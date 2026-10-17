#Requires AutoHotkey v2.0  ;මේ Code එකෙන්, AHK v2 එක භාවිතා වන බව පෙන්වයි


msgbox "This Automation Process Is Still In The Test Mode. Do this with your own Risk" ; මේ Code එකෙන්, ලියා ඇති වාක්‍ය, MassageBox එකක දර්ශනය වේ.

/* AHK තුල, Special Keys වල නම් වෙනුවට භාවිතා කරන සංඛේත */
            /* ^ : Control */
            /* + : Shift */
            /* ! : ALT */
            /* # : WinKey */


 ; මේ Code එකෙන්, "deshan" ලෙස Type කර, "Enter" බොත්තම Click කල විට, EPF කේතය Type වේ.        
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




#Requires AutoHotkey v2.0
CoordMode("Pixel", "Client")

checker_window_pid := 0
packer_window_pid  := 0
picker_window_pid  := 0

windows := WinGetList("ahk_exe javaw.exe ahk_class SunAwtFrame")

;Displaying the Warning Message
overlay0 := Show_Processing_Please_Wait_Text_In_The_Center_Of_The_Screen()

for hwnd in windows {
    title := WinGetTitle("ahk_id " hwnd)

    if !InStr(title, "Warehouse Management System")
        continue

    ; Check the window state BEFORE maximizing
    state := WinGetMinMax("ahk_id " hwnd)

    WinActivate("ahk_id " hwnd)
    Sleep(500)

    ; Maximize only if it is not already maximized
    if (state != 1) {
        Send("#{Up}")
        Sleep(1000)
    }

    color := PixelGetColor(650, 34, "RGB")
    colorHex := Format("{:06X}", color)

    pid := WinGetPID("ahk_id " hwnd)

    switch colorHex {
        case "4472C4":
            checker_window_pid := pid

        case "ED7D31":
            packer_window_pid := pid

        case "00B050":
            picker_window_pid := pid
    }
}

Hide_Processing_Please_Wait_Text_In_The_Center_Of_The_Screen(overlay0)
Sleep 100



WinActivate("ahk_pid " . picker_window_pid) 
overlay1 := Show_Press_F5_to_PICKING_Message() ;Show overlay GUI For Press F5



/* මේ Code එකෙන් කරන්නේ, "Picker" කියන Window එක "Active (Focus වෙලාද)" කියා බලන එක */
/* (Window එකක, නම හොයාගන්න, "Window Spy" කියන Tool එක භාවිතා කරන්න පුළුවන්. මේක, "AHK Dashboard" එකේ තියෙනවා) */
#HotIf WinActive("ahk_pid " . picker_window_pid) 
F5::{
                
    hide_Press_F5_to_PICKING_Message(overlay1) ;Hide overlay GUI For Press F5

    RunWait "Picker.exe"   ; මේ Code එකෙන්, "Picker.exe" එක ධාවනය වී අවසන් වනතුරු රැඳී සිටි. "Picker.exe" එක මඟින් සිදු වන්නේ, "Picker" Window එක තුල සිදු වෙන Clicks සිදු කිරීමයි. මෙය, "TinyTask" නම්, Software එක භාවිතා කර කලින් නිර්මාණය කර තිබු File එකක්.
    
    

    WinActivate("ahk_pid " . checker_window_pid) ; /* මේ Code එකෙන් කරන්නේ, "Checker" කියන Window එක "Active (Focus)" කිරීම */
    Sleep 300

    

    WinActivate("ahk_pid " . checker_window_pid) ;/* මේ Code එකෙන් කරන්නේ, "Checker" කියන Window එක "Active (Focus)" කිරීම */
    RunWait "Paste the barcode in Checker Window.exe" ; මේ Code එකෙන්, "Picker.exe" එක ධාවනය වී අවසන් වනතුරු රැඳී සිටි. 
    global overlay3 := Show_Press_F6_to_PICKING_Message()  
}



/* මේ Code එකෙන් කරන්නේ, "Checker" කියන Window එක "Active (Focus වෙලාද)" කියා බලන එක */
#HotIf WinActive("ahk_pid " . checker_window_pid) 
F6::{ 
    hide_Press_F6_to_PICKING_Message(overlay3) 
    
     RunWait "Checker Window.exe" ; මේ Code එකෙන්, "checker.exe" එක ධාවනය වී අවසන් වනතුරු රැඳී සිටි. 
     WinActivate("ahk_pid " . packer_window_pid) ; /* මේ Code එකෙන් කරන්නේ, "Packer" කියන Window එක "Active (Focus)" කිරීම */
     RunWait "Packer Window.exe" ; මේ Code එකෙන්, "Packer Window.exe" එක ධාවනය වී අවසන් වනතුරු රැඳී සිටි. 
     WinActivate("ahk_pid " . picker_window_pid)  ; /* මේ Code එකෙන් කරන්නේ, "Picker" කියන Window එක, නැවත "Active (Focus)" කිරීම */
}



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
Show_Press_F5_to_PICKING_Message() {
    myGui := Gui("+AlwaysOnTop -Caption +ToolWindow")
    myGui.BackColor := "202020"
    myGui.SetFont("s16 Bold cFFFFFF", "Segoe UI")
    myGui.AddText("Center w350", "Press 'F5' to 'Picking'")

    myGui.Show("AutoSize Hide")
    myGui.GetPos(,, &guiWidth, &guiHeight)

    ; Get primary monitor work area
    MonitorGetWorkArea(1, &left, &top, &right, &bottom)

    ; Align to the right with a responsive margin
    margin := 20
    xPos := right - guiWidth - margin
    yPos := top + ((bottom - top - guiHeight) // 2)

    myGui.Show("x" xPos " y" yPos " NoActivate")
    return myGui
}

hide_Press_F5_to_PICKING_Message(myGui) {
    myGui.Hide()
}




;GUI 3
Show_Press_F6_to_PICKING_Message() {
    myGui := Gui("+AlwaysOnTop -Caption +ToolWindow")
    myGui.BackColor := "202020"
    myGui.SetFont("s16 Bold cFFFFFF", "Segoe UI")
    myGui.AddText("Center w350", "Press 'F6' to 'Checking' and 'Packing'")

    myGui.Show("AutoSize Hide")
    myGui.GetPos(,, &guiWidth, &guiHeight)

    ; Get primary monitor work area
    MonitorGetWorkArea(1, &left, &top, &right, &bottom)

    ; Align to bottom-right with a 20-pixel margin
    margin := 20
    xPos := right - guiWidth - margin
    yPos := bottom - guiHeight - margin

    myGui.Show("x" xPos " y" yPos " NoActivate")
    return myGui
}

hide_Press_F6_to_PICKING_Message(myGui) {
    myGui.Hide()
}


/* Script එකක් F12 Press කරලා, නවත්වන්න හදපු Code එක */
#SingleInstance Force 
#UseHook
F12:: ExitApp
