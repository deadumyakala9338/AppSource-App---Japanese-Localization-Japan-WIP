#if AppSource
page 70658597 "APIL10N G/L Entries TJP"
#endif
#if OnPremise
page 99022 "APIL10N G/L Entries TJP"
#endif
{
    PageType = API;
    Caption = 'G/L Entries';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'glEntryTJP';
    EntitySetName = 'glEntriesTJP';
    SourceTable = "G/L Entry";
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
                field(glAccNameJapaneseTJP; Rec."G/L Acc. Name (Japanese) TJP")
                {
                    Caption = 'G/L Acc. Name (Japanese) TJP';
                }
            }
        }
    }
}