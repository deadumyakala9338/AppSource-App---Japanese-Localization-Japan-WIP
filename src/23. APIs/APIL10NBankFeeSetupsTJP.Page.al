#if AppSource
page 70658583 "APIL10N Bank Fee Setups TJP"
#endif
#if OnPremise
page 99008 "APIL10N Bank Fee Setups TJP"
#endif
{
    PageType = API;
    Caption = 'Bank Fee Setups';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'bankFeeSetupTJP';
    EntitySetName = 'bankFeeSetupsTJP';
    SourceTable = "Bank Fee Setup TJP";
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
                field(bankAccountNo; Rec."Bank Account No.")
                {
                    Caption = 'Bank Account No.';
                }
                field(payeeBankType; Rec."Payee Bank Type")
                {
                    Caption = 'Payee Bank Type';
                }
                field(paymentAmountFrom; Rec."Payment Amount From")
                {
                    Caption = 'Payment Amount From';
                }
                field(bankFee; Rec."Bank Fee")
                {
                    Caption = 'Bank Fee';
                }
            }
        }
    }
}