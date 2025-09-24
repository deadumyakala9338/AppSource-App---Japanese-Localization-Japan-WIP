#if AppSource
table 70658576 "Fixed Asset Rates TJP"
{
    Caption = 'Fixed Asset Rates';
    DrillDownPageID = "Fixed Asset Rates TJP";
    LookupPageID = "Fixed Asset Rates TJP";

    fields
    {
        field(1; "Number of Years"; Integer)
        {
            Caption = 'Number of Years';
            DataClassification = CustomerContent;
        }
        field(2; "Straight-Line Rate"; Decimal)
        {
            Caption = 'Straight-Line Rate';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(3; "DB Rate"; Decimal)
        {
            Caption = 'DB Rate';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(4; "Adjust Depreciation"; Decimal)
        {
            Caption = 'Adjust Depreciation';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(5; "Guarantee %"; Decimal)
        {
            Caption = 'Guarantee %';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(6; "JPDB Type"; Enum "JPDB Type TJP")
        {
            Caption = 'JPDB Type';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "JPDB Type", "Number of Years")
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
table 99001 "Fixed Asset Rates TJP"
{
    Caption = 'Fixed Asset Rates';
    DrillDownPageID = "Fixed Asset Rates TJP";
    LookupPageID = "Fixed Asset Rates TJP";

    fields
    {
        field(1; "Number of Years"; Integer)
        {
            Caption = 'Number of Years';
            DataClassification = CustomerContent;
        }
        field(2; "Straight-Line Rate"; Decimal)
        {
            Caption = 'Straight-Line Rate';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(3; "DB Rate"; Decimal)
        {
            Caption = 'DB Rate';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(4; "Adjust Depreciation"; Decimal)
        {
            Caption = 'Adjust Depreciation';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(5; "Guarantee %"; Decimal)
        {
            Caption = 'Guarantee %';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(6; "JPDB Type"; Enum "JPDB Type TJP")
        {
            Caption = 'JPDB Type';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "JPDB Type", "Number of Years")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
#endif