; This script restarts EOS utility by clicking the stop button, then
; re-launching timer shooting (recurses until timer button is unghosted)
;
; 2014 Keith Simmons <ksimmons@gmail.com> 

Gosub, StopTimeLapse
Sleep 3000
Gosub, StartTimeLapse

exit

StopTimeLapse:
WinActivate Timer shooting status
WinWaitActive Timer shooting status
ControlClick, Stop 
return

StartTimeLapse:
WinActivate, ahk_class WindowsForms10.Window.8.app.0.3fbab22_r15_ad1
WinWaitActive, ahk_class WindowsForms10.Window.8.app.0.3fbab22_r15_ad1
ControlClick, WindowsForms10.BUTTON.app.0.3fbab22_r15_ad11, ahk_class WindowsForms10.Window.8.app.0.3fbab22_r15_ad1

IfWinExist, Timer shooting settings 
{
    WinActivate
    ControlClick, Start
    return
}
else
{
    Sleep 1000
    Gosub, StartTimeLapse
}
return



