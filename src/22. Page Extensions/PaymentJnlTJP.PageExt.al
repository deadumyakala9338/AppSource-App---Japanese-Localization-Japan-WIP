#if AppSource
pageextension 70658585 PaymentJnlTJP extends "Payment Journal"
#endif
#if OnPremise
pageextension 99009 PaymentJnlTJP extends "Payment Journal"
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
        addafter("Account No.")
        {
            field("Vendor Bank Account TJP"; Rec."Vendor Bank Account TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies Vendor bank account code for selected vendor.';
                Visible = TheCompanyIsInJapan;
            }
            field("Bank Fee TJP"; Rec."Bank Fee Calculated TJP")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the bank remittance for money transfer.';
                Visible = TheCompanyIsInJapan;
            }
        }
    }
    actions
    {
        addbefore(ExportPaymentsToFile_Promoted)
        {
#if not RemoveOldZenginFileExport
            actionref(ZenginFileExportTJP_Promoted; ZenginFileExportTJP)
            {
                ObsoleteState = Pending;
                ObsoleteTag = '20.0';
                ObsoleteReason = 'V2 is ready.';
            }
#endif
            actionref(ZenginFileExportV2TJP_Promoted; ZenginFileExportV2TJP)
            {
            }
        }
        addlast(processing)
        {
            group(ZenginTJP)
            {
                Caption = 'Zengin';
                Visible = TheCompanyIsInJapan;

#if not RemoveOldZenginFileExport
                action(ZenginFileExportTJP)
                {
                    Caption = 'Generate AutoPayment File';
                    ToolTip = 'Generate a file to electronically instruct your bank to transfer funds from your bank account to your supplier bank account using files that are.';
                    ApplicationArea = All;
                    Image = ExportFile;
                    Ellipsis = true;
                    Visible = false;
                    ObsoleteState = Pending;
                    ObsoleteTag = '20.0';
                    ObsoleteReason = 'V2 is ready.';

                    trigger OnAction()
                    var
                        GenerateFirmBank: Report "Gen. FirmBanking Pmt. File TJP";
                    begin
                        GenerateFirmBank.ErrorValidation(Rec."Journal Template Name", Rec."Journal Batch Name", Rec."Bal. Account No.", Rec."Posting Date");
                        GenerateFirmBank.SetBatchTemplate(Rec."Journal Template Name", Rec."Journal Batch Name", Rec."Bal. Account No.", Rec."Posting Date");
                        GenerateFirmBank.RunModal();
                    end;
                }
#endif
                action(ZenginFileExportV2TJP)
                {
                    Caption = 'Generate AutoPayment File';
                    ToolTip = 'Generate a payment request text file in Zengin format.';
                    ApplicationArea = All;
                    Image = ExportFile;
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        GenerateFirmBank: Report "Gen Firm Banking Pmt F V2 TJP";
                    begin
                        GenerateFirmBank.ErrorValidation(Rec."Journal Template Name", Rec."Journal Batch Name", Rec."Bal. Account No.", Rec."Posting Date");
                        GenerateFirmBank.SetBatchTemplate(Rec."Journal Template Name", Rec."Journal Batch Name", Rec."Bal. Account No.", Rec."Posting Date");
                        GenerateFirmBank.RunModal();
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