#if AppSource
report 70658583 "Receivables-Payables TJP"
#endif
#if OnPremise
report 99008 "Receivables-Payables TJP"
#endif
{
    DefaultLayout = RDLC;
    RDLCLayout = 'TecturaJP/JapanLocalization/ReceivablesPayablesJP.rdlc';
    ApplicationArea = Basic, Suite;
    Caption = 'Receivables-Payables';
    PreviewMode = PrintLayout;
    UsageCategory = None;

    dataset
    {
        dataitem("General Ledger Setup"; "General Ledger Setup")
        {
            DataItemTableView = sorting("Primary Key") where("Primary Key" = const(''));
            column(CompanyName; CompanyInformation.Name) //#01 Replaced with CompanyProperty.Dispalyname
            {
            }
            column(GLSetupCustBalancesDue; GeneralLedgerSetup."Cust. Balances Due")
            {
                AutoFormatType = 1;
            }
            column(GLSetupVenBalancesDue; GeneralLedgerSetup."Vendor Balances Due")
            {
                AutoFormatType = 1;
            }
            column(NetBalancesDueLCY; NetBalancesDueLCY)
            {
                AutoFormatType = 1;
            }
            column(GLSetupCustVenBalancesDue; GeneralLedgerSetup."Cust. Balances Due" - GeneralLedgerSetup."Vendor Balances Due")
            {
                AutoFormatType = 1;
            }
            column(BeforeCustBalanceLCY; beforeCustBalanceLCY)
            {
            }
            column(BeforeVendorBalanceLCY; beforeVendorBalanceLCY)
            {
            }
            column(VenBalancesDue_GLSetup; "Vendor Balances Due")
            {
            }
            column(CustBalancesDue_GLSetup; "Cust. Balances Due")
            {
            }
            column(CustVenBalancesDue_GLSetup; "Cust. Balances Due" - "Vendor Balances Due")
            {
                AutoFormatType = 1;
            }
            column(PrimaryKey_GLSetup; "Primary Key")
            {
            }
            column(ReceivablesPayablesCaption; ReceivablesPayablesCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(DueDateCaption; DueDateCaptionLbl)
            {
            }
            column(CustBalDueCaption; CustBalDueCaptionLbl)
            {
            }
            column(VendBalDueCaption; VendBalDueCaptionLbl)
            {
            }
            column(BalDateLCYCaption; BalDateLCYCaptionLbl)
            {
            }
            column(NetChangeLCYCaption; NetChangeLCYCaptionLbl)
            {
            }
            column(BeforeCaption; BeforeCaptionLbl)
            {
            }
            column(AfterCaption; AfterCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            dataitem(PeriodLoop; "Integer")
            {
                DataItemTableView = sorting(Number);
                column(GLSetupDateFilter; GeneralLedgerSetup.GetFilter("Date Filter"))
                {
                }

                trigger OnAfterGetRecord()
                begin
                    StartDate := EndDate + 1;
                    EndDate := CalcDate(PeriodLength, StartDate) - 1;
                    MultiplyAmounts();
                end;

                trigger OnPreDataItem()
                begin
                    if StartDate <> 0D then begin
                        EndDate := StartDate - 1;
                        StartDate := 0D;
                        MultiplyAmounts();
                        beforeCustBalanceLCY := GeneralLedgerSetup."Cust. Balances Due";
                        beforeVendorBalanceLCY := GeneralLedgerSetup."Vendor Balances Due";
                    end;
                    SetRange(Number, 1, NoOfPeriods);
                end;
            }
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(RepStartDate; StartDate)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Starting Date';
                        NotBlank = true;
                        ToolTip = 'Specifies the date from which the report or batch job processes information.';
                    }
                    field(RepNoOfPeriods; NoOfPeriods)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'No. of Periods';
                        ToolTip = 'Specifies how many accounting periods to include in the report.';
                    }
                    field(RepPeriodLength; PeriodLength)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Period Length';
                        ToolTip = 'Specifies the period for which data is shown in the report. For example, enter "1M" for one month, "30D" for thirty days, "3Q" for three quarters, or "5Y" for five years.';
                    }
                    field(RepLangSel; LangSel)
                    {
                        ApplicationArea = All;
                        Caption = 'Language Selection';
                        TableRelation = Language;
                        ToolTip = 'Specifies for system which language report labels to display';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            if StartDate = 0D then
                StartDate := WorkDate();
            if NoOfPeriods = 0 then
                NoOfPeriods := 1;
            if Format(PeriodLength) = '' then
                Evaluate(PeriodLength, '<1M>');
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        StartDate := WorkDate();
        NoOfPeriods := 1;
        Evaluate(PeriodLength, '<1M>');

        CompanyInformation.Get();
    end;

    trigger OnPreReport()
    begin
        CompanyInformation.Get();
        CurrReport.Language := Language2.GetLanguageID(LangSel);
    end;

    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        CompanyInformation: Record "Company Information";
        Language2: Codeunit Language;
        PeriodLength: DateFormula;
        LangSel: Code[10];
        StartDate: Date;
        EndDate: Date;
        NoOfPeriods: Integer;
        NetBalancesDueLCY: Decimal;
        beforeCustBalanceLCY: Decimal;
        beforeVendorBalanceLCY: Decimal;
        ReceivablesPayablesCaptionLbl: Label 'Receivables-Payables';
        PageCaptionLbl: Label 'Page';
        DueDateCaptionLbl: Label 'Due Date';
        CustBalDueCaptionLbl: Label 'Cust. Balances Due (LCY)';
        VendBalDueCaptionLbl: Label 'Vendor Balances Due (LCY)';
        BalDateLCYCaptionLbl: Label 'Balance at Date (LCY)';
        NetChangeLCYCaptionLbl: Label 'Net Change (LCY)';
        BeforeCaptionLbl: Label '...Before';
        AfterCaptionLbl: Label 'After...';
        TotalCaptionLbl: Label 'Total';

    local procedure MultiplyAmounts()
    begin
        GeneralLedgerSetup.SetRange("Date Filter", StartDate, EndDate);
        GeneralLedgerSetup.CalcFields("Cust. Balances Due", "Vendor Balances Due");
        NetBalancesDueLCY := NetBalancesDueLCY + GeneralLedgerSetup."Cust. Balances Due" - GeneralLedgerSetup."Vendor Balances Due";
    end;

    procedure InitializeRequest(NewStartDate: Date; NewNoOfPeriods: Integer; NewPeriodLength: DateFormula)
    begin
        StartDate := NewStartDate;
        NoOfPeriods := NewNoOfPeriods;
        PeriodLength := NewPeriodLength;
    end;
}

