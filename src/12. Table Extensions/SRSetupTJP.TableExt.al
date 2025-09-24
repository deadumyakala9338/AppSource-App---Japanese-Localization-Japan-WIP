#if AppSource
tableextension 70658587 SRSetupTJP extends "Sales & Receivables Setup"
{
    fields
    {
        field(70658575; "Coll. Invoice Base Date TJP"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Collective Invoice Base Date';
            OptionMembers = "Posting Date","Document Date";
            OptionCaption = 'Posting Date,Document Date';
        }
        field(70658576; "Col. Inv. Copy Identifier1 TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Col. Inv. Copy Identifier 1';
        }
        field(70658577; "Col. Inv. Copy Identifier2 TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Col. Inv. Copy Identifier 2';
        }
        field(70658578; "Col. Inv. Copy Identifier3 TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Col. Inv. Copy Identifier 3';
        }
        field(70658579; "Col. Inv. No. of Copies TJP"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Col. Inv. No. of Copies';
        }
        field(70658580; "Allow Attach After Post TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Allow Addition/Deletion Of Attachments After Post';
        }
    }
}
#endif

#if OnPremise
tableextension 99012 SRSetupTJP extends "Sales & Receivables Setup"
{
    fields
    {
        field(99000; "Coll. Invoice Base Date TJP"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Collective Invoice Base Date';
            OptionMembers = "Posting Date","Document Date";
            OptionCaption = 'Posting Date,Document Date';
        }
        field(99001; "Col. Inv. Copy Identifier1 TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Col. Inv. Copy Identifier 1';
        }
        field(99002; "Col. Inv. Copy Identifier2 TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Col. Inv. Copy Identifier 2';
        }
        field(99003; "Col. Inv. Copy Identifier3 TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Col. Inv. Copy Identifier 3';
        }
        field(99004; "Col. Inv. No. of Copies TJP"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Col. Inv. No. of Copies';
        }
        field(99005; "Allow Attach After Post TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Allow Addition/Deletion Of Attachments After Post';
        }
    }
}
#endif