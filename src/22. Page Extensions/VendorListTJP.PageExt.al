#if AppSource
pageextension 70659003 "Vendor List TJP" extends "Vendor List"
#endif
#if OnPremise
pageextension 99038 "Vendor List TJP" extends "Vendor List"
#endif
{
    layout
    {
        addafter("Payments (LCY)")
        {
            field("Outstanding PNotes TJP"; Rec."Outstanding PNotes TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD';
                DrillDownPageID = "Vendor Promissory List TJP";
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