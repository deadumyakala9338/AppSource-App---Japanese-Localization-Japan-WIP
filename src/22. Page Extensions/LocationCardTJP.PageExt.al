#if AppSource
pageextension 70659007 LocationCardTJP extends "Location Card"
#endif
#if OnPremise
pageextension 99042 LocationCardTJP extends "Location Card"
#endif
{
    layout
    {
        addafter("Address & Contact")
        {
            group(EnglishAddressTJP)
            {
                Caption = 'English Address';
                Visible = TheCompanyIsInJapan;

                field("English Name TJP"; Rec."English Name TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the location.';
                }
                field("English Address TJP"; Rec."English Address TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the location address.';
                }
                field("English Address 2 TJP"; Rec."English Address 2 TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the location address 2.';
                }
                field("English Post Code TJP"; Rec."English Post Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the postal code.';
                }
                field("English City TJP"; Rec."English City TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the city of the location.';
                }
                field("English Country/Region TJP"; Rec."English Country/Region TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the country/region of the address.';
                }
                field("English County TJP"; Rec."English County TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the county of the location';
                }
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