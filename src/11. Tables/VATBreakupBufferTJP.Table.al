#if AppSource
table 70658578 "VAT Breakup Buffer TJP"
{
    TableType = Temporary;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.', Locked = true;
            Editable = false;
        }
        field(2; "Document No."; code[20])
        {
            Caption = 'Document No.', Locked = true;
            Editable = false;
        }
        field(3; "Customer Code"; Code[20])
        {
            Caption = 'Customer Code', Locked = true;
            TableRelation = Customer;
            ValidateTableRelation = true;
            Editable = false;
        }
        field(10; "VAT %"; Decimal)
        {
            Caption = 'VAT %', Locked = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(11; "VAT Identifier"; Code[20])
        {
            Caption = 'VAT Identifier', Locked = true;
            Editable = false;
        }
        field(12; "VAT Base"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Base', Locked = true;
            Editable = false;
        }
        field(13; "VAT Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Amount', Locked = true;
        }
        field(14; "Amount Including VAT"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount Including VAT', Locked = true;
            Editable = false;
        }
        field(20; "Report Breakup Amount"; Decimal)
        {
            Caption = 'Report Breakup Amount', Locked = true;
            Editable = false;
        }
        field(30; "Report Label Text"; Text[100])
        {
            Caption = 'Report Label Text', Locked = true;
            Editable = false;
        }
    }
    keys
    {
        key(Key1; "Entry No.", "Document No.")
        {
            Clustered = true;
        }
        key(Key2; "VAT %")
        {

        }
    }
}
#endif

#if OnPremise
table 99003 "VAT Breakup Buffer TJP"
{
    TableType = Temporary;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.', Locked = true;
            Editable = false;
        }
        field(2; "Document No."; code[20])
        {
            Caption = 'Document No.', Locked = true;
            Editable = false;
        }
        field(3; "Customer Code"; Code[20])
        {
            Caption = 'Customer Code', Locked = true;
            TableRelation = Customer;
            ValidateTableRelation = true;
            Editable = false;
        }
        field(10; "VAT %"; Decimal)
        {
            Caption = 'VAT %', Locked = true;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(11; "VAT Identifier"; Code[20])
        {
            Caption = 'VAT Identifier', Locked = true;
            Editable = false;
        }
        field(12; "VAT Base"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Base', Locked = true;
            Editable = false;
        }
        field(13; "VAT Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Amount', Locked = true;
        }
        field(14; "Amount Including VAT"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount Including VAT', Locked = true;
            Editable = false;
        }
        field(20; "Report Breakup Amount"; Decimal)
        {
            Caption = 'Report Breakup Amount', Locked = true;
            Editable = false;
        }
        field(30; "Report Label Text"; Text[100])
        {
            Caption = 'Report Label Text', Locked = true;
            Editable = false;
        }
    }
    keys
    {
        key(Key1; "Entry No.", "Document No.")
        {
            Clustered = true;
        }
        key(Key2; "VAT %")
        {

        }
    }
}
#endif