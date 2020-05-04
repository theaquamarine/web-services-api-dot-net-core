# run in a job or something to avoid polluting
# start-job {cd $pwd;.\codegenerator.ps1}|wait-job|receive-job
# TODO: handle overloaded optional parameters - eg AdjustUserAccountBalanceByCardNumber
# TODO: treat overloads as separate parametersets
# TODO: some methods/cmdlets are superfluous - GetSharedAccountProperty and GetSharedAccountProperties should be same cmdlet
# TODO: import methods should probably be import-, maybe start-
# TODO: Combine Lookup methods into other cmdlets?

using assembly ".\..\PaperCut\bin\Debug\netstandard2.0\publish\PaperCut.dll"

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
        Write-Output "$($indentunit * $indentlevel)<#"
        $indentlevel++
        Write-Output "$($indentunit * $indentlevel).SYNOPSIS"
        $indentlevel++
        Write-Output $(($indentunit * $indentlevel) + ($memberSummary.ToString().Trim() -replace "`n\s+", ' '))
        $indentlevel = $indentlevel - 2
        Write-Output "$($indentunit * $indentlevel)#>"
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
        Write-Output ($indentunit * $indentlevel + '#' + $($ParameterDescription.ToString().Trim() -replace "`n\s+", ' ') + "`n")
    }
}

function Write-OutputTypeAttribute {
    param (
        $Type
    )
    # Void can't be used from C#, so special-case it
    if ($type -eq 'Void' -or $type -eq 'System.Void') { $type = 'void' }
    $attribute = "[OutputType(typeof($Type))]"
    "[OutputType(`"$Type`")]"
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

    BEGIN {
        $indentlevel++
    }

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

        if ($Description) { 
            $outputString += $($indentunit * $indentlevel)
            $outputString += "#$Description`n" 
        }
        else { $outputString += Get-ParameterDocs -ParameterName $name -MemberName $xmlDocMemberName -xmlDoc $xmlDoc | Write-ParameterDocs }

        $name = ConvertTo-PascalCase $name

        if ($alias) {
            $outputString += $($indentunit * $indentlevel)
            $outputString += "[Alias(`"$($alias -join ',')`")]`n" 
        }

        # ParameterAttribute
        # https://docs.microsoft.com/en-us/dotnet/api/System.Management.Automation.ParameterAttribute?view=pscore-6.2.0
        # Parameter keywords -join ",`n"
        $outputString += $($indentunit * $indentlevel)
        $outputString += "[Parameter("
        $outputString += "Mandatory = `$$mandatory, "
        $outputString += if ($null -ne $Position) { $outputString += "Position = $position, " }
        if ($Position -eq 0) { $outputString += "ValueFromPipeline = `$true, " }
        $outputString += "ValueFromPipelineByPropertyName = `$true"
        $outputString += ")]`n"

        # The actual property
        $outputString += $($indentunit * $indentlevel)
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

# $PSPaperCutDir = Join-Path $PSScriptRoot 'PSPaperCut'
$PSPaperCutDir = $PSScriptRoot
$PublicFunctionDir = Join-Path $PSPaperCutDir 'Public'
if (-not (Test-Path $PublicFunctionDir)) {mkdir $PublicFunctionDir}

[PaperCut.ServerCommandProxy].GetMethods() |
Sort-Object -Unique Name | # TODO: Cheat to deal with overloads
? {$_.DeclaringType.Name -ne 'Object'} |
% {& {
# % {

    $indentunit = '    '
    $indentlevel = 0

    $parameters = $_.GetParameters()

    Write-Output "function $(Get-FunctionName $_) {"

    $indentlevel ++

    #region Comment-based help
    $membertype = $_.MemberType.ToString().Substring(0, 1)
    $parameterList = $parameters.ParameterType.Fullname -join ','
    $signature = $_.Name + '(' + $parameterList + ')'
    $typename = $_.ReflectedType.FullName
    $xmlDocMemberName = $membertype + ':' + $typename + '.' + $signature
    # Write-Output ('# ' + $xmlDocMemberName)

    $assemblySource = $_.Module.FullyQualifiedName
    $xmlDocSource = $assemblySource.Replace('.dll', '.xml')
    [xml]$xmlDoc = if (Test-Path $xmlDocSource) {
        Get-Content $xmlDocSource
    }

    Get-MemberSummary -MemberName $xmlDocMemberName -xmlDoc $xmlDoc | Write-MemberSummary
    #endregion Comment-based help

    #region Attributes
    Write-Output "$($indentunit * $indentlevel)[CmdletBinding()]"
    Write-Output "$($indentunit * $indentlevel)$(Write-OutputTypeAttribute -Type $($_.ReturnType.FullName))"
    #endregion Attributes

    #region Param block
    Write-Output "$($indentunit * $indentlevel)param ("

    $selfParam = [pscustomobject]@{
        Name        = 'PaperCutServer';
        Type        = $_.DeclaringType.FullName;
        Mandatory   = $false;
        Alias       = 'Server';
        Position    = $($parameters.Count);
        Description = 'The PaperCut server to use.';
        DefaultValue = '(Connect-PaperCutServer)'
    }

    ($parameters + $selfParam | Write-Parameter) -join ",`n`n"
    Write-Output "$($indentunit * $indentlevel))`n"
    #endregion Param block

    #region input processing methods
    $beginblock, $processblock, $endblock = ''

    # Build the actual method call to execute
    $parameterString = ($parameters.Name | ConvertTo-PascalCase | % { "`$$_" }) -join ', '
    $outputCall = "`$PaperCutServer.$($_.Name)($parameterString)"

    $processblock += "$($indentunit * $indentlevel)PROCESS {`n"
    $indentlevel++
    $processblock += "$($indentunit * $indentlevel)$outputCall`n"
    $indentlevel--
    $processblock += "$($indentunit * $indentlevel)}"

    if ($beginblock) {Write-Output $beginblock}
    if ($processblock) {Write-Output $processblock}
    if ($endblock) {Write-Output $endblock}
    #endregion input processing methods

    $indentlevel--
    Write-output "$($indentunit * $indentlevel)}"
# }
} | Out-File (Join-Path $PublicFunctionDir "$(Get-FunctionName $_).ps1") }


# Ensure a file called PaperCut.dll exists in PSPaperCut folder to placate Update-ModuleManifest
$PaperCutDllPath = Join-Path $PSPaperCutDir 'PaperCut.dll'
if (-not (Test-Path $PaperCutDllPath)) {New-Item $PaperCutDllPath}

$PSDFile = Join-Path $PSPaperCutDir 'PSPaperCut.psd1'
$PublicFunctions = Join-Path $PublicFunctionDir '*.ps1'

$functions = Get-ChildItem $PublicFunctions | Select-Object -ExpandProperty BaseName
Update-ModuleManifest -Path $PSDFile -FunctionsToExport $functions
