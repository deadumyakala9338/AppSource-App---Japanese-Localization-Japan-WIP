#if AppSource
pageextension 70658589 VendBankAccListTJP extends "Vendor Bank Account List"
#endif
#if OnPremise
pageextension 99013 VendBankAccListTJP extends "Vendor Bank Account List"
#endif
{
    layout
    {
        addafter("Language Code")
        {
            field("Default Bank TJP"; Rec."Default Bank TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies for Default Vendor Bank';
                Visible = TheCompanyIsInJapan;
            }
            field("Zengin Bank Branch No. TJP"; Rec."Zengin Bank Branch No. TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies Zengin Bank Branch No.';
                Visible = TheCompanyIsInJapan;
            }
            field("Zengin Bank Name Kana TJP"; Rec."Zengin Bank Name Kana TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies Zengin Bank Name Kana';
                Visible = TheCompanyIsInJapan;
            }
            field("Zengin Branch Name Kana TJP"; Rec."Zengin Branch Name Kana TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies Zengin Branch Name Kana';
                Visible = TheCompanyIsInJapan;
            }
            field("Zengin Account Type TJP"; Rec."Zengin Account Type TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies Zengin Account Type';
                Visible = TheCompanyIsInJapan;
            }
            field("Zengin Bank Account No. TJP"; Rec."Zengin Bank Account No. TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies Zengin Bank Account No.';
                Visible = TheCompanyIsInJapan;
            }
            field("Zengin Account Holder Kana TJP"; Rec."Zengin Account Holder Kana TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies Zengin Account Holder Kana';
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