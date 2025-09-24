#if AppSource
pageextension 70659002 "Customer List TJP" extends "Customer List"
#endif
#if OnPremise
pageextension 99037 "Customer List TJP" extends "Customer List"
#endif
{
    layout
    {
        addafter("Credit Limit (LCY)")
        {
            field("Outstanding PNotes TJP"; Rec."Outstanding PNotes TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD';
                DrillDownPageID = "Customer Promissory List TJP";
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