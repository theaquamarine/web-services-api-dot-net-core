## PowerShell module for PaperCut

This module is very early on and mostly automatically generated from `PaperCut.ServerCommandProxy` and documentation using `codegenerator.ps1`.

To generate the functions, run `Start-Job {cd $pwd;.\codegenerator.ps1}|Wait-Job|Remove-Job` from  the PSPaperCut directory.

Automatically generated code is not committed to most branches but is available in a branch called `pspapercut-hydrated`. The functions will eventually be committed for manual editing.

### Installation

There are currently two main options for installing this module: 
-   Running `dotnet publish` (after running `codegenerator.ps1` if needed) and using the contents of `bin\{Configuration}\netstandard2.0\publish`, either directly or in a folder called `PSPaperCut` on your PSModulePath, or
-   Downloading the artifacts from a 'PowerShell Module' Github Action, ideally from the `pspapercut-hydrated` branch.

### Usage

Connect to your PaperCut server using `Connect-PaperCutServer`:

`$server = Connect-PaperCutServer -Server localhost -Port 9191 -AuthToken password123`

User the module's functions, providing the server details.

`Test-PaperCutUserExists -Username admin -Server $server`

### Todo

-   Several methods are not well ported to PowerShell and will probably be manually done, particularly overloaded methods, and most of the `Test-` methods.
-   Return and accept objects rather than strings- this is PowerShell! Return a `PaperCutUser` like an `ADUser`, for example. There's some work on this in the `pspapercut-objects` branch.
-   Several groups of methods should probably be the same function, eg the ones for retrieving user properties, the ones for finding users using other details, etc.
-   The current method for providing a server to functions is cumbersome, and I suspect most people do not regularly connect to more than one PaperCut instance (particularly at once). Look at other options - perhaps have a default or last used one saved in module scope and used if another isn't specified. [`SecretServer`](https://github.com/RamblingCookieMonster/SecretServer) module's workflow could be an option.
-   Plenty of commands have things that look like they should be optional parameters, but aren't. Part of this is not being able to handle overloaded methods currently, part is `ServerCommandProxy` always wanting all parameters. Examples include `Limit` and `Offset` parameters throughout.
-   Parameters that want one of a set of options should use `ValidateSet`, eg quota periods.
-   Error messages are fairly obtuse- they're returned directly from the Java PaperCut server, and include the Java exception plus some wrapping, eg `Exception calling "SetGroupQuota" with "4" argument(s): "Server returned a fault exception: [295] java.lang.Exception: The supplied schedule period 'never' is invalid or unsupported."` This may be better dealt with outside the PowerShell module.
