function Get-PaperCutServerConnection {
    <#
        .SYNOPSIS
            Returns a PaperCut server if connected, or prompts if not.
    #>
    if ($script:PaperCutServer) {
        $script:PaperCutServer
    } else {
        Connect-PaperCutServer -ErrorAction Stop
    }
}
