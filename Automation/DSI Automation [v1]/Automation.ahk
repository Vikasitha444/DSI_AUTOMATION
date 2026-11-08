#Requires AutoHotkey v2.0  ;මේ Code එකෙන්, AHK v2 එක භාවිතා වන බව පෙන්වයි
#SingleInstance Force



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

::736::dss000736
::4674::dss004674
::8290::dss008290
::8499::dss008499
::8155::dss008155
::698::dss000698
::3512::dss003512
::3637::dss003637
::3837::dss003837
::4826::dss004826
::5126::dss005126
::7956::dss007956
::4825::dss004825
::6485::dss006485



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





;==============================================================================================
;  අලුතින් එකතු කල කොටස : INCORRECT ITEM ALERT (රතු Screen එකෙන් Warning එකක් පෙන්වීම)
;  (ඉහත තිබූ කිසිම Code එකක් වෙනස් කර නැත. මේ කොටස, සම්පූර්ණයෙන්ම, අලුතින් එකතු කල ඒවා පමණි.)
;==============================================================================================

#HotIf   ; ඉහත "#HotIf" Conditions, මෙතැන සිට අවලංගු කරයි.


; --- "Incorrect Items" Table එක තියෙන තැන (Checker Window එකේ Client ඛණ්ඩාංක). අවශ්‍ය නම් පමණක් වෙනස් කරන්න. ---
global INC_X := 405     ; Table එකේ වම් පැත්තේ X
global INC_Y := 258     ; Table එකේ Header එකට පහළින් පටන් ගන්නා Y
global INC_W := 298     ; පළල
global INC_H := 400     ; උස (පේළි 16ක් පමණ)


; ඉහත Table එක, සෑම 200ms කට වරක් පරික්ෂා කරයි. (Checker Window එක Active වී ඇති විට පමණි)
SetTimer(CheckIncorrectItems, 200)


; Barcode Scanner එකෙන් "Text" එකක් ලෙස Type වන Item Code එක (උදා: PI072605), "Enter" එක එන තුරු සටහන් කරගනී. (Keyboard එකේ Type වන දේවල් අවහිර නොකරයි - "V" = Visible)
global lastScan := ""
global scanIH := InputHook("V", "{Enter}{NumpadEnter}")
scanIH.OnEnd := ScanInputEnded
scanIH.Start()

ScanInputEnded(ih) {
    global lastScan
    t := Trim(ih.Input)
    if RegExMatch(t, "^\S*\d{4,}\S*$")     ; ඉලක්කම් 4ක් හෝ වැඩි, හිස්තැන් නැති Text එකක් පමණක් "Barcode" එකක් ලෙස සලකයි
        lastScan := t
    ih.Start()
}



; Table එකේ පින්තූරය (Pixels) ගෙන, එහි "Signature" එකක් (CRC) සාදයි. Table එකේ අලුත් Item එකක් ආවොත්, හෝ Qty එක වැඩි වුනොත්, Signature එක වෙනස් වේ.
CheckIncorrectItems() {
    static lastSig := "", candSig := "", stable := 0, initDone := false, pending := false

    ; "Incorrect bar code" වැනි Popup (Dialog) එකක් Open වී තිබෙන විට, Table එක පරික්ෂා නොකරයි. (Popup එකේ පින්තූරය, Table එකේ පින්තූරයට මිශ්‍ර වීම වැළැක්වීමට)
    if (checker_window_pid && !PopupOpen() && WinActive("ahk_pid " . checker_window_pid)) {
        hwnd := WinExist("A")
        if (WinGetClass(hwnd) = "SunAwtFrame") {      ; Active Window එක, Checker ගේ ප්‍රධාන Window එක නම් පමණි
            try {
                WinGetClientPos(&cx, &cy, , , hwnd)
            } catch {
                return
            }

            sig := CaptureIncorrectTable(cx + INC_X, cy + INC_Y, INC_W, INC_H, &nonEmpty)

            if (sig != "") {
                if !initDone {
                    lastSig := sig          ; පළමු වතාවට, තිබෙන දේ "Baseline" එක ලෙස ගනී (Alert එකක් නැත)
                    initDone := true
                } else if (sig = lastSig) {
                    stable := 0
                } else {
                    ; වෙනසක් පෙනුනොත්, ඒ වෙනස 2 වතාවක් (400ms) එක දිගට තිබුනොත් පමණක් පිළිගනී. (Popup එකක් වැසෙන විට ඇතිවන තාවකාලික වෙනස්කම් මඟ හැරීමට)
                    if (sig = candSig) {
                        stable += 1
                    } else {
                        candSig := sig
                        stable := 1
                    }
                    if (stable >= 2) {
                        lastSig := sig
                        stable := 0
                        pending := nonEmpty     ; Table එක හිස් වුනොත් (Reset), Alert එකක් නැත. Item තිබේ නම් පමණක් Alert කරයි.
                    }
                }
            }
        }
    }

    ; TinyTask Macros ක්‍රියාත්මක වෙන විට, හෝ Popup එකක් Open වී ඇති විට, රතු Screen එක පෙන්වන්නේ නැත. ඒවා ඉවර වූ පසු පෙන්වයි.
    if (pending && !MacroRunning() && !PopupOpen()) {
        pending := false
        ShowIncorrectItemAlert()
    }
}



; Checker එකේ (javaw.exe) "Incorrect bar code" වැනි Popup / Dialog Window එකක් Open වී තිබේද යන්න පරික්ෂා කරයි.
PopupOpen() {
    return checker_window_pid && WinExist("ahk_pid " . checker_window_pid . " ahk_class SunAwtDialog")
}



MacroRunning() {
    for n in ["Picker.exe", "Paste the barcode in Checker Window.exe", "Checker Window.exe", "Packer Window.exe"] {
        if ProcessExist(n)
            return true
    }
    return false
}



; Screen එකේ ලබා දුන් කොටසේ පින්තූරය ගෙන, CRC අගයක් ලබා දෙයි. (&nonEmpty = Table එකේ පළමු පේළියේ Item එකක් තිබේද යන්න)
CaptureIncorrectTable(x, y, w, h, &nonEmpty) {
    nonEmpty := false

    hdcScreen := DllCall("GetDC", "Ptr", 0, "Ptr")
    hdcMem    := DllCall("CreateCompatibleDC", "Ptr", hdcScreen, "Ptr")
    hbm       := DllCall("CreateCompatibleBitmap", "Ptr", hdcScreen, "Int", w, "Int", h, "Ptr")
    hOld      := DllCall("SelectObject", "Ptr", hdcMem, "Ptr", hbm, "Ptr")

    ok := DllCall("BitBlt", "Ptr", hdcMem, "Int", 0, "Int", 0, "Int", w, "Int", h
                          , "Ptr", hdcScreen, "Int", x, "Int", y, "UInt", 0x00CC0020)

    bmi := Buffer(40, 0)
    NumPut("UInt", 40, "Int", w, "Int", -h, "UShort", 1, "UShort", 32, bmi)
    buf := Buffer(w * h * 4, 0)
    DllCall("GetDIBits", "Ptr", hdcMem, "Ptr", hbm, "UInt", 0, "UInt", h, "Ptr", buf, "Ptr", bmi, "UInt", 0)

    DllCall("SelectObject", "Ptr", hdcMem, "Ptr", hOld)
    DllCall("DeleteObject", "Ptr", hbm)
    DllCall("DeleteDC", "Ptr", hdcMem)
    DllCall("ReleaseDC", "Ptr", 0, "Ptr", hdcScreen)

    if !ok
        return ""

    ; පළමු පේළියේ Pixel එක, Table එකේ පහළ (හිස්) Pixel එකට වඩා වෙනස් නම්, Table එකේ Items තිබේ.
    topPx := NumGet(buf, (6 * w + 4) * 4, "UInt") & 0xFFFFFF
    botPx := NumGet(buf, ((h - 6) * w + 4) * 4, "UInt") & 0xFFFFFF
    nonEmpty := (topPx != botPx)

    return String(DllCall("ntdll\RtlComputeCrc32", "UInt", 0, "Ptr", buf, "UInt", buf.Size, "UInt"))
}



; මුළු Screen එකම රතු පාටින් වසා, Warning එක පෙන්වයි. "OK" Click කල පසු පමණක් අතුරුදහන් වේ.
ShowIncorrectItemAlert(code := "") {
    prev := WinExist("A")       ; කලින් Active වී තිබූ Window එක (OK ඔබන විට, නැවත එයට යාමට)

    sw := A_ScreenWidth
    sh := A_ScreenHeight

    g := Gui("+AlwaysOnTop -Caption +ToolWindow -DPIScale")
    g.BackColor := "FF0000"
    g.MarginX := 0
    g.MarginY := 0

    g.SetFont("s54 bold cWhite", "Segoe UI")
    g.Add("Text", "x0 y" Round(sh * 0.16) " w" sw " Center BackgroundTrans", "INCORRECT ITEM DETECTED!")

    if (code != "") {
        ; Scan කල Text එක "05pi074618" වගේ නම්: Qty = 05, Item = PI 074618 ලෙස වෙන් කර, "PI 074618  05" ආකාරයෙන් පෙන්වයි.
        item := StrUpper(code)
        qty  := ""
        if RegExMatch(code, "^(\d+)([A-Za-z]+)(\d+)$", &m) {
            item := StrUpper(m[2]) " " m[3]
            qty  := m[1]
        } else if RegExMatch(code, "^([A-Za-z]+)(\d+)$", &m) {
            item := StrUpper(m[1]) " " m[2]
        }

        yy := Round(sh * 0.32)
        gap := 30
        g.SetFont("s66 bold cYellow", "Segoe UI")
        t1 := g.Add("Text", "x0 y" yy " BackgroundTrans", item)
        t1.GetPos(, , &w1, &h1)

        w2 := 0
        h2 := 0
        if (qty != "") {
            g.SetFont("s36 bold cWhite", "Segoe UI")     ; Qty එක, Item Code එකට වඩා කුඩා අකුරින්
            t2 := g.Add("Text", "x0 y" yy " BackgroundTrans", qty)
            t2.GetPos(, , &w2, &h2)
            total := w1 + gap + w2
        } else {
            total := w1
        }

        x0 := Round((sw - total) / 2)
        t1.Move(x0, yy)
        if (qty != "")
            t2.Move(x0 + w1 + gap, yy + h1 - h2 - 10)    ; පහළට සමතලා වන සේ (Baseline)
    }

    g.SetFont("s26 bold cWhite", "Segoe UI")
    g.Add("Text", "x0 y" Round(sh * 0.50) " w" sw " Center BackgroundTrans"
        , "Check the 'Incorrect Items' list, remove the wrong item,`nthen click OK to continue.")

    g.SetFont("s30 bold cBlack", "Segoe UI")
    btn := g.Add("Button", "x" Round((sw - 300) / 2) " y" Round(sh * 0.70) " w300 h90 Default", "OK")   ; "Default" = Keyboard එකේ "Enter" ඔබන විටත් "OK" Click වේ.
    shownAt := A_TickCount
    ; Scanner එකේ අන්තිමට එන "Enter" එකෙන් අහම්බෙන් වැසී යාම වැළැක්වීමට, පළමු 0.8s තුල, Enter/Click නොසලකා හරියි.
    btn.OnEvent("Click", (*) => (A_TickCount - shownAt > 800) ? g.Destroy() : 0)

    hw := g.Hwnd
    g.Show("x0 y0 w" sw " h" sh)
    WinActivate("ahk_id " hw)
    btn.Focus()

    SoundBeep(1200, 250)
    SoundBeep(1200, 250)
    shownAt := A_TickCount      ; Beep ඉවර වූ පසු, නැවත කාලය ගණනය කරයි

    WinWaitClose("ahk_id " hw)      ; "OK" Click කරනතුරු රැඳී සිටී

    if (prev && WinExist("ahk_id " prev))
        WinActivate("ahk_id " prev) ; කලින් Window එකට (Checker) නැවත යයි
}









; ===================================================================
; GUIs Place in a diffrent folder
; ================================================================


; "Show_Processing_Please_Wait_Text_In_The_Center_Of_The_Screen" Warning Message Overlay GUI
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






; "Enter Picklist number and press 'F5'"  Message Overlay GUI
; ===== Help Overlay (Picker) =====
helpRunLimit := 5
helpRunFile := A_ScriptDir "\help_overlay.ini"
helpRunCount := Integer(IniRead(helpRunFile, "Overlay", "Runs", 0))
helpGuiDismissed := false

checker_window_title := checker_window_pid
helpGui := Gui("+AlwaysOnTop -Caption +ToolWindow +Border +E0x08000000")  ; no-activate, ✕ click karanna puluwan
helpGui.BackColor := "000000"
helpGui.MarginX := 10
helpGui.MarginY := 8

; Header
helpGui.SetFont("s9 Bold cFFFFFF", "Segoe UI")
helpGui.AddText("x10 y8 w210 h20 Center", "Help")

; Divider
helpGui.AddProgress(
    "x10 y32 w210 h1 c606060 Background606060",
    100
)

; Instructions
helpGui.SetFont("s9 Norm cDCDCDC", "Segoe UI")
helpGui.AddText(
    "x10 y40 w210 h20 Center",
    "Enter Picklist number and press 'F5'"
)

; Window eke udin dakunu kone podi ✕ close eka
helpGui.SetFont("s9 Bold cB0B0B0", "Segoe UI")
helpCloseBtn := helpGui.AddText("+0x100 Center x204 y4 w16 h18", "✕")
helpCloseBtn.OnEvent("Click", HelpOverlay_Close)

; Window eke size eka (padding)
helpGui.AddText("x10 y62 w210 h2", "")

helpGuiVisible := false

SetTimer(UpdateHelpOverlay, 200)

HelpOverlay_Close(*) {
    global helpGui, helpGuiVisible, helpGuiDismissed
    helpGuiDismissed := true
    helpGui.Hide()
    helpGuiVisible := false
}

; Automation eka run wena har pauwe meka call karanna (eg: F5 handler eke modata)
HelpOverlay_CountRun() {
    global helpRunCount, helpRunFile
    helpRunCount += 1
    IniWrite(helpRunCount, helpRunFile, "Overlay", "Runs")
}

UpdateHelpOverlay() {
    global picker_window_pid, checker_window_title
    global helpGui, helpGuiVisible
    global helpGuiDismissed, helpRunCount, helpRunLimit

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

    ; ✕ click karala hari, 5 parak run unata passe hari penne na
    if (helpGuiDismissed || helpRunCount >= helpRunLimit)
        shouldShow := false

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


; "Scan the Barcodes and Press 'F6' to Submit and Check" Message Overlay GUI
;Meke, Size eka adu karala, Close button ekk dala thiyenne. Anika, Automation eka 5 parak run unat passe meka aye penna one na.
; ===== Checker Overlay =====
checkerRunLimit := 5
checkerRunFile := A_ScriptDir "\checker_overlay.ini"
checkerRunCount := Integer(IniRead(checkerRunFile, "Overlay", "Runs", 0))
checkerOverlayDismissed := false

checkerOverlay := Gui("+AlwaysOnTop -Caption +ToolWindow +Border +E0x08000000")  ; no-activate, ✕ click karanna puluwan
checkerOverlay.BackColor := "000000"
checkerOverlay.MarginX := 10
checkerOverlay.MarginY := 8

checkerOverlay.SetFont("s9 Bold cFFFFFF", "Segoe UI")
checkerOverlay_Header := checkerOverlay.AddText("xm Center", "Help")

checkerOverlay_Divider := checkerOverlay.AddText("xm h1 w10 Background606060")

checkerOverlay.SetFont("s9 Norm cDCDCDC", "Segoe UI")
checkerOverlay_Body := checkerOverlay.AddText("xm Center", "Scan the Barcodes and Press 'F6' to Submit and Check")

; Header + divider width eka, text eke width ekata match karanawa
checkerOverlay_Body.GetPos(, , &bodyW)
checkerOverlay_Header.Move(, , bodyW)
checkerOverlay_Divider.Move(, , bodyW)

; Window eke udin dakunu kone podi ✕ close eka
checkerOverlay.SetFont("s9 Bold cB0B0B0", "Segoe UI")
checkerCloseBtn := checkerOverlay.AddText("+0x100 Center x" (checkerOverlay.MarginX + bodyW - 16) " y4 w16 h18", "✕")
checkerCloseBtn.OnEvent("Click", CheckerOverlay_Close)

checkerOverlayVisible := false

SetTimer(CheckerOverlay_Update, 200)

CheckerOverlay_Close(*) {
    global checkerOverlay, checkerOverlayVisible, checkerOverlayDismissed
    checkerOverlayDismissed := true
    checkerOverlay.Hide()
    checkerOverlayVisible := false
}

; Automation eka run wena har pauwe meka call karanna (eg: F6 handler eke modata)
CheckerOverlay_CountRun() {
    global checkerRunCount, checkerRunFile
    checkerRunCount += 1
    IniWrite(checkerRunCount, checkerRunFile, "Overlay", "Runs")
}

CheckerOverlay_Update() {
    global checker_window_pid, checkerOverlay, checkerOverlayVisible
    global checkerOverlayDismissed, checkerRunCount, checkerRunLimit

    checkerHwnd := checker_window_pid ? WinExist("ahk_pid " checker_window_pid) : 0

    shouldShow := false
    if (checkerHwnd && WinActive("ahk_id " checkerHwnd)
        && !checkerOverlayDismissed && checkerRunCount < checkerRunLimit)
        shouldShow := true

    if (shouldShow && !checkerOverlayVisible) {
        checkerOverlay.Show("NA AutoSize")
        checkerOverlay.GetPos(, , &gW, &gH)
        WinGetPos(&wx, &wy, &wW, &wH, "ahk_id " checkerHwnd)
        checkerOverlay.Move(wx + wW - gW - 20, wy + (wH - gH) // 2)
        checkerOverlayVisible := true
    } else if (!shouldShow && checkerOverlayVisible) {
        checkerOverlay.Hide()
        checkerOverlayVisible := false
    }
}





; "Loading... Please don't touch the mouse or keyboard" GUI
;This Appears when the automation starts
#Requires AutoHotkey v2.0

busyProcs   := ["Picker.exe"
              , "Paste the barcode in Checker Window.exe"
              , "Checker Window.exe"
              , "Packer Window.exe"]
busyGraceMs  := 800          ; exe iwara wela, meka thuru block eka thiyenawa (window maru gap cover karanna)
busyActive   := false
busyLastSeen := -999999
busyDots     := 0
busyFrame    := 0
busySpinFrames := ["⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"]
busyAccent   := "4FC3F7"

; ---------- DPI scale (ona PC ekakata, ona screen ekakata) ----------
busyS := A_ScreenDPI / 96
Sc(n) => Round(n * busyS)

busyW      := Sc(360)
busyH      := Sc(96)
busyPad    := Sc(20)
busyMargin := Sc(100)         ; screen edge ekata gap eka (yatin saha dakunen)

; ---------- GUI ----------
busyGui := Gui("+AlwaysOnTop -Caption +ToolWindow -DPIScale +E0x08000000")
busyGui.BackColor := "1B1B1F"
busyGui.MarginX := 0
busyGui.MarginY := 0

; spinner (left, text block ekata samaanawa vertical center)
busyGui.SetFont("s20 c" busyAccent, "Segoe UI Symbol")
busySpin := busyGui.AddText("x" busyPad " y" Sc(18) " w" Sc(44) " h" Sc(44) " Center +0x200", busySpinFrames[1])

; title + subtitle
textX := busyPad + Sc(44) + Sc(12)
textW := busyW - textX - busyPad

busyGui.SetFont("s12 Bold cFFFFFF", "Segoe UI")
busyTitle := busyGui.AddText("x" textX " y" Sc(18) " w" textW " h" Sc(26) " +0x200", "Automation Running")

busyGui.SetFont("s9 Norm cA0A0A0", "Segoe UI")
busyGui.AddText("x" textX " y" Sc(44) " w" textW " h" Sc(18) " +0x200", "Please don't touch the mouse or keyboard")

; sliding loading bar (marquee), padding dekatama samaanawa
busyBar := busyGui.AddProgress("x" busyPad " y" Sc(76) " w" (busyW - busyPad * 2) " h" Sc(4)
                             . " -Theme +0x8 c" busyAccent " Background33333A")
SendMessage(0x40A, 1, 25, busyBar.Hwnd)    ; PBM_SETMARQUEE (on, 25ms)

; size set karala, rounded corners damma
busyGui.Show("NA Hide w" busyW " h" busyH)
busyRgn := DllCall("CreateRoundRectRgn", "Int", 0, "Int", 0, "Int", busyW + 1, "Int", busyH + 1
                 , "Int", Sc(18), "Int", Sc(18), "Ptr")
DllCall("SetWindowRgn", "Ptr", busyGui.Hwnd, "Ptr", busyRgn, "Int", true)

; --- Low-level hooks: physical input withrai block karanawa (TinyTask/AHK input block wenne naha) ---
busyKbdCB   := CallbackCreate(BusyKbdHook, "Fast", 3)
busyMouseCB := CallbackCreate(BusyMouseHook, "Fast", 3)
busyHMod    := DllCall("GetModuleHandle", "Ptr", 0, "Ptr")
busyKbdHandle   := DllCall("SetWindowsHookEx", "Int", 13, "Ptr", busyKbdCB,   "Ptr", busyHMod, "UInt", 0, "Ptr")
busyMouseHandle := DllCall("SetWindowsHookEx", "Int", 14, "Ptr", busyMouseCB, "Ptr", busyHMod, "UInt", 0, "Ptr")

OnExit(BusyGuard_Cleanup)
SetTimer(BusyGuard_Tick, 80)

BusyKbdHook(nCode, wParam, lParam) {
    global busyActive
    if (nCode >= 0 && busyActive) {
        vk    := NumGet(lParam, 0, "UInt")
        flags := NumGet(lParam, 8, "UInt")
        if !(flags & 0x10) && vk != 0x7B      ; injected (automation) allow, F12 (stop) allow
            return 1
    }
    return DllCall("CallNextHookEx", "Ptr", 0, "Int", nCode, "UPtr", wParam, "Ptr", lParam, "Ptr")
}

BusyMouseHook(nCode, wParam, lParam) {
    global busyActive
    if (nCode >= 0 && busyActive) {
        flags := NumGet(lParam, 12, "UInt")
        if !(flags & 0x1)                     ; injected (automation) allow
            return 1
    }
    return DllCall("CallNextHookEx", "Ptr", 0, "Int", nCode, "UPtr", wParam, "Ptr", lParam, "Ptr")
}

BusyGuard_Tick() {
    global busyProcs, busyGraceMs, busyActive, busyLastSeen, busyDots, busyFrame
    global busyGui, busyTitle, busySpin, busySpinFrames, busyW, busyH, busyMargin

    now := A_TickCount
    for p in busyProcs {
        if ProcessExist(p) {
            busyLastSeen := now
            break
        }
    }

    shouldBusy := (now - busyLastSeen) < busyGraceMs

    if (shouldBusy && !busyActive) {
        busyActive := true
        ; work area = taskbar eka bahala screen eka, nisa taskbar eken poddak udata
        MonitorGetWorkArea(MonitorGetPrimary(), &l, &t, &r, &b)
        x := r - busyW - busyMargin
        y := b - busyH - busyMargin
        x := Max(x, l)                        ; podi screen walatath eliyata yanne naha
        y := Max(y, t)
        busyGui.Show("NA x" x " y" y)
    } else if (!shouldBusy && busyActive) {
        busyActive := false
        busyGui.Hide()
    }

    if busyActive {
        busyFrame := Mod(busyFrame + 1, busySpinFrames.Length)
        busySpin.Text := busySpinFrames[busyFrame + 1]

        busyDots := Mod(busyDots + 1, 16)
        busyTitle.Text := "Automation Running" . SubStr("...", 1, busyDots // 4)
    }
}

BusyGuard_Cleanup(*) {
    global busyKbdHandle, busyMouseHandle
    if busyKbdHandle
        DllCall("UnhookWindowsHookEx", "Ptr", busyKbdHandle)
    if busyMouseHandle
        DllCall("UnhookWindowsHookEx", "Ptr", busyMouseHandle)
}

/* Script එකක් F12 Press කරලා, නවත්වන්න හදපු Code එක */
#SingleInstance Force 
#UseHook
F12:: ExitApp


