function Get-PaperCutUser {
    [Alias('Get-PaperCutUserProperties', 'Get-PaperCutUserProperty')] # Probably not really required
    <#
.SYNOPSIS
Get multiple user properties at once (to save multiple calls).
#>
    [OutputType("PSCustomObject")] # Should be a real type
    param (
        #The name of the user.
        [Parameter(Mandatory = $True, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $Username,

        #The names of the properties to get.  See  for valid property names.
        [Alias('Property', 'PropertyNames')]
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateSet(
            'balance',
            'primary-card-number',
            'secondary-card-number',
            'card-pin',
            'department',
            'disabled-net',
            'disabled-print',
            'email',
            'full-name',
            'internal',
            'notes',
            'office',
            'print-stats.job-count',
            'print-stats.page-count',
            'net-stats.data-mb',
            'net-stats.time-hours',
            'restricted',

            'account-selection.mode',
            'account-selection.can-charge-personal',
            'account-selection.can-charge-shared-from-list',
            'account-selection.can-charge-shared-by-pin'
        )]
        # Possibly don't ValidateSet and just allow free text like Get-AdUser -Properties does?
        [string[]] $Properties = @('balance', 'email', 'full-name', 'disabled-print', 'internal', 'restricted'),

        #The PaperCut server to use.
        [Alias("Server")][Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $true)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        try {
            $object = @{'Username' = $Username }
            $response = $PaperCutServer.GetUserProperties($Username, $Properties)

            for ($i = 0; $i -lt $response.Length; $i++) {
                $value = $response[$i]
                if ([bool]::TryParse($value, [ref]$null)) {
                    $value = [System.Convert]::ToBoolean($value)
                }

                $object[$Properties[$i]] = $value
            }

            [pscustomobject]$object
        }
        catch [System.Management.Automation.MethodInvocationException] {
            # It should probably be ServerCommandProxy doing this?
            Write-Error ($_.Exception.InnerException.FaultString -replace 'java.lang.Exception: ')
            # TargetObject = username
        }
    }
}
