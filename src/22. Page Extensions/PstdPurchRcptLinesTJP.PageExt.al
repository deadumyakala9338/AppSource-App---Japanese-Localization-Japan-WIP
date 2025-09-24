#if AppSource
pageextension 70658691 "Pstd. Purch. Rcpt. Lines TJP" extends "Posted Purchase Receipt Lines"
#endif
#if OnPremise
pageextension 99036 "Pstd. Purch. Rcpt. Lines TJP" extends "Posted Purchase Receipt Lines"
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
                ToolTip = 'TBD', Locked = true;
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