#if AppSource
tableextension 70658589 FALedEntryTJP extends "FA Ledger Entry"
{
    fields
    {
        field(70658575; "Depr. Method (Extended) TJP"; Enum "Depreciation Method (Extended) TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Depreciation Method (Extended)';
        }
    }
}
#endif

#if OnPremise
tableextension 99014 FALedEntryTJP extends "FA Ledger Entry"
{
    fields
    {
        field(99000; "Depr. Method (Extended) TJP"; Enum "Depreciation Method (Extended) TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Depreciation Method (Extended)';
        }
    }
}
#endif