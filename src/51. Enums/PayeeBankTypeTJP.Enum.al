#if AppSource
enum 70658582 "Payee Bank Type TJP"
#endif
#if OnPremise
enum 99007 "Payee Bank Type TJP"
#endif
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; "Same Bank Same Branch") { Caption = 'Same Bank Same Branch'; }
    value(1; "Same Bank Different Branch") { Caption = 'Same Bank Different Branch'; }
    value(2; "Different Bank") { Caption = 'Different Bank'; }
}