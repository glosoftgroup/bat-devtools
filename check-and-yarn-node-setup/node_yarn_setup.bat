
@ECHO off

IF _%1_==_payload_  GOTO :payload

:getadmin
    echo %~nx0: elevating self
    SET vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 0 >> "%vbs%"
    rem "runas", 0 -> hide console
    rem "runas", 1 -> show console
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
GOTO :eof

:payload
    echo %~nx0: running payload with parameters:
    echo %*
    echo ---------------------------------------------------
    cd /d %2
    shift
    shift

    rem put your code here

    rem check if node exists else download and install
    call node_setup.bat

    rem 10 seconds timeout for node to finish install
    timeout 10 > NUL

    rem check if yarn exists else download and install
    call yarn_setup.bat

GOTO :eof