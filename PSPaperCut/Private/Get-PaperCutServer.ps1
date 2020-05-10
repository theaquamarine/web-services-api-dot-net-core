function Get-PaperCutServer{
    <#
        .SYNOPSIS
            Returns a PaperCut server if connected, or prompts if not.
    #>
    if ($PaperCutServer) {
        $PaperCutServer
    } else {
        Connect-PaperCutServer
    }
}
