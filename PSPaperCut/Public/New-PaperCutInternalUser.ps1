function New-PaperCutInternalUser {
    <#
        .SYNOPSIS
            Creates and sets up a new internal user account.  The (unique) username and password are required at a minimum. The other properties are optional and will be used if not blank.  Properties may also be set after creation using  or .
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("void")]
    param (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $UserName,

        #(required) The user's password.
        [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
        [string] $Password,

        #(optional) The full name of the user.
        [Parameter(Mandatory, Position = 2, ValueFromPipelineByPropertyName)]
        [string] $FullName,

        #(optional) The email address of the user.
        [Parameter(Mandatory, Position = 3, ValueFromPipelineByPropertyName)]
        [string] $Email,

        #(optional) The card/identity number of the user.
        [Parameter(Mandatory, Position = 4, ValueFromPipelineByPropertyName)]
        [string] $CardId,

        #The card/id pin.
        [Parameter(Mandatory, Position = 5, ValueFromPipelineByPropertyName)]
        [string] $Pin,

        #Whether or not we want to send a confirmation email to the created user
        [Parameter(Position = 6, ValueFromPipelineByPropertyName)]
        [bool] $SendEmail = $false,

        #The PaperCut server to use.
        [Alias("Server")]
        [Parameter(Position = 7, ValueFromPipelineByPropertyName)]
        [PaperCut.ServerCommandProxy] $PaperCutServer = (Get-PaperCutServerConnection)
    )

    PROCESS {
        if ($PSCmdlet.ShouldProcess($userName, 'AddNewInternalUser')) {
            $PaperCutServer.AddNewInternalUser($UserName, $Password, $FullName, $Email, $CardId, $Pin, $SendEmail)
        }
    }
}
