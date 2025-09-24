#if AppSource
tableextension 70658588 PPSetupTJP extends "Purchases & Payables Setup"
{
    fields
    {
        field(70658575; "Bank Fee G/L Account No. TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Fee G/L Account No.';
            TableRelation = "G/L Account";
        }
        field(70658576; "Allow Attach After Post TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Allow Addition/Deletion Of Attachments After Post';
        }
        field(70658577; "ShowEachPmtJnlLineZengin TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Show Each Payment Journal Line (Zengin File)';
        }
    }
}
#endif

#if OnPremise
tableextension 99013 PPSetupTJP extends "Purchases & Payables Setup"
{
    fields
    {
        field(99000; "Bank Fee G/L Account No. TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Fee G/L Account No.';
            TableRelation = "G/L Account";
        }
        field(99001; "Allow Attach After Post TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Allow Addition/Deletion Of Attachments After Post';
        }
        field(99002; "ShowEachPmtJnlLineZengin TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Show Each Payment Journal Line (Zengin File)';
        }
    }
}
#endif