#if AppSource
tableextension 70658605 "Purch. Invoice Line TJP" extends "Purch. Inv. Line"
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
tableextension 99030 "Purch. Invoice Line TJP" extends "Purch. Inv. Line"
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