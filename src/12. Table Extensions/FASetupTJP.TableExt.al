#if AppSource
tableextension 70658590 FASetupTJP extends "FA Setup"
{
    fields
    {
        field(70658575; "FA Rounding Type TJP"; Enum "FA Rounding Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'FA Rounding Type';
        }
        field(70658576; "FA Rounding Precision TJP"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'FA Rounding Precision';
            InitValue = 1;
        }
        field(70658577; "Use Non-Jpn FA Depn Method TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Use Non-Japanese FA Depreciation Method';
        }
    }
}
#endif

#if OnPremise
tableextension 99015 FASetupTJP extends "FA Setup"
{
    fields
    {
        field(99000; "FA Rounding Type TJP"; Enum "FA Rounding Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'FA Rounding Type';
        }
        field(99001; "FA Rounding Precision TJP"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'FA Rounding Precision';
            InitValue = 1;
        }
        field(99002; "Use Non-Jpn FA Depn Method TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Use Non-Japanese FA Depreciation Method';
        }        
    }
}
#endif