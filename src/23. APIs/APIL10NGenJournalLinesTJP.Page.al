#if AppSource
page 70658593 "APIL10N Gen. Journal Lines TJP"
#endif
#if OnPremise
page 99018 "APIL10N Gen. Journal Lines TJP"
#endif
{
    PageType = API;
    Caption = 'Gen. Journal Lines';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'generalJournalLineTJP';
    EntitySetName = 'generalJournalLinesTJP';
    SourceTable = "Gen. Journal Line";
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    Extensible = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'ID';
                }
                field(journalTemplateName; Rec."Journal Template Name")
                {
                    Caption = 'Journal Template Name';
                }
                field(journalBatchName; Rec."Journal Batch Name")
                {
                    Caption = 'Journal Batch Name';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field(vendorBankAccountTJP; Rec."Vendor Bank Account TJP")
                {
                    Caption = 'Vendor Bank Account TJP';
                }
                field(vatExceptionTJP; Rec."VAT Exception TJP")
                {
                    Caption = 'VAT Exception TJP';
                }
                field(bankFeeCalculatedTJP; Rec."Bank Fee Calculated TJP")
                {
                    Caption = 'Bank Fee Calculated TJP';
                }
                field(promissoryNoteStatusTJP; Rec."Promissory Note Status TJP")
                {
                    Caption = 'Promissory Note Status TJP';
                }
                field(promissoryNoteNoTJP; Rec."Promissory Note No. TJP")
                {
                    Caption = 'Promissory Note No. TJP';
                }
                field(pNoteIssuerTypeTJP; Rec."PNote Issuer Type TJP")
                {
                    Caption = 'PNote Issuer Type TJP';
                }
            }
        }
    }
}