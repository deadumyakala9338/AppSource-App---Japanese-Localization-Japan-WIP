#if AppSource
page 70658591 "APIL10N VAT Entries TJP"
#endif
#if OnPremise
page 99016 "APIL10N VAT Entries TJP"
#endif
{
    PageType = API;
    Caption = 'VAT Entries';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'vatEntryTJP';
    EntitySetName = 'vatEntriesTJP';
    SourceTable = "VAT Entry";
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
                field(noTypeTJP; Rec."No. Type TJP")
                {
                    Caption = 'No. Type TJP';
                }
                field(billPayToNoExtendedTJP; Rec."Bill/Pay-to No. (Extended) TJP")
                {
                    Caption = 'Bill/Pay-to No. (Extended) TJP';
                }
            }
        }
    }
}