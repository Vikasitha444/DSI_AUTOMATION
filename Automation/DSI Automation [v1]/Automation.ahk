#Requires AutoHotkey v2.0  ;මේ Code එකෙන්, AHK v2 එක භාවිතා වන බව පෙන්වයි


msgbox "This Automation Process Is Still In The Test Mode. Do this with your own Risk" ; මේ Code එකෙන්, ලියා ඇති වාක්‍ය, MassageBox එකක දර්ශනය වේ.

/* AHK තුල, Special Keys වල නම් වෙනුවට භාවිතා කරන සංඛේත */
            /* ^ : Control */
            /* + : Shift */
            /* ! : ALT */
            /* # : WinKey */


::deshan::dss008499 ; මේ Code එකෙන්, "deshan" ලෙස Type කර, "Enter" බොත්තම Click කල විට, EPF කේතය Type වේ.        
::nilantha::dss000736
::Sarath::dss004825
::Sajith::dss008155


#Requires AutoHotkey v2.0

CoordMode("Pixel", "Client")

; Initialize PID variables
checker_window_pid := 0
packer_window_pid  := 0
picker_window_pid  := 0

windows := WinGetList("ahk_exe javaw.exe ahk_class SunAwtFrame")

for hwnd in windows {
    title := WinGetTitle("ahk_id " hwnd)

    if !InStr(title, "Warehouse Management System")
        continue

    WinActivate("ahk_id " hwnd)
    Sleep(500)

    Send("#{Up}")
    Sleep(1000)

    color := PixelGetColor(650, 34, "RGB")
    colorHex := Format("{:06X}", color)

    ; Get the process ID of this window
    pid := WinGetPID("ahk_id " hwnd)

    ; Assign PID according to window color
    switch colorHex {
        case "4472C4":
            checker_window_pid := pid

        case "ED7D31":
            packer_window_pid := pid

        case "00B050":
            picker_window_pid := pid
    }
}

; Display the assigned PIDs
MsgBox(
    "ahk_pid " . picker_window_pid
)

WinActivate("ahk_pid " . picker_window_pid) 


/* මේ Code එකෙන් කරන්නේ, "Picker" කියන Window එක "Active (Focus වෙලාද)" කියා බලන එක */
/* (Window එකක, නම හොයාගන්න, "Window Spy" කියන Tool එක භාවිතා කරන්න පුළුවන්. මේක, "AHK Dashboard" එකේ තියෙනවා) */
#HotIf WinActive("ahk_pid " . picker_window_pid) 
F5::{            
    RunWait "Picker.exe"   ; මේ Code එකෙන්, "Picker.exe" එක ධාවනය වී අවසන් වනතුරු රැඳී සිටි. "Picker.exe" එක මඟින් සිදු වන්නේ, "Picker" Window එක තුල සිදු වෙන Clicks සිදු කිරීමයි. මෙය, "TinyTask" නම්, Software එක භාවිතා කර කලින් නිර්මාණය කර තිබු File එකක්.
    
    WinActivate("ahk_pid " . checker_window_pid) ; /* මේ Code එකෙන් කරන්නේ, "Checker" කියන Window එක "Active (Focus)" කිරීම */
    Sleep 300

    

    WinActivate("ahk_pid " . checker_window_pid) ;/* මේ Code එකෙන් කරන්නේ, "Checker" කියන Window එක "Active (Focus)" කිරීම */
    RunWait "Paste the barcode in Checker Window.exe" ; මේ Code එකෙන්, "Picker.exe" එක ධාවනය වී අවසන් වනතුරු රැඳී සිටි. 

}


/* මේ Code එකෙන් කරන්නේ, "Checker" කියන Window එක "Active (Focus වෙලාද)" කියා බලන එක */
#HotIf WinActive("ahk_pid " . checker_window_pid) 
F6::{  
     RunWait "Checker Window.exe" ; මේ Code එකෙන්, "checker.exe" එක ධාවනය වී අවසන් වනතුරු රැඳී සිටි. 
     WinActivate("ahk_pid " . packer_window_pid) ; /* මේ Code එකෙන් කරන්නේ, "Packer" කියන Window එක "Active (Focus)" කිරීම */
     RunWait "Packer Window.exe" ; මේ Code එකෙන්, "Packer Window.exe" එක ධාවනය වී අවසන් වනතුරු රැඳී සිටි. 
     WinActivate("ahk_pid " . picker_window_pid)  ; /* මේ Code එකෙන් කරන්නේ, "Picker" කියන Window එක, නැවත "Active (Focus)" කිරීම */
}

    

/* Script එකක් F12 Press කරලා, නවත්වන්න හදපු Code එක */
#SingleInstance Force 
#UseHook
F12:: {
    ; Force-stop all AutoHotkey processes
    for proc in ComObject("WbemScripting.SWbemLocator")
        .ConnectServer().ExecQuery(
            "SELECT ProcessId FROM Win32_Process " .
            "WHERE Name LIKE 'AutoHotkey%'"
        )
    {
        try {
            ProcessClose(proc.ProcessId)
        }
    }
}
