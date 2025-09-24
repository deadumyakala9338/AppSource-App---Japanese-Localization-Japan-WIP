#if AppSource
pageextension 70658578 GLAccCardTJP extends "G/L Account Card"
#endif
#if OnPremise
pageextension 99003 GLAccCardTJP extends "G/L Account Card"
#endif
{
    layout
    {
        addafter(Name)
        {
            field("Name (Japanese) TJP"; Rec."Name (Japanese) TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the name of the general ledger account.';
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