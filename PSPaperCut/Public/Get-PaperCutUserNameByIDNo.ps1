function Get-PaperCutUserNameByIDNo {
    <#
        .SYNOPSIS
            Looks up the user with the given user id number and returns their user name.  If no match was found an empty string is returned.
    #>
    [CmdletBinding()]
    [OutputType("System.String")]
    param (
        #The user id number to look up.
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $IdNo,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.LookUpUserNameByIDNo($IdNo)
    }
}
