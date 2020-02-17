function Add-PaperCutAdminAccessGroup {
<#
.SYNOPSIS
Adds a group as an admin group with default admin rights.
#>
[OutputType("void")]
    param (
#The name of the group.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $GroupName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.AddAdminAccessGroup($GroupName)
    }
}

function Add-PaperCutAdminAccessUser {
<#
.SYNOPSIS
Adds a user as an admin with default admin rights.
#>
[OutputType("void")]
    param (
#The name of the user.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.AddAdminAccessUser($Username)
    }
}

function Add-PaperCutNewGroup {
<#
.SYNOPSIS
Add a new group to system's group list.  The caller is responsible for ensuring that the supplied group name is valid and exists in the linked user directory source.  The status of this method may be monitored with calls to getTaskStatus().
#>
[OutputType("void")]
    param (
#The name of the new group to add. The group should already exist in the network user directory.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $GroupName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.AddNewGroup($GroupName)
    }
}

function Add-PaperCutNewInternalUser {
<#
.SYNOPSIS
Creates and sets up a new internal user account.  The (unique) username and password are required at a minimum. The other properties are optional and will be used if not blank.  Properties may also be set after creation using  or .
#>
[OutputType("void")]
    param (
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $UserName,

#(required) The user's password.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Password,

#(optional) The full name of the user.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $FullName,

#(optional) The email address of the user.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Email,

#(optional) The card/identity number of the user.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $CardId,

#The card/id pin.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Pin,

#Whether or not we want to send a confirmation email to the created user
[Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
[bool] $SendEmail = False,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.AddNewInternalUser($UserName, $Password, $FullName, $Email, $CardId, $Pin, $SendEmail)
    }
}

function Add-PaperCutNewSharedAccount {
<#
.SYNOPSIS
Create a new shared account with the given name.
#>
[OutputType("void")]
    param (
#The name of the shared account to create. Use a '\' to denote a subaccount, e.g.: 'parent\sub'
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SharedAccountName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.AddNewSharedAccount($SharedAccountName)
    }
}

function Add-PaperCutNewUser {
<#
.SYNOPSIS
Trigger the process of adding a new user account. Assuming the user exists in the OS/Network/Domain user directory, the account will be created with the correct initial settings as defined by the rules setup in the admin interface under the Group's section. Calling this method is equivalent to triggering the "new user" event when a new user performs printing for the first time.
#>
[OutputType("void")]
    param (
#The username of the user to add.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.AddNewUser($Username)
    }
}

function Add-PaperCutNewUsers {
[OutputType("void")]
    param (
#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.AddNewUsers()
    }
}

function Add-PaperCutPrinterAccessGroup {
<#
.SYNOPSIS
Add the group to the printer access group list.
#>
[OutputType("void")]
    param (
#The existing printer's server name.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ServerName,

#The existing printer's queue name.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PrinterName,

#The name of the group that needs to be added to the printer group restrictions list
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $GroupName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.AddPrinterAccessGroup($ServerName, $PrinterName, $GroupName)
    }
}

function Add-PaperCutSharedAccountAccessGroup {
<#
.SYNOPSIS
Allow the given group access to the given shared account without using a pin.
#>
[OutputType("void")]
    param (
#The name of the shared account to allow access to.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SharedAccountName,

#The name of the group to give access to.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $GroupName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.AddSharedAccountAccessGroup($SharedAccountName, $GroupName)
    }
}

function Add-PaperCutSharedAccountAccessUser {
<#
.SYNOPSIS
Allow the given user access to the given shared account without using a pin.
#>
[OutputType("void")]
    param (
#The name of the shared account to allow access to.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SharedAccountName,

#The name of the user to give access to.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.AddSharedAccountAccessUser($SharedAccountName, $Username)
    }
}

function Add-PaperCutUserToGroup {
<#
.SYNOPSIS
Adds the user to the specified group
#>
[OutputType("void")]
    param (
#The user name
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The name of the group.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $GroupName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.AddUserToGroup($Username, $GroupName)
    }
}

function Invoke-PaperCutAdjustSharedAccountAccountBalance {
<#
.SYNOPSIS
Adjust a shared account's account balance by an adjustment amount. An adjustment bay be positive (add to the account) or negative (subtract from the account).
#>
[OutputType("void")]
    param (
#The full name of the shared account to adjust.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $AccountName,

#The adjustment amount. Positive to add credit and negative to subtract.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[double] $Adjustment,

#A user defined comment to associated with the transaction. This may be a null string.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Comment,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.AdjustSharedAccountAccountBalance($AccountName, $Adjustment, $Comment)
    }
}

function Invoke-PaperCutAdjustUserAccountBalance {
<#
.SYNOPSIS
Adjust a user's account balance by an adjustment amount. An adjustment bay be positive (add to the user's account) or negative (subtract from the account).
#>
[OutputType("void")]
    param (
#The username associated with the user who's account is to be adjusted.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The adjustment amount. Positive to add credit and negative to subtract.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[double] $Adjustment,

#A user defined comment to associated with the transaction. This may be a null string.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Comment,

#Optional name of the user's personal account. If blank, the built-in default account is used.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $AccountName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.AdjustUserAccountBalance($Username, $Adjustment, $Comment, $AccountName)
    }
}

function Invoke-PaperCutAdjustUserAccountBalanceByCardNumber {
<#
.SYNOPSIS
Adjust a user's account balance.  User lookup is by card number.
#>
[OutputType("System.Boolean")]
    param (
#The card number associated with the user who's account is to be adjusted.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $CardNumber,

#The adjustment amount.  Positive to add credit and negative to subtract.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[double] $Adjustment,

#A user defined comment to be associated with the transaction.  This may be a null string.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Comment,

#Optional name of the user's personal account.  If blank, the built-in default account is used.  If multiple personal accounts is enabled the account name must be provided.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $AccountName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.AdjustUserAccountBalanceByCardNumber($CardNumber, $Adjustment, $Comment, $AccountName)
    }
}

function Invoke-PaperCutAdjustUserAccountBalanceByGroup {
<#
.SYNOPSIS
Adjust the account balance of all users in a group by an adjustment amount. An adjustment may be positive (add to the user's account) or negative (subtract from the account).
#>
[OutputType("void")]
    param (
#The group for which all users' accounts are to be adjusted.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Group,

#The adjustment amount. Positive to add credit and negative to subtract.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[double] $Adjustment,

#A user defined comment to be associated with the transaction. This may be a null string.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Comment,

#Optional name of the user's personal account. If blank, the built-in default account is used.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $AccountName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.AdjustUserAccountBalanceByGroup($Group, $Adjustment, $Comment, $AccountName)
    }
}

function Invoke-PaperCutAdjustUserAccountBalanceIfAvailable {
<#
.SYNOPSIS
Adjust a user's account balance by an adjustment amount (if there is credit available).   This can be used to perform atomic account adjustments, without needed to check the user's balance first. An adjustment may be positive (add to the user's account) or negative (subtract from the account).
#>
[OutputType("System.Boolean")]
    param (
#The username associated with the user who's account is to be adjusted.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The adjustment amount. Positive to add credit and negative to subtract.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[double] $Adjustment,

#A user defined comment to associated with the transaction. This may be a null string.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Comment,

#Optional name of the user's personal account. If blank, the built-in default account is used.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $AccountName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.AdjustUserAccountBalanceIfAvailable($Username, $Adjustment, $Comment, $AccountName)
    }
}

function Invoke-PaperCutAdjustUserAccountBalanceIfAvailableLeaveRemaining {
<#
.SYNOPSIS
Adjust a user's account balance by an adjustment amount (if there is credit available to leave the specified amount still available in the account).   This can be used to perform atomic account adjustments, without need to check the user's balance first. An adjustment may be positive (add to the user's account) or negative (subtract from the account).
#>
[OutputType("System.Boolean")]
    param (
#The username associated with the user who's account is to be adjusted.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The adjustment amount. Positive to add credit and negative to subtract.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[double] $Adjustment,

#The amount to leave in the account when deductions are done.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[double] $LeaveRemaining,

#A user defined comment to associated with the transaction. This may be a null string.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Comment,

#Optional name of the user's personal account. If blank, the built-in default account is used.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $AccountName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.AdjustUserAccountBalanceIfAvailableLeaveRemaining($Username, $Adjustment, $LeaveRemaining, $Comment, $AccountName)
    }
}

function Test-PaperCutApplyDeviceSettings {
[OutputType("System.Boolean")]
    param (
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $DeviceName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.ApplyDeviceSettings($DeviceName)
    }
}

function Invoke-PaperCutBatchImportInternalUsers {
<#
.SYNOPSIS
Import the internal users contained in the given tab-delimited import file.
#>
[OutputType("void")]
    param (
#The import file location relative to the application server.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ImportFile,

#True to overwrite existing user passwords, false to only update un-set passwords.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[bool] $OverwriteExistingPasswords,

#True to overwrite existing user PINs, false to only update un-set PINs.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[bool] $OverwriteExistingPINs,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.BatchImportInternalUsers($ImportFile, $OverwriteExistingPasswords, $OverwriteExistingPINs)
    }
}

function Invoke-PaperCutBatchImportSharedAccounts {
<#
.SYNOPSIS
Import the shared accounts contained in the given TSV import file.
#>
[OutputType("System.String")]
    param (
#The import file location relative to the application server.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ImportFile,

#If true, perform a test only. The printed statistics will show what would have occurred if testing wasn't enabled. No accounts will be modified.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[bool] $Test,

#If true, accounts that do not exist in the import file but exist in the system will be deleted.  If false, they will be ignored.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[bool] $DeleteNonExistentAccounts,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.BatchImportSharedAccounts($ImportFile, $Test, $DeleteNonExistentAccounts)
    }
}

function Invoke-PaperCutBatchImportUserCardIdNumbers {
<#
.SYNOPSIS
Import the user card/ID numbers and PINs contained in the given tab-delimited import file.
#>
[OutputType("void")]
    param (
#The import file location relative to the application server.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ImportFile,

#If true, users with a PIN already defined will have it overwritten by the PIN in the import file, if specified. If false, the existing PIN will not be overwritten.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[bool] $OverwriteExistingPINs,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.BatchImportUserCardIdNumbers($ImportFile, $OverwriteExistingPINs)
    }
}

function Invoke-PaperCutBatchImportUsers {
<#
.SYNOPSIS
Import the users contained in the given tab-delimited import file.
#>
[OutputType("void")]
    param (
#The import file location relative to the application server.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ImportFile,

#If true, users only existing in the import file will be newly created, otherwise ignored
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[bool] $CreateNewUsers,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.BatchImportUsers($ImportFile, $CreateNewUsers)
    }
}

function Test-PaperCutChangeInternalAdminPassword {
<#
.SYNOPSIS
Change the internal admin password.
#>
[OutputType("System.Boolean")]
    param (
#The new password.  Cannot be blank.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $NewPassword,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.ChangeInternalAdminPassword($NewPassword)
    }
}

function Remove-PaperCutExistingSharedAccount {
<#
.SYNOPSIS
Delete a shared account from the system.  Use this method with care.  Deleting a shared account will permanently delete it from the shared account list (print history records will remain).
#>
[OutputType("void")]
    param (
#The name of the shared account to delete.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SharedAccountName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.DeleteExistingSharedAccount($SharedAccountName)
    }
}

function Remove-PaperCutExistingUser {
<#
.SYNOPSIS
Delete/remove an existing user from the user list. Use this method with care.  Calling this will perminantly delete the user account from the user list (print and transaction history records remain).
#>
[OutputType("void")]
    param (
#The username of the user to delete/remove.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

[Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
[bool] $RedactUserData = False,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.DeleteExistingUser($Username, $RedactUserData)
    }
}

function Remove-PaperCutPrinter {
<#
.SYNOPSIS
Delete a printer.
#>
[OutputType("void")]
    param (
#The name of the server hosting the printer.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ServerName,

#The printer's name.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PrinterName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.DeletePrinter($ServerName, $PrinterName)
    }
}

function Disable-PaperCutPrinter {
<#
.SYNOPSIS
Disable a printer for select period of time.
#>
[OutputType("void")]
    param (
#The name of the server hosting the printer.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ServerName,

#The printer's name.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PrinterName,

#The number of minutes to disable the printer. If the value is -1 the printer will be disabled for all time until re-enabled.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[int] $DisableMins,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.DisablePrinter($ServerName, $PrinterName, $DisableMins)
    }
}

function Disable-PaperCutPrintingForUser {
<#
.SYNOPSIS
Disable printing for a user for a specified period of time.
#>
[OutputType("void")]
    param (
#The name of the user to disable printing for.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The number of minutes to disable printing for the user. If the value is -1 the printer will be disabled for all time until re-enabled.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[int] $DisableMins,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.DisablePrintingForUser($Username, $DisableMins)
    }
}

function Disable-PaperCutSharedAccount {
<#
.SYNOPSIS
Disable shared account for a specified period of time.
#>
[OutputType("void")]
    param (
#The name of the shared account to disable.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SharedAccountName,

#The number of minutes to disable the shared account for. If the value is -1 the shared account will be disabled permanently until re-enabled.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[int] $DisableMins,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.DisableSharedAccount($SharedAccountName, $DisableMins)
    }
}

function Export-PaperCutUserDataHistory {
[OutputType("void")]
    param (
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#Location on the PaperCut MF/NG application server to export CSV reports to. The system account running the PaperCut process must have write permissions to this location.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SaveLocation,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.ExportUserDataHistory($Username, $SaveLocation)
    }
}

function Test-PaperCutGenerateAdHocReport {
[OutputType("System.Boolean")]
    param (
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $AuthToken,

[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ReportType,

[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $DataParams,

[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ExportTypeExt,

[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ReportTitle,

[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SaveLocation,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GenerateAdHocReport($AuthToken, $ReportType, $DataParams, $ExportTypeExt, $ReportTitle, $SaveLocation)
    }
}

function Test-PaperCutGenerateScheduledReport {
[OutputType("System.Boolean")]
    param (
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $AuthToken,

[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ReportTitle,

[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SaveLocation,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GenerateScheduledReport($AuthToken, $ReportTitle, $SaveLocation)
    }
}

function Get-PaperCutConfigValue {
<#
.SYNOPSIS
Get the config value from the server.
#>
[OutputType("System.String")]
    param (
#The name of the config value to retrieve.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ConfigName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GetConfigValue($ConfigName)
    }
}

function Get-PaperCutGroupMembers {
<#
.SYNOPSIS
Retrive all users in group.
#>
[OutputType("System.String[]")]
    param (
#The group to look up
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $GroupName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GetGroupMembers($GroupName)
    }
}

function Get-PaperCutGroupQuota {
<#
.SYNOPSIS
Get the group quota allocation settings on a given group.
#>
[OutputType("PaperCut.GetGroupQuotaResponse")]
    param (
#The name of the group.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $GroupName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GetGroupQuota($GroupName)
    }
}

function Get-PaperCutPrinterCostSimple {
<#
.SYNOPSIS
Get the page cost if, and only if, the printer is using the Simple Charging Model.
#>
[OutputType("System.Double")]
    param (
#The name of the server.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ServerName,

#The name of the printer.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PrinterName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GetPrinterCostSimple($ServerName, $PrinterName)
    }
}

function Get-PaperCutPrinterProperties {
<#
.SYNOPSIS
Gets a list printer properties.
#>
[OutputType("System.String[]")]
    param (
#The name of the server.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ServerName,

#The name of the printer.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PrinterName,

#An array of strings, one for each property name
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string[]] $PropertyNames,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GetPrinterProperties($ServerName, $PrinterName, $PropertyNames)
    }
}

function Get-PaperCutPrinterProperty {
<#
.SYNOPSIS
Gets a printer property.
#>
[OutputType("System.String")]
    param (
#The name of the server.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ServerName,

#The name of the printer.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PrinterName,

#The name of the property.  Valid options include: cost-model, custom-field-1, custom-field-2, custom-field-3, custom-field-4, custom-field-5, custom-field-6, disabled, print-stats.job-count, print-stats.page-count, printer-id
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PropertyName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GetPrinterProperty($ServerName, $PrinterName, $PropertyName)
    }
}

function Get-PaperCutSharedAccountAccountBalance {
<#
.SYNOPSIS
Gets a shared account's current balance.
#>
[OutputType("System.Double")]
    param (
#The name of the shared account.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SharedAccountName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GetSharedAccountAccountBalance($SharedAccountName)
    }
}

function Get-PaperCutSharedAccountOverdraftMode {
<#
.SYNOPSIS
Get the shared account's overdraft mode
#>
[OutputType("System.String")]
    param (
#The name of the shared account.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SharedAccountName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GetSharedAccountOverdraftMode($SharedAccountName)
    }
}

function Get-PaperCutSharedAccountProperties {
<#
.SYNOPSIS
Get multiple shared account properties at once (to save multiple calls).
#>
[OutputType("System.String[]")]
    param (
#The shared account name.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SharedAccountName,

#The names of the properties to get.  See  for valid property names.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string[]] $PropertyNames,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GetSharedAccountProperties($SharedAccountName, $PropertyNames)
    }
}

function Get-PaperCutSharedAccountProperty {
<#
.SYNOPSIS
Gets a shared account property.
#>
[OutputType("System.String")]
    param (
#The name of the shared account.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SharedAccountName,

#The name of the property to get.  Valid options include: access-groups, access-users, account-id, balance, comment-option, disabled, invoice-option, notes, overdraft-amount, pin, restricted.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PropertyName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GetSharedAccountProperty($SharedAccountName, $PropertyName)
    }
}

function Get-PaperCutTaskStatus {
[OutputType("PaperCut.GetTaskStatusResponse")]
    param (
#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GetTaskStatus()
    }
}

function Get-PaperCutTotalUsers {
[OutputType("System.Int32")]
    param (
#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GetTotalUsers()
    }
}

function Get-PaperCutUserAccountBalance {
<#
.SYNOPSIS
Gets a user's current account balance.
#>
[OutputType("System.Double")]
    param (
#The name of the user.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#Optional name of the user's personal account. If blank, the total balance is returned.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $AccountName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GetUserAccountBalance($Username, $AccountName)
    }
}

function Get-PaperCutGroupsByUser {
<#
.SYNOPSIS
Retrive all groups a user is a member of.
#>
[OutputType("System.String[]")]
    param (
#The username to look up
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $UserName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GetUserGroups($UserName)
    }
}

function Get-PaperCutUserOverdraftMode {
<#
.SYNOPSIS
Get the user's overdraft mode
#>
[OutputType("System.String")]
    param (
#The name of the user.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GetUserOverdraftMode($Username)
    }
}

function Get-PaperCutUserProperties {
<#
.SYNOPSIS
Get multiple user properties at once (to save multiple calls).
#>
[OutputType("System.String[]")]
    param (
#The name of the user.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The names of the properties to get.  See  for valid property names.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string[]] $PropertyNames,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GetUserProperties($Username, $PropertyNames)
    }
}

function Get-PaperCutUserProperty {
<#
.SYNOPSIS
Gets a user property.
#>
[OutputType("System.String")]
    param (
#The name of the user.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The name of the property to get.  The following list of property names can also be set using : balance: the user's balance, unformatted, e.g. "1234.56".primary-card-numbersecondary-card-numbercard-pindepartmentdisabled-net: true if the user's 'net access is disabled, otherwise falsedisabled-print: true if the user's printing is disabled, otherwise falseemailfull-nameinternal: true if this is an internal user, otherwise falsenotesofficeprint-stats.job-count: total number of print jobs from this user, unformatted, e.g. "1234" print-stats.page-count: total number of pages printed by this user, unformatted, e.g. "1234" net-stats.data-mb: total 'net MB used by this user, unformatted, e.g. "1234.56" net-stats.time-hours: total 'net hours used by this user, unformatted, e.g. "1234.56" restricted: true if this user's printing is restricted, false if they are unrestricted. The following options are "read only", i.e. cannot be set using : account-selection.mode: the user's account selection mode.  One of the following: AUTO_CHARGE_TO_PERSONAL_ACCOUNTCHARGE_TO_PERSONAL_ACCOUNT_WITH_CONFIRMATIONAUTO_CHARGE_TO_SHAREDSHOW_ACCOUNT_SELECTION_POPUPSHOW_ADVANCED_ACCOUNT_SELECTION_POPUPSHOW_MANAGER_MODE_POPUPaccount-selection.can-charge-personal: true if the user's account selection settings allow them to charge jobs to their personal account, otherwise false. account-selection.can-charge-shared-from-list: true if the user's account selection settings allow them to select a shared account to charge from a list of shared accounts, otherwise false. account-selection.can-charge-shared-by-pin: true if the user's account selection settings allow them to charge a shared account by PIN or code, otherwise false.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PropertyName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GetUserProperty($Username, $PropertyName)
    }
}

function Test-PaperCutGroupExists {
<#
.SYNOPSIS
Test to see if a group associated with groupname exists in the system.
#>
[OutputType("System.Boolean")]
    param (
#The groupname to test.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $GroupName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.GroupExists($GroupName)
    }
}

function Test-PaperCutIsUserExists {
<#
.SYNOPSIS
Test to see if a user associated with "username" exists in the system.
#>
[OutputType("System.Boolean")]
    param (
#The username to test.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.IsUserExists($Username)
    }
}

function Get-PaperCutPrinters {
<#
.SYNOPSIS
List all printers (sorted by printer name) starting at 'offset' and ending at 'limit'. This can be used to enumerate all printers in 'pages'.  When retrieving a list of all printers, the recommended page size / limit is 1000.  Batching in groups of 1000 ensures efficient transfer and processing. E.g.: listPrinters(0, 1000) - returns users 0 through 999 listPrinters(1000, 1000) - returns users 1000 through 1999 listPrinters(2000, 1000) - returns users 2000 through 2999
#>
[OutputType("System.String[]")]
    param (
#The 0-index offset in the list of printers to return.  I.e. 0 is the first printer, 1 is the second, etc.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[int] $Offset,

#The number of printers to return in this batch.  Recommended: 1000.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[int] $Limit,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.ListPrinters($Offset, $Limit)
    }
}

function Get-PaperCutSharedAccounts {
<#
.SYNOPSIS
List all shared accounts (sorted by account name) starting at offset and ending at limit. This can be used to enumerate all shared accounts in 'pages'.  When retrieving a list of all shared accounts, the recommended page size / limit is 1000.  Batching in groups of 1000 ensures efficient transfer and processing. E.g.: listSharedAccounts(0, 1000) - returns accounts 0 through 999 listSharedAccounts(1000, 1000) - returns accounts 1000 through 1999 listSharedAccounts(2000, 1000) - returns accounts 2000 through 2999
#>
[OutputType("System.String[]")]
    param (
#The 0-index offset in the list of accounts to return.  I.e. 0 is the first account, 1 is the second, etc.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[int] $Offset,

#The number of users to return in this batch.  Recommended: 1000.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[int] $Limit,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.ListSharedAccounts($Offset, $Limit)
    }
}

function Get-PaperCutUserAccounts {
<#
.SYNOPSIS
List all user accounts (sorted by username) starting at 'offset' and ending at 'limit'. This can be used to enumerate all user accounts in 'pages'.  When retrieving a list of all user accounts, the recommended page size / limit is 1000.  Batching in groups of 1000 ensures efficient transfer and processing. E.g.: listUserAccounts(0, 1000) - returns users 0 through 999 listUserAccounts(1000, 1000) - returns users 1000 through 1999 listUserAccounts(2000, 1000) - returns users 2000 through 2999
#>
[OutputType("System.String[]")]
    param (
#The 0-index offset in the list of users to return.  I.e. 0 is the first user, 1 is the second, etc.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[int] $Offset,

#The number of accounts to return in this batch.  Recommended: 1000.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[int] $Limit,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.ListUserAccounts($Offset, $Limit)
    }
}

function Get-PaperCutGroups {
<#
.SYNOPSIS
List all user groups (sorted by groupname) starting at 'offset' and ending at 'limit'. This can be used to enumerate all groups in 'pages'.  When retrieving a list of all groups, the recommended page size / limit is 1000.  Batching in groups of 1000 ensures efficient transfer and processing. E.g.: listUserGroups(0, 1000) - returns users 0 through 999 listUserGroups(1000, 1000) - returns users 1000 through 1999 listUserGroups(2000, 1000) - returns users 2000 through 2999
#>
[OutputType("System.String[]")]
    param (
#The 0-index offset in the list of groups to return.  I.e. 0 is the first group, 1 is the second, etc.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[int] $Offset,

#The number of groups to return in this batch.  Recommended: 1000.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[int] $Limit,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.ListUserGroups($Offset, $Limit)
    }
}

function Get-PaperCutUserSharedAccounts {
<#
.SYNOPSIS
List all shared accounts (sorted by account name) that the user has access to, starting at offset and listing only limit accounts. This can be used to enumerate all shared accounts in 'pages'. When retrieving a list of all shared accounts, the recommended page size / limit is 1000. Batching in groups of 1000 ensures efficient transfer and processing. E.g.: listUserSharedAccounts("user", 0, 1000) - returns accounts 0 through 999 listUserSharedAccounts("user", 1000, 1000) - returns accounts 1000 through 1999 listUserSharedAccounts("user", 2000, 1000) - returns accounts 2000 through 2999
#>
[OutputType("System.String[]")]
    param (
#The user's name.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The 0-index offset in the list of accounts to return.  I.e. 0 is the first account, 1 is the second, etc.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[int] $Offset,

#The number of accounts to return in this batch.  Recommended: 1000.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[int] $Limit,

#If true, list accounts regardless of current shared account mode.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[bool] $IgnoreAccountMode,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.ListUserSharedAccounts($Username, $Offset, $Limit, $IgnoreAccountMode)
    }
}

function Get-PaperCutUserNameByCardNo {
<#
.SYNOPSIS
Looks up the user with the given user card number and returns their user name.  If no match was found an empty string is returned.
#>
[OutputType("System.String")]
    param (
#The user card number to look up.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $CardNo,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.LookUpUserNameByCardNo($CardNo)
    }
}

function Get-PaperCutUserNameByEmail {
[OutputType("System.String")]
    param (
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Email,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.LookUpUserNameByEmail($Email)
    }
}

function Get-PaperCutUserNameByIDNo {
<#
.SYNOPSIS
Looks up the user with the given user id number and returns their user name.  If no match was found an empty string is returned.
#>
[OutputType("System.String")]
    param (
#The user id number to look up.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $IdNo,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.LookUpUserNameByIDNo($IdNo)
    }
}

function Get-PaperCutUserNameBySecondaryUserName {
[OutputType("System.String")]
    param (
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SecondaryUserName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.LookUpUserNameBySecondaryUserName($SecondaryUserName)
    }
}

function Get-PaperCutUsersByFullName {
[OutputType("System.String[]")]
    param (
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $FullName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.LookUpUsersByFullName($FullName)
    }
}

function Start-PaperCutGroupSync {
[OutputType("void")]
    param (
#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.PerformGroupSync()
    }
}

function Start-PaperCutOnlineBackup {
[OutputType("void")]
    param (
#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.PerformOnlineBackup()
    }
}

function Start-PaperCutUserAndGroupSync {
[OutputType("void")]
    param (
#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.PerformUserAndGroupSync()
    }
}

function Start-PaperCutUserAndGroupSyncAdvanced {
<#
.SYNOPSIS
An advanced version of the user and group synchronization process providing control over the sync behaviour. A call to this method will commence the sync process and the operation will complete in the background.
#>
[OutputType("void")]
    param (
#If set to True, old users will be deleted.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[bool] $DeleteNonExistentUsers,

#If set to True, user details such as full-name, email, etc. will be synced with the underlying OS/Network/Domain user directory.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[bool] $UpdateUserDetails,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.PerformUserAndGroupSyncAdvanced($DeleteNonExistentUsers, $UpdateUserDetails)
    }
}

function Invoke-PaperCutProcessJob {
<#
.SYNOPSIS
Takes the details of a job and logs and charges as if it were a "real" job.  Jobs processed via this method are not susceptible to filters, pop-ups, hold/release queues etc., they are simply logged.  See the user manual section "Importing Job Details" for more information and the format of jobDetails.
#>
[OutputType("void")]
    param (
#The job details (a comma separated list of name-value pairs with an equals sign as the name-value delimiter).
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $JobDetails,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.ProcessJob($JobDetails)
    }
}

function Invoke-PaperCutReapplyInitialUserSettings {
<#
.SYNOPSIS
Re-applies initial user settings on the given user. These initial settings are based on group membership.
#>
[OutputType("void")]
    param (
#The user's username
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.ReapplyInitialUserSettings($Username)
    }
}

function Remove-PaperCutAdminAccessGroup {
<#
.SYNOPSIS
Removes a group from the list of admin groups.
#>
[OutputType("void")]
    param (
#The name of the group.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $GroupName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.RemoveAdminAccessGroup($GroupName)
    }
}

function Remove-PaperCutAdminAccessUser {
<#
.SYNOPSIS
Removes an admin user from the list of admins.
#>
[OutputType("void")]
    param (
#The name of the user.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.RemoveAdminAccessUser($Username)
    }
}

function Remove-PaperCutGroup {
<#
.SYNOPSIS
Removes the user group.
#>
[OutputType("void")]
    param (
#The name of the group that needs to be deleted.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $GroupName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.RemoveGroup($GroupName)
    }
}

function Remove-PaperCutPrinterAccessGroup {
<#
.SYNOPSIS
Removes the group from the printer access group list.
#>
[OutputType("void")]
    param (
#The existing printer's server name.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ServerName,

#The existing printer's queue name.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PrinterName,

#The name of the group that needs to be removed from the list of groups allowed to print to this printer.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $GroupName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.RemovePrinterAccessGroup($ServerName, $PrinterName, $GroupName)
    }
}

function Remove-PaperCutSharedAccountAccessGroup {
<#
.SYNOPSIS
Revoke the given group's access to the given shared account.
#>
[OutputType("void")]
    param (
#The name of the shared account to revoke access to.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SharedAccountName,

#The name of the group to revoke access for.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $GroupName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.RemoveSharedAccountAccessGroup($SharedAccountName, $GroupName)
    }
}

function Remove-PaperCutSharedAccountAccessUser {
<#
.SYNOPSIS
Revoke the given user's access to the given shared account.
#>
[OutputType("void")]
    param (
#The name of the shared account to revoke access to.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SharedAccountName,

#The name of the user to revoke access for.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.RemoveSharedAccountAccessUser($SharedAccountName, $Username)
    }
}

function Remove-PaperCutUserFromGroup {
<#
.SYNOPSIS
Removes the user from the specified group.
#>
[OutputType("void")]
    param (
#The user name
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The name of the group.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $GroupName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.RemoveUserFromGroup($Username, $GroupName)
    }
}

function Rename-PaperCutPrinter {
<#
.SYNOPSIS
Rename a printer.  This can be useful after migrating a print queue or print server (i.e. the printer retains its history and settings under the new name).  Note that in some cases case sensitivity is important, so care should be taken to enter the name exactly as it appears in the OS.
#>
[OutputType("void")]
    param (
#The existing printer's server name.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ServerName,

#The existing printer's queue name.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PrinterName,

#The new printer's server name.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $NewServerName,

#The new printer's queue name.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $NewPrinterName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.RenamePrinter($ServerName, $PrinterName, $NewServerName, $NewPrinterName)
    }
}

function Rename-PaperCutSharedAccount {
<#
.SYNOPSIS
Rename an existing shared account.
#>
[OutputType("void")]
    param (
#The name of the shared account to rename. Use a '\' to denote a subaccount. e.g.: 'parent\sub'
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $CurrentSharedAccountName,

#The new shared account name.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $NewSharedAccountName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.RenameSharedAccount($CurrentSharedAccountName, $NewSharedAccountName)
    }
}

function Rename-PaperCutUserAccount {
<#
.SYNOPSIS
Rename a user account.  Useful when the user has been renamed in the domain / directory, so that usage history can be maintained for the new username.  This should be performed in conjunction with a rename of the user in the domain / user directory, as all future usage and authentication will need to use the new username.
#>
[OutputType("void")]
    param (
#The username of the user to rename.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $CurrentUserName,

#The user's new username.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $NewUserName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.RenameUserAccount($CurrentUserName, $NewUserName)
    }
}

function Reset-PaperCutPrinterCounts {
<#
.SYNOPSIS
Reset the counts (pages and job counts) associated with a printer.
#>
[OutputType("void")]
    param (
#The name of the server hosting the printer.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ServerName,

#The printer's name.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PrinterName,

#The name of the user/script/process resetting the counts.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ResetBy,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.ResetPrinterCounts($ServerName, $PrinterName, $ResetBy)
    }
}

function Reset-PaperCutUserCounts {
<#
.SYNOPSIS
Reset the counts (pages and job counts) associated with a user account.
#>
[OutputType("void")]
    param (
#The username associated with the user who's counts are to be reset.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The name of the user/script/process reseting the counts.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ResetBy,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.ResetUserCounts($Username, $ResetBy)
    }
}

function Set-PaperCutConfigValue {
<#
.SYNOPSIS
Set the config value from the server. NOTE: Take care updating config values.  You may cause serious problems which can only be fixed by reinstallation of the application. Use the setConfigValue API at your own risk.
#>
[OutputType("void")]
    param (
#The name of the config value to set.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ConfigName,

#The value to set.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ConfigValue,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetConfigValue($ConfigName, $ConfigValue)
    }
}

function Set-PaperCutGroupQuota {
<#
.SYNOPSIS
Set the group quota allocation settings on a given group.
#>
[OutputType("void")]
    param (
#The name of the group.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $GroupName,

#The quota amount to set.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[double] $QuotaAmount,

#The schedule period (one of either NONE, DAILY, WEEKLY or MONTHLY);
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Period,

#The maximum quota accumulation.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[double] $QuotaMaxAccumulation,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetGroupQuota($GroupName, $QuotaAmount, $Period, $QuotaMaxAccumulation)
    }
}

function Set-PaperCutPrinterCostSimple {
<#
.SYNOPSIS
Method to set a simple single page cost using the Simple Charging Model.
#>
[OutputType("void")]
    param (
#The name of the server.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ServerName,

#The name of the printer.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PrinterName,

#The cost per page (simple charging model)
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[double] $CostPerPage,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetPrinterCostSimple($ServerName, $PrinterName, $CostPerPage)
    }
}

function Set-PaperCutPrinterProperties {
[OutputType("void")]
    param (
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ServerName,

[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PrinterName,

[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string[,]] $PropertyNamesAndValues,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetPrinterProperties($ServerName, $PrinterName, $PropertyNamesAndValues)
    }
}

function Set-PaperCutPrinterProperty {
<#
.SYNOPSIS
Sets a printer property.
#>
[OutputType("void")]
    param (
#The name of the server.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $ServerName,

#The name of the printer.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PrinterName,

#The name of the property.  Valid options include: disabled.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PropertyName,

#The value of the property to set.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PropertyValue,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetPrinterProperty($ServerName, $PrinterName, $PropertyName, $PropertyValue)
    }
}

function Set-PaperCutSharedAccountAccountBalance {
<#
.SYNOPSIS
Set a shared account's account balance.
#>
[OutputType("void")]
    param (
#The name of the account to be adjusted.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $AccountName,

#The balance to set (positive or negative).
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[double] $Balance,

#The comment to be associated with the transaction.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Comment,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetSharedAccountAccountBalance($AccountName, $Balance, $Comment)
    }
}

function Set-PaperCutSharedAccountOverdraftMode {
<#
.SYNOPSIS
Set the shared account's overdraft mode
#>
[OutputType("void")]
    param (
#The name of the shared account.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SharedAccountName,

#the shared account's new overdraft mode ('individual' or 'default')
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Mode,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetSharedAccountOverdraftMode($SharedAccountName, $Mode)
    }
}

function Set-PaperCutSharedAccountProperties {
<#
.SYNOPSIS
Set multiple shared account properties at once (to save multiple calls).
#>
[OutputType("void")]
    param (
#The shared account name.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SharedAccountName,

#The list of property names and values to set. E.g. [["balance", "1.20"], ["invoice-option", "ALWAYS_INVOICE"]]. See  for valid property names.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string[][]] $PropertyNamesAndValues,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetSharedAccountProperties($SharedAccountName, $PropertyNamesAndValues)
    }
}

function Set-PaperCutSharedAccountProperty {
<#
.SYNOPSIS
Sets a shared account property.
#>
[OutputType("void")]
    param (
#The name of the shared account.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $SharedAccountName,

#The name of the property to set.  See  for valid property names.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PropertyName,

#The value of the property to set.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PropertyValue,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetSharedAccountProperty($SharedAccountName, $PropertyName, $PropertyValue)
    }
}

function Set-PaperCutUserAccountBalance {
<#
.SYNOPSIS
Set the balance on a user's account to a set value. This is conducted as a transaction.
#>
[OutputType("void")]
    param (
#The username associated with the user who's account is to be set.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The balance to set the account to.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[double] $Balance,

#A user defined comment to associate with the transaction. This may be a null string.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Comment,

#Optional name of the user's personal account. If blank, the built-in default account is used.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $AccountName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetUserAccountBalance($Username, $Balance, $Comment, $AccountName)
    }
}

function Set-PaperCutUserAccountBalanceByGroup {
<#
.SYNOPSIS
Set the balance for each member of a group to the given value.
#>
[OutputType("void")]
    param (
#The group for which all users' balance is to be set.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Group,

#The value to set all users' balance to.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[double] $Balance,

#A user defined comment to associate with the transaction. This may be a null string.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Comment,

#Optional name of the user's personal account. If blank, the built-in default account is used.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $AccountName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetUserAccountBalanceByGroup($Group, $Balance, $Comment, $AccountName)
    }
}

function Set-PaperCutUserAccountSelectionAdvancedPopup {
[OutputType("void")]
    param (
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $AuthToken,

[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $UserName,

[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[bool] $AllowPersonal,

[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[bool] $ChargeToPersonalWhenSharedSelected,

[Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
[string] $DefaultSharedAccount,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetUserAccountSelectionAdvancedPopup($AuthToken, $UserName, $AllowPersonal, $ChargeToPersonalWhenSharedSelected, $DefaultSharedAccount)
    }
}

function Set-PaperCutUserAccountSelectionAutoChargePersonal {
<#
.SYNOPSIS
Set the user to Auto Charge to Personal
#>
[OutputType("void")]
    param (
#The name of the user with the account to credit.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#If a popup confirmation is to be used (Optional. Defaults to false)
[Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
[bool] $WithPopupConfirmation = False,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetUserAccountSelectionAutoChargePersonal($Username, $WithPopupConfirmation)
    }
}

function Set-PaperCutUserAccountSelectionAutoSelectSharedAccount {
<#
.SYNOPSIS
Set the user to Auto Charge to a Single Shared Account
#>
[OutputType("void")]
    param (
#The name of the user with the account to credit.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The name of the shared account.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $AccountName,

#Transactions should be primarily charged to the user, not the account
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[bool] $ChargeToPersonal,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetUserAccountSelectionAutoSelectSharedAccount($Username, $AccountName, $ChargeToPersonal)
    }
}

function Set-PaperCutUserAccountSelectionStandardPopup {
<#
.SYNOPSIS
Set the user to select an acccount from the popup list of approved accounts
#>
[OutputType("void")]
    param (
#The name of the user with the account to credit.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#Allows the user to allocate the transaction to their personal account
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[bool] $AllowPersonal,

#Sets the popup behavior to present a list of approved accounts to the user
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[bool] $AllowListSelection,

#Sets the popup behavior to allow the user to enter a PIN code to identify an account
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[bool] $AllowPinCode,

#Sets the popup behavior to allow the user to supply alternate credentials as the billable user for the job
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[bool] $AllowPrintingAsOtherUser,

#When a shared account is selected the user should be charged for the job with a record of the transaction attributed to the account
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[bool] $ChargeToPersonalWhenSharedSelected,

#The default shared account (blank for none)
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $DefaultSharedAccount,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetUserAccountSelectionStandardPopup($Username, $AllowPersonal, $AllowListSelection, $AllowPinCode, $AllowPrintingAsOtherUser, $ChargeToPersonalWhenSharedSelected, $DefaultSharedAccount)
    }
}

function Set-PaperCutUserOverdraftMode {
<#
.SYNOPSIS
Set the user's overdraft mode
#>
[OutputType("void")]
    param (
#The name of the user.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#mode - the overdraft mode to use ('individual' or 'default')
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Mode,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetUserOverdraftMode($Username, $Mode)
    }
}

function Set-PaperCutUserProperties {
<#
.SYNOPSIS
Set multiple user properties at once (to save multiple calls).
#>
[OutputType("void")]
    param (
#The name of the user.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The list of property names and values to set. E.g. [["balance", "1.20"], ["office", "East Wing"]].  See for valid property names.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string[][]] $PropertyNamesAndValues,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetUserProperties($Username, $PropertyNamesAndValues)
    }
}

function Set-PaperCutUserProperty {
<#
.SYNOPSIS
Sets a user property.
#>
[OutputType("void")]
    param (
#The name of the user.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The name of the property to set.  Valid options include: balance, card-number, card-pin, department, disabled-net, disabled-print, email, full-name, notes, office, password, print-stats.job-count, print-stats.page-count, net-stats.data-mb, net-stats.time-hours, restricted.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PropertyName,

#The value of the property to set.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $PropertyValue,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SetUserProperty($Username, $PropertyName, $PropertyValue)
    }
}

function Test-PaperCutSharedAccountExists {
<#
.SYNOPSIS
Test to see if a shared account exists.
#>
[OutputType("System.Boolean")]
    param (
#The name of the shared account.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $AccountName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SharedAccountExists($AccountName)
    }
}

function Test-PaperCutSyncGroup {
<#
.SYNOPSIS
Syncs an existing group with the configured directory server, updates the group membership.
#>
[OutputType("System.Boolean")]
    param (
#The name of the new group to sync. The group should already exist in the network user directory.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $GroupName,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.SyncGroup($GroupName)
    }
}

function Use-PaperCutCard {
<#
.SYNOPSIS
Apply the value of a card to a user's account.
#>
[OutputType("System.String")]
    param (
#The name of the user with the account to credit.
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The number of the card to use.
[Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[string] $CardNumber,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.UseCard($Username, $CardNumber)
    }
}

function Test-PaperCutUserExists {
[OutputType("System.Boolean")]
    param (
[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
[string] $Username,

#The PaperCut server to use.
[Alias("Server")][Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
[PaperCut.ServerCommandProxy] $PaperCutServer = (Connect-PaperCutServer)
    )

    PROCESS {
        $PaperCutServer.UserExists($Username)
    }
}

