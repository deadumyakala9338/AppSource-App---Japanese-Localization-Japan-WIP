#if AppSource
pageextension 70659009 "Employee List TJP" extends "Employee List"
#endif
#if OnPremise
pageextension 99044 "Employee List TJP" extends "Employee List"
#endif
{
    layout
    {
        moveafter("No."; "Last Name")
        moveafter("Last Name"; "First Name")
    }
}