@echo off
SET "yarn_status=null"
FOR /f "delims=" %%i in ('yarn --version 2^>nul') do SET yarn_status=%%i

SET "node_status=null"
FOR /f "delims=" %%i in ('node --version 2^>nul') do SET node_status=%%i

echo {"yarn": "%yarn_status%","node": "%node_status%"} >> status.json
