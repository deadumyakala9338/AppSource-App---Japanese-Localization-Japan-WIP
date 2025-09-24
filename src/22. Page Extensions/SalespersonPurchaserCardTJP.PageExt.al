#if AppSource
pageextension 70658687 "Salesperson/Purchaser Card TJP" extends "Salesperson/Purchaser Card"
#endif
#if OnPremise
pageextension 99034 "Salesperson/Purchaser Card TJP" extends "Salesperson/Purchaser Card"
#endif
{
    layout
    {
        addafter(Name)
        {
            field("Name (English) TJP"; Rec."Name (English) TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the English name of the salesperson/purchaser';
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