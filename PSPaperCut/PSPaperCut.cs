using System.Management.Automation;

[Cmdlet("Connect","PaperCutServer")]
[OutputType(typeof(ServerCommandProxy))]
public class TestSampleCmdletCommand : PSCmdlet
{
    [Parameter(
        Mandatory = true,
        Position = 0,
        ValueFromPipeline = true,
        ValueFromPipelineByPropertyName = true)]
    public string Server { get; set; }

    [Parameter(
        Mandatory = true,
        Position = 1,
        ValueFromPipelineByPropertyName = true)]
    public int Port { get; set; }

    [Parameter(
        Mandatory = true,
        Position = 2,
        ValueFromPipelineByPropertyName = true)]
    public string AuthToken { get; set; }

    protected override void ProcessRecord()
    {
        WriteObject(new ServerCommandProxy(Server, Port, AuthToken));
    }
}