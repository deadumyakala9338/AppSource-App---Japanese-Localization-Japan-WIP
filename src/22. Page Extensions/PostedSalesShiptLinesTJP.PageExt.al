pageextension 70658699 "Posted Sales Shipt Lines TJP" extends "Posted Sales Shipment Lines"
{
    layout
    {
        addafter("Sell-to Customer No.")
        {
            field("Posting Date TJP"; Rec."Posting Date")
            {
                ApplicationArea = All;
                ToolTip = 'TBD';
            }
        }
    }
}