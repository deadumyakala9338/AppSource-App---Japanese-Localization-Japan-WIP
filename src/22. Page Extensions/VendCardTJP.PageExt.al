#if AppSource
pageextension 70658582 VendCardTJP extends "Vendor Card"
#endif
#if OnPremise
pageextension 99007 VendCardTJP extends "Vendor Card"
#endif
{
    layout
    {
        addafter("Creditor No.")
        {
            field("Outstanding PNotes TJP"; Rec."Outstanding PNotes TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies Outstanding Vendor Promissory notes.';
                DrillDownPageID = "Vendor Promissory List TJP";
                Visible = TheCompanyIsInJapan;
            }
            group(BankFeeTJP)
            {
                Caption = 'Bank Fee:';
                Visible = TheCompanyIsInJapan;

                field("Bank Fee Addition TJP"; Rec."Bank Fee Addition TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether own company needs to pay the bank remittance for money transfer. ';
                }
                field("Bank Fee Vendor Pay TJP"; Rec."Bank Fee Vendor Pay TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether vendor needs to pay the bank remittance for money transfer. ';
                }
                field("BankFee Threshold Ven. Pay TJP"; Rec."BankFee Threshold Ven. Pay TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Bank Fee Threshold for money transfer vendor payment.';
                }
            }
        }
        //moveafter("Bank Fee Vendor Pay TJP"; "Preferred Bank Account Code")
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