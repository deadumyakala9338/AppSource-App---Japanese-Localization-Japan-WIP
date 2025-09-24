#if AppSource
pageextension 70658590 SRSetupTJP extends "Sales & Receivables Setup"
#endif
#if OnPremise
pageextension 99014 SRSetupTJP extends "Sales & Receivables Setup"
#endif
{
    layout
    {
        addafter(Archiving)
        {
            group("Coll. Invoice TJP")
            {
                Caption = 'Collective Invoice';
                Visible = TheCompanyIsInJapan;

                field("Col. Inv. Copy Identifier1 TJP"; Rec."Col. Inv. Copy Identifier1 TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Collective Invoice Copy Identifier1';
                }
                field("Col. Inv. Copy Identifier2 TJP"; Rec."Col. Inv. Copy Identifier2 TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Collective Invoice Copy Identifier2';
                }
                field("Col. Inv. Copy Identifier3 TJP"; Rec."Col. Inv. Copy Identifier3 TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Collective Invoice Copy Identifier3';
                }
                field("Col. Inv. No. of Copies TJP"; Rec."Col. Inv. No. of Copies TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Collective Invoice no. of copies';
                }
                field("Coll. Invoice Base Date TJP"; Rec."Coll. Invoice Base Date TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Collective Invoice payment calculation based on.';
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