#if AppSource
pageextension 70658593 FASetupTJP extends "Fixed Asset Setup"
#endif
#if OnPremise
pageextension 99017 FASetupTJP extends "Fixed Asset Setup"
#endif
{
    layout
    {
        addafter("Automatic Insurance Posting")
        {
            field("FA Rounding Type TJP"; Rec."FA Rounding Type TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies Fixed Asset Rounding Type.';
                Visible = TheCompanyIsInJapan;
            }
            field("FA Rounding Precision TJP"; Rec."FA Rounding Precision TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies Fixed Asset Rounding Precision';
                Visible = TheCompanyIsInJapan;
            }
            field("Use Non-Jpn FA Depn Method TJP"; Rec."Use Non-Jpn FA Depn Method TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies if non-Japanese FA depreciation methods are used in this company';
                //Visible = TheCompanyIsInJapan;
                Visible = false;                                                                    // 2025-07-25 Anada
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