#if AppSource
report 70658584 "Trial Balance TJP"
#endif
#if OnPremise
report 99009 "Trial Balance TJP"
#endif
{
    DefaultLayout = RDLC;
    RDLCLayout = 'TecturaJP/JapanLocalization/TrialBalanceJP.rdlc';
    AdditionalSearchTerms = 'year closing,close accounting period,close fiscal year';
    ApplicationArea = Basic, Suite;
    Caption = 'Trial Balance';
    PreviewMode = PrintLayout;
    UsageCategory = None;

    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Account Type", "Date Filter", "Global Dimension 1 Filter", "Global Dimension 2 Filter";
            column(TrialBalCaption; TrialBalCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(NetChangeCaption; NetChangeCaptionLbl)
            {
            }
            column(BalanceCaption; BalanceCaptionLbl)
            {
            }
            column(AccNoCaption; FieldCaption("No."))
            {
            }
            column(AccNameCaption; AccNameCaptionLbl)
            {
            }
            column(NetChangeDebitCaption; NetChangeDebitCaptionLbl)
            {
            }
            column(NetChangeCreditCaption; NetChangeCreditCaptionLbl)
            {
            }
            column(BalAtDateDebitCaption; BalAtDateDebitCaptionLbl)
            {
            }
            column(BalAtDateCreditCaption; BalAtDateCreditCaptionLbl)
            {
            }
            column(JPNDateText; JPNDateText)
            {
            }
            column(FilterCaption; TableCaption + ': ' + GLFilter)
            {
            }
            column(Text000PeriodText; StrSubstNo(Text000Txt, PeriodText))
            {
            }
            column(COMPANYNAME; CompanyInformation.Name)
            {
            }
            column(PeriodText; PeriodText)
            {
            }
            column(GLFilter; GLFilter)
            {
            }
            column(GLAccNo; "No.")
            {
            }
            column(PageGroupNo; PageGroupNo)
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                column(GLAccNo2; "G/L Account"."No.")
                {
                }
                column(GLAccIndWithName; PadStr('', "G/L Account".Indentation * 2) + AccDescription)
                {
                }
                column(GLAccNetChangeDebit; "G/L Account"."Net Change")
                {
                }
                column(GLAccNetChangeCredit; -"G/L Account"."Net Change")
                {
                    AutoFormatType = 1;
                }
                column(GLAccBalanceAtDateDebit; "G/L Account"."Balance at Date")
                {
                }
                column(GLAccBalanceAtDateCredit; -"G/L Account"."Balance at Date")
                {
                    AutoFormatType = 1;
                }
                column(GLAccType; Format("G/L Account"."Account Type", 0, 2))
                {
                }
                column(GLAccNoofBlankLines; "G/L Account"."No. of Blank Lines")
                {
                }
                dataitem(BlankLineRepeater; "Integer")
                {
                    DataItemTableView = sorting(Number);
                    column(BlankLineNo; BlankLineNo)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        if BlankLineNo = 0 then
                            CurrReport.Break();

                        BlankLineNo -= 1;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    BlankLineNo := "G/L Account"."No. of Blank Lines" + 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CalcFields("Net Change", "Balance at Date");

                if ChangeGroupNo then begin
                    PageGroupNo += 1;
                    ChangeGroupNo := false;
                end;

                ChangeGroupNo := "New Page";

                AccDescription := "G/L Account".Name;
                if (GlobalLanguage = 1041) and ("G/L Account"."Name (Japanese) TJP" <> '') then
                    AccDescription := "G/L Account"."Name (Japanese) TJP"
            end;

            trigger OnPreDataItem()
            begin
                PageGroupNo := 0;
                ChangeGroupNo := false;
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
        JPNDateText := StrSubstNo(TextJPNDateTxt, Date2DMY(Today, 1), Date2DMY(Today, 2), Date2DMY(Today, 3));

        GLFilter := "G/L Account".GetFilters;
        PeriodText := copystr("G/L Account".GetFilter("Date Filter"), 1, MaxStrLen(PeriodText));
    end;

    var
        CompanyInformation: Record "Company Information";
        Language2: Codeunit Language;
        LangSel: Code[10];
        JPNDateText: Text[30];
        AccDescription: Text[100];
        GLFilter: Text;
        PeriodText: Text[30];
        PageGroupNo: Integer;
        ChangeGroupNo: Boolean;
        BlankLineNo: Integer;
        TextJPNDateTxt: Label '%3 / %2 / %1', Comment = 'Year=%1 / Month=%2 /Day=%3';
        Text000Txt: Label 'Period: %1', Comment = 'Period Text=%1';
        TrialBalCaptionLbl: Label 'Trial Balance';
        PageCaptionLbl: Label 'Page';
        NetChangeCaptionLbl: Label 'Net Change';
        BalanceCaptionLbl: Label 'Balance';
        AccNameCaptionLbl: Label 'Name';
        NetChangeDebitCaptionLbl: Label 'Debit';
        NetChangeCreditCaptionLbl: Label 'Credit';
        BalAtDateDebitCaptionLbl: Label 'Debit';
        BalAtDateCreditCaptionLbl: Label 'Credit';
}

