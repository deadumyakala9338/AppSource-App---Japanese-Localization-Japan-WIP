#if AppSource
pageextension 70658690 "Pstd. Purch. Invoice Lines TJP" extends "Posted Purchase Invoice Lines"
#endif
#if OnPremise
pageextension 99035 "Pstd. Purch. Invoice Lines TJP" extends "Posted Purchase Invoice Lines"
#endif
{
    layout
    {
        addafter("Buy-from Vendor No.")
        {
            field("Buy-from Vend. Name TJP"; Rec."Buy-from Vend. Name TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD';
                Visible = TheCompanyIsInJapan;
            }
            field("Posting Date TJP"; Rec."Posting Date")
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