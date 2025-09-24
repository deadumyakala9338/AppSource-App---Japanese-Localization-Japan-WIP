#if AppSource
report 70658579 "Consumption Tax Summary TJP"
#endif
#if OnPremise
report 99004 "Consumption Tax Summary TJP"
#endif
{
    DefaultLayout = RDLC;
    RDLCLayout = 'TecturaJP/JapanLocalization/ConsumptionTaxSummary.rdlc';
    Caption = 'Consumption Tax Summary';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = sorting("No.") where("Account Type" = const(Posting));
            RequestFilterFields = "No.", "Date Filter", "VAT Bus. Posting Group", "VAT Prod. Posting Group", "Global Dimension 1 Filter", "Global Dimension 2 Filter";
            column(RepCaption; RepCaptionLbl) { }
            column(PageCaption; PageCaptionLbl) { }
            column(RateCaption; RateCaptionLbl) { }
            column(NoCaption; NoCaptionLbl) { }
            column(DescriptionCaption; DescriptionCaptionLbl) { }
            column(VATBusPostingGrpCaption; VATBusPostingGrpCaptionLbl) { }
            column(VATProdPostingGrpCaption; VATProdPostingGrpCaptionLbl) { }
            column(NetAmtCaption; NetAmtCaptionLbl) { }
            column(TaxableAmtCaption; TaxableAmtCaptionLbl) { }
            column(NonTaxableAmtCaption; NonTaxableAmtCaptionLbl) { }
            column(SReceivedCTaxCaption; SReceivedCTaxCaptionLbl) { }
            column(SuspensePaidCTaxCaption; SuspensePaidCTaxCaptionLbl) { }
            column(CompanyInfo_Name; CompanyInformation.Name) { }
            column(USERID; UserId) { }
            column(TodayDate; Format(Today, 0, 4)) { }
            column(DontPrint; DontPrint) { }
            column(ReportGLFilters; GLAccCaptionLbl + ': ' + GLFilter) { }
            column(ReportVATPostingFilters; VATPostingSetupCaptionLbl + ': ' + VATFilter) { }
            dataitem("VAT Posting Setup"; "VAT Posting Setup")
            {
                DataItemTableView = sorting("VAT Bus. Posting Group", "VAT Prod. Posting Group");
                RequestFilterFields = "VAT Bus. Posting Group", "VAT Prod. Posting Group";
                column(GLAcc_No; "G/L Account"."No.") { }
                column(GLAcc_Desc; AccDescription) { }
                column(VATPostSetup_VBPG; "VAT Bus. Posting Group") { }
                column(VATPostSetup_VPPG; "VAT Prod. Posting Group") { }
                column(NetAmount; NetAmount)
                {
                    AutoFormatType = 1;
                }
                column(TaxableAmount; TaxableAmount)
                {
                    AutoFormatType = 1;
                }
                column(NonTaxableAmount; NonTaxableAmount)
                {
                    AutoFormatType = 1;
                }
                column(TaxAmountSales; TaxAmountSale)
                {
                    AutoFormatType = 1;
                }
                column(TaxAmountPurch; TaxAmountPurch)
                {
                    AutoFormatType = 1;
                }
                column(TaxPercentage; "VAT Posting Setup"."VAT %")
                {
                    DecimalPlaces = 0 : 2;
                }
                column(PercentageString; PercentageCaptionLbl) { }

                trigger OnAfterGetRecord()
                begin
                    "G/L Account".SETRANGE("Gen. Posting Type Filter TJP");
                    "G/L Account".SETRANGE("VAT BPG Filter TJP", "VAT Posting Setup"."VAT Bus. Posting Group");
                    "G/L Account".SETRANGE("VAT PPG Filter TJP", "VAT Posting Setup"."VAT Prod. Posting Group");

                    Calculate();

                    if (NetAmount = 0) and (TaxableAmount = 0) and (TaxAmountSale = 0) and (TaxAmountPurch = 0) and (NonTaxableAmount = 0) and DontPrint then
                        CurrReport.Skip();
                end;
            }

            trigger OnAfterGetRecord()
            begin
                AccDescription := copystr(Name, 1, MaxStrLen(AccDescription));
                if (CurrReport.Language = 1041) and ("Name (Japanese) TJP" <> '') then
                    AccDescription := copystr("Name (Japanese) TJP", 1, MaxStrLen(AccDescription));
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(RepLangSel; LangSel)
                    {
                        ApplicationArea = All;
                        Caption = 'Language Selection';
                        LookupPageID = Languages;
                        TableRelation = Language;
                        ToolTip = 'Specifies for system which language report labels to display';
                    }
                    field(NoZeroOptions; DontPrint)
                    {
                        ApplicationArea = All;
                        Caption = 'No Zero Lines';
                        ToolTip = 'Specifies for Exclude Zero Lines';
                    }
                }
            }
        }
    }

    trigger OnInitReport()
    var
        CompanyInformationRec: Record "Company Information";
        OnlyAvailableInJapanMsg: Label 'This report is only available for companies in Japan.';
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then begin
            Message(OnlyAvailableInJapanMsg);
            Error('');
        end;
        //
        GeneralLedgerSetup.Get();
        CompanyInformation.Get();
        clear(LangSel);
    end;

    trigger OnPreReport()
    begin
        CurrReport.Language := Language2.GetLanguageID(LangSel);

        GLFilter := copystr("G/L Account".GetFilters(), 1, MaxStrLen(GLFilter));
        VATFilter := copystr("VAT Posting Setup".GetFilters(), 1, MaxStrLen(VATFilter));
    end;

    var
        CompanyInformation: Record "Company Information";
        GeneralLedgerSetup: Record "General Ledger Setup";
        Language2: codeunit Language;
        LangSel: Code[10];
        GLFilter: Text[250];
        AccDescription: Text[80];
        VATFilter: Text[250];
        NetAmount: Decimal;
        TaxableAmount: Decimal;
        NonTaxableAmount: Decimal;
        TaxAmountSale: Decimal;
        TaxAmountPurch: Decimal;
        "Tax%": Decimal;
        DontPrint: Boolean;
        RepCaptionLbl: label 'Consumption Tax Work Sheet';
        PageCaptionLbl: label 'Page';
        RateCaptionLbl: label 'Rate';
        SuspensePaidCTaxCaptionLbl: label 'Suspense Paid CTax';
        TaxableAmtCaptionLbl: label 'Taxable Amount';
        NetAmtCaptionLbl: label 'Net Amount';
        NoCaptionLbl: label 'No.';
        DescriptionCaptionLbl: label 'Description';
        VATBusPostingGrpCaptionLbl: label 'B U S';
        VATProdPostingGrpCaptionLbl: label 'P R O';
        SReceivedCTaxCaptionLbl: label 'SReceived CTax';
        NonTaxableAmtCaptionLbl: label 'Non-Taxable Amount';
        PercentageCaptionLbl: label '%';
        GLAccCaptionLbl: label 'G/L Account';
        VATPostingSetupCaptionLbl: label 'VAT Posting Setup';

    procedure Calculate()
    begin
        NetAmount := 0;
        TaxableAmount := 0;
        NonTaxableAmount := 0;
        TaxAmountSale := 0;
        TaxAmountPurch := 0;

        "G/L Account".SETRANGE("Gen. Posting Type Filter TJP");
        "G/L Account".CALCFIELDS("Amount (for Tax) TJP");
        NetAmount := "G/L Account"."Amount (for Tax) TJP";

        "G/L Account".SETRANGE("Gen. Posting Type Filter TJP", "G/L Account"."Gen. Posting Type Filter TJP"::" ");
        "G/L Account".CALCFIELDS("Non Amount (for Tax) TJP", "VAT Amount (for Tax) TJP");
        NonTaxableAmount += "G/L Account"."Non Amount (for Tax) TJP";

        "G/L Account".SETRANGE("Gen. Posting Type Filter TJP", "G/L Account"."Gen. Posting Type Filter TJP"::Sale);
        "G/L Account".CALCFIELDS("Non Amount (for Tax) TJP", "VAT Amount (for Tax) TJP");
        NonTaxableAmount += "G/L Account"."Non Amount (for Tax) TJP";
        TaxAmountSale := "G/L Account"."VAT Amount (for Tax) TJP";

        "G/L Account".SETRANGE("Gen. Posting Type Filter TJP", "G/L Account"."Gen. Posting Type Filter TJP"::Purchase);
        "G/L Account".CALCFIELDS("Non Amount (for Tax) TJP", "VAT Amount (for Tax) TJP");
        NonTaxableAmount += "G/L Account"."Non Amount (for Tax) TJP";
        TaxAmountPurch := "G/L Account"."VAT Amount (for Tax) TJP";

        TaxAmountPurch := AmountRounding(TaxAmountPurch);
        TaxAmountSale := AmountRounding(TaxAmountSale);
        NetAmount := AmountRounding(NetAmount);
        NonTaxableAmount := AmountRounding(NonTaxableAmount);

        TaxableAmount := NetAmount - NonTaxableAmount;
        if TaxableAmount <> 0 then
            "Tax%" := Round((TaxAmountSale + TaxAmountPurch) / TaxableAmount * 100, 0.01, '=')
        else
            "Tax%" := 0;

    end;

    procedure AmountRounding(Amount: Decimal): Decimal
    var
        Direction: Text[2];
    begin
        case GeneralLedgerSetup."Inv. Rounding Type (LCY)" of
            GeneralLedgerSetup."Inv. Rounding Type (LCY)"::Up:
                Direction := '>';
            GeneralLedgerSetup."Inv. Rounding Type (LCY)"::Down:
                Direction := '<';
            else
                Direction := '=';
        end;
        exit(Round(Amount, GeneralLedgerSetup."Amount Rounding Precision", Direction));
    end;
}

