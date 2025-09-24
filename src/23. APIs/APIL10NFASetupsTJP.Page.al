#if AppSource
page 70658588 "APIL10N FA Setups TJP"
#endif
#if OnPremise
page 99013 "APIL10N FA Setups TJP"
#endif
{
    PageType = API;
    Caption = 'FA Setups';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'faSetupTJP';
    EntitySetName = 'faSetupsTJP';
    SourceTable = "FA Setup";
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
                field(faRoundingTypeTJP; Rec."FA Rounding Type TJP")
                {
                    Caption = 'FA Rounding Type TJP';
                }
                field(faRoundingPrecisionTJP; Rec."FA Rounding Precision TJP")
                {
                    Caption = 'FA Rounding Precision TJP';
                }
            }
        }
    }
}