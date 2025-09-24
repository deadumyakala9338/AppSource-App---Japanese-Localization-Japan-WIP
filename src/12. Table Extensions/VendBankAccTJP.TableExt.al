#if AppSource
tableextension 70658586 VendBankAccTJP extends "Vendor Bank Account"
{
    fields
    {
        field(70658575; "Default Bank TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Default Bank';
        }
        field(70658576; "Zengin Bank Branch No. TJP"; Text[7])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Bank & Branch No.';
        }
        field(70658577; "Zengin Bank Name Kana TJP"; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Bank Name Kana';
        }
        field(70658578; "Zengin Branch Name Kana TJP"; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Branch Name Kana';
        }
        field(70658579; "Zengin Account Type TJP"; Enum "Zengin Account Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Account Type';
        }
        field(70658580; "Zengin Bank Account No. TJP"; Text[7])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Bank Account No.';
        }
        field(70658581; "Zengin Account Holder Kana TJP"; Text[40])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Account Holder Kana';
        }
    }
}
#endif

#if OnPremise
tableextension 99011 VendBankAccTJP extends "Vendor Bank Account"
{
    fields
    {
        field(99000; "Default Bank TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Default Bank';
        }
        field(99001; "Zengin Bank Branch No. TJP"; Text[7])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Bank & Branch No.';
        }
        field(99002; "Zengin Bank Name Kana TJP"; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Bank Name Kana';
        }
        field(99003; "Zengin Branch Name Kana TJP"; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Branch Name Kana';
        }
        field(99004; "Zengin Account Type TJP"; Enum "Zengin Account Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Account Type';
        }
        field(99005; "Zengin Bank Account No. TJP"; Text[7])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Bank Account No.';
        }
        field(99006; "Zengin Account Holder Kana TJP"; Text[40])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Account Holder Kana';
        }
    }
}
#endif