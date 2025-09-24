#if AppSource
pageextension 70659006 VATProdPostingGrpTJP extends "VAT Product Posting Groups"
#endif
#if OnPremise
pageextension 99041 VATProdPostingGrpTJP extends "VAT Product Posting Groups"
#endif
{
    layout
    {
        addafter(Description)
        {
            field("Reduced Tax TJP"; Rec."Reduced Tax TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD';
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