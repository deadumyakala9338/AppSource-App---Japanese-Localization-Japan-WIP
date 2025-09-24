#if AppSource
pageextension 70659011 "Bank Account Posting Grps TJP" extends "Bank Account Posting Groups"
#endif
#if OnPremise
pageextension 99046 "Bank Account Posting Grps TJP" extends "Bank Account Posting Groups"
#endif
{
    layout
    {
        addafter(Code)
        {
            field("Description TJP"; Rec."Description TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the description for the bank account posting group.';
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