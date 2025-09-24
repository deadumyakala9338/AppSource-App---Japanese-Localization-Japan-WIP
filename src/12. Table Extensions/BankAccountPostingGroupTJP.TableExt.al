#if AppSource
tableextension 70658597 "Bank Account Posting Group TJP" extends "Bank Account Posting Group"
{
    fields
    {
        field(70658575; "Description TJP"; Text[100])
        {
            DataClassification = SystemMetadata;
            Caption = 'Description';
        }
    }
}
#endif

#if OnPremise
tableextension 99022 "Bank Account Posting Group TJP" extends "Bank Account Posting Group"
{
    fields
    {
        field(99000; "Description TJP"; Text[100])
        {
            DataClassification = SystemMetadata;
            Caption = 'Description';
        }
    }
}
#endif