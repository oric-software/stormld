@ECHO OFF
SET STARTADDR=$500
SET INPUTFN=Driver
SET OUTTAP=sl.tap
SET AUTOFLAG=1
%OSDK%\bin\xa.exe %INPUTFN%.s -o final.out -e xaerr.txt -l %INPUTFN%.txt


%OSDK%\bin\xa.exe %INPUTFN%.s -o release\stormld -e xaerr_telemon.txt -l %INPUTFN%_telemon.txt  -DTARGET_TELEMON

%OSDK%\bin\header.exe -a%AUTOFLAG% final.out %OUTTAP% %STARTADDR%

copy release\storm.com ..\..\..\oricutron\usbdrive

rem copy %OUTTAP% c:\emulate\oric\shared /Y
rem pause
