#if AppSource
pageextension 70658575 CompInfoTJP extends "Company Information"
#endif
#if OnPremise
pageextension 99000 CompInfoTJP extends "Company Information"
#endif
{
    layout
    {
        addafter(Picture)
        {
            field("Chop TJP"; Rec."Chop TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Chop that is displayed on reports.';
                Visible = TheCompanyIsInJapan;
            }
        }
        addafter(Payments)
        {
            group(OtherTJP)
            {
                Caption = 'English Address & Payments';
                Visible = TheCompanyIsInJapan;

                field("English Name TJP"; Rec."English Name TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the English Name that is displayed on reports.';
                }
                field("English Name 2 TJP"; Rec."English Name 2 TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the English Name 2 that is displayed on reports.';
                }
                field("English Address TJP"; Rec."English Address TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the English Address that is displayed on reports.';
                }
                field("English Address 2 TJP"; Rec."English Address 2 TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the English Address 2 that is displayed on reports.';
                }
                field("English Post Code TJP"; Rec."English Post Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the English Post Code that is displayed on reports.';
                }
                field("English City TJP"; Rec."English City TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the English City that is displayed on reports.';
                }
                field("English County TJP"; Rec."English County TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the English County that is displayed on reports.';
                }
                field("Eng. Country/Region Code TJP"; Rec."Eng. Country/Region Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the English Country/Region Code that is displayed on reports.';
                }
                field("Eng. Phone No. TJP"; Rec."Eng. Phone No. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the English Phone No that is displayed on reports.';
                }
                field("Eng. Fax No. TJP"; Rec."Eng. Fax No. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the English Fax No that is displayed on reports.';
                }
                field("Reporting Language TJP"; Rec."Reporting Language TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Reporting Language that is displayed on reports.';
                }
                field("Eng. Bank Acc. No. TJP"; Rec."Eng. Bank Acc. No. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the English Company Bank Account No.';
                }
                field("Eng. Bank Acc. Name TJP"; Rec."Eng. Bank Acc. Name TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the English Company Bank Account Name';
                }
                field("Eng. Bank Acc. Holder Name TJP"; Rec."Eng. Bank Acc. Holder Name TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the English Company Bank Account Holder Name';
                }
                field("Eng. Account Type TJP"; Rec."Eng. Account Type TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the company Bank Account Type';
                }
            }
        }
        addafter(BankAccountPostingGroup)
        {
            field("Bank Account Holder Name TJP"; Rec."Bank Account Holder Name TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies Company Bank Account Holder Name';
                Visible = TheCompanyIsInJapan;
            }
        }
        addafter("Bank Branch No.")
        {
            field("Account Type TJP"; Rec."Account Type TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the company English Bank Account Type';
                Visible = TheCompanyIsInJapan;
            }
        }
    }

    trigger OnOpenPage()
    var
        CompanyInformationRec: Record "Company Information";
    begin
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') = 1 then
            TheCompanyIsInJapan := true
        else
            TheCompanyIsInJapan := false;
    end;

    var
        TheCompanyIsInJapan: Boolean;
}