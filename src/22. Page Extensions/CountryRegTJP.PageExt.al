#if AppSource
pageextension 70658576 CountryRegTJP extends "Countries/Regions"
#endif
#if OnPremise
pageextension 99001 CountryRegTJP extends "Countries/Regions"
#endif
{
    layout
    {
        addafter("Address Format")
        {
            field("Address Format (Extended) TJP"; Rec."Address Format (Extended) TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the format of the address that is displayed on external-facing documents.';
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