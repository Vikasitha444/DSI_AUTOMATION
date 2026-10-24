#Requires AutoHotkey v2.0  ;මේ Code එකෙන්, AHK v2 එක භාවිතා වන බව පෙන්වයි


msgbox "This Automation Process Is Still In The Test Mode. Do this with your own Risk" ; මේ Code එකෙන්, ලියා ඇති වාක්‍ය, MassageBox එකක දර්ශනය වේ.

/* AHK තුල, Special Keys වල නම් වෙනුවට භාවිතා කරන සංඛේත */
            /* ^ : Control */
            /* + : Shift */
            /* ! : ALT */
            /* # : WinKey */


 ; මේ Code එකෙන්, "deshan" ලෙස Type කර, "Enter" බොත්තම Click කල විට, EPF කේතය Type වේ. (Hot Strings ලෙසද හැඳින්වේ)        
::nilantha::dss000736
::Ramesh::dss004674
::Pasindu::dss008290
::deshan::dss008499
::Sajith::dss008155
::Ranasingha::dss000698
::Lasantha::dss003512
::Dauglas::dss003637
::Kuruppu::dss003837
::Mahendra::dss004826
::Thilak::dss005126
::Sampath::dss007956
::Sarath::dss004825
::Bandusena::dss006485





CoordMode("Pixel", "Client")
;  මෙතැනදී, "CoordMode" Function එකෙන් කරන්නේ, "Client ගේ Software එකේ Window එකට"සාපෙක්ෂව, Screen එකේ, ඛණ්ඩාංක ලබා ගැනීමයි.
; "CoordMode" Function එකට, "Parameters" 02ක් "Parse" කල යුතු වේ. 
;            (i) ඛණ්ඩාංක මැනීමට භාවිතා කල යුතු මිම්ම {උදා:- Pixel }
;            (ii) ඛණ්ඩාංක ලබා ගත යුත්තේ, "Screen එකට", "Window එකට" හෝ "Client ගේ Software එකේ Window එකට"සාපෙක්ෂවද යන්නයි. (මෙහි, හොඳම ක්‍රමය වන්නේ, "Client ගේ Software එකේ Window එකට"සාපෙක්ෂව ඛණ්ඩාංක ලබා ගැනීමයි)
; "CoordMode" යන්නෙහි දිගු නාමය වන්නේ, "coordinates mode" යන්නයි.



;මේ Code එකෙන්, "checker_window_pid","packer_window_pid","picker_window_pid" යන Variable වලට, බින්දුව (0), Assign කරනු ලැබේ. මෙහි අරමුණ වන්නේ, එම, "Variables" වල අගයන්, "Reset" කිරීමයි.
checker_window_pid := 0
packer_window_pid  := 0
picker_window_pid  := 0



;මේ Code එකෙන්, "DSI Warehouse Mangement System" එකට, අයත් "Windows" මොනවද යන්න සොයා, ඉන්පසු එය, List එකකට Save කරයි.
;මෙහි අරමුණ වන්නේ, Computer එකේ, Windows කිහිපයක් Open කර ඇති විට, "DSI Warehouse Mangement System" එකට, අයත් "Windows" වෙනම හඳුනා ගැනීමයි.
;"DSI Warehouse Mangement System" එක අයිති, "ahk_exe javaw.exe ahk_class SunAwtFrame" කියන, "Window" වර්ගයටයි.
;මෙහිදී, "DSI Warehouse Mangement System" එකට, අයත්, "ahk_exe javaw.exe ahk_class SunAwtFrame" යන, වර්ගයේ, "Windows" කිහිපයක් පැවතිය හැකි නිසා, ඒ සියල්ල හඳුනාගෙන "windows කියන Varibale එකේ Save කරයි"
windows := WinGetList("ahk_exe javaw.exe ahk_class SunAwtFrame")



global overlay0 := Show_Processing_Please_Wait_Text_In_The_Center_Of_The_Screen()  ; Displaying the Warning Message (මේක තාවකාලිකව, GUI එකක් නිර්මාණය කිරීම සඳහා යෙදු Code එකක්. මේක ගැන හිතන්න එපා. )



;පහතින් ඇති, ForLoop එක යෙදීමේ අරමුණ වන්නේ, "DSI Warehouse Mangement System" එකේ, "Picking", "Checking" , "Packing" යන, "Windows" අනන්‍යව හඳුනා ගැනීමට, "Computer" එකේ පවතින සියලුම, "Windows" For Loop එක මඟින් Loop කිරීමයයි.
;එම "Window" වල, පවතින, එකම, අනන්‍යතාව පෙන්වන ලක්ෂනය වනුයේ, ඒවායේ පාට යි. ("Picking Window එක" := කොළ පාටයි, "Checking Window එක" := නිල් පාටයි, "Packing Window එක" := තැඹිලි පාටයි) 
;තවද, මෙම ForLoop එක ක්‍රියාත්මක වෙන විට, වරකට එක බහින්, සෑම "Window" එකකම, පාට, පරික්ෂා කරනු ලබයි.
;තවද, වරකට එක බහින්, සෑම "Window" එකක්ම, "Maximize" වී ඇත්දැයි පරික්ෂා කරනු ලබයි.
;පාට ගැලපුනොත්, "Window" එකෙහි, "AHK ID" එක, "checker_window_pid", "packer_window_pid" සහ "picker_window_pid", යන Variables වල‍ට Save වේ.

for hwnd in windows {
    title := WinGetTitle("ahk_id " hwnd)  ; hwnd (Handle to a Window) == මේක, "Microsoft Windwos" විසින්, Window එකක්, අනන්‍යව හඳුනාගැනීමට, ලබා දෙන අංකයක්.
                                          ; මේ Code එකෙන්, "ForLoop එක" විසින්, මේ අවස්ථාවේ තෝරා ගෙන ඇති, Window එකේ, "AHK ID" එක සහ, hwnd අංකය (මේක, "Microsoft Windwos" විසින්, Window එකක්, අනන්‍යව හඳුනාගැනීමට, ලබා දෙන අංකය) භාවිතා කර, එම "Window" එකේ, "Title එක", "Variable" එකට Assign කරනු ලබයි.

                                          
    if !InStr(title, "Warehouse Management System") ; මේ Code එකෙන් Check කරන්නේ, "Warehouse Management System" කියන, "Window" එක Open වෙලා තියෙනවද යන්න පරික්ෂා කිරීමයි.
        continue                                    ; එසේ Open වී නැත්නම්, කිසිවක් සිදු නොවේ.

    
    state := WinGetMinMax("ahk_id " hwnd)   ;මේ Code එකෙන් කරන්නේ, "Warehouse Management System එකේ", "ForLoop එක" විසින්, මේ අවස්ථාවේ තෝරා ගෙන ඇති, Window එක, "Minimized" වෙලාද? "Maximize" වෙලාද යන්න බැලීමයි. ඉන්පසු, "state"  යන Varibale එකට, Assign කරයි.
                                            ; මේ Code එක භාවිතා කිරීමේ අරමුණ තමා, "Window" එක තුල, ඛණ්ඩාංක ආශ්‍රිත වැඩ කටයුතු සිදු කරන විට, නිරවද්‍යව වැඩි කිරීමට සහ, ඕනෑම, Computer එකක, ක්‍රියාත්මක වන විදිහට නිර්මාණය කිරීම.


    WinActivate("ahk_id " hwnd) ;මේ Code එකෙන් කරන්නේ, "Warehouse Management System එකේ", "ForLoop එක" විසින්, මේ අවස්ථාවේ තෝරා ගෙන ඇති, Window එක, ඉදිරියට ගෙන ඒමයි (Activate කිරීමයි).
    
    Sleep(500)                  ;මේ Code එකෙන් කරන්නේ, ඊළඟ පියවරට යාමට පෙර, "500ms" ක, Delay එකක් තැබීමයි.

    
    ;මේ "If Code Block එකෙන්" බලන්නේ, Window "Maximize" වෙලාද යන්නයි.
    ;එසේ, Window එක "Maximize" වෙලා නැත්නම්, එම "Window" එක, "Win + UpArrowKey" එක, Shortcut එක ලෙස භාවිතා කර, "Maximize" කරනු ලැබේ.
    if (state != 1) {
        Send("#{Up}")
        Sleep(1000)             ;මේ Code එකෙන් කරන්නේ, ඊළඟ පියවරට යාමට පෙර, "1000ms" ක, Delay එකක් තැබීමයි.
    }

    color := PixelGetColor(650, 34, "RGB") ;මේ Code එකේ අරමුණ වන්නේ, ලබා දී ඇති, "X=650", "Y=34" ඛණ්ඩාංකයේ පාට, "RGB" ආකාරයෙන් ලබා ගැනීමයි.
    
    colorHex := Format("{:06X}", color)    ; මේ Code එකෙන් කරන්නේ, "RGB" ලෙස ගත්තු පාට, "Hexadecimal" ආකාරයට Convert කර, "colorHex" නම්, Variable එකට Save කිරීමයි.

    pid := WinGetPID("ahk_id " hwnd)  ; මේ Code එකෙන් කරන්නේ, "ForLoop එක" විසින්, මේ අවස්ථාවේ තෝරා ගෙන ඇති, Window එකේ, "Process ID" එක ලබා ගැනීමයි.
                                      ; මේක ලබා ගැනීමට හේතුව, පහලින් ඇති, "SWICH-CASE Code Block" එක පිලිබඳ අධ්‍යනය කරන විට තේරෙයි.


    
    
; පහතින් ඇති, "SWICH-CASE Code Block" එකෙන් පරික්ෂා කරන්නේ, ඉහතදී, "colorHex" නම්, Variable එකට, "Assign" වී ඇති, පාටට අනුව, ගැලපෙන, "Warehouse Management System Software එකේ" Window එකට, අදාළ, Process ID එක, Assign කිරීමයි


    switch colorHex {
        case "4472C4":                     ;"colorHex" නම්, Varibale එකේ අගය, "නිල්" පාට නම්....
            checker_window_pid := pid           ;..."ForLoop එක" විසින්, මේ අවස්ථාවේ තෝරා ගෙන ඇති, "Process ID" එක, "checker_window_pid" යන, Varibale එකට Assign වේ.


        case "ED7D31":                      ;"colorHex" නම්, Varibale එකේ අගය, "තැඹිලි" පාට නම්....    
            packer_window_pid := pid            ;..."ForLoop එක" විසින්, මේ අවස්ථාවේ තෝරා ගෙන ඇති, "Process ID" එක, "packer_window_pid" යන, Varibale එකට Assign වේ.    


        case "00B050":                      ;"colorHex" නම්, Varibale එකේ අගය, "කොළ" පාට නම්....
            picker_window_pid := pid            ;..."ForLoop එක" විසින්, මේ අවස්ථාවේ තෝරා ගෙන ඇති, "Process ID" එක, "picker_window_pid" යන, Varibale එකට Assign වේ.
    }
}


Hide_Processing_Please_Wait_Text_In_The_Center_Of_The_Screen(overlay0) 
Sleep 100



WinActivate("ahk_pid " . picker_window_pid) 
;global overlay1 := Show_Press_F5_to_PICKING_Message() ;Show overlay GUI For Press F5






/* මේ Code එකෙන් කරන්නේ, "Picker" කියන Window එක "Active (Focus වෙලාද)" කියා බලන එක */
/* (Window එකක, නම හොයාගන්න, "Window Spy" කියන Tool එක භාවිතා කරන්න පුළුවන්. මේක, "AHK Dashboard" එකේ තියෙනවා) */
#HotIf WinActive("ahk_pid " . picker_window_pid) 

Hide_Processing_Please_Wait_Text_In_The_Center_Of_The_Screen(overlay0)
;Show_Press_F5_to_PICKING_Message()

F5::{
                
    ;hide_Press_F5_to_PICKING_Message(overlay0) ;Hide overlay GUI For Press F5
    

    RunWait "Picker.exe"   ; මේ Code එකෙන්, "Picker.exe" එක ධාවනය වී අවසන් වනතුරු රැඳී සිටි. "Picker.exe" එක මඟින් සිදු වන්නේ, "Picker" Window එක තුල සිදු වෙන Clicks සිදු කිරීමයි. මෙය, "TinyTask" නම්, Software එක භාවිතා කර කලින් නිර්මාණය කර තිබු File එකක්.
    
    

    WinActivate("ahk_pid " . checker_window_pid) ; /* මේ Code එකෙන් කරන්නේ, "Checker" කියන Window එක "Active (Focus)" කිරීම */
    Sleep 300

    

    WinActivate("ahk_pid " . checker_window_pid) ;/* මේ Code එකෙන් කරන්නේ, "Checker" කියන Window එක "Active (Focus)" කිරීම */
    RunWait "Paste the barcode in Checker Window.exe" ; මේ Code එකෙන්, "Picker.exe" එක ධාවනය වී අවසන් වනතුරු රැඳී සිටි. 
    ;global overlay3 := Show_Press_F6_to_PICKING_Message()  
}





/* මේ Code එකෙන් කරන්නේ, "Checker" කියන Window එක "Active (Focus වෙලාද)" කියා බලන එක */
#HotIf WinActive("ahk_pid " . checker_window_pid) 

Hide_Processing_Please_Wait_Text_In_The_Center_Of_The_Screen(overlay0)
;hide_Press_F5_to_PICKING_Message(overlay1)

F6::{ 
    ;hide_Press_F6_to_PICKING_Message(overlay3) 
    
     RunWait "Checker Window.exe" ; මේ Code එකෙන්, "checker.exe" එක ධාවනය වී අවසන් වනතුරු රැඳී සිටි. 
     WinActivate("ahk_pid " . packer_window_pid) ; /* මේ Code එකෙන් කරන්නේ, "Packer" කියන Window එක "Active (Focus)" කිරීම */
     RunWait "Packer Window.exe" ; මේ Code එකෙන්, "Packer Window.exe" එක ධාවනය වී අවසන් වනතුරු රැඳී සිටි. 
     WinActivate("ahk_pid " . picker_window_pid)  ; /* මේ Code එකෙන් කරන්නේ, "Picker" කියන Window එක, නැවත "Active (Focus)" කිරීම */
}













; ===================================================================
; GUIs Place in a diffrent folder
; ================================================================


;GUI
Show_Processing_Please_Wait_Text_In_The_Center_Of_The_Screen() {
    myGui := Gui("+AlwaysOnTop -Caption +ToolWindow")
    myGui.BackColor := "202020"
    myGui.SetFont("s16 Bold cFFFFFF", "Segoe UI")
    myGui.AddText("Center w350", "Calibrating... Please Wait!")

    myGui.Show("AutoSize Hide")
    myGui.GetPos(,, &guiWidth, &guiHeight)

    MonitorGetWorkArea(1, &left, &top, &right, &bottom)

    xPos := left + ((right - left - guiWidth) // 2)
    yPos := top + ((bottom - top - guiHeight) // 2)

    myGui.Show("x" xPos " y" yPos " NoActivate")
    return myGui
}

Hide_Processing_Please_Wait_Text_In_The_Center_Of_The_Screen(myGui) {
    myGui.Hide()
}






;GUI 2
; ── Minimal Black & White Overlay ──

myGui := Gui("+AlwaysOnTop -Caption +ToolWindow +Border")
myGui.BackColor := "000000"
myGui.MarginX := 18
myGui.MarginY := 20

; Header
myGui.SetFont("s11 Bold cFFFFFF", "Segoe UI")
myGui.AddText("x18 y20 w224 h30 Center", "Help")

; Divider
myGui.AddProgress("x18 y60 w224 h1 c606060 Background606060", 100)

; Description
myGui.SetFont("s13 cDCDCDC", "Segoe UI")
myGui.AddText("x18 y78 w224 h50 Center", "Enter Picklist number and press 'F5'")

; Extra vertical space at the bottom
myGui.AddText("x18 y140 w224 h100", "")

guiVisible := false

SetTimer(CheckPickerWindow, 200)

CheckPickerWindow() {
    global picker_window_pid, myGui, guiVisible

    activeHwnd := WinExist("A")
    pickerHwnd := WinExist("ahk_pid " picker_window_pid)
    pickerActive := false

    if (activeHwnd && pickerHwnd) {
        try {
            pickerActive := (
                WinGetPID("ahk_id " activeHwnd) = picker_window_pid
            )
        }
    }

    if (pickerActive && !guiVisible) {
        myGui.Show("NA AutoSize")
        myGui.GetPos(, , &guiW, &guiH)

        x := A_ScreenWidth - guiW - 20
        y := (A_ScreenHeight - guiH) // 2

        myGui.Show("NA x" x " y" y)
        guiVisible := true
    } else if (!pickerActive && guiVisible) {
        myGui.Hide()
        guiVisible := false
    }
}


;GUI 3


; ── Help Overlay ──

checker_window_title := checker_window_pid
helpGui := Gui("+AlwaysOnTop -Caption +ToolWindow +Border")
helpGui.BackColor := "000000"
helpGui.MarginX := 18
helpGui.MarginY := 20

; Header
helpGui.SetFont("s11 Bold cFFFFFF", "Segoe UI")
helpGui.AddText("x18 y20 w224 h30 Center", "Help")

; Divider
helpGui.AddProgress(
    "x18 y60 w224 h1 c606060 Background606060",
    100
)

; Instructions
helpGui.SetFont("s13 cDCDCDC", "Segoe UI")
helpGui.AddText(
    "x18 y78 w224 h50 Center",
    "Enter Picklist number and press 'F5'"
)

; Extra height
helpGui.AddText("x18 y140 w224 h100", "")

helpGuiVisible := false

SetTimer(UpdateHelpOverlay, 200)

UpdateHelpOverlay() {
    global picker_window_pid, checker_window_title
    global helpGui, helpGuiVisible

    activeHwnd := WinExist("A")
    checkerHwnd := WinExist(checker_window_title)

    shouldShow := false

    if activeHwnd {
        try {
            activePid := WinGetPID("ahk_id " activeHwnd)

            if (activePid = picker_window_pid)
                shouldShow := true
        }

        if (checkerHwnd && activeHwnd = checkerHwnd)
            shouldShow := true
    }

    if (shouldShow && !helpGuiVisible) {
        helpGui.Show("NA AutoSize")

        helpGui.GetPos(, , &guiW, &guiH)

        x := A_ScreenWidth - guiW - 20
        y := (A_ScreenHeight - guiH) // 2

        helpGui.Show("NA x" x " y" y)
        helpGuiVisible := true
    }
    else if (!shouldShow && helpGuiVisible) {
        helpGui.Hide()
        helpGuiVisible := false
    }
}





/* Script එකක් F12 Press කරලා, නවත්වන්න හදපු Code එක */
#SingleInstance Force 
#UseHook
F12:: ExitApp


