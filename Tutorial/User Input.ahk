#Requires AutoHotkey v2.0

UserName := InputBox("Please Enter your name")
MsgBox("" . UserName ) ;මෙහිදී තිත(.) මඟින්, Text එක සහ UserName හි පවතින අගය, එකතු කරනු ලැබේ (Concatinate)
                       ;Expection :- තිත(.)ට, දෙපසින්ම හිස්තැන් තැබීම අනිවාර්ය වේ.