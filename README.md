ℹ️Used for partially anonymizing roblox studio without usage of client settings such as FFlags.

❗Use default.bat for normal usage. internal.bat for roblox studio internal, make sure "Patcher" folder is located in %userprofile%\Desktop\. if signature is outdated then [use this guide](https://github.com/7ap/internal-studio-patcher/wiki/Updating), if the script automatically runs the patcher and doesn't patch while the signature is valid then manually run the patcher (.exe) twice.

❗To prevent Roblox Studio from automatically updating (removes studio internal if updated), you must delete:
```
RobloxStudioInstaller.exe
```
and
```
RobloxStudioLauncherBeta.exe
```
in your roblox studio installation however this is not recommended as updates tend to add new content, fix bugs and such.

❗This doesn't delete plugin folders (userid named folders) and settings located at 
```
%userprofile%\AppData\Local\Roblox\
```

⚠️This script will log you out of the roblox client, this breaks the multiple login feature in roblox studio.

ℹ️Make sure to edit the Windows Host file to include the following:

```
::1       localhost
127.0.0.1 localhost
127.0.0.1 rbxinfra.com
127.0.0.1 rbx.com
127.0.0.1 ecsv2.roblox.com
127.0.0.1 ncs.roblox.com
127.0.0.1 client-telemetry.roblox.com
127.0.0.1 gold.roblox.com
127.0.0.1 lms.roblox.com
127.0.0.1 metrics.roblox.com
127.0.0.1 tracing.roblox.com
```
