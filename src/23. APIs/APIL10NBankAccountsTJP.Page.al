#if AppSource
page 70658586 "APIL10N Bank Accounts TJP"
#endif
#if OnPremise
page 99011 "APIL10N Bank Accounts TJP"
#endif
{
    PageType = API;
    Caption = 'Bank Accounts';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'bankAccountTJP';
    EntitySetName = 'bankAccountsTJP';
    SourceTable = "Bank Account";
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
                field(pNoteReceivableAccountTJP; Rec."P.Note Receivable Account TJP")
                {
                    Caption = 'P.Note Receivable Account TJP';
                }
                field(pNotePayableAccountTJP; Rec."P.Note Payable Account TJP")
                {
                    Caption = 'P.Note Payable Account TJP';
                }
                field(pNoteDiscountedAccountTJP; Rec."P.Note Discounted Account TJP")
                {
                    Caption = 'P.Note Discounted Account TJP';
                }
                field(pNoteRecDiscAccountTJP; Rec."P.Note Rec. Disc. Account TJP")
                {
                    Caption = 'P.Note Rec. Disc. Account TJP';
                }
                field(pNoteDishonoredAccountTJP; Rec."P.Note Dishonored Account TJP")
                {
                    Caption = 'P.Note Dishonored Account TJP';
                }
                field(companyCodeTJP; Rec."Company Code TJP")
                {
                    Caption = 'Company Code TJP';
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