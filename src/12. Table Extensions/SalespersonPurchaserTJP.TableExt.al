#if AppSource
tableextension 70658604 "Salesperson/Purchaser TJP" extends "Salesperson/Purchaser"
{
    fields
    {
        field(70658575; "Name (English) TJP"; Text[50])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Name (English)';
        }
    }
}
#endif

#if OnPremise
tableextension 99029 "Salesperson/Purchaser TJP" extends "Salesperson/Purchaser"
{
    fields
    {
        field(99000; "Name (English) TJP"; Text[50])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Name (English)';
        }
    }
}
#endif