#if AppSource
pageextension 70659005 "Sales Lines TJP" extends "Sales Lines"
#endif
#if OnPremise
pageextension 99040 "Sales Lines TJP" extends "Sales Lines"
#endif
{
    layout
    {
        addafter("Sell-to Customer No.")
        {
            field("Sell-to Customer Name TJP"; Rec."Sell-to Customer Name TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Sell-to Address TJP"; Rec."Sell-to Address TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Sell-to Address 2 TJP"; Rec."Sell-to Address 2 TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Sell-to City TJP"; Rec."Sell-to City TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Sell-to Post Code TJP"; Rec."Sell-to Post Code TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Sell-to Cntry/Region Code TJP"; Rec."Sell-to Cntry/Region Code TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Bill-to Name TJP"; Rec."Bill-to Name TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Bill-to Address TJP"; Rec."Bill-to Address TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Bill-to Address 2 TJP"; Rec."Bill-to Address 2 TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Bill-to City TJP"; Rec."Bill-to City TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Bill-to Post Code TJP"; Rec."Bill-to Post Code TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Bill-to Cntry/Region Code TJP"; Rec."Bill-to Cntry/Region Code TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Document Date TJP"; Rec."Document Date TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Order Date TJP"; Rec."Order Date TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Due Date TJP"; Rec."Due Date TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Ext. Document No. TJP"; Rec."Ext. Document No. TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Assigned User ID TJP"; Rec."Assigned User ID TJP")
            {
                ApplicationArea = All;
                Tooltip = 'TBD';
            }
            field("Salesperson Code TJP"; Rec."Salesperson Code TJP")
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
    }
}