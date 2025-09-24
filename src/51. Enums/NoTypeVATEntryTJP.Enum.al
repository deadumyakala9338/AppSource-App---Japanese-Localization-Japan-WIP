#if AppSource
enum 70658581 "No. Type VAT Entry TJP"
#endif
#if OnPremise
enum 99006 "No. Type VAT Entry TJP"
#endif
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; " ") { }
    value(1; Customer) { Caption = 'Customer'; }
    value(2; Vendor) { Caption = 'Vendor'; }
}