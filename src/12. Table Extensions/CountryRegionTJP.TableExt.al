#if AppSource
tableextension 70658575 CountryRegionTJP extends "Country/Region"
{
    fields
    {
        field(70658575; "Address Format (Extended) TJP"; Enum "Address Format (Extended) TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Address Format (Extended)';
        }
    }
}
#endif

#if OnPremise
tableextension 99000 CountryRegionTJP extends "Country/Region"
{
    fields
    {
        field(99000; "Address Format (Extended) TJP"; Enum "Address Format (Extended) TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Address Format (Extended)';
        }
    }
}
#endif