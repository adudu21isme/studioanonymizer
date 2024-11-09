ℹ️Used for partially anonymizing roblox studio without usage of client settings such as fflags

❗Use default.bat for normal usage, internal.bat for roblox studio internal, make sure "Patcher" folder is located in %userprofile%\Desktop\Patcher\. if signature is outdated for internal then [use this guide](https://github.com/7ap/internal-studio-patcher/wiki/Updating). if signature is vaild and patching fails then directly run the executable.

⚠️This script will log you out of the roblox client, this breaks the multiple login feature in roblox studio.

❗This doesn't delete plugin folders (userid named folders) and settings located at 
```
%userprofile%\AppData\Local\Roblox\
```
ℹ️Make sure to edit the Windows Host file to include the following:

```
127.0.0.1 ecsv2.roblox.com
127.0.0.1 ncs.roblox.com
127.0.0.1 client-telemetry.roblox.com
127.0.0.1 dfw2-128-116-95-3.roblox.com
127.0.0.1 ams2-128-116-21-3.roblox.com
127.0.0.1 atl1-128-116-99-3.roblox.com
127.0.0.1 lax2-128-116-116-3.roblox.com
127.0.0.1 nrt1-128-116-120-3.roblox.com
127.0.0.1 gold.roblox.com
127.0.0.1 ord2-128-116-101-3.roblox.com
127.0.0.1 lms.roblox.com
127.0.0.1 metrics.roblox.com
127.0.0.1 tracing.roblox.com
```
