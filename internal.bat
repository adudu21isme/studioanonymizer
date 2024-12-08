@echo off
title Anonymized Studio Internal
start "" "%userprofile%\Desktop\Patcher\target\release\internal-studio-patcher.exe"
setlocal
:PROMPT
SET /P AREYOUSURE=Erase Credentials? y/n:
IF /I "%AREYOUSURE%" NEQ "y" GOTO GO
for /f "tokens=1,2 delims= " %%a in ('cmdkey /list ^| find "www.roblox.com"') do ( cmdkey /delete:%%b > nul 2>&1)
echo Erased Credentials
:GO
endlocal
setlocal
:PROMPT
SET /P AREYOUSURE=Anonymize Files? y/n:
IF /I "%AREYOUSURE%" NEQ "y" GOTO GO
echo Erasing Cache and Roblox AppData...
powershell -Command "Remove-Item '%userprofile%\AppData\LocalLow\rbxcsettings.rbx' -Force -ErrorAction SilentlyContinue; Remove-Item '%userprofile%\AppData\Local\Roblox\AnalysticsSettings.xml' -Force -ErrorAction SilentlyContinue; Remove-Item '%userprofile%\AppData\Local\Roblox\LocalStorage' -Recurse -Force -ErrorAction SilentlyContinue; Remove-Item '%userprofile%\AppData\Local\Roblox\Downloads' -Recurse -Force -ErrorAction SilentlyContinue; Remove-Item '%userprofile%\AppData\Local\Roblox\OTAPatchBackups' -Recurse -Force -ErrorAction SilentlyContinue; Remove-Item '%userprofile%\AppData\Local\Roblox\logs' -Recurse -Force -ErrorAction SilentlyContinue; Remove-Item '%userprofile%\AppData\Local\Roblox\ScriptAutosaves' -Recurse -Force -ErrorAction SilentlyContinue; Remove-Item '%userprofile%\AppData\Local\Roblox\UserCaptures' -Recurse -Force -ErrorAction SilentlyContinue; Remove-Item '%userprofile%\AppData\Local\Roblox\Sandbox' -Recurse -Force -ErrorAction SilentlyContinue; Remove-Item '%userprofile%\AppData\Local\Roblox\pluginIDEState' -Recurse -Force -ErrorAction SilentlyContinue; Remove-Item '%userprofile%\AppData\Local\Roblox\InstalledPlugins' -Recurse -Force -ErrorAction SilentlyContinue; Remove-Item '%userprofile%\AppData\Local\Temp' -Recurse -Force -ErrorAction SilentlyContinue"
:GO
endlocal
echo Adjusting Studio Registry...
reg add "HKCU\Software\ROBLOX Corporation\Environments\RobloxStudio\Channel" /v "www.roblox.com" /t REG_SZ /d "zflag" /f > nul 2>&1
reg add "HKCU\Software\ROBLOX Corporation\Environments\RobloxPlayer\Channel" /v "www.roblox.com" /t REG_SZ /d "zflag" /f > nul 2>&1
reg add "HKCU\Software\Roblox\RobloxStudio\LoggedInUsersStore\https:\www.roblox.com" /v "users" /t REG_SZ /d "{}" /f > nul 2>&1
reg add "HKCU\Software\ROBLOX Corporation\Environments\roblox-studio\Capabilities" /v "ApplicationName" /t REG_SZ /d "BAD ROBLOX STUDIO" /f > nul 2>&1
reg add "HKCU\Software\ROBLOX Corporation\Environments\roblox-studio\Capabilities" /v "ApplicationDescription" /t REG_SZ /d "Please use Roblox Studio Internal" /f > nul 2>&1
reg delete "HKCU\Software\Roblox\RobloxStudio\RobloxStudioFirstTimeLoggedIn" /f > nul 2>&1
reg delete "HKCU\Software\Roblox\RobloxStudio\RobloxStudioMostRecentLogin" /f > nul 2>&1
reg delete "HKCU\Software\Roblox\RobloxStudio\RobloxStudioLaunchTrackingGuid" /f > nul 2>&1
reg delete "HKCU\Software\Roblox\RobloxStudio\DirtyPublishWarningDialog" /f > nul 2>&1
echo Checking Studio Registry...
powershell -Command "$robloxStudioPath='Registry::HKEY_CURRENT_USER\Software\Roblox\RobloxStudio';$subKeys=Get-ChildItem -Path $robloxStudioPath;$regexPattern='^(rbxRecentRobloxApiGames_v02_\d+|\d+(_\d+)?|(\d+rbxRecentFiles_v03))$';$foundKeys=@();foreach($key in $subKeys){if($key.PSChildName -match $regexPattern){$foundKeys+= $robloxStudioPath + '\' + $key.PSChildName;}}if($foundKeys.Count -gt 0){Write-Host '';$foundKeys | ForEach-Object {Write-Host $_};$confirmation=Read-Host 'Delete UserId Studio Registry? y/n';if($confirmation -eq 'y'){foreach($keyPath in $foundKeys){Remove-Item -Path $keyPath -Recurse -Force -ErrorAction SilentlyContinue}Write-Host 'Deleted UserIds';}}"
echo Launching...
start "" "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Roblox\Roblox Studio.lnk"
