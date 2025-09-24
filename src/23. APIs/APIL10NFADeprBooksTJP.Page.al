#if AppSource
page 70658590 "APIL10N FA Depr Books TJP"
#endif
#if OnPremise
page 99015 "APIL10N FA Depr Books TJP"
#endif
{
    PageType = API;
    Caption = 'FA Depreciation Books';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'faDepreciationBookTJP';
    EntitySetName = 'faDepreciationBooksTJP';
    SourceTable = "FA Depreciation Book";
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
                field(faNo; Rec."FA No.")
                {
                    Caption = 'FA No.';
                }
                field(depreciationBookCode; Rec."Depreciation Book Code")
                {
                    Caption = 'Depreciation Book Code';
                }
                field(guaranteePercentTJP; Rec."Guarantee % TJP")
                {
                    Caption = 'Guarantee % TJP';
                }
                field(adjustmentDepreciationPercentTJP; Rec."Adjustment Depreciation % TJP")
                {
                    Caption = 'Adjustment Depreciation % TJP';
                }
                field(adjDeprAmountTJP; Rec."Adj. Depr. Amount TJP")
                {
                    Caption = 'Adj. Depr. Amount TJP';
                }
                field(depreciationYearsTJP; Rec."Depreciation Years TJP")
                {
                    Caption = 'Depreciation Years TJP';
                }
                field(straightLineDepr5PercentTJP; Rec."Straight Line Depr. 5 % TJP")
                {
                    Caption = 'Straight Line Depr. 5 % TJP';
                }
                field(adjDeprBaseAmountTJP; Rec."Adj. Depr. Base Amount TJP")
                {
                    Caption = 'Adj. Depr. Base Amount TJP';
                }
                field(jpDBTypeTJP; Rec."JPDB Type TJP")
                {
                    Caption = 'JPDB Type TJP';
                }
                field(deprMethodExtendedTJP; Rec."Depr. Method (Extended) TJP")
                {
                    Caption = 'Depr. Method (Extended) TJP';
                }
            }
        }
    }
}