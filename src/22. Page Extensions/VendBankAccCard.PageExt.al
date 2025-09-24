#if AppSource
pageextension 70658588 VendBankAccCardTJP extends "Vendor Bank Account Card"
#endif
#if OnPremise
pageextension 99012 VendBankAccCardTJP extends "Vendor Bank Account Card"
#endif
{
    layout
    {
        addafter(Transfer)
        {
            group(ZenginTJP)
            {
                Caption = 'Zengin';
                Visible = TheCompanyIsInJapan;

                field("Zengin Bank Branch No. TJP"; Rec."Zengin Bank Branch No. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Zengin Bank Branch No.';
                }
                field("Zengin Bank Name Kana TJP"; Rec."Zengin Bank Name Kana TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Zengin Bank Name Kana';
                }
                field("Zengin Branch Name Kana TJP"; Rec."Zengin Branch Name Kana TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Zengin Branch Name Kana';
                }
                field("Zengin Account Type TJP"; Rec."Zengin Account Type TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Zengin Account Type';
                }
                field("Zengin Bank Account No. TJP"; Rec."Zengin Bank Account No. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Zengin Bank Account No.';
                }
                field("Zengin Account Holder Kana TJP"; Rec."Zengin Account Holder Kana TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Zengin Account Holder Kana';
                }
                field("Default Bank TJP"; Rec."Default Bank TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies default vendor bank account.';
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