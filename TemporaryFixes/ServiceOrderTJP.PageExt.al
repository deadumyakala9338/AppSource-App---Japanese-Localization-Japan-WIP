#if AppSource
pageextension 70658598 "Service Order TJP" extends "Service Order"
#endif
#if OnPremise
pageextension 99022 "Service Order TJP" extends "Service Order"
#endif
{
    layout
    {
        addbefore(Control1902018507)
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
