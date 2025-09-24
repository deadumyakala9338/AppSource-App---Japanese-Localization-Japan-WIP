#if AppSource
page 70658595 "APIL10N Vendors TJP"
#endif
#if OnPremise
page 99020 "APIL10N Vendors TJP"
#endif
{
    PageType = API;
    Caption = 'Vendors';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'vendorTJP';
    EntitySetName = 'vendorsTJP';
    SourceTable = "Vendor";
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
                field(bankFeeAdditionTJP; Rec."Bank Fee Addition TJP")
                {
                    Caption = 'Bank Fee Addition TJP';
                }
                field(outstandingPNotesTJP; Rec."Outstanding PNotes TJP")
                {
                    Caption = 'Outstanding PNotes TJP';
                }
                field(bankFeeVendorPayTJP; Rec."Bank Fee Vendor Pay TJP")
                {
                    Caption = 'Bank Fee Vendor Pay TJP';
                }
                field(bankFeeThresholdVenPayTJP; Rec."BankFee Threshold Ven. Pay TJP")
                {
                    Caption = 'BankFee Threshold Ven. Pay TJP';
                }
            }
        }
    }
}