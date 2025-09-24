#if AppSource
tableextension 70658585 BankAccTJP extends "Bank Account"
{
    fields
    {
        field(70658575; "P.Note Receivable Account TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'P.Note Receivable Account';
            TableRelation = "G/L Account"."No." WHERE("Account Type" = CONST(Posting));
        }
        field(70658576; "P.Note Payable Account TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'P.Note Payable Account';
            TableRelation = "G/L Account"."No." WHERE("Account Type" = CONST(Posting));
        }
        field(70658577; "P.Note Discounted Account TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'P.Note Discounted Account';
            TableRelation = "G/L Account"."No." WHERE("Account Type" = CONST(Posting));
        }
        field(70658578; "P.Note Rec. Disc. Account TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'P.Note Rec. Disc. Account';
            TableRelation = "G/L Account"."No." WHERE("Account Type" = CONST(Posting));
        }
        field(70658579; "P.Note Dishonored Account TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'P.Note Dishonored Account';
            TableRelation = "G/L Account"."No." WHERE("Account Type" = CONST(Posting));
        }
        field(70658580; "Company Code TJP"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Company Code';
        }
        field(70658581; "Zengin Bank Branch No. TJP"; Text[7])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Bank & Branch No.';
        }
        field(70658582; "Zengin Bank Name Kana TJP"; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Bank Name Kana';
        }
        field(70658583; "Zengin Branch Name Kana TJP"; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Branch Name Kana';
        }
        field(70658584; "Zengin Account Type TJP"; Enum "Zengin Account Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Account Type';
        }
        field(70658585; "Zengin Bank Account No. TJP"; Text[7])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Bank Account No.';
        }
        field(70658586; "Zengin Account Holder Kana TJP"; Text[40])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Account Holder Kana';
        }
    }
}
#endif

#if OnPremise
tableextension 99010 BankAccTJP extends "Bank Account"
{
    fields
    {
        field(99000; "P.Note Receivable Account TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'P.Note Receivable Account';
            TableRelation = "G/L Account"."No." WHERE("Account Type" = CONST(Posting));
        }
        field(99001; "P.Note Payable Account TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'P.Note Payable Account';
            TableRelation = "G/L Account"."No." WHERE("Account Type" = CONST(Posting));
        }
        field(99002; "P.Note Discounted Account TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'P.Note Discounted Account';
            TableRelation = "G/L Account"."No." WHERE("Account Type" = CONST(Posting));
        }
        field(99003; "P.Note Rec. Disc. Account TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'P.Note Rec. Disc. Account';
            TableRelation = "G/L Account"."No." WHERE("Account Type" = CONST(Posting));
        }
        field(99004; "P.Note Dishonored Account TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'P.Note Dishonored Account';
            TableRelation = "G/L Account"."No." WHERE("Account Type" = CONST(Posting));
        }
        field(99005; "Company Code TJP"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Company Code';
        }
        field(99006; "Zengin Bank Branch No. TJP"; Text[7])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Bank & Branch No.';
        }
        field(99007; "Zengin Bank Name Kana TJP"; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Bank Name Kana';
        }
        field(99008; "Zengin Branch Name Kana TJP"; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Branch Name Kana';
        }
        field(99009; "Zengin Account Type TJP"; Enum "Zengin Account Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Account Type';
        }
        field(99010; "Zengin Bank Account No. TJP"; Text[7])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Bank Account No.';
        }
        field(99011; "Zengin Account Holder Kana TJP"; Text[40])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Account Holder Kana';
        }
    }
}
#endif