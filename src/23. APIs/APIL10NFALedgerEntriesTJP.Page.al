#if AppSource
page 70658584 "APIL10N FA Ledger Entries TJP"
#endif
#if OnPremise
page 99009 "APIL10N FA Ledger Entries TJP"
#endif
{
    PageType = API;
    Caption = 'FA Ledger Entries';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'faLedgerEntryTJP';
    EntitySetName = 'faLedgerEntriesTJP';
    SourceTable = "FA Ledger Entry";
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
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                }
                field(deprMethodExtendedTJP; Rec."Depr. Method (Extended) TJP")
                {
                    Caption = 'Depr. Method (Extended) TJP';
                }
            }
        }
    }
}