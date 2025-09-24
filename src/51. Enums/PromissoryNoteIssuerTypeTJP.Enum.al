#if AppSource
enum 70658578 "Promissory Note Issuer Type TJP"
#endif
#if OnPremise
enum 99003 "Promissory Note Issuer Type TJP"
#endif
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; Customer) { Caption = 'Customer'; }
    value(1; Vendor) { Caption = 'Vendor'; }
}