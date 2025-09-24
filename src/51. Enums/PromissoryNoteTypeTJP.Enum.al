#if AppSource
enum 70658580 "Promissory Note Type TJP"
#endif
#if OnPremise
enum 99005 "Promissory Note Type TJP"
#endif
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; "Promissory Note") { Caption = 'Promissory Note'; }
    value(1; Endorsement) { Caption = 'Endorsement'; }
    value(2; "Exchange Note") { Caption = 'Exchange Note'; }
    value(3; "Electronically Recorded Monetary Claims") { Caption = 'Electronically Recorded Claims/Obligations'; }
}