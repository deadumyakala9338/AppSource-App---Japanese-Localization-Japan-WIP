#if AppSource
tableextension 70658591 FADepBookTJP extends "FA Depreciation Book"
{
    fields
    {
        field(70658575; "Guarantee % TJP"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Guarantee %';
            DecimalPlaces = 2 : 8;
        }
        field(70658576; "Adjustment Depreciation % TJP"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Adjustment Depreciation %';
            DecimalPlaces = 2 : 8;
        }
        field(70658577; "Adj. Depr. Amount TJP"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Adj. Depr. Amount';
        }
        field(70658578; "Depreciation Years TJP"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Japan DB Depreciation Years';
            TableRelation = "Fixed Asset Rates TJP"."Number of Years" WHERE("JPDB Type" = FIELD("JPDB Type TJP"));
        }
        field(70658579; "Straight Line Depr. 5 % TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Straight Line Depr. 5 %';
        }
        field(70658580; "Adj. Depr. Base Amount TJP"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Adj. Depr. Base Amount';
        }
        field(70658581; "JPDB Type TJP"; Enum "JPDB Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Japan DB Type';
            // trigger OnValidate()
            // var
            //     ErrorMsg001Lbl: Label 'JPDB Type must be selected.';
            //     ErrorMsg002Lbl: Label 'JPDB Type must be blank';
            // begin
            //     if "Depr. Method (Extended) TJP" = "Depr. Method (Extended) TJP"::JPDB then begin
            //         if "JPDB Type TJP" = "JPDB Type TJP"::" " then begin
            //             Message(ErrorMsg001Lbl);
            //             Validate("JPDB Type TJP", "JPDB Type TJP"::JPDB2012);
            //         end
            //     end
            //     else
            //         if "JPDB Type TJP" <> "JPDB Type TJP"::" " then begin
            //             Message(ErrorMsg002Lbl);
            //             Validate("JPDB Type TJP", "JPDB Type TJP"::" ");
            //         end;
            // end;
        }
        field(70658582; "Depr. Method (Extended) TJP"; Enum "Depreciation Method (Extended) TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Depreciation Method';
            trigger OnValidate()
            begin
                if "Depr. Method (Extended) TJP" <> "Depr. Method (Extended) TJP"::JPDB then
                    Validate("JPDB Type TJP", "JPDB Type TJP"::" ");
            end;
        }
    }
    keys
    {
        // key(Key5; "Straight Line Depr. 5 % TJP")
        // {
        //     ObsoleteState = Pending;
        //     ObsoleteTag = '24.0';
        //     ObsoleteReason = 'Must be renamed.';
        // }
        key(KeyTJP; "Straight Line Depr. 5 % TJP")
        {
        }
    }
}
#endif

#if OnPremise
tableextension 99016 FADepBookTJP extends "FA Depreciation Book"
{
    fields
    {
        field(99000; "Guarantee % TJP"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Guarantee %';
            DecimalPlaces = 2 : 8;
        }
        field(99001; "Adjustment Depreciation % TJP"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Adjustment Depreciation %';
            DecimalPlaces = 2 : 8;
        }
        field(99002; "Adj. Depr. Amount TJP"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Adj. Depr. Amount';
        }
        field(99003; "Depreciation Years TJP"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Japan DB Depreciation Years';
            TableRelation = "Fixed Asset Rates TJP"."Number of Years" WHERE("JPDB Type" = FIELD("JPDB Type TJP"));
        }
        field(99004; "Straight Line Depr. 5 % TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Straight Line Depr. 5 %';
        }
        field(99005; "Adj. Depr. Base Amount TJP"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Adj. Depr. Base Amount';
        }
        field(99006; "JPDB Type TJP"; Enum "JPDB Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Japan DB Type';
            // trigger OnValidate()
            // var
            //     ErrorMsg001Lbl: Label 'JPDB Type must be selected.';
            //     ErrorMsg002Lbl: Label 'JPDB Type must be blank';
            // begin
            //     if "Depr. Method (Extended) TJP" = "Depr. Method (Extended) TJP"::JPDB then begin
            //         if "JPDB Type TJP" = "JPDB Type TJP"::" " then begin
            //             Message(ErrorMsg001Lbl);
            //             Validate("JPDB Type TJP", "JPDB Type TJP"::JPDB2012);
            //         end
            //     end
            //     else
            //         if "JPDB Type TJP" <> "JPDB Type TJP"::" " then begin
            //             Message(ErrorMsg002Lbl);
            //             Validate("JPDB Type TJP", "JPDB Type TJP"::" ");
            //         end;
            // end;
        }
        field(99007; "Depr. Method (Extended) TJP"; Enum "Depreciation Method (Extended) TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Depreciation Method';
            trigger OnValidate()
            begin
                if "Depr. Method (Extended) TJP" <> "Depr. Method (Extended) TJP"::JPDB then
                    Validate("JPDB Type TJP", "JPDB Type TJP"::" ");
            end;
        }
    }
    keys
    {
        key(Key5; "Straight Line Depr. 5 % TJP")
        {

        }
    }
}
#endif