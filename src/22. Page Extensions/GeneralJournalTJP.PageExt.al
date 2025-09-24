#if AppSource
pageextension 70658677 "General Journal TJP" extends "General Journal"
#endif
#if OnPremise
pageextension 99026 "General Journal TJP" extends "General Journal"
#endif
{
    layout
    {
        addafter(CurrentJnlBatchName)
        {
            field("Information About Attachment TJP"; InformationAboutAttachment)
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Attachment';
                ToolTip = 'Specifies if attachments exist for this batch.';
                Visible = TheCompanyIsInJapan;
            }
        }
    }

    actions
    {
        addlast(promoted)
        {
            group(ExcelUploadDownloadTJP_PromotedTJP)
            {
                Caption = 'Upload/Download';

                actionref(UploadFromExcelTJP_Promoted; UploadFromExcelTJP)
                {
                }
                actionref(DownloadToExcelTJP_Promoted; DownloadToExcelTJP)
                {
                }
            }
        }
        addlast("F&unctions")
        {
            group(ExcelUploadDownloadTJP)
            {
                Caption = 'Upload/Download';
                Image = Excel;
                Visible = TheCompanyIsInJapan;

                action(UploadFromExcelTJP)
                {
                    ApplicationArea = All;
                    Caption = 'Upload from Excel';
                    ToolTip = 'Upload journal lines from Excel.';
                    Image = Excel;

                    trigger OnAction()
                    var
                        GenJournalLineRec: Record "Gen. Journal Line";
                        GenJnlULDLTJP: Codeunit "Gen. Jnl.-UL/DL TJP";
                    begin
                        GenJnlULDLTJP.UploadGeneralJournalFromExcel(Rec."Journal Template Name", Rec."Journal Batch Name");
                        GenJournalLineRec.SetRange("Journal Template Name", Rec."Journal Template Name");
                        GenJournalLineRec.SetRange("Journal Batch Name", Rec."Journal Batch Name");
                        if GenJournalLineRec.IsEmpty = false then
                            Rec.FindFirst();
                    end;
                }
                action(DownloadToExcelTJP)
                {
                    ApplicationArea = All;
                    Caption = 'Download to Excel';
                    ToolTip = 'Download journal lines to Excel.';
                    Image = Excel;

                    trigger OnAction()
                    var
                        GenJnlULDLTJP: Codeunit "Gen. Jnl.-UL/DL TJP";
                    begin
                        GenJnlULDLTJP.DownloadGeneralJournalToExcel(Rec."Journal Template Name", Rec."Journal Batch Name");
                    end;
                }
            }
        }
        addafter(Approvals)
        {
            action(AttachmentsTJP)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                Image = Attachments;
                Visible = TheCompanyIsInJapan;

                trigger OnAction()
                var
                    GenJournalBatchRec: Record "Gen. Journal Batch";
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecordReference: RecordRef;
                begin
                    GenJournalBatchRec.SetRange("Journal Template Name", Rec."Journal Template Name");
                    GenJournalBatchRec.SetRange(Name, Rec."Journal Batch Name");
                    GenJournalBatchRec.FindFirst();
                    RecordReference.GetTable(GenJournalBatchRec);
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

    trigger OnAfterGetCurrRecord()
    var
        DocumentAttachmentRec: Record "Document Attachment";
        JournalTemplateNameInText: Text[10];
        JournalBatchNameInText: Text[10];
        No: Code[20];
    begin
        JournalTemplateNameInText := PadStr(Rec."Journal Template Name", 10, ' ');
        JournalBatchNameInText := PadStr(Rec."Journal Batch Name", 10, ' ');
        Evaluate(No, JournalTemplateNameInText + JournalBatchNameInText);
        DocumentAttachmentRec.SetRange("Table ID", Database::"Gen. Journal Batch");
        DocumentAttachmentRec.SetRange("No.", No);
        DocumentAttachmentRec.SetRange("Document Type", Enum::"Attachment Document Type"::" TJP");
        if DocumentAttachmentRec.IsEmpty = false then
            InformationAboutAttachment := InformationAboutAttachmentYesLbl
        else
            InformationAboutAttachment := InformationAboutAttachmentNoLbl;
    end;

    var
        TheCompanyIsInJapan: Boolean;
        InformationAboutAttachment: Text[5];
        InformationAboutAttachmentYesLbl: Label 'Yes';
        InformationAboutAttachmentNoLbl: Label 'No';
}