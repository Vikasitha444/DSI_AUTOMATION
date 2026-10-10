#Requires AutoHotkey v2.0
msgbox "This Automation Process Is Still In The Test Mode. Do this with your own Risk" ;

/* AHK තුල, Special Keys වල නම් වෙනුවට භාවිතා කරන සංඛේත */
            /* ^ : Control */
            /* + : Shift */
            /* ! : ALT */
            /* # : WinKey */


::deshan::dss008499 ; මේ Code එකෙන්, "deshan" ලෙස Type කර, "Enter" බොත්තම Click කල විට, EPF කේතය Type වේ.        
::nilantha::dss000736
::Sarath::dss004825
::Sajith::dss008155



#HotIf WinActive("ahk_pid 14300")            
F5::{            
    RunWait "Picker.exe"
    
    WinActivate("ahk_pid 9268")
    Sleep 300

    

    WinActivate("ahk_pid 9268")
    RunWait "Paste the barcode in Checker Window.exe"

}



#HotIf WinActive("ahk_pid 9268") 
F6::{  
     RunWait "Checker Window.exe"
     WinActivate("ahk_pid 14124")
     RunWait "Packer Window.exe"
     WinActive("ahk_pid 14300")   
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
