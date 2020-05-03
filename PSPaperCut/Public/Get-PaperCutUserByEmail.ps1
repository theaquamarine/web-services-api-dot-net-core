function Get-PaperCutUserNameByEmail {
    [OutputType("System.String")]
    param (
        [Parameter(Mandatory = $True, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $Email,

        #The PaperCut server to use.
        [Alias("Server")][Parameter(Mandatory = $False, ValueFromPipelineByPropertyName = $true)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $response = $PaperCutServer.LookUpUserNameByEmail($Email)

        if ($response) {
            $object = @{'Email' = $Email}
            $object['Username'] = $response

            [pscustomobject]$object
        } else {
            Write-Error "The user with email '$Email' could not be found."
        }
    }
}
