#if AppSource
pageextension 70658581 CustCardTJP extends "Customer Card"
#endif
#if OnPremise
pageextension 99006 CustCardTJP extends "Customer Card"
#endif
{
    layout
    {
        addafter("Last Statement No.")
        {
            field("Outstanding PNotes TJP"; Rec."Outstanding PNotes TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies outstanding promissory noted for selecred customer';
                DrillDownPageID = "Customer Promissory List TJP";
                Visible = TheCompanyIsInJapan;
            }
        }
        addafter("Copy Sell-to Addr. to Qte From")
        {
            field("Collective Invoice Date TJP"; Rec."Collective Invoice Date TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the consolidated collective invoice generated.';
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