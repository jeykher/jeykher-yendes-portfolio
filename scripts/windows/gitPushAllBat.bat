@ECHO OFF

:: gitPushAll Script BAT

:: This script Bat allow to push all changes on bitbucket, gitlab & github git remote repositories

:: Params
:: %1 => --branch: string
:: %2 => branch: string

:: Comand 
::  gitPushAll --branch [rama a hacer push]

:: Variables
:: branch: store git branch to push on git remote repositories

SET branch=%2

:WELCOME

COLOR FF
@ECHO.
ECHO "Welcome %USERNAME%"
@ECHO.

:PUSHING

ECHO "Wait a second to push change on git remote repositories..."
@ECHO.
ECHO "Push changes on bitbucket remote repositories for branch %branch%..."
@ECHO.
git push bitbucket %branch%
@ECHO.
ECHO "Push changes on gitlab remote repositories for branch %branch%..."
@ECHO.
git push gitlab %branch%
@ECHO.
ECHO "Push changes on github remote repositories for branch %branch%..."
@ECHO.
git push github %branch%
@ECHO.
GOTO :FINISH

:FINISH

ECHO "The process has finished successfully."
@ECHO.
ECHO "Please press any button to finish..."
@ECHO.
PAUSE

:END
