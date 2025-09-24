#if AppSource
pageextension 70658580 GLEntriesTJP extends "General Ledger Entries"
#endif
#if OnPremise
pageextension 99005 GLEntriesTJP extends "General Ledger Entries"
#endif
{
    layout
    {
        addafter("G/L Account Name")
        {
            field("G/L Acc. Name (Japanese) TJP"; Rec."G/L Acc. Name (Japanese) TJP")
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