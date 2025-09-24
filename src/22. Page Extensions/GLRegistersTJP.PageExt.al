#if AppSource
pageextension 70658678 "G/L Registers TJP" extends "G/L Registers"
#endif
#if OnPremise
pageextension 99027 "G/L Registers TJP" extends "G/L Registers"
#endif
{
    layout
    {
        addafter("Journal Batch Name")
        {
            field(AttachmentsExistTJP; AttachmentsExist)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies if the G/L Register entry has attachments or not.';
                Caption = 'Attachments';
                Visible = TheCompanyIsInJapan;
            }
        }
    }
    actions
    {
        addafter("&Register")
        {
            action(AttachDocumentsTJP)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                Image = Attachments;
                Visible = TheCompanyIsInJapan;

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecordReference: RecordRef;
                begin
                    RecordReference.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecordReference);
                    DocumentAttachmentDetails.RunModal();
                end;
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

    trigger OnAfterGetRecord()
    var
        DocumentAttachmentRec: Record "Document Attachment";
    begin
        DocumentAttachmentRec.SetRange("Table ID", Database::"G/L Register");
        DocumentAttachmentRec.SetRange("No.", Format(Rec."No."));
        DocumentAttachmentRec.SetRange("Document Type", Enum::"Attachment Document Type"::" TJP");
        if DocumentAttachmentRec.IsEmpty = false then
            AttachmentsExist := true
        else
            AttachmentsExist := false;
    end;

    var
        TheCompanyIsInJapan: Boolean;
        AttachmentsExist: Boolean;
}