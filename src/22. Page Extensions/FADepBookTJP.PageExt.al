#if AppSource
pageextension 70658594 FADepBookTJP extends "FA Depreciation Books"
#endif
#if OnPremise
pageextension 99018 FADepBookTJP extends "FA Depreciation Books"
#endif
{
    layout
    {
        // FA No.
        modify("FA No.")
        {
            Width = 5;
        }
        // Depreciation Book Code
        modify("Depreciation Book Code")
        {
            Width = 5;
        }
        // FA Posting Group
        modify("FA Posting Group")
        {
            Width = 5;
        }
        addafter("FA Posting Group")
        {
            // Book Value
            field("Book Value TJP"; Rec."Book Value")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the book value for the fixed asset.';
                Width = 9;
                Visible = TheCompanyIsInJapan;
            }
            // Depreciation Method (Japan Localization 70658582) (8/8)
            field("Depreciation Method (Extended) TJP"; Rec."Depr. Method (Extended) TJP")
            {
                ApplicationArea = All;
                Caption = 'Japan Depreciation Method';
                ToolTip = 'Specifies the depreciation method of fixed assets customized for Japanese business practice.';
                Width = 10;
                Visible = TheCompanyIsInJapan;
            }
            // Japan DB Type (Japan Localization 70658581) (7/8)
            field("JPDB Type TJP"; Rec."JPDB Type TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the depreciation method between 200% and 250% for Japanese declining balance.';
                Width = 10;
                Visible = TheCompanyIsInJapan;
            }
        }
        // Depreciation Method
        moveafter("Book Value TJP"; "Depreciation Method")
        modify("Depreciation Method")
        {
            //visible = ((TheCompanyIsInJapan = false) or ((TheCompanyIsInJapan = true) and (UseNonJapaneseFADepreciationMethod = true)));
            Visible = false;
        }
        // Depreciation Starting Date
        modify("Depreciation Starting Date")
        {
            Visible = true;
            Width = 9;
        }
        moveafter("JPDB Type TJP"; "Depreciation Starting Date")
        // No. of Depreciation Years
        moveafter("Depreciation Method"; "No. of Depreciation Years")
        modify("No. of Depreciation Years")
        {
            //visible = ((TheCompanyIsInJapan = false) or ((TheCompanyIsInJapan = true) and (UseNonJapaneseFADepreciationMethod = true)));
            Visible = false;
        }
        // Japan Depreciation Years (Japan Localization 70658578) (4/8)
        addafter("Depreciation Starting Date")
        {
            field("Depreciation Years TJP"; Rec."Depreciation Years TJP")
            {
                ApplicationArea = All;
                Caption = 'Japan Depreciation Years';
                ToolTip = 'Specifies the useful life of the fixed assets.';
                Width = 3;
                Visible = TheCompanyIsInJapan;
            }
        }
        // Salvage Value
        addafter("Depreciation Years TJP")
        {
            field("Salvage Value TJP"; Rec."Salvage Value")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the estimated residual value of a fixed asset when it can no longer be used.';
                Width = 6;
                Visible = TheCompanyIsInJapan;
            }
        }
        // Ending Book Value
        modify("Ending Book Value")
        {
            Visible = true;
            Width = 6;
        }
        moveafter("Salvage Value TJP"; "Ending Book Value")
        // Disposed Of
        addafter("Ending Book Value")
        {
            field(DisposedOfTJP; Rec."Disposal Date" > 0D)
            {
                ApplicationArea = All;
                Caption = 'Disposed Of';
                ToolTip = 'Specifies whether the fixed asset has been disposed of.';
                Width = 3;
                Visible = TheCompanyIsInJapan;
            }
        }
        // Depreciation Ending Date (Hide)
        modify("Depreciation Ending Date")
        {
            Visible = (TheCompanyIsInJapan = false);
        }
        // Straight-Line %
        modify("Straight-Line %")
        {
            Visible = TheCompanyIsInJapan;
            Editable = false;
            Width = 4;
        }
        // Declining-Balance %
        modify("Declining-Balance %")
        {
            Visible = TheCompanyIsInJapan;
            Editable = false;
            Width = 4;
        }
        addafter("Declining-Balance %")
        {
            // Adjustment Depreciation % (Japan Localization 70658576) (2/8)
            field("Adjustment Depreciation % TJP"; Rec."Adjustment Depreciation % TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Un-depreciated balance × Depreciation rate under the declining-balance method ("depreciation amount before adjustment")';
                Editable = false;
                Width = 4;
                Visible = TheCompanyIsInJapan;
            }
            // Adjustment Depreciation Base Amount (Japan Localization 70658580) (6/8)
            field("Adj. Depr. Base Amount TJP"; Rec."Adj. Depr. Base Amount TJP")
            {
                ApplicationArea = All;
                Caption = 'Adj. Depr. Base Amount';
                ToolTip = 'TBD';
                Width = 9;
                Editable = false;
                Visible = TheCompanyIsInJapan;
            }
            // Adjustment Depreciation Amount (Japan Localization 70658577) (3/8)
            field("Adj. Depr. Amount TJP"; Rec."Adj. Depr. Amount TJP")
            {
                ApplicationArea = All;
                Caption = 'Adj. Depr. Amount';
                ToolTip = 'TBD';
                Width = 9;
                Editable = false;
                Visible = TheCompanyIsInJapan;
            }
            // Guarantee % (Japan Localization 70658575) (1/8)
            field("Guarantee % TJP"; Rec."Guarantee % TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the guaranteed depreciation amount refers to the amount calculated by multiplying the acquisition cost of the fixed asset by the guarantee rate according to its useful life.';
                Width = 4;
                Visible = TheCompanyIsInJapan;
            }
            // 5% Depreciation (Japan Localization 70658579) (5/8)
            field("Straight Line Depr. 5 % TJP"; Rec."Straight Line Depr. 5 % TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the percentage of straight line depreciation method.';
                Width = 3;
                Visible = false;
            }
        }
    }

    trigger OnOpenPage()
    var
        CompanyInformationRec: Record "Company Information";
    //FASetupRec: Record "FA Setup";                                                                // 2025-07-25 Anada
    begin
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') = 1 then
            TheCompanyIsInJapan := true
        else
            TheCompanyIsInJapan := false;
        // if TheCompanyIsInJapan = true then                                                       // 2025-07-25 Anada
        //     if FASetupRec.Get() = true then
        //         if FASetupRec."Use Non-Jpn FA Depn Method TJP" = true then
        //             UseNonJapaneseFADepreciationMethod := true;
    end;

    var
        TheCompanyIsInJapan: Boolean;
    //UseNonJapaneseFADepreciationMethod: Boolean;                                                  // 2025-07-25 Anada
}