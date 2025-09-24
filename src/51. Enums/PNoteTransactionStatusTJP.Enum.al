#if AppSource
enum 70658579 "PNote Transaction Status TJP"
#endif
#if OnPremise
enum 99004 "PNote Transaction Status TJP"
#endif
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; " ") { }
    value(1; Journalized) { Caption = 'Journalized'; }
}