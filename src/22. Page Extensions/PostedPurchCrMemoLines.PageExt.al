pageextension 70658700 "Posted Purch Cr Memo Lines TJP" extends "Posted Purchase Cr. Memo Lines"
{
    layout
    {
        addafter(Description)
        {
            field("Posting Date TJP"; Rec."Posting Date")
            {
                ApplicationArea = All;
                ToolTip = 'TBD';
            }
        }
    }
}