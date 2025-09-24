#if AppSource
tableextension 70658583 GLSetupTJP extends "General Ledger Setup"
{
    fields
    {
        field(70658575; "Address Format (Extended) TJP"; Enum "Address Format (Extended) TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Address Format (Extended)';
        }
        field(70658576; "P-Note Default Batch TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'P-Note Default Batch';
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("P-Note Default Template TJP"));
        }
        field(70658577; "P-Note Default Template TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'P-Note Default Template';
            TableRelation = "Gen. Journal Template".Name WHERE(Type = CONST(General), Recurring = CONST(false));
        }
        field(70658578; "P-Note on Hand Account TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'P-Note on Hand Account';
            TableRelation = "G/L Account"."No.";
        }
        field(70658579; "P-Note Receivables Nos. TJP"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'P-Note Receivables Nos.';
            TableRelation = "No. Series";
        }
        field(70658580; "P-Note Payables Nos. TJP"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'P-Note Payables Nos.';
            TableRelation = "No. Series";
        }
    }
}
#endif

#if OnPremise
tableextension 99008 GLSetupTJP extends "General Ledger Setup"
{
    fields
    {
        field(99000; "Address Format (Extended) TJP"; Enum "Address Format (Extended) TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Address Format (Extended)';
        }
        field(99001; "P-Note Default Batch TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'P-Note Default Batch';
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("P-Note Default Template TJP"));
        }
        field(99002; "P-Note Default Template TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'P-Note Default Template';
            TableRelation = "Gen. Journal Template".Name WHERE(Type = CONST(General), Recurring = CONST(false));
        }
        field(99003; "P-Note on Hand Account TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'P-Note on Hand Account';
            TableRelation = "G/L Account"."No.";
        }
        field(99004; "P-Note Receivables Nos. TJP"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'P-Note Receivables Nos.';
            TableRelation = "No. Series";
        }
        field(99005; "P-Note Payables Nos. TJP"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'P-Note Payables Nos.';
            TableRelation = "No. Series";
        }
    }
}
#endif