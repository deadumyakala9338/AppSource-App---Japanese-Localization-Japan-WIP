#if AppSource
enum 70658587 "Report Rounding Factor TJP"
#endif
#if OnPremise
enum 99012 "Report Rounding Factor TJP"
#endif
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; " ") { }
    value(1; Tens) { Caption = 'Tens'; }
    value(2; Hundreds) { Caption = 'Hundreds'; }
    value(3; Thousands) { Caption = 'Thousands'; }
    value(4; "Hundred Thousands") { Caption = 'Hundred Thousands'; }
    value(5; Millions) { Caption = 'Millions'; }
}