function Invoke-PaperCutProcessJob {
    <#
        .SYNOPSIS
            Takes the details of a job and logs and charges as if it were a "real" job.  Jobs processed via this method are not susceptible to filters, pop-ups, hold/release queues etc., they are simply logged.  See the user manual section "Importing Job Details" for more information and the format of jobDetails.
    #>
    [CmdletBinding()]
    [OutputType("void")]
    param (
        #The job details (a comma separated list of name-value pairs with an equals sign as the name-value delimiter).
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $JobDetails,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        $PaperCutServer.ProcessJob($JobDetails)
    }
}
