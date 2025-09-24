#if AppSource
pageextension 70658686 "FA Card TJP" extends "Fixed Asset Card"
#endif
#if OnPremise
pageextension 99033 "FA Card TJP" extends "Fixed Asset Card"
#endif
{
    layout
    {
        // Depreciation Book Code
        modify(DepreciationBookCode)
        {
            Editable = (TheCompanyIsInJapan = false);
        }
        // FA Posting Group
        modify(FAPostingGroup)
        {
            Editable = (TheCompanyIsInJapan = false);
        }
        // Book Value
        moveafter(FAPostingGroup; BookValue)
        // Depreciation Method
        moveafter(BookValue; DepreciationMethod)
        modify(DepreciationMethod)
        {
            Editable = (TheCompanyIsInJapan = false);
        }
        // Depreciation Table Code
        modify(DepreciationTableCode)
        {
            Visible = (TheCompanyIsInJapan = false);
        }
        // Use Half-Year Convention
        modify(UseHalfYearConvention)
        {
            Visible = (TheCompanyIsInJapan = false);
        }
        // Depreciation Method (Japan Localization 70658582) (8/8)
        addafter(DepreciationMethod)
        {
            field(DeprMethodExtendedTJP; FADepreciationBook."Depr. Method (Extended) TJP")
            {
                ApplicationArea = All;
                Caption = 'Japan Depreciation Method';
                ToolTip = 'TBD';
                Visible = TheCompanyIsInJapan;
                Editable = false;

                trigger OnValidate()
                begin
                    LoadFADepreciationBooks();
                    FADepreciationBook.Validate("Depr. Method (Extended) TJP");
                    SaveSimpleDepreciationBook(xRec."No.");
                    ShowAcquisitionNotification();
                    //
                    case FADepreciationBook."Depr. Method (Extended) TJP" of
                    //FADepreciationBook."Depr. Method (Extended) TJP"::"Straight-Line":
                    //begin
                    //StraightLine := true;
                    //DecliningBalance := false;
                    //end;
                    //FADepreciationBook."Depr. Method (Extended) TJP"::JPDB:
                    //begin
                    //StraightLine := false;
                    //DecliningBalance := true;
                    //end;
                    end;
                end;
            }
        }
        // Japan Depreciation Type (Japan Localization 70658581) (7/8)
        addafter(DeprMethodExtendedTJP)
        {
            field(JPDBTypeTJP; FADepreciationBook."JPDB Type TJP")
            {
                ApplicationArea = All;
                Caption = 'Japan Depreciation Type';
                ToolTip = 'TBD';
                Visible = TheCompanyIsInJapan;
                Editable = false;

                trigger OnValidate()
                begin
                    NewJPDBTypeTJP := FADepreciationBook."JPDB Type TJP";
                    LoadFADepreciationBooks();
                    FADepreciationBook."JPDB Type TJP" := FADepreciationBook."JPDB Type TJP"::" ";
                    FADepreciationBook.Validate("JPDB Type TJP", NewJPDBTypeTJP);
                    SaveSimpleDepreciationBook(xRec."No.");
                    ShowAcquisitionNotification();
                end;
            }
        }
        // Depreciation Starting Date
        moveafter(JPDBTypeTJP; DepreciationStartingDate)
        modify(DepreciationStartingDate)
        {
            Editable = (TheCompanyIsInJapan = false);
        }
        // No. of Depreciation Years
        moveafter(DepreciationStartingDate; NumberOfDepreciationYears)
        modify(NumberOfDepreciationYears)
        {
            Visible = (TheCompanyIsInJapan = false) or (TheCompanyIsInJapan and Last5PercentDepreciation);
            Editable = (TheCompanyIsInJapan = false);
        }
        // Depreciation Ending Date
        moveafter(NumberOfDepreciationYears; DepreciationEndingDate)
        modify(DepreciationEndingDate)
        {
            Visible = (TheCompanyIsInJapan = false) or (TheCompanyIsInJapan and Last5PercentDepreciation);
            Editable = (TheCompanyIsInJapan = false);
        }
        // Japan Depreciation Years (Japan Localization 70658578) (4/8)
        addafter(DepreciationStartingDate)
        {
            field(DepreciationYearsTJP; FADepreciationBook."Depreciation Years TJP")
            {
                ApplicationArea = All;
                Caption = 'Japan Depreciation Years';
                ToolTip = 'TBD';
                Visible = TheCompanyIsInJapan;
                Editable = false;

                trigger OnValidate()
                var
                begin
                    NewDepreciationYearsTJP := FADepreciationBook."Depreciation Years TJP";
                    LoadFADepreciationBooks();
                    //FADepreciationBook."Depreciation Years TJP" := OldDepreciationYearsTJP;
                    FADepreciationBook.Validate("Depreciation Years TJP", NewDepreciationYearsTJP);
                    SaveSimpleDepreciationBook(xRec."No.");
                    ShowAcquisitionNotification();
                end;
            }
        }
        // Salvage Value
        addafter(DepreciationEndingDate)
        {
            field(SalvageValueTJP; SalvageValue)
            {
                ApplicationArea = All;
                Caption = 'Salvage Value';
                ToolTip = 'TBD';
                Editable = false;
                Visible = TheCompanyIsInJapan;

                trigger OnDrillDown()
                var
                    FALedgerEntry: Record "FA Ledger Entry";
                //FALedgerEntries: Page "FA Ledger Entries";
                begin
                    if SalvageValue <> 0 then begin
                        FALedgerEntry.SetRange("FA No.", FADepreciationBook."FA No.");
                        FALedgerEntry.SetRange("Depreciation Book Code", FADepreciationBook."Depreciation Book Code");
                        FALedgerEntry.SetRange("FA Posting Type", FALedgerEntry."FA Posting Type"::"Salvage Value");
                        // FALedgerEntry.FindSet();
                        // FALedgerEntries.SetRecord(FALedgerEntry);
                        // FALedgerEntries.Run();
                        Page.Run(0, FALedgerEntry);
                    end
                    else
                        exit;
                end;
            }
        }
        // Ending Book Value
        addafter(SalvageValueTJP)
        {
            field(EndingBookValueTJP; FADepreciationBook."Ending Book Value")
            {
                ApplicationArea = All;
                Caption = 'Ending Book Value';
                ToolTip = 'TBD';
                Visible = TheCompanyIsInJapan;
                Editable = (TheCompanyIsInJapan = false);

                trigger OnValidate()
                begin
                    LoadFADepreciationBooks();
                    FADepreciationBook.Validate("Ending Book Value");
                    SaveSimpleDepreciationBook(xRec."No.");
                    ShowAcquisitionNotification();
                end;
            }
        }
        // Disposal Of
        addafter(EndingBookValueTJP)
        {
            field(DisposedOfTJP; FADepreciationBook."Disposal Date" > 0D)
            {
                ApplicationArea = All;
                Caption = 'Disposed Of';
                ToolTip = 'TBD';
                Visible = TheCompanyIsInJapan;
            }
        }
        // Japan SL
        addafter(DisposedOfTJP)
        {
            group(JapanSLTJP)
            {
                Caption = 'Japan SL';
                Visible = TheCompanyIsInJapan;

                // Straight-Line %
                field(StraightLinePercentTJP; FADepreciationBook."Straight-Line %")
                {
                    ApplicationArea = All;
                    Caption = 'Straight-Line %';
                    ToolTip = 'TBD';
                    Editable = false;
                    Visible = TheCompanyIsInJapan;
                }
            }
        }
        // Japan DB
        addafter(JapanSLTJP)
        {
            group(JapanDBTJP)
            {
                Caption = 'Japan DB';
                Visible = TheCompanyIsInJapan;

                // Declining Balance Percent
                field(DecliningBalancePercentTJP; FADepreciationBook."Declining-Balance %")
                {
                    ApplicationArea = All;
                    Caption = 'Declining Balance %';
                    ToolTip = 'TBD';
                    Editable = false;
                    Visible = TheCompanyIsInJapan;

                    trigger OnValidate()
                    begin
                        LoadFADepreciationBooks();
                        FADepreciationBook.Validate("Declining-Balance %");
                        SaveSimpleDepreciationBook(xRec."No.");
                        ShowAcquisitionNotification();
                    end;
                }
                // Adjustment Depreciation % (Japan Localization 70658576) (2/8)
                field(AdjustmentDepreciationPercentTJP; FADepreciationBook."Adjustment Depreciation % TJP")
                {
                    ApplicationArea = All;
                    Caption = 'Adjustment Depreciation %';
                    ToolTip = 'TBD';
                    Editable = false;
                    Visible = TheCompanyIsInJapan;
                }
                // Adjustment Depreciation Base Amount (Japan Localization 70658580) (6/8)
                field(AdjDeprBaseAmountTJP; FADepreciationBook."Adj. Depr. Base Amount TJP")
                {
                    ApplicationArea = All;
                    Caption = 'Adj. Depr. Base Amount';
                    ToolTip = 'TBD';
                    Editable = false;
                    Visible = TheCompanyIsInJapan;
                }
                // Adjustment Depreciation Amount (Japan Localization 70658577) (3/8)
                field(AdjDeprAmountTJP; FADepreciationBook."Adj. Depr. Amount TJP")
                {
                    ApplicationArea = All;
                    Caption = 'Adj. Depr. Amount';
                    ToolTip = 'TBD';
                    Editable = false;
                    Visible = TheCompanyIsInJapan;
                }
                // Guarantee % (Japan Localization 70658575) (1/8)
                field(GuaranteePercentTJP; FADepreciationBook."Guarantee % TJP")
                {
                    ApplicationArea = All;
                    Caption = 'Guarantee %';
                    ToolTip = 'TBD';
                    Editable = false;
                    Visible = TheCompanyIsInJapan;
                }
            }
        }
        // Japan Other
        addafter(JapanDBTJP)
        {
            group(JapanOtherTJP)
            {
                Caption = 'Japan SL/DB Common';
                Visible = false;

                // 5% Depreciation (Japan Localization 70658579) (5/8)
                field(StraightLineDepr5PercentTJP; FADepreciationBook."Straight Line Depr. 5 % TJP")
                {
                    ApplicationArea = All;
                    Caption = 'Straight Line Depr. 5 %';
                    ToolTip = 'TBD';
                    Visible = TheCompanyIsInJapan;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        LoadFADepreciationBooks();
                        FADepreciationBook.Validate("Straight Line Depr. 5 % TJP");
                        SaveSimpleDepreciationBook(xRec."No.");
                        ShowAcquisitionNotification();
                        //
                        if FADepreciationBook."Straight Line Depr. 5 % TJP" = true then
                            Last5PercentDepreciation := true
                        else
                        Last5PercentDepreciation := false;
                        CurrPage.Update();
                    end;
                }
            }
        }
    }

    actions
    {
        addlast(Promoted)
        {
            actionref(SimpleTJP_Promoted; DepreciationBookInCardTJP)
            {
            }
        }
        addlast(navigation)
        {

            action(DepreciationBookInCardTJP)
            {
                ApplicationArea = All;
                Caption = 'Depreciation Book in Card Format';
                ToolTip = 'Shows depreciation book in card format.';
                Image = Card;
                Visible = (Simple = false) and (MultipleDepreciationBook = false) and TheCompanyIsInJapan;

                trigger OnAction()
                var
                begin
                    Simple := true;
                    CurrPage.Update();
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        CompanyInformationRec: Record "Company Information";
        FADepreciationBook2: Record "FA Depreciation Book";
        FADepreciationBook3: Record "FA Depreciation Book";
    begin
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') = 1 then
            TheCompanyIsInJapan := true
        else
            TheCompanyIsInJapan := false;
        //
        FADepreciationBook2.SetRange("FA No.", Rec."No.");
        if FADepreciationBook2.FindFirst() then
            case FADepreciationBook2."Depr. Method (Extended) TJP" of
            //FADepreciationBook2."Depr. Method (Extended) TJP"::"Straight-Line":
            //begin
            //StraightLine := true;
            //DecliningBalance := false;
            //end;
            //FADepreciationBook2."Depr. Method (Extended) TJP"::JPDB:
            //begin
            //StraightLine := false;
            //DecliningBalance := true;
            //end;
            end
        else begin
            FADepreciationBook."Depreciation Method" := FADepreciationBook."Depreciation Method"::" TJP";
            FADepreciationBook."Depr. Method (Extended) TJP" := FADepreciationBook."Depr. Method (Extended) TJP"::" ";
            FADepreciationBook."JPDB Type TJP" := FADepreciationBook."JPDB Type TJP"::" ";
            //StraightLine := true;
            //DecliningBalance := true;
        end;
        //
        FADepreciationBook2.CalcFields("Salvage Value");
        SalvageValue := FADepreciationBook2."Salvage Value";
        //
        if FADepreciationBook2."Straight Line Depr. 5 % TJP" = true then
            Last5PercentDepreciation := true
        else
            Last5PercentDepreciation := false;
        //
        FADepreciationBook3.SetRange("FA No.", Rec."No.");
        if FADepreciationBook3.Count > 1 then
            MultipleDepreciationBook := true;
    end;

    var
        TheCompanyIsInJapan: Boolean;
        NewJPDBTypeTJP: Enum "JPDB Type TJP";
        //OldDepreciationYearsTJP: Integer;
        NewDepreciationYearsTJP: Integer;
        //StraightLine: Boolean;
        //DecliningBalance: Boolean;
        SalvageValue: Decimal;
        Last5PercentDepreciation: Boolean;
        MultipleDepreciationBook: Boolean;
}