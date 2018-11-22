@ECHO OFF

SET "yarn_found=null"
FOR /f "delims=" %%i in ('yarn -V 2^>nul') do SET yarn_found=%%i
echo yarn version: %yarn_found%

rem rem set the variables
SET YARN_EXEC=yarn-1.12.3.msi
SET "DOWNLOAD_URL=https://yarnpkg.com/latest.msi"
SET "FILENAME=%~dp0\yarn-1.12.3.msi"
SET "YARN_DOWNLOAD_STATUS=true"
SET "INSTALLATION_LOCATION=%ProgramFiles(x86)%"
SET "YARN_AVAILABLE_STATUS=false"


rem if yarn_found is null then install silently

IF "%yarn_found%"=="null" (
        msiexec.exe /i %YARN_EXEC% /qb /l* yarn-install-log.txt
        timeout 30 > NUL
)ELSE (
    echo Could not install yarn ...
)
