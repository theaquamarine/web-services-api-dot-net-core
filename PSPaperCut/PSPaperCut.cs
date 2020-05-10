using System.Management.Automation;

namespace PaperCut.PSPaperCut
{
    /// <summary>
    /// <para type="synopsis">
    ///  Set up a connection to a PaperCut server.
    ///  </para>
    /// </summary>
    [Cmdlet("Connect","PaperCutServer")]
    [OutputType(typeof(ServerCommandProxy))]
    public class ConnectPaperCutServerCommand : PSCmdlet
    {
        /// <summary>
        /// <para type="description">
        ///  The name or IP address of the server hosting the Application Server. The server should be configured
        ///  to allow XML-RPC connections from the host running this proxy class. Localhost is generally accepted
        ///  by default.
        ///  </para>
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        public string Server { get; set; }

        /// <summary>
        /// <para type="description">
        ///  The port the Application Server is listening on. This is port 9191 on a default install.
        ///  </para>
        /// </summary>
        [Parameter(
            Position = 1,
            ValueFromPipelineByPropertyName = true)]
        public int Port { get; set; } = 9191;

        /// <summary>
        /// <para type="description">
        ///  The authentication token as a string. All RPC calls must pass through an authentication token.
        ///  This should be the value defined in the advanced config key auth.webservices.auth-token.
        ///  </para>
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 2,
            ValueFromPipelineByPropertyName = true)]
        public string AuthToken { get; set; }

        protected override void ProcessRecord()
        {
            ServerCommandProxy scp =  new ServerCommandProxy(Server, Port, AuthToken);
            // TODO: script scope
            // TODO: make updating variable optional
            SessionState.PSVariable.Set("PaperCutServer", scp);
            // TODO: -PassThru parameter?
            WriteObject(scp);
        }
    }
}
