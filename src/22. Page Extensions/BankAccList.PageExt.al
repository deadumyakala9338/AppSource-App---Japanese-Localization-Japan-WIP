#if AppSource
pageextension 70658587 BankAccListTJP extends "Bank Account List"
#endif
#if OnPremise
pageextension 99011 BankAccListTJP extends "Bank Account List"
#endif
{
    layout
    {
        addafter("Search Name")
        {
            field("Zengin Bank Branch No. TJP"; Rec."Zengin Bank Branch No. TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies Zengin Bank Branch No.';
                Visible = TheCompanyIsInJapan;
            }
            field("Zengin Bank Name Kana TJP"; Rec."Zengin Bank Name Kana TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies Zengin Bank Name Kana.';
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
            field("Company Code TJP"; Rec."Company Code TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies Company Code';
                Visible = TheCompanyIsInJapan;
            }
        }
    }

    actions
    {
        addafter("C&ontact")
        {
            action("BankFeeSetupTJP")
            {
                Caption = 'Bank Fee Setup';
                ToolTip = 'Specifies list of  bank fee setup information';
                ApplicationArea = All;
                Image = CalculateCost;
                Visible = TheCompanyIsInJapan;
                RunObject = Page "Bank Fee Setup TJP";
                RunPageView = SORTING("Bank Account No.", "Payee Bank Type", "Payment Amount From");
                RunPageLink = "Bank Account No." = FIELD("No.");
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