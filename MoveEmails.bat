set source=E:\
set target=C:\Warlords\Email
set archive=%target%\Archive
move %target%\*.EML %archive%
copy %source%\*.EML %target%