#if AppSource
codeunit 70658595 "Event Subs Gen. Jnl. Batch TJP"
#endif
#if OnPremise
codeunit 99009 "Event Subs Gen. Jnl. Batch TJP"
#endif
{
    //
    // Remove attachment when the batch is deleted
    //
    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Batch", 'OnAfterDeleteEvent', '', false, false)]
    local procedure TableGenJournalBatchOnAfterDeleteEvent(var Rec: Record "Gen. Journal Batch"; RunTrigger: Boolean)
    var
        CompanyInformationRec: Record "Company Information";
        DocumentAttachmentRec: Record "Document Attachment";
        JournalTemplateNameInText: Text[10];
        JournalBatchNameInText: Text[10];
        No: Code[20];
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        JournalTemplateNameInText := PadStr(Rec."Journal Template Name", 10, ' ');
        JournalBatchNameInText := PadStr(Rec.Name, 10, ' ');
        Evaluate(No, JournalTemplateNameInText + JournalBatchNameInText);
        DocumentAttachmentRec.SetRange("Table ID", Database::"Gen. Journal Batch");
        DocumentAttachmentRec.SetRange("No.", No);
        DocumentAttachmentRec.SetRange("Document Type", Enum::"Attachment Document Type"::" TJP");
        if DocumentAttachmentRec.Find('-') = true then
            repeat
                DocumentAttachmentRec.Delete(true);
            until DocumentAttachmentRec.Next() = 0;
    end;

    //
    // Copy attachments from General Journal Batch to G/L Register
    //
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterFinishPosting', '', true, true)]
    local procedure CodeunitGenJnlPostLineOnAfterFinishPosting(var GlobalGLEntry: Record "G/L Entry"; var GLRegister: Record "G/L Register";
                                                               var IsTransactionConsistent: Boolean; var GenJournalLine: Record "Gen. Journal Line")
    var
        CompanyInformationRec: Record "Company Information";
        DocumentAttachmentFromRec: Record "Document Attachment";
        DocumentAttachmentToRec: Record "Document Attachment";
        JournalTemplateNameInText: Text[10];
        JournalBatchNameInText: Text[10];
        NoFrom: Code[20];
        NoTo: Code[20];
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        JournalTemplateNameInText := PadStr(GenJournalLine."Journal Template Name", 10, ' ');
        JournalBatchNameInText := PadStr(GenJournalLine."Journal Batch Name", 10, ' ');
        Evaluate(NoFrom, JournalTemplateNameInText + JournalBatchNameInText);
        DocumentAttachmentFromRec.SetRange("Table ID", Database::"Gen. Journal Batch");
        DocumentAttachmentFromRec.SetRange("No.", NoFrom);
        DocumentAttachmentFromRec.SetRange("Document Type", DocumentAttachmentFromRec."Document Type"::" TJP");
        if DocumentAttachmentFromRec.Find('-') = true then
            repeat
                DocumentAttachmentToRec.Init();
                DocumentAttachmentToRec.TransferFields(DocumentAttachmentFromRec);
                DocumentAttachmentToRec.Validate("Table ID", Database::"G/L Register");
                Evaluate(NoTo, Format(GLRegister."No."));
                DocumentAttachmentToRec.Validate("No.", NoTo);
                DocumentAttachmentToRec.Validate("Document Type", DocumentAttachmentToRec."Document Type"::" TJP");
                if DocumentAttachmentToRec.Insert(true) = true then
                    DocumentAttachmentFromRec.Delete(true);
            until DocumentAttachmentFromRec.Next() = 0;
    end;
}