#if AppSource
pageextension 70659008 "Employee Card TJP" extends "Employee Card"
#endif
#if OnPremise
pageextension 99043 "Employee Card TJP" extends "Employee Card"
#endif
{
    DataCaptionExpression = Rec."No." + ' ∙ ' + Rec."Last Name" + ' ∙ ' + Rec."First Name";

    layout
    {
        moveafter("No."; "Last Name")
        moveafter("Middle Name"; "First Name")
        addafter("First Name")
        {
            field("Last Name (English) TJP"; Rec."Last Name (English) TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the last name in English.';
                Visible = TheCompanyIsInJapan;
            }
            field("First Name (English) TJP"; Rec."First Name (English) TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the first name in English.';
                Visible = TheCompanyIsInJapan;
            }
        }
        addafter("First Name")
        {
            field("Last Name In Kana TJP"; Rec."Last Name In Kana TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the last name in kana.';
                Visible = TheCompanyIsInJapan;
            }
            field("First Name In Kana TJP"; Rec."First Name In Kana TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the first name in Kana.';
                Visible = TheCompanyIsInJapan;
            }
        }
        addafter("Company E-Mail")
        {
            field("User Name TJP"; Rec."User Name TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the user name.';
                Visible = TheCompanyIsInJapan;
            }
        }
        addafter(Payments)
        {
            group(ZenginTJP)
            {
                Caption = 'Zengin';
                Visible = TheCompanyIsInJapan;

                field("Zengin Bank/Branch No. TJP"; Rec."Zengin Bank/Branch No. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Zengin Bank/Branch No. (7 digits)';
                }
                field("Zengin Bank Name Kana TJP"; Rec."Zengin Bank Name Kana TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Zengin Bank Name Kana. (Max. 15 characters)';
                }
                field("Zengin Branch Name Kana TJP"; Rec."Zengin Branch Name Kana TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Zengin Branch Name Kana. (Max. 15 characters)';
                }
                field("Zengin Account Type TJP"; Rec."Zengin Account Type TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Zengin Account Type.';
                }
                field("Zengin Account No. TJP"; Rec."Zengin Account No. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Zengin Account No. (7 digits)';
                }
                field("Zengin Account Holder Kana TJP"; Rec."Zengin Account Holder Kana TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Zengin Account Holder Kana. (Max. 30 characters)';
                }
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