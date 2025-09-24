#if AppSource
page 70658585 "APIL10N P&P Setups TJP"
#endif
#if OnPremise
page 99010 "APIL10N P&P Setups TJP"
#endif
{
    PageType = API;
    Caption = 'Purchases & Payables Setups';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'ppSetupTJP';
    EntitySetName = 'ppSetupsTJP';
    SourceTable = "Purchases & Payables Setup";
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
                field(bankFeeGLAccountNoTJP; Rec."Bank Fee G/L Account No. TJP")
                {
                    Caption = 'Bank Fee G/L Account No. TJP';
                }
            }
        }
    }
}