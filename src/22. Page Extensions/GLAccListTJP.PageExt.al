#if AppSource
pageextension 70658579 GLAccListTJP extends "G/L Account List"
#endif
#if OnPremise
pageextension 99004 GLAccListTJP extends "G/L Account List"
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