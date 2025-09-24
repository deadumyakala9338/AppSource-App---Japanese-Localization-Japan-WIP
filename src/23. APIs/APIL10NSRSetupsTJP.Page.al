#if AppSource
page 70658587 "APIL10N S&R Setups TJP"
#endif
#if OnPremise
page 99012 "APIL10N S&R Setups TJP"
#endif
{
    PageType = API;
    Caption = 'Sales & Receivables Setups';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'srSetupTJP';
    EntitySetName = 'srSetupsTJP';
    SourceTable = "Sales & Receivables Setup";
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
                field(collInvoiceBaseDateTJP; Rec."Coll. Invoice Base Date TJP")
                {
                    Caption = 'Coll. Invoice Base Date TJP';
                }
                field(colInvCopyIdentifier1TJP; Rec."Col. Inv. Copy Identifier1 TJP")
                {
                    Caption = 'Col. Inv. Copy Identifier1 TJP';
                }
                field(colInvCopyIdentifier2TJP; Rec."Col. Inv. Copy Identifier2 TJP")
                {
                    Caption = 'Col. Inv. Copy Identifier2 TJP';
                }
                field(colInvCopyIdentifier3TJP; Rec."Col. Inv. Copy Identifier3 TJP")
                {
                    Caption = 'Col. Inv. Copy Identifier3 TJP';
                }
                field(colInvNoOfCopiesTJP; Rec."Col. Inv. No. of Copies TJP")
                {
                    Caption = 'Col. Inv. No. of Copies TJP';
                }
            }
        }
    }
}