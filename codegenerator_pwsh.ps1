# run in a job or something to avoid polluting
# start-job {cd C:\web-services-api-dot-net-core;.\codegenerator_pwsh.ps1 > .\PSPaperCut\Cmdlets.ps1}|wait-job|receive-job
# TODO: handle overloaded optional parameters - eg AdjustUserAccountBalanceByCardNumber
# TODO: treat overloads as separate parametersets
# TODO: add Cmdlets to CmdletsToExport
# TODO: some methods/cmdlets are superfluous - GetSharedAccountProperty and GetSharedAccountProperties should be same cmdlet
# TODO: import methods should probably be import-, maybe start-
# TODO: Combine Lookup methods into other cmdlets?

using assembly ".\PaperCut\bin\Debug\netstandard2.0\publish\PaperCut.dll"

function ConvertTo-PascalCase {
    # Capitalises first letter of string
    param (
        [Parameter(ValueFromPipeline)]
        [string] $aString
    )
    process {
        if ($aString.Length -gt 0) {
            $aString.Substring(0, 1).ToUpper() + $aString.SubString(1)
        }
    }
}

function Get-MemberSummary {
    param (
        [string] $MemberName,
        [xml] $xmlDoc
    )
    try {
        if ($xmlDoc) {($xmlDoc | Select-Xml -XPath "//member[@name='$MemberName']/summary").Node.innertext}
    } catch [System.Management.Automation.RuntimeException] {
        Write-Warning "Error generating member docs for $MemberName : $ParameterName"
    }
}

function Write-MemberSummary {
    param (
        [Parameter(ValueFromPipeline)]$MemberSummary
    )
    if ($MemberSummary) {
        # TODO: break at period, use first sentence for synopsis and entiruty for description.
        Write-Output '<#'
        Write-Output '.SYNOPSIS'
        Write-Output $($memberSummary.ToString().Trim() -replace "`n\s+", ' ')
        Write-Output '#>'
    }
}

function Get-ParameterDocs {
    param (
        [string]$MemberName,
        [string]$ParameterName,
        [xml]$xmlDoc
    )
    # case-insensitive matching may be desirable? https://www.w3.org/TR/xpath-functions/#func-matches
    try {
        if ($xmlDoc) {($xmlDoc | Select-Xml -XPath "//member[@name='$MemberName']/param[@name='$ParameterName']").Node.innertext.replace('   ', ' ')}
    } catch [System.Management.Automation.RuntimeException] {
        Write-Warning "Error generating parameter docs for $MemberName : $ParameterName"
    }
}

function Write-ParameterDocs {
    param (
        [Parameter(ValueFromPipeline)]$ParameterDescription
    )
    if ($ParameterDescription) {
        Write-Output ('#' + $($ParameterDescription.ToString().Trim() -replace "`n\s+", ' ') + "`n")
    }
}

function Write-OutputTypeAttribute {
    param (
        $Type
    )
    # Void can't be used from C#, so special-case it
    if ($type -eq 'Void' -or $type -eq 'System.Void') { $type = 'void' }
    $attribute = "[OutputType(typeof($Type))]"
    $attribute = "[OutputType(`"$Type`")]"
    $attribute | Write-Output
}

function Write-Parameter {
    # TODO: Separate into Write-ParameterAttribute as there can be several per parameter
    [cmdletbinding()]
    param (
        [Alias('Identifier')]
        [Parameter(Mandatory = $true, ValueFromPipeLineByPropertyName = $true)]$Name,
        [Alias('ParameterType')]
        [Parameter(Mandatory = $true, ValueFromPipeLineByPropertyName = $true)]$Type,
        [Parameter(ValueFromPipeLineByPropertyName = $true, ParameterSetName='Mandatory')]$Mandatory,
        [Parameter(ValueFromPipeLineByPropertyName = $true, ParameterSetName='IsOptional')]$isOptional,
        [Parameter(ValueFromPipeLineByPropertyName = $true)]$Alias,
        [Parameter(ValueFromPipeLineByPropertyName = $true)]$Position,
        [Parameter(ValueFromPipeLineByPropertyName = $true)]$DefaultValue,
        [Parameter(ValueFromPipeLineByPropertyName = $true)]$Description
    );

    PROCESS {
        # if ($Description) {$Description | Write-ParameterDocs}
        # else {Get-ParameterDocs -ParameterName $name -MemberName $xmlDocMemberName -xmlDoc $xmlDoc |
        #     Write-ParameterDocs}

        # $name = ConvertTo-PascalCase $name
        # if ($MyInvocation.Line -match "\s-isOptional\s") {$mandatory = -not $mandatory}
        if ($PSCmdlet.ParameterSetName -eq 'IsOptional') {
            $mandatory = -not $_.IsOptional
        }
        $mandatory = $mandatory.toString().toLower()

        # TODO: needs conversion to $Type- to a bool, quotes around strings, etc
        $defaultString = if ('' -ne $DefaultValue) {
            $DefaultValue = switch ($DefaultValue) {
                'True' {'$true'; break}
                'False' {'$false'; break}
                default {$DefaultValue; break}
            }
            # $DefaultValue = [$type]$DefaultValue
            " = $DefaultValue"
        }

        $outputString = ''

        if ($Description) { $outputString += "#$Description`n" }
        else { $outputString += Get-ParameterDocs -ParameterName $name -MemberName $xmlDocMemberName -xmlDoc $xmlDoc | Write-ParameterDocs }

        $name = ConvertTo-PascalCase $name

        if ($alias) { $outputString += "[Alias(`"$($alias -join ',')`")]" }

        # ParameterAttribute
        # https://docs.microsoft.com/en-us/dotnet/api/System.Management.Automation.ParameterAttribute?view=pscore-6.2.0
        # Parameter keywords -join ",`n"
        $outputString += "[Parameter("
        $outputString += "Mandatory = `$$mandatory, "
        $outputString += if ($null -ne $Position) { $outputString += "Position = $position, " }
        if ($Position -eq 0) { $outputString += "ValueFromPipeline = `$true, " }
        $outputString += "ValueFromPipelineByPropertyName = `$true"
        $outputString += ")]`n"

        # The actual property
        $outputString += "[$type] `$$name$defaultString"
        Write-Output $outputString
    }
}

    function Get-FunctionName {
    $prefix = 'PaperCut'
    $returntype = $_.ReturnType.FullName
    $noun = $_.Name
    $verb = if ($noun -eq 'ListUserGroups') {
        $noun = 'Groups'
        'Get'
    }
    elseif ($noun -eq 'GetUserGroups') {
        $noun = 'GroupsByUser'
        'Get'
    }
    elseif ($noun.StartsWith('List')) {
        $noun = $noun.Substring(4)
        'Get'
    }
    elseif ($noun.StartsWith('LookUp')) {
        $noun = $noun.Substring(6)
        'Get'
    }
    elseif ($noun.StartsWith('Delete')) {
        $noun = $noun.Substring(6)
        'Remove'
    }
    elseif ($noun.StartsWith('Perform')) {
        $noun = $noun.Substring(7)
        'Start'
    }
    elseif ($noun.StartsWith('Adjust')) {
        # Intentionally not removing 'Adjust'
        'Invoke'
    }
    elseif ($returntype -eq 'Boolean' -or $returntype -eq 'System.Boolean') { 'Test' } # Not perfect, there are several methods which return bool for success
    elseif ((Get-Verb).Verb | ? { $noun.StartsWith($_) }) {
        # if the name starts with an approved verb, use that
        $verb = (Get-Verb).Verb | ? { $noun.StartsWith($_) }
        $noun = $noun.Substring($($verb.Length))
        $verb
    }
    else {
        'Invoke'
    }

    $noun = $prefix + $noun

    "$verb-$noun"
}

# Can have 'using assembly PaperCut.dll', but doesn't matter as long as it's in RequiredAssemblies
# Same probably true for PSPaperCut, it's in RootModule/NestedModules

# [ServerCommandProxy].GetDeclaredMethods('AdjustUserAccountBalanceByCardNumber') |
# [ServerCommandProxy].GetDeclaredMethods('AddNewUsers') |
[PaperCut.ServerCommandProxy].GetMethods() |
Sort-Object -Unique Name | # TODO: Cheat to deal with overloads
% {& {
# % {

    # skip stuff like equals and tostring
    if ($_.DeclaringType.Name -eq 'Object') { return }


    $returntype = $_.ReturnType.FullName
    # $commandName = $_.Name + 'Command'

    $name = Get-FunctionName $_


    $parameters = $_.GetParameters()

    $assemblySource = $_.Module.FullyQualifiedName
    $xmlDocSource = $assemblySource.Replace('.dll', '.xml')

    $membertype = $_.MemberType.ToString().Substring(0, 1)
    $parameterList = $parameters.ParameterType.Fullname -join ','
    $signature = $_.Name + '(' + $parameterList + ')'
    $typename = $_.ReflectedType.FullName
    $xmlDocMemberName = $membertype + ':' + $typename + '.' + $signature
    # Write-Output ('# ' + $xmlDocMemberName)

    [xml]$xmlDoc = if (Test-Path $xmlDocSource) {
        Get-Content $xmlDocSource
    }


    $functionDefinition = "function $name {"

    Write-output $functionDefinition

    Get-MemberSummary -MemberName $xmlDocMemberName -xmlDoc $xmlDoc | Write-MemberSummary

    Write-OutputTypeAttribute -Type $returntype
    # write-output $classDefinition
    Write-Output '    param ('


    $selfParam = [pscustomobject]@{
        Name        = 'PaperCutServer';
        Type        = $_.DeclaringType.FullName;
        Mandatory   = $false;
        Alias       = 'Server';
        Position    = $($parameters.Count);
        Description = 'The PaperCut server to use.';
        DefaultValue = '(Connect-PaperCutServer)'
    }

    # $parameters += $selfParam

    ($parameters + $selfParam | Write-Parameter) -join ",`n`n"
    Write-Output "    )`n"

    # Build the actual method call to execute
    $parameterString = ($parameters.Name | ConvertTo-PascalCase | % { "`$$_" }) -join ', '
    $outputCall = "`$PaperCutServer.$($_.Name)($parameterString)"

    $processingMethods = @"
    PROCESS {
        $outputCall
    }
"@

    write-output $processingMethods

    Write-output "}`n"
# }
} > (Join-Path .\PSPaperCut\Public "$(Get-FunctionName $_).ps1")}
