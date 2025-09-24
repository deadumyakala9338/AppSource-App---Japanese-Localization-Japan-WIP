#if AppSource
page 70658589 "APIL10N Vendor Bank Accts TJP"
#endif
#if OnPremise
page 99014 "APIL10N Vendor Bank Accts TJP"
#endif
{
    PageType = API;
    Caption = 'Vendor Bank Accounts';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'vendorBankAccountTJP';
    EntitySetName = 'vendorBankAccountsTJP';
    SourceTable = "Vendor Bank Account";
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
                field(vendorNo; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                }
                field(code; Rec.Code)
                {
                    Caption = 'Code';
                }
                field(defaultBankTJP; Rec."Default Bank TJP")
                {
                    Caption = 'Default Bank TJP';
                }
                field(zenginBankBranchNoTJP; Rec."Zengin Bank Branch No. TJP")
                {
                    Caption = 'Zengin Bank Branch No. TJP';
                }
                field(zenginBankNameKanaTJP; Rec."Zengin Bank Name Kana TJP")
                {
                    Caption = 'Zengin Bank Name Kana TJP';
                }
                field(zenginBranchNameKanaTJP; Rec."Zengin Branch Name Kana TJP")
                {
                    Caption = 'Zengin Branch Name Kana TJP';
                }
                field(zenginAccountTypeTJP; Rec."Zengin Account Type TJP")
                {
                    Caption = 'Zengin Account Type TJP';
                }
                field(zenginBankAccountNoTJP; Rec."Zengin Bank Account No. TJP")
                {
                    Caption = 'Zengin Bank Account No. TJP';
                }
                field(zenginAccountHolderKanaTJP; Rec."Zengin Account Holder Kana TJP")
                {
                    Caption = 'Zengin Account Holder Kana TJP';
                }
            }
        }
    }
}