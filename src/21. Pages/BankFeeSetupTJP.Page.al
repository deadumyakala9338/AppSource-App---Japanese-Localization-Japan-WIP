#if AppSource
page 70658579 "Bank Fee Setup TJP"
#endif
#if OnPremise
page 99004 "Bank Fee Setup TJP"
#endif
{
    Caption = 'Bank Fee Setup';
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Bank Statement Service,Bank Account,Navigate';
    RefreshOnActivate = true;
    SourceTable = "Bank Fee Setup TJP";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                ShowCaption = false;
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies a code to identify reference bank account.';
                }
                field("Payee Bank Type"; Rec."Payee Bank Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a option to identify Payee Bank Type';
                }
                field("Payment Amount From"; Rec."Payment Amount From")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies amount range';
                }
                field("Bank Fee"; Rec."Bank Fee")
                {
                    ApplicationArea = All;
                    DecimalPlaces = 0 : 5;
                    ToolTip = 'Specifies to any charges imposed by financial institutions on their personal and business customers';
                }
            }
        }
    }

    trigger OnInit()
    var
        CompanyInformationRec: Record "Company Information";
        OnlyAvailableInJapanMsg: Label 'This page is only available for companies in Japan.';
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then begin
            Message(OnlyAvailableInJapanMsg);
            Error('');
        end;
    end;
}

