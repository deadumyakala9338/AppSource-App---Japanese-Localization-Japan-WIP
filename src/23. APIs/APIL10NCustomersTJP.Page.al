#if AppSource
page 70658596 "APIL10N Customers TJP"
#endif
#if OnPremise
page 99021 "APIL10N Customers TJP"
#endif
{
    PageType = API;
    Caption = 'Customers';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'customerTJP';
    EntitySetName = 'customersTJP';
    SourceTable = Customer;
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
                field(outstandingPNotesTJP; Rec."Outstanding PNotes TJP")
                {
                    Caption = 'Outstanding PNotes TJP';
                }
                field(collectiveInvoiceDateTJP; Rec."Collective Invoice Date TJP")
                {
                    Caption = 'Collective Invoice Date TJP';
                }
            }
        }
    }
}