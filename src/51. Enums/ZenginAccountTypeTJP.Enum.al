#if AppSource
enum 70658583 "Zengin Account Type TJP"
#endif
#if OnPremise
enum 99008 "Zengin Account Type TJP"
#endif
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; " ") { }
    value(1; Savings) { Caption = 'Savings'; }
    value(2; Current) { Caption = 'Current'; }
    value(3; Chochiku) { Caption = 'Chochiku'; }
    value(4; Others) { Caption = 'Others'; }
}