#if AppSource
enum 70658586 "FA Rounding Type TJP"
#endif
#if OnPremise
enum 99011 "FA Rounding Type TJP"
#endif
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; Nearest) { Caption = 'Nearest'; }
    value(1; Up) { Caption = 'Up'; }
    value(2; Down) { Caption = 'Down'; }
}