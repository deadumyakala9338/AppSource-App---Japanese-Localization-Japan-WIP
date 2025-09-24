#if AppSource
pageextension 70658679 "General Journal Batches TJP" extends "General Journal Batches"
#endif
#if OnPremise
pageextension 99028 "General Journal Batches TJP" extends "General Journal Batches"
#endif
{
    layout
    {
        addafter(Description)
        {
            field(AttachmentsExistTJP; AttachmentsExist)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies if the batch has attachments or not.';
                Caption = 'Attachments';
                Visible = TheCompanyIsInJapan;
            }
        }
    }
    actions
    {
        addfirst(Navigation)
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
        JournalTemplateNameInText: Text[10];
        NameInText: Text[10];
        No: Code[20];
    begin
        JournalTemplateNameInText := PadStr(Rec."Journal Template Name", 10, ' ');
        NameInText := PadStr(Rec.Name, 10, ' ');
        Evaluate(No, JournalTemplateNameInText + NameInText);
        DocumentAttachmentRec.SetRange("Table ID", Database::"Gen. Journal Batch");
        DocumentAttachmentRec.SetRange("No.", No);
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