#if AppSource
pageextension 70658595 FADepBkSubPageTJP extends "FA Depreciation Books Subform"
#endif
#if OnPremise
pageextension 99019 FADepBkSubPageTJP extends "FA Depreciation Books Subform"
#endif
{
    layout
    {
        // Depreciation Book Code
        movefirst(Control1; "Depreciation Book Code")
        modify("Depreciation Book Code")
        {
            Width = 5;
        }
        // FA Posting Group
        moveafter("Depreciation Book Code"; "FA Posting Group")
        modify("FA Posting Group")
        {
            Width = 5;
        }
        // Book Value
        moveafter("FA Posting Group"; BookValue)
        modify(BookValue)
        {
            Width = 9;
        }
        // Depreciation Method
        moveafter(BookValue; "Depreciation Method")
        modify("Depreciation Method")
        {
            //Visible = ((TheCompanyIsInJapan = false) or ((TheCompanyIsInJapan = true) and (UseNonJapaneseFADepreciationMethod = true)));
            Visible = false;
        }
        // Depreciation Method (Japan Localization 70658582) (8/8)
        addafter("Depreciation Method")
        {
            field("Depr. Method (Extended) TJP"; Rec."Depr. Method (Extended) TJP")
            {
                ApplicationArea = All;
                Caption = 'Japan Depreciation Method';
                ToolTip = 'Specifies the depreciation method of fixed assets customized for Japanese business practice.';
                Visible = (TheCompanyIsInJapan = true);
                Width = 10;
            }
        }
        // Japan DB Type (Japan Localization 70658581) (7/8)
        addafter("Depr. Method (Extended) TJP")
        {
            field("JPDB Type TJP"; Rec."JPDB Type TJP")
            {
                ApplicationArea = All;
                Caption = 'Japan DB Type';
                ToolTip = 'Specifies the depreciation method between 200% and 250% for Japanese declining balance.';
                Visible = (TheCompanyIsInJapan = true);
                Width = 10;
            }
        }
        // Depreciation Starting Date
        moveafter("JPDB Type TJP"; "Depreciation Starting Date")
        modify("Depreciation Starting Date")
        {
            Width = 9;
        }
        // No. of Depreciation Years
        moveafter("Depreciation Method"; "No. of Depreciation Years")
        modify("No. of Depreciation Years")
        {
            //visible = ((TheCompanyIsInJapan = false) or ((TheCompanyIsInJapan = true) and (UseNonJapaneseFADepreciationMethod = true)));
            Visible = false;
        }
        // Depreciation Ending Date
        moveafter("No. of Depreciation Years"; "Depreciation Ending Date")
        modify("Depreciation Ending Date")
        {
            //Visible = (TheCompanyIsInJapan = false);
            //Visible = ((TheCompanyIsInJapan = false) or ((TheCompanyIsInJapan = true) and (UseNonJapaneseFADepreciationMethod = true)));
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
                Visible = (TheCompanyIsInJapan = true);
                Width = 3;
            }
        }
        // Salvage Value
        addafter("Depreciation Years TJP")
        {
            field("Salvage Value TJP"; Rec."Salvage Value")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the estimated residual value of a fixed asset when it can no longer be used.';
                Visible = (TheCompanyIsInJapan = true);
                Width = 9;
            }
        }
        // Ending Book Value
        moveafter("Salvage Value TJP"; "Ending Book Value")
        modify("Ending Book Value")
        {
            Visible = (TheCompanyIsInJapan = true);
            Width = 9;
        }
        // Disposed Of
        moveafter("Ending Book Value"; """Disposal Date"" > 0D")
        modify("""Disposal Date"" > 0D")
        {
            Caption = 'Disposed Of';
            ToolTip = 'Specifies whether the fixed asset has been disposed of.';
            Width = 3;
        }
        // Straight-Line %
        moveafter("""Disposal Date"" > 0D"; "Straight-Line %")
        modify("Straight-Line %")
        {
            Editable = false;
            Visible = (TheCompanyIsInJapan = true);
            Width = 4;
        }
        // Declining-Balance %
        moveafter("Straight-Line %"; "Declining-Balance %")
        modify("Declining-Balance %")
        {
            Width = 4;
        }
        // Adjustment Depreciation % (Japan Localization 70658576) (2/8)
        addafter("Declining-Balance %")
        {
            field("Adjustment Depreciation % TJP"; Rec."Adjustment Depreciation % TJP")
            {
                ApplicationArea = All;
                Caption = 'Adjustment Depreciation %';
                ToolTip = 'Specifies the Un-depreciated balance × Depreciation rate under the declining-balance method ("depreciation amount before adjustment")';
                Visible = (TheCompanyIsInJapan = true);
                Editable = false;
                Width = 4;
            }
        }
        // Adjustment Depreciation Base Amount (Japan Localization 70658580) (6/8)
        addafter("Adjustment Depreciation % TJP")
        {
            field("Adj. Depr. Base Amount TJP"; Rec."Adj. Depr. Base Amount TJP")
            {
                ApplicationArea = All;
                Caption = 'Adj. Depr. Base Amount';
                ToolTip = 'TBD';
                Visible = (TheCompanyIsInJapan = true);
                Editable = false;
                Width = 9;
            }
        }
        // Adjustment Depreciation Amount (Japan Localization 70658577) (3/8)
        addafter("Adj. Depr. Base Amount TJP")
        {
            field("Adj. Depr. Amount TJP"; Rec."Adj. Depr. Amount TJP")
            {
                ApplicationArea = All;
                Caption = 'Adj. Depr. Amount';
                ToolTip = 'TBD';
                Visible = (TheCompanyIsInJapan = true);
                Editable = false;
                Width = 9;
            }
        }
        // Guarantee % (Japan Localization 70658575) (1/8)
        addafter("Adj. Depr. Amount TJP")
        {
            field("Guarantee % TJP"; Rec."Guarantee % TJP")
            {
                ApplicationArea = All;
                Caption = 'Guarantee %';
                ToolTip = 'Specifies the guaranteed depreciation amount refers to the amount calculated by multiplying the acquisition cost of the fixed asset by the guarantee rate according to its useful life.';
                Visible = (TheCompanyIsInJapan = true);
                Editable = false;
                Width = 4;
            }
        }
        // 5% Depreciation (Japan Localization 70658579) (5/8)
        addafter("Guarantee % TJP")
        {
            field("Straight Line Depr. 5 % TJP"; Rec."Straight Line Depr. 5 % TJP")
            {
                ApplicationArea = All;
                Caption = 'Straight Line Depr. 5 %';
                ToolTip = 'Specifies the percentage of straight line depreciation method.';
                Visible = false;
                Width = 3;
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