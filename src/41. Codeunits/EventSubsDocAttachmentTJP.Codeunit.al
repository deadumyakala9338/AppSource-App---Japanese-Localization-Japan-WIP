#if AppSource
codeunit 70658594 "Event Subs Doc Attachment TJP"
#endif
#if OnPremise
codeunit 99008 "Event Subs Doc Attachment TJP"
#endif
{
    //
    // Filter the list depending on the table the attachment is related to
    //
    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure PageDocumentAttachmentDetailsOnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment";
                                                                      var RecRef: RecordRef;
                                                                      var FlowFieldsEditable: Boolean)
    var
        CompanyInformationRec: Record "Company Information";
        FieldReference: FieldRef;
        JournalTemplateName: Code[10];
        Name: Code[10];
        JournalTemplateNameInText: Text[10];
        NameInText: Text[10];
        No: Code[20];
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        case RecRef.Number of
            Database::"G/L Register":    // Table 45
                begin
                    FieldReference := RecRef.Field(1);
                    No := FieldReference.Value;
                    DocumentAttachment.SetRange("No.", No);
                    DocumentAttachment.SetRange("Document Type", DocumentAttachment."Document Type"::" TJP");
                end;
            Database::"Gen. Journal Batch":    // Table 232
                begin
                    FieldReference := RecRef.Field(1);
                    JournalTemplateName := FieldReference.Value;
                    FieldReference := RecRef.Field(2);
                    Name := FieldReference.Value;
                    Evaluate(JournalTemplateNameInText, JournalTemplateName);
                    Evaluate(NameInText, Name);
                    JournalTemplateNameInText := PadStr(JournalTemplateNameInText, 10, ' ');
                    NameInText := PadStr(NameInText, 10, ' ');
                    Evaluate(No, JournalTemplateNameInText + NameInText);
                    DocumentAttachment.SetRange("No.", No);
                    DocumentAttachment.SetRange("Document Type", DocumentAttachment."Document Type"::" TJP");
                end;
        end;
    end;

    //
    // Set key fields
    //
    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]
    local procedure TableDocumentAttachmentOnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment";
                                                                       var RecRef: RecordRef)
    var
        CompanyInformationRec: Record "Company Information";
        FieldReference: FieldRef;
        JournalTemplateName: Code[10];
        Name: Code[10];
        JournalTemplateNameInText: Text[10];
        NameInText: Text[10];
        No: Code[20];
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        case RecRef.Number of
            Database::"G/L Register":    // Table 45
                begin
                    FieldReference := RecRef.Field(1);
                    Evaluate(No, FieldReference.Value);
                    DocumentAttachment.Validate("No.", No);
                    DocumentAttachment."Document Type" := DocumentAttachment."Document Type"::" TJP";
                end;
            Database::"Gen. Journal Batch":    // Table 232
                begin
                    FieldReference := RecRef.Field(1);
                    JournalTemplateName := FieldReference.Value;
                    FieldReference := RecRef.Field(2);
                    Name := FieldReference.Value;
                    Evaluate(JournalTemplateNameInText, JournalTemplateName);
                    Evaluate(NameInText, Name);
                    JournalTemplateNameInText := PadStr(JournalTemplateNameInText, 10, ' ');
                    NameInText := PadStr(NameInText, 10, ' ');
                    Evaluate(No, JournalTemplateNameInText + NameInText);
                    DocumentAttachment.Validate("No.", No);
                    DocumentAttachment."Document Type" := DocumentAttachment."Document Type"::" TJP";
                end;
        end;
    end;
}