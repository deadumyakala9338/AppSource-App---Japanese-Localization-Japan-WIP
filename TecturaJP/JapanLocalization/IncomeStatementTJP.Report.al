#if AppSource
report 70658585 "Income Statement TJP"
#endif
#if OnPremise
report 99010 "Income Statement TJP"
#endif
{
    DefaultLayout = RDLC;
    RDLCLayout = 'TecturaJP/JapanLocalization/IncomeStatementJP.rdlc';
    Caption = 'Income Statement';
    PreviewMode = PrintLayout;
    UsageCategory = None;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = sorting("No.") where("Income/Balance" = const("Income Statement"));
            RequestFilterFields = "No.", "Account Type", "Date Filter", "Global Dimension 1 Filter", "Global Dimension 2 Filter";
            column(AccNo; "No.")
            {
            }
            column(GLFilters; "G/L Account".TableName + ': ' + GLFilter)
            {
            }
            column(COMPANYNAME; CompanyInformation.Name)
            {
            }
            column(TotalLongText; TotalLongText)
            {
            }
            column(TotalHeaderText; TotalHeaderText)
            {
            }
            column(RoundFactorText; RoundFactorText)
            {
            }
            column(PageGroupNo; PageGroupNo)
            {
            }
            column(NextPageGroupNo; NextPageGroupNo)
            {
            }
            column(EmptyString; '')
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(NoCaption; NoCaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(CurrentPeriodCaption; CurrentPeriodCaptionLbl)
            {
            }
            column(IncomeStatementCaption; IncomeStatementCaptionLbl)
            {
            }
            column(CurrentPeriodNetChangeDrCaption; CurrentPeriodNetChangeDrCaptionLbl)
            {
            }
            column(CurrentPeriodNetChangeCrCaption; CurrentPeriodNetChangeCrCaptionLbl)
            {
            }
            column(CurrentPeriodLastYearCaption; CurrentPeriodLastYearCaptionLbl)
            {
            }
            column(CurrentYTDCaption; CurrentYTDCaptionLbl)
            {
            }
            column(LastYTDCaption; LastYTDCaptionLbl)
            {
            }
            dataitem(BlankLineCounter; "Integer")
            {
                DataItemTableView = sorting(Number);
                column(GLAccBlankLines; "G/L Account"."No. of Blank Lines")
                {
                }
                column(BlankLineCounter_Number; Number)
                {
                }

                trigger OnPreDataItem()
                begin
                    SetRange(Number, 1, "G/L Account"."No. of Blank Lines");
                end;
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                column(AccNo2; "G/L Account"."No.")
                {
                }
                column(AccType; "G/L Account"."Account Type")
                {
                }
                column(AccName; PadStr('', "G/L Account".Indentation * 2) + AccDescription)
                {
                }
                column(ShowAccType; ShowAccType)
                {
                }
                column(CurrentPeriodNetChangeDr; CurrentPeriodNetChange)
                {
                    DecimalPlaces = 2 : 2;
                }
                column(CurrentPeriodNetChangeCr; -CurrentPeriodNetChange)
                {
                    DecimalPlaces = 2 : 2;
                }
                column(LastYrCurrPeriodNetChange; LastYrCurrPeriodNetChange)
                {
                    DecimalPlaces = 2 : 2;
                }
                column(CurrentYTDNetChange; CurrentYTDNetChange)
                {
                    DecimalPlaces = 2 : 2;
                }
                column(LastYTDNetChange; LastYTDNetChange)
                {
                    DecimalPlaces = 2 : 2;
                }
                column(Integer_Number; Number)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                if not AddCurr then begin
                    SetRange("Date Filter", CurrentPeriodStart, CurrentPeriodEnd);
                    CalcFields("Net Change");
                    CurrentPeriodNetChange := GeneralFunctionsTJP.RoundAmount("Net Change", RepRoundingFactor.AsInteger());

                    SetRange("Date Filter", CurrentYearStart, CurrentPeriodEnd);
                    CalcFields("Net Change");
                    CurrentYTDNetChange := GeneralFunctionsTJP.RoundAmount("Net Change", RepRoundingFactor.AsInteger());

                    SetRange("Date Filter", LastYearCurrentPeriodStart, LastYearCurrentPeriodEnd);
                    CalcFields("Net Change");
                    LastYrCurrPeriodNetChange := GeneralFunctionsTJP.RoundAmount("Net Change", RepRoundingFactor.AsInteger());

                    SetRange("Date Filter", LastYearStart, LastYearCurrentPeriodEnd);
                    CalcFields("Net Change");
                    LastYTDNetChange := GeneralFunctionsTJP.RoundAmount("Net Change", RepRoundingFactor.AsInteger());

                    if (CurrentPeriodNetChange = 0) and (CurrentYTDNetChange = 0) and
                       (LastYrCurrPeriodNetChange = 0) and (LastYTDNetChange = 0) and
                       ("Account Type" = "Account Type"::Posting)
                    then
                        CurrReport.Skip();
                end else begin
                    SetRange("Date Filter", CurrentPeriodStart, CurrentPeriodEnd);
                    CalcFields("Additional-Currency Net Change");
                    CurrentPeriodNetChange :=
                      GeneralFunctionsTJP.RoundAmount("Additional-Currency Net Change", RepRoundingFactor.AsInteger());

                    SetRange("Date Filter", CurrentYearStart, CurrentPeriodEnd);
                    CalcFields("Additional-Currency Net Change");
                    CurrentYTDNetChange :=
                      GeneralFunctionsTJP.RoundAmount("Additional-Currency Net Change", RepRoundingFactor.AsInteger());

                    SetRange("Date Filter", LastYearCurrentPeriodStart, LastYearCurrentPeriodEnd);
                    CalcFields("Additional-Currency Net Change");
                    LastYrCurrPeriodNetChange :=
                      GeneralFunctionsTJP.RoundAmount("Additional-Currency Net Change", RepRoundingFactor.AsInteger());

                    SetRange("Date Filter", LastYearStart, LastYearCurrentPeriodEnd);
                    CalcFields("Net Change");
                    LastYTDNetChange :=
                      GeneralFunctionsTJP.RoundAmount("Additional-Currency Net Change", RepRoundingFactor.AsInteger());

                    if (CurrentPeriodNetChange = 0) and (CurrentYTDNetChange = 0) and
                       (LastYrCurrPeriodNetChange = 0) and (LastYTDNetChange = 0) and
                       ("Account Type" = "Account Type"::Posting)
                    then
                        CurrReport.Skip();
                end;

                AccDescription := "G/L Account".Name;
                if (GlobalLanguage = 1041) and ("G/L Account"."Name (Japanese) TJP" <> '') then
                    AccDescription := "G/L Account"."Name (Japanese) TJP";

                PageGroupNo := NextPageGroupNo;
                //ShowAccType := "G/L Account"."Account Type";   // 2021-11-27 by Anada
                //Evaluate(ShowAccType, Format("G/L Account"."Account Type"));    // 2022-10-04 by Anada
                ShowAccType := "G/L Account"."Account Type".AsInteger();    // 2022-10-04 by Anada
                if "G/L Account"."New Page" then
                    NextPageGroupNo := PageGroupNo + 1;
                if PageGroupNo = NextPageGroupNo then
                    PageGroupNo := NextPageGroupNo - 1;
            end;

            trigger OnPreDataItem()
            begin
                //Add TotalLongText,TotalHeaderText.Begin,COMMENTS
                TotalLongText :=
                  StrSubstNo(
                    TextPeriodVersusTxt,
                    CurrentPeriodStart, CurrentPeriodEnd, LastYearCurrentPeriodStart, LastYearCurrentPeriodEnd) + '' + '' + '';

                GeneralLedgerSetup.Get();
                if AddCurr then
                    TotalHeaderText := StrSubstNo(Text1450000Txt, GeneralLedgerSetup."Additional Reporting Currency")
                else begin
                    GeneralLedgerSetup.TestField("LCY Code");
                    TotalHeaderText := StrSubstNo(Text1450000Txt, GeneralLedgerSetup."LCY Code");
                end;
                //Add TotalLongText,TotalHeaderText.End

                PageGroupNo := 1;
                NextPageGroupNo := 1;
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
                    field(AmountsInWhole; RepRoundingFactor)
                    {
                        ApplicationArea = All;
                        Caption = 'Amount in whole';
                        ToolTip = 'Specifies amount rounding factor';
                    }
                    field(ShowAmountsInAddReportingCurrency; AddCurr)
                    {
                        ApplicationArea = All;
                        Caption = 'Show Amounts in Add. Reporting Currency';
                        MultiLine = true;
                        ToolTip = 'Specifies Additional reporting currency amount';
                    }
                    field(LangSelect; LangSel)
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
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInformation.Get();
    end;

    trigger OnPreReport()
    begin
        CurrReport.Language := Language2.GetLanguageID(LangSel);

        GLFilter := copystr("G/L Account".GetFilters(), 1, MaxStrLen(GLFilter));
        RoundFactorText := GeneralFunctionsTJP.RoundDescription(RepRoundingFactor.AsInteger());
        CurrentPeriodStart := "G/L Account".GetRangeMin("Date Filter");
        CurrentPeriodEnd := "G/L Account".GetRangeMax("Date Filter");

        LastYearCurrentPeriodStart := CalcDate('<-1Y>', NormalDate(CurrentPeriodStart) + 1) - 1;
        LastYearCurrentPeriodEnd := CalcDate('<-1Y>', NormalDate(CurrentPeriodEnd) + 1) - 1;
        if CurrentPeriodStart <> NormalDate(CurrentPeriodStart) then
            LastYearCurrentPeriodStart := ClosingDate(LastYearCurrentPeriodStart);
        if CurrentPeriodEnd <> NormalDate(CurrentPeriodEnd) then
            LastYearCurrentPeriodEnd := ClosingDate(LastYearCurrentPeriodEnd);

        AccountingPeriod.Reset();
        AccountingPeriod.SetRange("New Fiscal Year", true, true);
        AccountingPeriod.SetFilter("Starting Date", '..%1', CurrentPeriodEnd);
        AccountingPeriod.FindLast();
        CurrentYearStart := AccountingPeriod."Starting Date";

        AccountingPeriod.SetFilter("Starting Date", '..%1', LastYearCurrentPeriodEnd);
        if AccountingPeriod.FindLast() then
            LastYearStart := AccountingPeriod."Starting Date";
    end;

    var
        AccountingPeriod: Record "Accounting Period";
        GeneralLedgerSetup: Record "General Ledger Setup";
        CompanyInformation: Record "Company Information";
        Language2: Codeunit Language;
        GeneralFunctionsTJP: Codeunit "General Functions TJP";
        RepRoundingFactor: Enum "Report Rounding Factor TJP";
        LangSel: Code[10];
        AccDescription: Text[250];
        GLFilter: Text[250];
        CurrentPeriodStart: Date;
        CurrentPeriodEnd: Date;
        LastYearCurrentPeriodStart: Date;
        LastYearCurrentPeriodEnd: Date;
        CurrentYearStart: Date;
        LastYearStart: Date;
        CurrentPeriodNetChange: Decimal;
        CurrentYTDNetChange: Decimal;
        LastYrCurrPeriodNetChange: Decimal;
        LastYTDNetChange: Decimal;
        AddCurr: Boolean;
        RoundFactorText: Text[50];
        Text1450000Txt: Label 'All amounts are in %1.', Comment = 'Currency Code=%1';
        PageGroupNo: Integer;
        TotalLongText: Text[250];
        TotalHeaderText: Text[250];
        ShowAccType: Integer;
        NextPageGroupNo: Integer;
        TextPeriodVersusTxt: Label 'Period: %1..%2 versus %3..%4', Comment = 'Period Start=%1..PeriodEnd=%2 LastYearCurrentPeriodStart=%3..LastYearCurrentPeriodEnd=%4';
        IncomeStatementCaptionLbl: Label 'Income Statement';
        PageCaptionLbl: Label 'Page';
        CurrentPeriodCaptionLbl: Label 'Current Period';
        NoCaptionLbl: Label 'No.';
        NameCaptionLbl: Label 'Name';
        CurrentPeriodNetChangeDrCaptionLbl: Label 'Debit';
        CurrentPeriodNetChangeCrCaptionLbl: Label 'Credit';
        CurrentPeriodLastYearCaptionLbl: Label 'Current Period Last Year';
        CurrentYTDCaptionLbl: Label 'Current YTD';
        LastYTDCaptionLbl: Label 'Last YTD';
}

