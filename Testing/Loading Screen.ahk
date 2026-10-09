
#Requires AutoHotkey v2.0
#SingleInstance Force

; Create Loading Screen
myGui := Gui("+AlwaysOnTop -Caption +Border")
myGui.BackColor := "20242C"
myGui.SetFont("s16 cFFFFFF", "Segoe UI")
myGui.AddText("Center w320", "Automation Starting...")
myGui.SetFont("s10 cB8C0CC")
myGui.AddText("Center w320 y+12", "Please wait while loading")

; Progress bar
myGui.AddProgress("w280 h8 x20 y+20 c3B82F6 Background404650", 0)

myGui.Show("w320 h130 Center")

; Keep the screen visible for 2 seconds
Sleep(2000)

; Close Loading Screen
myGui.Destroy()

; =================================
; YOUR AUTOMATION CODE STARTS HERE
; =================================

MsgBox("Automation Started!")

; Replace the MsgBox above with your actual automation code.
