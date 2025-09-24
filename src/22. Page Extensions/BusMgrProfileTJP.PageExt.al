#if AppSource
pageextension 70658596 BusMgrProfileTJP extends "Business Manager Role Center"
#endif
#if OnPremise
pageextension 99020 BusMgrProfileTJP extends "Business Manager Role Center"
#endif
{
    layout
    {
        // Add changes to page layout here
    }
    actions
    {
        addafter("Excel Reports")
        {
            group(JPReportsTJP)
            {
                Caption = 'Localization Reports';
                Visible = false;
                ObsoleteState = Pending;
                ObsoleteTag = '22.0';
                ObsoleteReason = 'Not applicable for other countries than Japan.';

                action("Collective Invoice TJP")
                {
                    Caption = 'Collective Invoice';
                    ToolTip = 'Specifies to open the report for Collective Invoice';
                    ApplicationArea = All;
                    RunObject = report "Collective Invoice TJP";
                    Image = Report;
                }
                action("Collective Invoice Potrait TJP")
                {
                    Caption = 'Collective Invoice Potrait';
                    ToolTip = 'Specifies to open the report for Collective Invoice Potrait';
                    ApplicationArea = All;
                    RunObject = report "Collective Inv. Portrait TJP";
                    Image = Report;
                }
                action("List of Invoice TJP")
                {
                    ApplicationArea = All;
                    Caption = 'List of Invoices';
                    ToolTip = 'TBD';
                    RunObject = report "List Of Invoice TJP";
                    Image = Report;
                }
                action("Consumption Tax Summary TJP")
                {
                    Caption = 'Consumption Tax Summary';
                    ToolTip = 'Specifies to open the report for Consumption Tax Summary';
                    ApplicationArea = All;
                    RunObject = report "Consumption Tax Summary TJP";
                    Image = Report;
                }
            }
            group(JPLocalizationTJP)
            {
                Caption = 'Japan Localization';
                Visible = false;
                ObsoleteState = Pending;
                ObsoleteTag = '22.0';
                ObsoleteReason = 'Not applicable for other countries than Japan.';

                action("Fixed Asset Rates TJP")
                {

                    Caption = 'Fixed Asset Rates';
                    ToolTip = 'Specifies to open the page for  Fixed Asset Rates.';
                    ApplicationArea = All;
                    RunObject = page "Fixed Asset Rates TJP";
                    Image = List;
                }
                action("Vendor - Promissory Note TJP")
                {
                    Caption = 'Vendor - Promissory Note';
                    ToolTip = 'Specifies to open the page for  Vendor - Promissory Note.';
                    ApplicationArea = All;
                    RunObject = page "Vendor Promissory List TJP";
                    Image = List;
                }
                action("Customer - Promissory Note TJP")
                {
                    Caption = 'Customer - Promissory Note';
                    ToolTip = 'Specifies to open the page for Customer - Promissory Note.';
                    ApplicationArea = All;
                    RunObject = page "Customer Promissory List TJP";
                    Image = List;
                }
            }
        }
    }
}