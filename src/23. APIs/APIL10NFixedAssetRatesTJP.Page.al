#if AppSource
page 70658582 "APIL10N Fixed Asset Rates TJP"
#endif
#if OnPremise
page 99007 "APIL10N Fixed Asset Rates TJP"
#endif
{
    PageType = API;
    Caption = 'Fixed Asset Rates';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'fixedAssetRateTJP';
    EntitySetName = 'fixedAssetRatesTJP';
    SourceTable = "Fixed Asset Rates TJP";
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
                field(numberOfYears; Rec."Number of Years")
                {
                    Caption = 'Number of Years';
                }
                field(straightLineRate; Rec."Straight-Line Rate")
                {
                    Caption = 'Straight-Line Rate';
                }
                field(dbRate; Rec."DB Rate")
                {
                    Caption = 'DB Rate';
                }
                field(adjustDepreciation; Rec."Adjust Depreciation")
                {
                    Caption = 'Adjust Depreciation';
                }
                field(guaranteePercent; Rec."Guarantee %")
                {
                    Caption = 'Guarantee %';
                }
                field(jpDBType; Rec."JPDB Type")
                {
                    Caption = 'JPDB Type';
                }
            }
        }
    }
}