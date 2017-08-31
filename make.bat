@ECHO OFF
SET STARTADDR=$500
SET INPUTFN=Driver
SET OUTTAP=sl.tap
SET AUTOFLAG=1



SET BINARYFILE=stormld
set DESCBIN=Start Stormlord game

SET PATH_RELEASE=build\usr\share\%BINARYFILE%\
SET ORICUTRON="..\..\..\oricutron\"
set VERSION=1.0.0
SET ORIGIN_PATH=%CD%
echo %osdk%


IF NOT EXIST build\bin mkdir build\usr\bin
IF NOT EXIST build\usr\share\doc\ mkdir build\usr\share\doc\
IF NOT EXIST build\usr\share\doc\%BINARYFILE% mkdir build\usr\share\doc\%BINARYFILE%
rem IF NOT EXIST build\usr\share\%BINARYFILE% mkdir build\usr\share\%BINARYFILE%
IF NOT EXIST build\usr\share\man mkdir build\usr\share\man
IF NOT EXIST build\usr\share\ipkg mkdir build\usr\share\ipkg

echo Compiling %BINARYFILE% ...
echo #define VERSION %VERSION% > src\version.h
echo Building ipkg csv
echo stormld   1.0.0  Start Storm lord > src\ipkg\%BINARYFILE%.csv




copy README.md build\usr\share\doc\%BINARYFILE%\
copy src\ipkg\%BINARYFILE%.csv build\usr\share\ipkg\


%OSDK%\bin\xa.exe %INPUTFN%.s -o release\final.out -e xaerr.txt -l %INPUTFN%.txt


%OSDK%\bin\xa.exe %INPUTFN%.s -o build\usr\bin\%BINARYFILE% -e xaerr_telemon.txt -l %INPUTFN%_telemon.txt  -DTARGET_TELEMON

%OSDK%\bin\header.exe -a%AUTOFLAG% release\final.out %OUTTAP% %STARTADDR%

copy build\usr\bin\%BINARYFILE% ..\..\..\oricutron\usbdrive

rem copy %OUTTAP% c:\emulate\oric\shared /Y
rem pause

IF "%1"=="NORUN" GOTO End
rem mkdir %ORICUTRON%\usbdrive\usr\share\man\%BINARYFILE%\
copy build\usr\bin\%BINARYFILE% %ORICUTRON%\usbdrive\usr\bin
copy src\man\%BINARYFILE%.hlp %ORICUTRON%\usbdrive\usr\share\man\
copy src\ipkg\%BINARYFILE%.csv  %ORICUTRON%\usbdrive\usr\share\ipkg\

cd %ORICUTRON%
OricutronV4 -mt
cd %ORIGIN_PATH%

:End
