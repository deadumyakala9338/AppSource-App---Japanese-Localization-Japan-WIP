#if AppSource
page 70658598 "APIL10N G/L Accounts TJP"
#endif
#if OnPremise
page 99023 "APIL10N G/L Accounts TJP"
#endif
{
    PageType = API;
    Caption = 'G/L Accounts';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'glAccountTJP';
    EntitySetName = 'glAccountsTJP';
    SourceTable = "G/L Account";
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
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(nameJapaneseTJP; Rec."Name (Japanese) TJP")
                {
                    Caption = 'Name (Japanese) TJP';
                }
                field(vatBPGFilterTJP; Rec."VAT BPG Filter TJP")
                {
                    Caption = 'VAT BPG Filter TJP';
                }
                field(vatPPGFilterTJP; Rec."VAT PPG Filter TJP")
                {
                    Caption = 'VAT PPG Filter TJP';
                }
            }
        }
    }
}