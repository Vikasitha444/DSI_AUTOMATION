#Requires AutoHotkey v2.0


;Exception := AHK වලදී, Index ආරම්භ වන්නේ, 0 න් නොවේ. 1 නි. 



;While Loop
^w::{
    counter := 0 
    while(counter < 5){
        MsgBox("This is the " .  counter ) ;මෙහිදී තිත(.) මඟින්, Text එක සහ Counter හි පවතින අගය, එකතු කරනු ලැබේ (Concatinate)
                                           ;Expection :- තිත(.)ට, දෙපසින්ම හිස්තැන් තැබීම අනිවාර්ය වේ.
        counter++
    }

}



;For Loop
^f::{
    fruits := ["Apple", "Banana", "Orange", "Mango"]

    for i, fruit in fruits
    {
        MsgBox(fruits[i])  ;මේ සඳහා, "A_Index" යන AHK varibale එකද භාවිතා කල හැක.   උදා:- MsgBox(fruits[I_Index])
    }
}


;Easy Itaration For Loop
^e::{

    loop 4
    {
        MsgBox("Hi to you all")
    }
}