#if AppSource
enum 70658576 "Collective Invoice Date TJP"
#endif
#if OnPremise
enum 99001 "Collective Invoice Date TJP"
#endif
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; None) { Caption = 'None'; }
    value(1; "5th") { Caption = '5th'; }
    value(2; "10th") { Caption = '10th'; }
    value(3; "15th") { Caption = '15th'; }
    value(4; "20th") { Caption = '20th'; }
    value(5; "25th") { Caption = '25th'; }
    value(6; "30th") { Caption = '30th'; }
    value(7; "End of Month") { Caption = 'End of Month'; }
}