#if AppSource
pageextension 70658597 "Service Order List TJP" extends "Service Orders"
#endif
#if OnPremise
pageextension 99021 "Service Order List TJP" extends "Service Orders"
#endif
{
    layout
    {
        addbefore(Control1900383207)
        {
            part("Attached Documents TJP"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(5900),
                              "No." = FIELD("No."),
                              "Document Type" = FIELD("Document Type");
            }
        }
    }
}
