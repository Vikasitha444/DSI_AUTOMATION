#Requires AutoHotkey v2.0
msgbox "This Automation Process Is Still In The Test Mode. Do this with your own Risk" ;

/* AHK තුල, Special Keys වල නම් වෙනුවට භාවිතා කරන සංඛේත */
            /* ^ : Control */
            /* + : Shift */
            /* ! : ALT */
            /* # : WinKey */


::deshan::dss008894 ; මේ Code එකෙන්, "deshan" ලෙස Type කර, "Enter" බොත්තම Click කල විට, EPF කේතය Type වේ.        
::nilantha::dss0050087


#HotIf WinActive("ahk_exe chrome.exe")            
^+x::{            
    WinActivate("ahk_exe chrome.exe")
    Sleep 300

    Send "^t"
    Sleep 300

    RunWait "Capture the Screenshot.exe"

    WinActivate("ahk_exe WINWORD.EXE")

}


/* මේ Code එකෙන් කරන්නේ, Window එක "Active (Focus වෙලාද)" කියා බලන එක */
/* (Window එකක, නම හොයාගන්න, "Window Spy" කියන Tool එක භාවිතා කරන්න පුළුවන්. මේක, "AHK Dashboard" එකේ තියෙනවා) */
#HotIf WinActive("ahk_exe WINWORD.EXE") 
^+v::{  
     RunWait "Copy And Paste the Image in MS Word.exe"
     WinActivate("ahk_exe mspaint.exe")
     RunWait "Drawing in the MS Paint.exe"

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
