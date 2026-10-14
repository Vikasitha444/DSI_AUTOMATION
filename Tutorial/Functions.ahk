/* FUNCTIONS */



; Function එකේ නම       Function එකට, අවශ්‍ය Parameters
Customized_Typing_Function(word     ,waiting_time := 100) ;Defulat Parameter (waiting_time := 100)
{
    Send word      ;User විසින් ඇතුලත් කල වචනය "Type" වේ.
    Sleep waiting_time    ;User විසින් ඇතුලත් කල "waiting_time" අනුව "Program එක" Sleep වේ.
}


/*Function Calling*/
Customized_Typing_Function  "Hi, Kohomada?", 1000
