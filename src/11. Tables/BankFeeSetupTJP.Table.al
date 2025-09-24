#if AppSource
table 70658577 "Bank Fee Setup TJP"
{
    Caption = 'Bank Fee Setup';
    DrillDownPageID = "Bank Fee Setup TJP";
    LookupPageID = "Bank Fee Setup TJP";

    fields
    {
        field(1; "Bank Account No."; Code[20])
        {
            Caption = 'Bank';
            TableRelation = "Bank Account";
            DataClassification = CustomerContent;
        }
        field(2; "Payee Bank Type"; Enum "Payee Bank Type TJP")
        {
            Caption = 'Payee Bank Type';
            DataClassification = CustomerContent;
        }
        field(3; "Payment Amount From"; Decimal)
        {
            Caption = 'Payment Amount From';
            DataClassification = CustomerContent;
        }
        field(4; "Bank Fee"; Decimal)
        {
            Caption = 'Bank Fee';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Bank Account No.", "Payee Bank Type", "Payment Amount From")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
#endif

#if OnPremise
table 99002 "Bank Fee Setup TJP"
{
    Caption = 'Bank Fee Setup';
    DrillDownPageID = "Bank Fee Setup TJP";
    LookupPageID = "Bank Fee Setup TJP";

    fields
    {
        field(1; "Bank Account No."; Code[20])
        {
            Caption = 'Bank';
            TableRelation = "Bank Account";
            DataClassification = CustomerContent;
        }
        field(2; "Payee Bank Type"; Enum "Payee Bank Type TJP")
        {
            Caption = 'Payee Bank Type';
            DataClassification = CustomerContent;
        }
        field(3; "Payment Amount From"; Decimal)
        {
            Caption = 'Payment Amount From';
            DataClassification = CustomerContent;
        }
        field(4; "Bank Fee"; Decimal)
        {
            Caption = 'Bank Fee';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Bank Account No.", "Payee Bank Type", "Payment Amount From")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
#endif