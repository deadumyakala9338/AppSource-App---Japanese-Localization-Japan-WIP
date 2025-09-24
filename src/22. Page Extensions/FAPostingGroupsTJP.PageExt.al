#if AppSource
pageextension 70659010 "FA Posting Groups TJP" extends "FA Posting Groups"
#endif
#if OnPremise
pageextension 99045 "FA Posting Groups TJP" extends "FA Posting Groups"
#endif
{
    layout
    {
        addafter(Code)
        {
            field("Description TJP"; Rec."Description TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the description for the FA posting group.';
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