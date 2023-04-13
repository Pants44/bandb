set "SOURCE_RESOURCE_FOLDER=.\bandb_resource_pack"
set "DESTINATION_RESOURCE_FOLDER=%LOCALAPPDATA%\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\development_resource_packs\%SOURCE_RESOURCE_FOLDER%"
RD /S /Q "%DESTINATION_RESOURCE_FOLDER%"
xcopy "%SOURCE_RESOURCE_FOLDER%" "%DESTINATION_RESOURCE_FOLDER%" /E /Y /I

set "SOURCE_BEHAVIOR_FOLDER=.\bandb_behavior_pack"
set "DESTINATION_BEHAVIOR_FOLDER=%LOCALAPPDATA%\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\development_behavior_packs\%SOURCE_BEHAVIOR_FOLDER%"
RD /S /Q "%DESTINATION_BEHAVIOR_FOLDER%"
xcopy "%SOURCE_BEHAVIOR_FOLDER%" "%DESTINATION_BEHAVIOR_FOLDER%" /E /Y /I

@echo off
xcopy "launch.json" "%DESTINATION_BEHAVIOR_FOLDER%" /Y
xcopy "launch.json" "%DESTINATION_RESOURCE_FOLDER%" /Y

@echo off
tasklist /FI "IMAGENAME eq Minecraft.Windows.exe" 2>NUL | find /I /N "Minecraft.Windows.exe">NUL
if "%ERRORLEVEL%"=="0" (
    taskkill /IM Minecraft.Windows.exe /F
    echo Minecraft Bedrock Edition has been stopped.
) else (
    echo Minecraft Bedrock Edition is not currently running. Lets start it.
)
start shell:AppsFolder\Microsoft.MinecraftUWP_8wekyb3d8bbwe!App