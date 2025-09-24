#if AppSource
pageextension 70658675 "Pstd. Sales Cr.Memo Lines TJP" extends "Posted Sales Credit Memo Lines"
#endif
#if OnPremise
pageextension 99024 "Pstd. Sales Cr.Memo Lines TJP" extends "Posted Sales Credit Memo Lines"
#endif
{
    layout
    {
        addafter("Sell-to Customer No.")
        {
            field("Sell-to Customer Name TJP"; Rec."Sell-to Customer Name TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
            }
            field("Sell-to Customer Name 2 TJP"; Rec."Sell-to Customer Name 2 TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
                Visible = false;
            }
            field("Sell-to Address TJP"; Rec."Sell-to Address TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
            }
            field("Sell-to Address 2 TJP"; Rec."Sell-to Address 2 TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
                Visible = false;
            }
            field("Sell-to City TJP"; Rec."Sell-to City TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
            }
            field("Sell-to Post Code TJP"; Rec."Sell-to Post Code TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
            }
            field("Sell-to Cntry/Region Code TJP"; Rec."Sell-to Cntry/Region Code TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
                Visible = false;
            }
            field("Bill-to Name TJP"; Rec."Bill-to Name TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
                Visible = false;
            }
            field("Bill-to Name 2 TJP"; Rec."Bill-to Name 2 TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
                Visible = false;
            }
            field("Bill-to Address TJP"; Rec."Bill-to Address TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
                Visible = false;
            }
            field("Bill-to Address 2 TJP"; Rec."Bill-to Address 2 TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
                Visible = false;
            }
            field("Bill-to City TJP"; Rec."Bill-to City TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
                Visible = false;
            }
            field("Bill-to Post Code TJP"; Rec."Bill-to Post Code TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
                Visible = false;
            }
            field("Bill-to Cntry/Region Code TJP"; Rec."Bill-to Cntry/Region Code TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
                Visible = false;
            }
            field("Document Date TJP"; Rec."Document Date TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
            }
            field("Due Date TJP"; Rec."Due Date TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
            }
            field("Ext. Document No. TJP"; Rec."Ext. Document No. TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
            }
            field("Assigned User ID TJP"; Rec."Assigned User ID TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
            }
            field("Salesperson Code TJP"; Rec."Salesperson Code TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
            }
            field("Payment Terms Code TJP"; Rec."Payment Terms Code TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
            }
            field("Payment Method Code TJP"; Rec."Payment Method Code TJP")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
            }
            field("Posting Date TJP"; Rec."Posting Date")
            {
                ApplicationArea = All;
                ToolTip = 'TBD', Locked = true;
            }
        }
    }
}