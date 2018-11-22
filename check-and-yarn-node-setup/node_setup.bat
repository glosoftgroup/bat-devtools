@ECHO OFF

SET "node_found=null"
FOR /f "delims=" %%i in ('node -v 2^>nul') do SET node_found=%%i
echo node version: %node_found%

rem set the variables
SET NODE_EXEC=node-v10.13.0-x86.msi
SET "DOWNLOAD_URL=http://nodejs.org/dist/v10.13.0/%NODE_EXEC%"
SET "FILENAME=%~dp0\node-v10.13.0-x86.msi"
SET "NODE_DOWNLOAD_STATUS=false"
SET "INSTALLATION_LOCATION=%ProgramFiles(x86)%"

rem check if node_found is null to download the file and install
IF "%node_found%"=="null" (
		bitsadmin.exe /transfer "JobName" "%DOWNLOAD_URL%" "%FILENAME%"
		SET "NODE_DOWNLOAD_STATUS=true"
)ELSE (
    echo Node is already installed. Proceeding ...
)

rem if node_download is true then install silently

IF "%NODE_DOWNLOAD_STATUS%"=="true" (
        msiexec.exe /i %NODE_EXEC% /qb /l* node-install-log.txt
)ELSE (
    echo Could not install ...
)

rem confirm version of node
FOR /f "delims=" %%i in ('node -v 2^>nul') do SET node_found=%%i
echo node version: %node_found%
