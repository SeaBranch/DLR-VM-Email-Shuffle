if not "%minimized%"=="" goto :minimized
set minimized=true
start /min cmd /C "%~dpnx0"
goto :EOF
:minimized

set source=E:
set outbox=%source%\Outbox
if not exist %outbox% ( mkdir %outbox% )
set target=C:\Warlords\Email
set archive=%target%\Archive
:loop

ping 127.0.0.1 -n 3 > nul

for %%I in (%source%\*.EML) do (
  if not exist %archive%\%%~nxI (
    copy %%I %archive%
  )
  if not exist %target%\%%~nxI (
    copy %%I %target%
  )
)

For %%J in (%target%\*.EML) do (
  if not exist %archive%\%%~nxJ (
    copy %%J %outbox%
  )
)

goto loop