#if AppSource
page 70658581 "APIL10N Promissory Notes TJP"
#endif
#if OnPremise
page 99006 "APIL10N Promissory Notes TJP"
#endif
{
    PageType = API;
    Caption = 'Promissory Notes';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'promissoryNoteTJP';
    EntitySetName = 'promissoryNotesTJP';
    SourceTable = "Promissory Note TJP";
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
                field(issuerType; Rec."Issuer Type")
                {
                    Caption = 'Issuer Type';
                }
                field(issuerNo; Rec."Issuer No.")
                {
                    Caption = 'Issuer No.';
                }
                field(issuerName; Rec."Issuer Name")
                {
                    Caption = 'Issuer Name';
                }
                field(issueDate; Rec."Issue Date")
                {
                    Caption = 'Issue Date';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(bankAccountCode; Rec."Bank Account Code")
                {
                    Caption = 'Bank Account Code';
                }
                field(bankName; Rec."Bank Name")
                {
                    Caption = 'Bank Name';
                }
                field(customerBankAccountCode; Rec."Customer Bank Account Code")
                {
                    Caption = 'Customer Bank Account Code';
                }
                field(customerBankName; Rec."Customer Bank Name")
                {
                    Caption = 'Customer Bank Name';
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                }
                field(endorser; Rec.Endorser)
                {
                    Caption = 'Endorser';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(glAccountNo; Rec."G/L Account No.")
                {
                    Caption = 'G/L Account No.';
                }
                field(type; Rec.Type)
                {
                    Caption = 'Type';
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                }
                field(documentStatus; Rec."Document Status")
                {
                    Caption = 'Document Status';
                }
                field(transactionStatus; Rec."Transaction Status")
                {
                    Caption = 'Transaction Status';
                }
            }
        }
    }
}