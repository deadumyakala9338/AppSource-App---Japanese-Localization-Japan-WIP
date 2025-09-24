#if AppSource
tableextension 70658596 "FA Posting Group TJP" extends "FA Posting Group"
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
tableextension 99021 "FA Posting Group TJP" extends "FA Posting Group"
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