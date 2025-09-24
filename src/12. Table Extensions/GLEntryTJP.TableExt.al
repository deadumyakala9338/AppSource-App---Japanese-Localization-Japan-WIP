#if AppSource
tableextension 70658577 GLEntryTJP extends "G/L Entry"
{
    fields
    {
        field(70658575; "G/L Acc. Name (Japanese) TJP"; Text[100])
        {
            Caption = 'G/L Account Name (Japanese)';
            FieldClass = FlowField;
            CalcFormula = Lookup("G/L Account"."Name (Japanese) TJP" WHERE("No." = FIELD("G/L Account No.")));
            Editable = false;
        }
    }
    keys
    {
        key(Key1TJP; "G/L Account No.", "Gen. Posting Type", "VAT Bus. Posting Group", "VAT Prod. Posting Group",
                     "Global Dimension 1 Code", "Global Dimension 2 Code", "Posting Date", "VAT Amount")
        {
            SumIndexFields = Amount, "VAT Amount";
        }
    }
}
#endif

#if OnPremise
tableextension 99002 GLEntryTJP extends "G/L Entry"
{
    fields
    {
        field(99000; "G/L Acc. Name (Japanese) TJP"; Text[100])
        {
            Caption = 'G/L Account Name (Japanese)';
            FieldClass = FlowField;
            CalcFormula = Lookup("G/L Account"."Name (Japanese) TJP" WHERE("No." = FIELD("G/L Account No.")));
            Editable = false;
        }
    }
    keys
    {
        key(Key1TJP; "G/L Account No.", "Gen. Posting Type", "VAT Bus. Posting Group", "VAT Prod. Posting Group",
                     "Global Dimension 1 Code", "Global Dimension 2 Code", "Posting Date", "VAT Amount")
        {
            SumIndexFields = Amount, "VAT Amount";
        }
    }
}
#endif