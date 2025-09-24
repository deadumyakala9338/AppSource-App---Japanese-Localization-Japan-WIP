#if AppSource
tableextension 70658593 VATProdPostingGrpTJP extends "VAT Product Posting Group"
{
    fields
    {
        field(70658575; "Reduced Tax TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Reduced Tax';
        }
    }
}
#endif

#if OnPremise
tableextension 99018 VATProdPostingGrpTJP extends "VAT Product Posting Group"
{
    fields
    {
        field(99000; "Reduced Tax TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Reduced Tax';
        }
    }
}
#endif