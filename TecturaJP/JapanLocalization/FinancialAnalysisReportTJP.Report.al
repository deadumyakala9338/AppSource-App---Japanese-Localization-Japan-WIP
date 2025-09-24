#if AppSource
report 70658587 "Financial Analysis Report TJP"
#endif
#if OnPremise
report 99012 "Financial Analysis Report TJP"
#endif
{
    DefaultLayout = RDLC;
    RDLCLayout = 'TecturaJP/JapanLocalization/FinancialAnalysisReportJP.rdlc';
    Caption = 'Financial Analysis Report';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;
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
            column(COMPANYNAME; CompanyInformation.Name)
            {
            }
            column(LongText; LongText)
            {
            }
            column(ReportName; ReportName)
            {
            }
            column(HeaderText; HeaderText)
            {
            }
            column(TableFilters; "G/L Account".TableName + ': ' + GLFilter)
            {
            }
            column(GLFilter; GLFilter)
            {
            }
            column(RoundFactorText; RoundFactorText)
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
            column(NoOfColumns; NoOfColumns)
            {
            }
            column(GroupNo; GroupNo)
            {
            }
            column(NoCaption; NoCaptionLbl)
            {
            }
            column(AccNameCaption; AccNameCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            dataitem(BlankLineCounter; "Integer")
            {
                DataItemTableView = sorting(Number);
                MaxIteration = 1;
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
                column(AccNo2; "G/L Account"."No.")
                {
                }
                column(AccType; "G/L Account"."Account Type")
                {
                }
                column(AccountName; AccountName)
                {
                }
                column(bShowTLine; bShowTLine)
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

                trigger OnAfterGetRecord()
                begin
                    bShowTLine := ShowTotalLine("G/L Account");
                    if (("G/L Account"."Account Type" = "G/L Account"."Account Type"::Heading) or
                        ("G/L Account"."Account Type" = "G/L Account"."Account Type"::"Begin-Total") or
                        ("G/L Account"."Account Type" = "G/L Account"."Account Type"::Posting) or
                        bShowTLine) and "G/L Account"."New Page"
                    then
                        GroupNo := GroupNo + 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                AccDescription := "G/L Account".Name;
                if (GlobalLanguage = 1041) and ("G/L Account"."Name (Japanese) TJP" <> '') then
                    AccDescription := "G/L Account"."Name (Japanese) TJP";

                if IndentAccountName then
                    AccountName := PadStr('', "G/L Account".Indentation * 2) + AccDescription
                else
                    AccountName := AccDescription;

                CalculateAmount("G/L Account");

                RoundAmount();
                if (ColumnAmount[1] = 0) and (ColumnAmount[2] = 0) and (ColumnAmount[3] = 0) and
                   (ColumnAmount[4] = 0) and (ColumnAmount[5] = 0) and (ColumnAmount[6] = 0) and
                   ("G/L Account"."Account Type" = "G/L Account"."Account Type"::Posting)
                then
                    CurrReport.Skip();

                ConvertAmountToText();
            end;

            trigger OnPreDataItem()
            begin
                if SelReportType = SelReportType::" " then
                    Error(Text1450007Err);
                PopulateFormatString();
                PopulateColumnHeader();
                FilterGLAccount("G/L Account");

                GroupNo := 1;
                GeneralLedgerSetup.Get();
                if AddCurr then
                    HeaderText := StrSubstNo(Text1450013Txt, GeneralLedgerSetup."Additional Reporting Currency")
                else begin
                    GeneralLedgerSetup.TestField("LCY Code");
                    HeaderText := StrSubstNo(Text1450013Txt, GeneralLedgerSetup."LCY Code");
                end;
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
                    field(RepReportType; SelReportType)
                    {
                        ApplicationArea = All;
                        Caption = 'Report Type';
                        OptionCaption = '" ",,"Net Change/Budget","Net Change (This Year/Last Year)","Balance (This Year/Last Year)"';
                        ToolTip = 'Specifies type of report should be export';
                    }
                    field(RepIndentAccountName; IndentAccountName)
                    {
                        ApplicationArea = All;
                        Caption = 'Indent Account Name';
                        ToolTip = 'Specifies general ledger account name';
                    }
                    field(AmountsInWhole; RepRoundingFactor)
                    {
                        ApplicationArea = All;
                        Caption = 'Amount in whole';
                        ToolTip = 'Specifies amount rounding factor';
                    }
                    field(RepAddCurr; AddCurr)
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
        if CurrentPeriodStart <> NormalDate(CurrentPeriodStart) then
            LastYearCurrentPeriodStart := ClosingDate(LastYearCurrentPeriodStart);

        LastYearCurrentPeriodEnd := CalcDate('<-1Y>', NormalDate(CurrentPeriodEnd) + 1) - 1;
        if CurrentPeriodEnd <> NormalDate(CurrentPeriodEnd) then
            LastYearCurrentPeriodEnd := ClosingDate(LastYearCurrentPeriodEnd);

        AccountingPeriod.Reset();
        AccountingPeriod.SetRange("New Fiscal Year", true, true);
        AccountingPeriod.SetFilter("Starting Date", '..%1', CurrentPeriodEnd);
        AccountingPeriod.FindLast();
        CurrentYearStart := AccountingPeriod."Starting Date";

        AccountingPeriod.SetFilter("Starting Date", '..%1', LastYearCurrentPeriodEnd);
        AccountingPeriod.FindLast();
        LastYearStart := AccountingPeriod."Starting Date";
    end;

    var
        AccountingPeriod: Record "Accounting Period";
        GeneralLedgerSetup: Record "General Ledger Setup";
        CompanyInformation: Record "Company Information";
        Language2: Codeunit Language;
        GeneralFunctionsTJP: Codeunit "General Functions TJP";
        RepRoundingFactor: Enum "Report Rounding Factor TJP";
        SelReportType: Option " ",,"Net Change/Budget","Net Change (This Year/Last Year)","Balance (This Year/Last Year)";
        GLFilter: Text[250];
        LongText: Text[250];
        RoundFactorText: Text[50];
        FormatString: array[6] of Text[50];
        CurrentPeriodEnd: Date;
        CurrentYearStart: Date;
        LastYearStart: Date;
        ColumnHeader: array[2] of Text[30];
        ColumnSubHeader: array[6] of Text[30];
        ColumnAmount: array[6] of Decimal;
        ColumnAmountText: array[6] of Text[30];
        DoNotRoundAmount: array[6] of Boolean;
        ReportName: Text[250];
        LangSel: Code[10];
        AccDescription: Text[250];
        AccountName: Text[250];
        HeaderText: Text[250];
        GroupNo: Integer;
        bShowTLine: Boolean;
        CurrentPeriodStart: Date;
        LastYearCurrentPeriodStart: Date;
        LastYearCurrentPeriodEnd: Date;
        NoOfColumns: Integer;
        IndentAccountName: Boolean;
        AddCurr: Boolean;
        Text1450000Txt: Label 'Current Year';
        Text1450001Txt: Label 'Last Year';
        Text1450002Txt: Label 'Balance';
        Text1450003Txt: Label 'Budget';
        Text1450004Txt: Label 'Variance %';
        Text1450005Txt: Label 'Statement of Financial Position';
        Text1450006Txt: Label 'Period: %1..%2 versus %3..%4', Comment = 'Period Start=%1..PeriodEnd=%2 LastYearCurrentPeriodStart=%3..LastYearCurrentPeriodEnd=%4';
        Text1450007Err: Label 'You must choose a Report Type.';
        Text1450008Txt: Label 'Statement of Financial Performance (Profit and Loss)';
        Text1450009Txt: Label 'Current Period';
        Text1450010Txt: Label 'Year To Date';
        Text1450011Txt: Label 'Net Change';
        Text1450012Txt: Label 'Net Change - Period';
        Text1450013Txt: Label 'All amounts are in %1.', Comment = 'Currency=%1';
        Text1450015Txt: Label '$ Difference';
        Text1450016Txt: Label '% Difference';
        Text1450017Txt: Label 'Period: %1..%2 versus %3..%4 and %5..%6 versus %7..%8',
                               Comment = 'Period Start=%1..PeriodEnd=%2 LastYearCurrentPeriodStart=%3..LastYearCurrentPeriodEnd=%4 CurrentYearStart=%5..CurrentPeriodEnd=%6 LastYearStart=%7..LastYearCurrentPeriodEnd=%8';
        PageCaptionLbl: Label 'Page';
        NoCaptionLbl: Label 'No.';
        AccNameCaptionLbl: Label 'Name';

    local procedure PopulateColumnHeader()
    var
        i: Integer;
    begin
        for i := 1 to 6 do
            ColumnSubHeader[i] := '';
        for i := 1 to 2 do
            ColumnHeader[i] := '';
        LongText := '';

        case SelReportType of
            1:
                begin
                    NoOfColumns := 6;
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
            SelReportType::"Net Change/Budget":
                begin
                    NoOfColumns := 6;
                    ReportName := Text1450008Txt;
                    ColumnHeader[1] := Text1450009Txt;
                    ColumnHeader[2] := Text1450010Txt;
                    ColumnSubHeader[1] := Text1450011Txt;
                    ColumnSubHeader[2] := Text1450003Txt;
                    ColumnSubHeader[3] := Text1450004Txt;
                    ColumnSubHeader[4] := Text1450011Txt;
                    ColumnSubHeader[5] := Text1450003Txt;
                    ColumnSubHeader[6] := Text1450004Txt;
                    LongText :=
                      StrSubstNo(
                        Text1450006Txt,
                        CurrentPeriodStart, CurrentPeriodEnd, CurrentYearStart, CurrentPeriodEnd);
                end;
            SelReportType::"Net Change (This Year/Last Year)":
                begin
                    NoOfColumns := 6;
                    ReportName := Text1450008Txt;
                    ColumnHeader[1] := Text1450012Txt;
                    ColumnHeader[2] := Text1450010Txt;
                    ColumnSubHeader[1] := Text1450000Txt;
                    ColumnSubHeader[2] := Text1450001Txt;
                    ColumnSubHeader[3] := Text1450004Txt;
                    ColumnSubHeader[4] := Text1450000Txt;
                    ColumnSubHeader[5] := Text1450001Txt;
                    ColumnSubHeader[6] := Text1450004Txt;
                    LongText :=
                      StrSubstNo(
                        Text1450017Txt,
                        CurrentPeriodStart, CurrentPeriodEnd,
                        LastYearCurrentPeriodStart, LastYearCurrentPeriodEnd,
                        CurrentYearStart, CurrentPeriodEnd,
                        LastYearStart, LastYearCurrentPeriodEnd);
                end;
            SelReportType::"Balance (This Year/Last Year)":
                begin
                    NoOfColumns := 4;
                    ReportName := Text1450005Txt;
                    ColumnSubHeader[1] := Text1450000Txt;
                    ColumnSubHeader[2] := Text1450001Txt;
                    ColumnSubHeader[3] := Text1450015Txt;
                    ColumnSubHeader[4] := Text1450016Txt;
                    LongText :=
                      StrSubstNo(
                        Text1450006Txt,
                        CurrentYearStart, CurrentPeriodEnd, LastYearStart, LastYearCurrentPeriodEnd);
                end;
        end;
    end;

    local procedure ConvertAmountToText()
    var
        i: Integer;
    begin
        for i := 1 to 6 do
            if i <= NoOfColumns then begin
                if FormatString[i] <> '' then
                    ColumnAmountText[i] := Format(ColumnAmount[i], 0, FormatString[i])
                else
                    ColumnAmountText[i] := Format(ColumnAmount[i]);
            end else
                ColumnAmountText[i] := '';
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
        case SelReportType of
            1, SelReportType::"Net Change/Budget", SelReportType::"Net Change (This Year/Last Year)":
                begin
                    FormatString[3] := '';
                    FormatString[6] := '';
                    DoNotRoundAmount[3] := true;
                    DoNotRoundAmount[6] := true;
                end;
            SelReportType::"Balance (This Year/Last Year)":
                begin
                    FormatString[4] := '';
                    DoNotRoundAmount[4] := true;
                end;
        end;
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
        case SelReportType of
            1, SelReportType::"Balance (This Year/Last Year)":
                GLAccount.SetRange("Income/Balance", GLAccount."Income/Balance"::"Balance Sheet");
            SelReportType::"Net Change/Budget", SelReportType::"Net Change (This Year/Last Year)":
                GLAccount.SetRange("Income/Balance", GLAccount."Income/Balance"::"Income Statement");
        end;
    end;

    local procedure CalculateAmount(var GLAccount: Record "G/L Account")
    var
        i: Integer;
    begin
        for i := 1 to 6 do
            ColumnAmount[i] := 0;
        case SelReportType of
            1:
                begin
                    GLAccount.SetRange("Date Filter", CurrentYearStart, CurrentPeriodEnd);
                    GLAccount.CalcFields("Balance at Date", "Budget at Date");
                    ColumnAmount[1] := GLAccount."Balance at Date";
                    ColumnAmount[2] := GLAccount."Budget at Date";
                    if ColumnAmount[2] <> 0 then
                        ColumnAmount[3] := Round((ColumnAmount[2] - ColumnAmount[1]) / ColumnAmount[2] * 100, 1);

                    GLAccount.SetRange("Date Filter", LastYearStart, LastYearCurrentPeriodEnd);
                    GLAccount.CalcFields("Balance at Date", "Budget at Date");
                    ColumnAmount[4] := GLAccount."Balance at Date";
                    ColumnAmount[5] := GLAccount."Budget at Date";
                    if ColumnAmount[5] <> 0 then
                        ColumnAmount[6] := Round((ColumnAmount[5] - ColumnAmount[4]) / ColumnAmount[5] * 100, 1);
                end;
            SelReportType::"Net Change/Budget":
                begin
                    GLAccount.SetRange("Date Filter", CurrentPeriodStart, CurrentPeriodEnd);
                    GLAccount.CalcFields("Net Change", "Budgeted Amount");
                    ColumnAmount[1] := GLAccount."Net Change";
                    ColumnAmount[2] := GLAccount."Budgeted Amount";
                    if ColumnAmount[2] <> 0 then
                        ColumnAmount[3] := Round((ColumnAmount[1] - ColumnAmount[2]) / ColumnAmount[2] * 100, 1);

                    GLAccount.SetRange("Date Filter", CurrentYearStart, CurrentPeriodEnd);
                    GLAccount.CalcFields("Net Change", "Budgeted Amount");
                    ColumnAmount[4] := GLAccount."Net Change";
                    ColumnAmount[5] := GLAccount."Budgeted Amount";
                    if ColumnAmount[5] <> 0 then
                        ColumnAmount[6] := Round((ColumnAmount[4] - ColumnAmount[5]) / ColumnAmount[5] * 100, 1);
                end;
            SelReportType::"Net Change (This Year/Last Year)":
                begin
                    GLAccount.SetRange("Date Filter", CurrentPeriodStart, CurrentPeriodEnd);
                    GLAccount.CalcFields("Net Change", "Additional-Currency Net Change");
                    if AddCurr then
                        ColumnAmount[1] := GLAccount."Additional-Currency Net Change"
                    else
                        ColumnAmount[1] := GLAccount."Net Change";
                    GLAccount.SetRange("Date Filter", LastYearCurrentPeriodStart, LastYearCurrentPeriodEnd);
                    GLAccount.CalcFields("Net Change", "Additional-Currency Net Change");
                    if AddCurr then
                        ColumnAmount[2] := GLAccount."Additional-Currency Net Change"
                    else
                        ColumnAmount[2] := GLAccount."Net Change";
                    if ColumnAmount[2] <> 0 then
                        ColumnAmount[3] := Round((ColumnAmount[1] - ColumnAmount[2]) / ColumnAmount[2] * 100, 1);

                    GLAccount.SetRange("Date Filter", CurrentYearStart, CurrentPeriodEnd);
                    GLAccount.CalcFields("Net Change", "Additional-Currency Net Change");
                    if AddCurr then
                        ColumnAmount[4] := GLAccount."Additional-Currency Net Change"
                    else
                        ColumnAmount[4] := GLAccount."Net Change";
                    GLAccount.SetRange("Date Filter", LastYearStart, LastYearCurrentPeriodEnd);
                    GLAccount.CalcFields("Net Change", "Additional-Currency Net Change");
                    if AddCurr then
                        ColumnAmount[5] := GLAccount."Additional-Currency Net Change"
                    else
                        ColumnAmount[5] := GLAccount."Net Change";
                    if ColumnAmount[5] <> 0 then
                        ColumnAmount[6] := Round((ColumnAmount[4] - ColumnAmount[5]) / ColumnAmount[5] * 100, 1);
                end;
            SelReportType::"Balance (This Year/Last Year)":
                begin
                    GLAccount.SetRange("Date Filter", CurrentYearStart, CurrentPeriodEnd);
                    GLAccount.CalcFields("Balance at Date", "Add.-Currency Balance at Date");
                    if AddCurr then
                        ColumnAmount[1] := GLAccount."Add.-Currency Balance at Date"
                    else
                        ColumnAmount[1] := GLAccount."Balance at Date";

                    GLAccount.SetRange("Date Filter", LastYearStart, LastYearCurrentPeriodEnd);
                    GLAccount.CalcFields("Balance at Date", "Add.-Currency Balance at Date");
                    if AddCurr then
                        ColumnAmount[2] := GLAccount."Add.-Currency Balance at Date"
                    else
                        ColumnAmount[2] := GLAccount."Balance at Date";
                    ColumnAmount[3] := ColumnAmount[1] - ColumnAmount[2];
                    if ColumnAmount[2] <> 0 then
                        ColumnAmount[4] := Round(((ColumnAmount[1] - ColumnAmount[2]) / ColumnAmount[2]) * 100, 1);
                end;
        end;
    end;

    local procedure ShowTotalLine(var GLAccount: Record "G/L Account"): Boolean
    begin
        if ((GLAccount."Account Type" = GLAccount."Account Type"::"End-Total") or
            (GLAccount."Account Type" = GLAccount."Account Type"::Total))
        then
            exit(true);

        exit(false);
    end;
}

