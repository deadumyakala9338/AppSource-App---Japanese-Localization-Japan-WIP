#if AppSource
pageextension 70659004 "Purchase Lines TJP" extends "Purchase Lines"
#endif
#if OnPremise
pageextension 99039 "Purchase Lines TJP" extends "Purchase Lines"
#endif
{
    layout
    {
        addafter("Buy-from Vendor No.")
        {
            field("Buy-from Vendor Name TJP"; Rec."Buy-from Vendor Name TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Buy-from Address TJP"; Rec."Buy-from Address TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Buy-from Address 2 TJP"; Rec."Buy-from Address 2 TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Buy-from City TJP"; Rec."Buy-from City TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Buy-from Post Code TJP"; Rec."Buy-from Post Code TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Buy-from Cntry/Region Code TJP"; Rec."Buy-from Cntry/Region Code TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Pay-to Name TJP"; Rec."Pay-to Name TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Pay-to Address TJP"; Rec."Pay-to Address TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Pay-to Address 2 TJP"; Rec."Pay-to Address 2 TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Pay-to City TJP"; Rec."Pay-to City TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Pay-to Post Code TJP"; Rec."Pay-to Post Code TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Pay-to Country/Region Code TJP"; Rec."Pay-to Country/Region Code TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Document Date TJP"; Rec."Document Date TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Due Date TJP"; Rec."Due Date TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Vendor Invoice No. TJP"; Rec."Vendor Invoice No. TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Vendor Order No. TJP"; Rec."Vendor Order No. TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Assigned User ID TJP"; Rec."Assigned User ID TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Purchaser Code TJP"; Rec."Purchaser Code TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Payment Terms Code TJP"; Rec."Payment Terms Code TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Payment Method Code TJP"; Rec."Payment Method Code TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Status TJP"; Rec."Status TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
        }
        addafter("Unit of Measure Code")
        {
            field("VAT Prod. Posting Group TJP"; Rec."VAT Prod. Posting Group")                     // 2025-05-05 Anada
            {
                ApplicationArea = All;
                ToolTip = 'n/a';
            }
        }
        addafter("ShortcutDimCode[8]")
        {
            field("Requested Receipt Date TJP"; Rec."Requested Receipt Date")                       // 2025-05-05 Anada
            {
                ApplicationArea = All;
                ToolTip = 'n/a';
            }
            field("Planned Receipt Date TJP"; Rec."Planned Receipt Date")                           // 2025-03-07 Anada
            {
                ApplicationArea = All;
                ToolTip = 'TBD';
            }
        }
    }
}