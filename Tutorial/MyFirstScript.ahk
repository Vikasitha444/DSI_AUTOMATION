#Requires AutoHotkey v2.0

/* AHK තුල, Special Keys වල නම් වෙනුවට භාවිතා කරන සංඛේත */
            /* ^ : Control */
            /* + : Shift */
            /* ! : ALT */
            /* # : WinKey */

#SingleInstance Force ;මේ Code එකෙන්, Script එක, දෙවතාවක් "Run වීම" වළක්වනවා



!x::msgbox "hello" ; මේ Code එකෙන්, "ALT + X" ක්ලික් කල විට, "Hello" යන වචනය, MassageBox එකක දර්ශනය වේ.

::btv:: By the way ; මේ Code එකෙන්, "btv" ලෙස Type කර, "Enter" බොත්තම Click කල විට, "By the way" යන වචනය Type වේ.
:*:PEmail:: pawanvikasitha2001@gmail.com ; මේ Code එකෙන්, "PEmail" ලෙස Type කල සැනින්, "Email එක" Type වේ. (මෙහිදී, "Enter" බොත්තම "Press කිරීම" අනිවාර්ය නොවේ)


#C::Run "Chrome" ; "Windows + C" ක්ලික් කර පසු, "Chrome Web Browser" එක Open වේ.
#Y::Run "www.youtube.com"  ; "Windows + Y" ක්ලික් කර පසු, "Default Web Browser" එකෙන්, "Youtube" Open වේ.
#d::Run "C:\Users\User\Documents\AutoHotkey" ; "Windows + D" Click කල පසු, ඇදලා Folder එක Open වේ.
#a::Run "C:\Users\" A_UserName "\Documents\AutoHotkey" ;"A_Username" යන විචල්‍ය නිසා, Folder Path එක ලබා දීමේදී, "UserName" එක වෙනස් වුනත් එය ගැටළුවක් නොවේ.
#q::Run "C:\Users\" A_UserName "\Downloads"
#h::Run "C:\Users\" A_UserName "\Documents\AutoHotkey\MyFirstScript.ahk"
#e::Edit ; "Windows + E" ක්ලික් කිරීමෙන්, අදාළ, AHK File එක, Edit කර ගත හැකිය.





+^,::Send A_DD '/' A_MM '/' A_YYYY   ;"Shift + Ctrl" ක්ලික් කළ විට, දිනය, මාසය සහ වර්ෂය Type වේ. (මේ වගේ Comman functions ගොඩක් තියෙනවා)
 

/* මේ Code එකෙන් කරන්නේ, "Visual Studio Code" කියන Window එක "Active (Focus වෙලාද)" කියා බලන එක */
/* (Window එකක, නම හොයාගන්න, "Window Spy" කියන Tool එක භාවිතා කරන්න පුළුවන්. මේක, "AHK Dashboard" එකේ තියෙනවා) */
#HotIf WinActive("MyFirstScript.ahk - Visual Studio Code")
#+p::{                     ; මේ Code එකෙන් කරන්නේ,  අදාළ Window එක Activte වෙලා නම්, පහලින් ඇති, "Actions" සිදු කිරීමයි
    
    Run 'Chrome'
    Sleep 200               ; මේ Code එකෙන් කරන්නේ, "Action" දෙකක් අතර Delay එකක් තැබීම. (මේක අනිවාර්යෙන් කරන්න ඕනේ)
    Send "{Space}"
    Sleep 200
    Send "{Tab}"
    Sleep 200
    Send "{Space}"   
    Sleep 200
    Send "Does the 'Echos of Love' song is Public Domain?"
    Sleep 200
    Send "{Tab}"
    Sleep 200
    Send "{Enter}"
    Sleep 200
}


#HotIf WinActive("ahk_exe chrome.exe")
w::{
    MouseClick "left"
    Sleep 500

    Send "{Down}"
    Sleep 200

    Send "^a"
    Sleep 200

    
    A_Clipboard := ""    ;මේක, AHK වල, "Inbuild Variable" එකක්. මේකේ "A_" කියන කොටස, නැහැ යැයි උපකල්පනය කරන්න.
    Send "^c"
    ClipWait 1
    

    msgbox A_Clipboard

    WinActivate("ahk_exe Notepad.exe")
    Sleep 200
    Send "^V"
    Sleep 200

    MouseClick "left"


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
     
