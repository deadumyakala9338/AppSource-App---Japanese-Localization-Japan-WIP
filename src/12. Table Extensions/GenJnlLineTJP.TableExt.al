#if AppSource
tableextension 70658581 GenJnlLineTJP extends "Gen. Journal Line"
{
    fields
    {
        field(70658575; "Vendor Bank Account TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Vendor Bank Account';
            TableRelation = IF ("Account Type" = CONST(Vendor))
                                "Vendor Bank Account".Code WHERE
                                ("Vendor No." = FIELD("Account No."));
            Editable = false;
        }
        field(70658576; "VAT Exception TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'VAT Exception';
        }
        field(70658577; "Bank Fee Calculated TJP"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Fee Calculated';
        }
        field(70658578; "Promissory Note Status TJP"; Enum "Promissory Note Status TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Promissory Note Status';
        }
        field(70658579; "Promissory Note No. TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Promissory Note No.';
        }
        field(70658580; "PNote Issuer Type TJP"; Enum "Promissory Note Issuer Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Promissory Note Issuer Type';
        }
    }
}
#endif

#if OnPremise
tableextension 99006 GenJnlLineTJP extends "Gen. Journal Line"
{
    fields
    {
        field(99000; "Vendor Bank Account TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Vendor Bank Account';
            TableRelation = IF ("Account Type" = CONST(Vendor))
                                "Vendor Bank Account".Code WHERE
                                ("Vendor No." = FIELD("Account No."));
            Editable = false;
        }
        field(99001; "VAT Exception TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'VAT Exception';
        }
        field(99002; "Bank Fee Calculated TJP"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Fee Calculated';
        }
        field(99003; "Promissory Note Status TJP"; Enum "Promissory Note Status TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Promissory Note Status';
        }
        field(99004; "Promissory Note No. TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Promissory Note No.';
        }
        field(99005; "PNote Issuer Type TJP"; Enum "Promissory Note Issuer Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Promissory Note Issuer Type';
        }
    }
}
#endif