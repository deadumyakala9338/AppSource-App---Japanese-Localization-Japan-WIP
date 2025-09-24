#if AppSource
pageextension 70658586 BankAccCardTJP extends "Bank Account Card"
#endif
#if OnPremise
pageextension 99010 BankAccCardTJP extends "Bank Account Card"
#endif
{
    layout
    {
        addafter("Bank Acc. Posting Group")
        {
            field("P.Note Receivable Account TJP"; Rec."P.Note Receivable Account TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the code for the number series that will be used to assign numbers to promissory note receivable account.';
                Visible = TheCompanyIsInJapan;
            }
            field("P.Note Payable Account TJP"; Rec."P.Note Payable Account TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the code for the number series that will be used to assign numbers to promissory note payable account.';
                Visible = TheCompanyIsInJapan;
            }
            field("P.Note Discounted Account TJP"; Rec."P.Note Discounted Account TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the code for the number series that will be used to assign numbers to promissory note discounted account.';
                Visible = TheCompanyIsInJapan;
            }
            field("P.Note Rec. Disc. Account TJP"; Rec."P.Note Rec. Disc. Account TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the code for the number series that will be used to assign numbers to promissory note rec. discounted account.';
                Visible = TheCompanyIsInJapan;
            }
            field("P.Note Dishonored Account TJP"; Rec."P.Note Dishonored Account TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the code for the number series that will be used to assign numbers to promissory note dishonored account.';
                Visible = TheCompanyIsInJapan;
            }
        }
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
                    ToolTip = 'Specifies Zengin Bank Name Kana.';
                }
                field("Zengin Branch Name Kana TJP"; Rec."Zengin Branch Name Kana TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Zengin Branch Name Kana.';
                }
                field("Zengin Account Type TJP"; Rec."Zengin Account Type TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Zengin Account Type.';
                }
                field("Zengin Bank Account No. TJP"; Rec."Zengin Bank Account No. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Zengin Bank Account No.';
                }
                field("Zengin Account Holder Kana TJP"; Rec."Zengin Account Holder Kana TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Zengin Account Holder Kana.';
                }
                field("Company Code TJP"; Rec."Company Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Company Code.';
                }
            }
        }
    }
    actions
    {
        addafter("C&ontact")
        {
            action("Bank Fee Setup TJP")
            {
                ApplicationArea = All;
                Caption = 'Bank Fee Setup';
                ToolTip = 'Specifies list of  bank fee setup information';
                Image = CalculateCost;
                Visible = TheCompanyIsInJapan;
                //Promoted = true;
                RunObject = page "Bank Fee Setup TJP";
                RunPageView = SORTING("Bank Account No.", "Payee Bank Type", "Payment Amount From");
                RunPageLink = "Bank Account No." = field("No.");
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