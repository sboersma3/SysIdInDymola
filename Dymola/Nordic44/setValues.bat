@echo on
setlocal

set /p M=<Mvalue.txt
set /p L=<Lvalue.txt
set /p h=<hvalue.txt
set /p ll=<llvalue.txt
call :FindReplace "M=50" "M=%M%" ..\ExcitationGeneration\Multisine_Noise_Simu.mo
call :FindReplace "L=4" "L=%L%" ..\ExcitationGeneration\Multisine_Noise_Simu.mo
call :FindReplace "h=0.01" "h=%h%" ..\ExcitationGeneration\Multisine_Noise_Simu.mo
call :FindReplace "ll=10" "ll=%ll%" ..\ExcitationGeneration\Multisine_Noise_Simu.mo

exit /b 

:FindReplace <findstr> <replstr> <file>
set tmp="%temp%\tmp.txt"
If not exist %temp%\_.vbs call :MakeReplace
for /f "tokens=*" %%a in ('dir "%3" /s /b /a-d /on') do (
  for /f "usebackq" %%b in (`Findstr /mic:"%~1" "%%a"`) do (
    echo(&Echo Replacing "%~1" with "%~2" in file %%~nxa
    <%%a cscript //nologo %temp%\_.vbs "%~1" "%~2">%tmp%
    if exist %tmp% move /Y %tmp% "%%~dpnxa">nul
  )
)
del %temp%\_.vbs
exit /b

:MakeReplace
>%temp%\_.vbs echo with Wscript
>>%temp%\_.vbs echo set args=.arguments
>>%temp%\_.vbs echo .StdOut.Write _
>>%temp%\_.vbs echo Replace(.StdIn.ReadAll,args(0),args(1),1,-1,1)
>>%temp%\_.vbs echo end with

