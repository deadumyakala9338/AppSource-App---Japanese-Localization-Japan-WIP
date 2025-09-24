#if AppSource
pageextension 70658591 PurchPaySetupTJP extends "Purchases & Payables Setup"
#endif
#if OnPremise
pageextension 99015 PurchPaySetupTJP extends "Purchases & Payables Setup"
#endif
{
    layout
    {
        addafter("Default Accounts")
        {
            group("Bank Fee TJP")
            {
                Caption = 'Zengin';
                Visible = TheCompanyIsInJapan;

                field("Bank Fee G/L Account No. TJP"; Rec."Bank Fee G/L Account No. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Bank Fee G/L Account No. for money transfer in vendor payment.';
                }
                field("ShowEachPmtJnlLineZengin TJP"; Rec."ShowEachPmtJnlLineZengin TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies to export the details of the zengin file with vendor wise summarized or single line for each payment journal line.';
                }
            }
            group(LawConcerningPreservationOfNationalTaxRecordsInElectronicFormTJP)
            {
                Caption = 'Law Concerning Preservation of National Tax Records in Electronic Form';
                Visible = false;

                field("Allow Attach After Post TJP"; Rec."Allow Attach After Post TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if addition or deletion of attachments are allowed after the documents have been posted.';
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