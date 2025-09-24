#if AppSource
pageextension 70658584 GLSetupTJP extends "General Ledger Setup"
#endif
#if OnPremise
pageextension 99008 GLSetupTJP extends "General Ledger Setup"
#endif
{
    layout
    {
        addafter(Application)
        {
            group("P-Note TJP")
            {
                Caption = 'P-Note';
                Visible = TheCompanyIsInJapan;

                field("P-Note Receivables Nos. TJP"; Rec."P-Note Receivables Nos. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to customer promissory note.';
                }
                field("P-Note Payables Nos. TJP"; Rec."P-Note Payables Nos. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to vendor promissory note.';
                }
                field("Address Format (Extended) TJP"; Rec."Address Format (Extended) TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the format of the address that is displayed on external-facing documents.';
                }
                field("P-Note Default Template TJP"; Rec."P-Note Default Template TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to default template for promissory note.';
                }
                field("P-Note Default Batch TJP"; Rec."P-Note Default Batch TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to default batch for promissory note.';
                }
                field("P-Note on Hand Account TJP"; Rec."P-Note on Hand Account TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for the number series that will be used to assign general ledger account numbers for promissory note.';
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