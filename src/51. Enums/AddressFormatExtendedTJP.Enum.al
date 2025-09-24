#if AppSource
enum 70658575 "Address Format (Extended) TJP"
#endif
#if OnPremise
enum 99000 "Address Format (Extended) TJP"
#endif
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; " ") { }
    value(1; "Japanese - Other") { Caption = 'Japanese - Other'; }
    value(2; "Japanese - Own") { Caption = 'Japanese - Own'; }
    value(3; "Japanese - Individual") { Caption = 'Japanese - Individual'; }
}
