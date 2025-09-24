#if AppSource
report 70658586 "Balance Sheet TJP"
#endif
#if OnPremise
report 99011 "Balance Sheet TJP"
#endif
{
    DefaultLayout = RDLC;
    RDLCLayout = 'TecturaJP/JapanLocalization/BalanceSheetJP.rdlc';
    Caption = 'Balance Sheet';
    PreviewMode = PrintLayout;
    UsageCategory = None;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Account Type", "Date Filter", "Budget Filter", "Global Dimension 1 Filter", "Global Dimension 2 Filter";
            column(AccNo; "No.")
            {
            }
            column(TableFilters; "G/L Account".TableName + ': ' + GLFilter)
            {
            }
            column(ColumnHeader1; ColumnHeader[1])
            {
            }
            column(ColumnHeader2; ColumnHeader[2])
            {
            }
            column(ColumnSubHeader1; ColumnSubHeader[1])
            {
            }
            column(ColumnSubHeader2; ColumnSubHeader[2])
            {
            }
            column(ColumnSubHeader3; ColumnSubHeader[3])
            {
            }
            column(ColumnSubHeader4; ColumnSubHeader[4])
            {
            }
            column(ColumnSubHeader5; ColumnSubHeader[5])
            {
            }
            column(ColumnSubHeader6; ColumnSubHeader[6])
            {
            }
            column(LongText; LongText)
            {
            }
            column(COMPANYNAME; CompanyInformation.Name)
            {
            }
            column(ReportName; ReportName)
            {
            }
            column(RoundFactorText; RoundFactorText)
            {
            }
            column(EmptyString; '')
            {
            }
            column(NextPageGroupNo; NextPageGroupNo)
            {
            }
            column(PageGroupNo; PageGroupNo)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(NoCaption; NoCaptionLbl)
            {
            }
            column(AccNameCaption; AccNameCaptionLbl)
            {
            }
            dataitem(BlankLineCounter; "Integer")
            {
                DataItemTableView = sorting(Number);
                MaxIteration = 1;
                column(ShowAccType; ShowAccType)
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
                MaxIteration = 1;
                column(GLAcc_No2; "G/L Account"."No.")
                {
                }
                column(GLAcc_AccType; "G/L Account"."Account Type")
                {
                }
                column(GLAcc_BlankLines; "G/L Account"."No. of Blank Lines")
                {
                }
                column(GLAcc_AccDesc; PadStr('', "G/L Account".Indentation * 2) + AccDescription)
                {
                }
                column(ColumnAmountText1; ColumnAmountText[1])
                {
                }
                column(ColumnAmountText2; ColumnAmountText[2])
                {
                }
                column(ColumnAmountText3; ColumnAmountText[3])
                {
                }
                column(ColumnAmountText4; ColumnAmountText[4])
                {
                }
                column(ColumnAmountText5; ColumnAmountText[5])
                {
                }
                column(ColumnAmountText6; ColumnAmountText[6])
                {
                }
                column(Integer_Number; Number)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                CalculateAmount("G/L Account");

                RoundAmount();
                if (ColumnAmount[1] = 0) and (ColumnAmount[2] = 0) and (ColumnAmount[3] = 0) and
                   (ColumnAmount[4] = 0) and (ColumnAmount[5] = 0) and (ColumnAmount[6] = 0) and
                   ("G/L Account"."Account Type" = "G/L Account"."Account Type"::Posting)
                then
                    CurrReport.Skip();

                AccDescription := "G/L Account".Name;
                if (GlobalLanguage = 1041) and ("G/L Account"."Name (Japanese) TJP" <> '') then
                    AccDescription := "G/L Account"."Name (Japanese) TJP";

                ConvertAmountToText();
                PageGroupNo := NextPageGroupNo;
                //ShowAccType := "G/L Account"."Account Type";   // 2021-11-27 by Anada
                //Evaluate(ShowAccType, Format("G/L Account"."Account Type"));    // 2022-10-04
                ShowAccType := "G/L Account"."Account Type".AsInteger();    // 2022-10-04
                if "G/L Account"."New Page" then
                    NextPageGroupNo := PageGroupNo + 1;
                if PageGroupNo = NextPageGroupNo then
                    PageGroupNo := NextPageGroupNo - 1;
            end;

            trigger OnPreDataItem()
            begin
                PopulateFormatString();
                PopulateColumnHeader();
                FilterGLAccount("G/L Account");
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
    end;

    trigger OnPreReport()
    begin
        CurrReport.Language := Language2.GetLanguageID(LangSel);

        GLFilter := copystr("G/L Account".GetFilters(), 1, MaxStrLen(GLFilter));
        RoundFactorText := GeneralFunctionsTJP.RoundDescription(RepRoundingFactor.AsInteger());
        CurrentPeriodEnd := "G/L Account".GetRangeMax("Date Filter");

        LastYearCurrentPeriodEnd := CalcDate('<-1Y>', NormalDate(CurrentPeriodEnd) + 1) - 1;
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
        CompanyInformation: Record "Company Information";
        Language2: Codeunit Language;
        GeneralFunctionsTJP: Codeunit "General Functions TJP";
        RepRoundingFactor: Enum "Report Rounding Factor TJP";
        LangSel: Code[10];
        AccDescription: Text[250];
        GLFilter: Text[250];
        LongText: Text[250];
        RoundFactorText: Text[50];
        FormatString: array[6] of Text[50];
        ColumnHeader: array[2] of Text[30];
        ColumnSubHeader: array[6] of Text[30];
        ColumnAmountText: array[6] of Text[30];
        ReportName: Text[250];
        PageGroupNo: Integer;
        ShowAccType: Integer;
        NextPageGroupNo: Integer;
        ColumnAmount: array[6] of Decimal;
        CurrentPeriodEnd: Date;
        LastYearCurrentPeriodEnd: Date;
        CurrentYearStart: Date;
        LastYearStart: Date;
        DoNotRoundAmount: array[6] of Boolean;
        Text1450000Txt: Label 'Current Year';
        Text1450001Txt: Label 'Last Year';
        Text1450002Txt: Label 'Balance';
        Text1450003Txt: Label 'Budget';
        Text1450004Txt: Label 'Variance %';
        Text1450005Txt: Label 'Balance Sheet';
        Text1450006Txt: Label 'Period: %1..%2 versus %3..%4', Comment = 'Period Start=%1..PeriodEnd=%2 LastYearCurrentPeriodStart=%3..LastYearCurrentPeriodEnd=%4';
        PageCaptionLbl: Label 'Page';
        NoCaptionLbl: Label 'No.';
        AccNameCaptionLbl: Label 'Name';


    local procedure PopulateColumnHeader()
    begin
        ReportName := Text1450005Txt;
        ColumnHeader[1] := Text1450000Txt;
        ColumnHeader[2] := Text1450001Txt;
        ColumnSubHeader[1] := Text1450002Txt;
        ColumnSubHeader[2] := Text1450003Txt;
        ColumnSubHeader[3] := Text1450004Txt;
        ColumnSubHeader[4] := Text1450002Txt;
        ColumnSubHeader[5] := Text1450003Txt;
        ColumnSubHeader[6] := Text1450004Txt;
        LongText :=
          StrSubstNo(
            Text1450006Txt,
            CurrentYearStart, CurrentPeriodEnd, LastYearStart, LastYearCurrentPeriodEnd);
    end;

    local procedure ConvertAmountToText()
    var
        i: Integer;
    begin
        for i := 1 to 6 do
            if FormatString[i] <> '' then
                ColumnAmountText[i] := Format(ColumnAmount[i], 0, FormatString[i])
            else
                ColumnAmountText[i] := Format(ColumnAmount[i]);
    end;

    local procedure PopulateFormatString()
    var
        i: Integer;
    begin
        for i := 1 to 6 do
            if RepRoundingFactor = RepRoundingFactor::" " then
                FormatString[i] := '<Precision,2:><Standard Format,0>'
            else
                FormatString[i] := '<Precision,1:><Standard Format,0>';

        FormatString[3] := '';
        FormatString[6] := '';
        DoNotRoundAmount[3] := true;
        DoNotRoundAmount[6] := true;
    end;

    local procedure RoundAmount()
    var
        i: Integer;
    begin
        for i := 1 to 6 do
            if not DoNotRoundAmount[i] then
                ColumnAmount[i] := GeneralFunctionsTJP.RoundAmount(ColumnAmount[i], RepRoundingFactor.AsInteger());
    end;

    local procedure FilterGLAccount(var GLAccount: Record "G/L Account")
    begin
        GLAccount.SetRange("Income/Balance", GLAccount."Income/Balance"::"Balance Sheet");
    end;

    local procedure CalculateAmount(var GLAccount: Record "G/L Account")
    begin
        GLAccount.SetRange("Date Filter", CurrentYearStart, CurrentPeriodEnd);
        GLAccount.CalcFields("Balance at Date", "Budget at Date");
        ColumnAmount[1] := GLAccount."Balance at Date";
        ColumnAmount[2] := GLAccount."Budget at Date";
        ColumnAmount[3] := 0;
        if ColumnAmount[2] <> 0 then
            ColumnAmount[3] := Round((ColumnAmount[2] - ColumnAmount[1]) / ColumnAmount[2] * 100, 1);

        GLAccount.SetRange("Date Filter", LastYearStart, LastYearCurrentPeriodEnd);
        GLAccount.CalcFields("Balance at Date", "Budget at Date");
        ColumnAmount[4] := GLAccount."Balance at Date";
        ColumnAmount[5] := GLAccount."Budget at Date";
        ColumnAmount[6] := 0;
        if ColumnAmount[5] <> 0 then
            ColumnAmount[6] := Round((ColumnAmount[5] - ColumnAmount[4]) / ColumnAmount[5] * 100, 1);
    end;
}

