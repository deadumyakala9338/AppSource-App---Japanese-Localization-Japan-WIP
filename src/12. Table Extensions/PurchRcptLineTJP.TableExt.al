#if AppSource
tableextension 70658606 "Purch. Rcpt. Line TJP" extends "Purch. Rcpt. Line"
{
    fields
    {
        field(70658575; "Buy-from Vend. Name TJP"; Text[100])
        {
            Caption = 'Buy-from Vendor Name';
            DataClassification = CustomerContent;
        }
    }
}
#endif

#if OnPremise
tableextension 99031 "Purch. Rcpt. Line TJP" extends "Purch. Rcpt. Line"
{
    fields
    {
        field(99000; "Buy-from Vend. Name TJP"; Text[100])
        {
            Caption = 'Buy-from Vendor Name';
            DataClassification = CustomerContent;
        }
    }
}
#endif