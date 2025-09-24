#if AppSource
page 70658592 "APIL10N Gen. Ledger Setups TJP"
#endif
#if OnPremise
page 99017 "APIL10N Gen. Ledger Setups TJP"
#endif
{
    PageType = API;
    Caption = 'General Ledger Setups';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'generalLedgerSetupTJP';
    EntitySetName = 'generalLedgerSetupsTJP';
    SourceTable = "General Ledger Setup";
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
                field(primaryKey; Rec."Primary Key")
                {
                    Caption = 'Primary Key';
                }
                field(addressFormatExtendedTJP; Rec."Address Format (Extended) TJP")
                {
                    Caption = 'Address Format (Extended) TJP';
                }
                field(pNoteDefaultBatchTJP; Rec."P-Note Default Batch TJP")
                {
                    Caption = 'P-Note Default Batch TJP';
                }
                field(pNoteDefaultTemplateTJP; Rec."P-Note Default Template TJP")
                {
                    Caption = 'P-Note Default Template TJP';
                }
                field(pNoteonHandAccountTJP; Rec."P-Note on Hand Account TJP")
                {
                    Caption = 'P-Note on Hand Account TJP';
                }
                field(pNoteReceivablesNosTJP; Rec."P-Note Receivables Nos. TJP")
                {
                    Caption = 'P-Note Receivables Nos. TJP';
                }
                field(pNotePayablesNosTJP; Rec."P-Note Payables Nos. TJP")
                {
                    Caption = 'P-Note Payables Nos. TJP';
                }
            }
        }
    }
}