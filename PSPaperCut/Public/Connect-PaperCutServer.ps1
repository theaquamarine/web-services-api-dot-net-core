function Connect-PaperCutServer {
    [CmdletBinding()]
    param (
        # The name or IP address of the server hosting the Application Server.
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [string] $Server,

        # The port the Application Server is listening on.
        [Parameter(Position = 1, ValueFromPipelineByPropertyName = $true)]
        [int] $Port = 9191,

        # The authentication token as a string.
        [Parameter(Mandatory = $true, Position = 2, ValueFromPipelineByPropertyName = $true)]
        [string] $AuthenticationToken
    )
    
    process {
        try {
            $ServerCommandProxy = [PaperCut.ServerCommandProxy]::new($Server, $Port, $AuthenticationToken)

            # Test we can connect to server & auth token works
            $ServerCommandProxy.GetTotalUsers() | Out-Null

            $script:PaperCutServer = $ServerCommandProxy
            $ServerCommandProxy
        } catch {
            throw ($_.Exception.InnerException)
        }
    }
}
