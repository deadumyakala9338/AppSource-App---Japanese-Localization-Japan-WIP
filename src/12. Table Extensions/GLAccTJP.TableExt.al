#if AppSource
tableextension 70658576 GLAccTJP extends "G/L Account"
{
    fields
    {
        field(70658575; "Name (Japanese) TJP"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Name (Japanese)';
        }
        field(70658576; "VAT BPG Filter TJP"; Code[20])
        {
            Caption = 'VAT BPG Filter';
            FieldClass = FlowFilter;
            TableRelation = "VAT Business Posting Group".Code;
        }
        field(70658577; "VAT PPG Filter TJP"; Code[20])
        {
            Caption = 'VAT PPG Filter';
            FieldClass = FlowFilter;
            TableRelation = "VAT Product Posting Group".Code;
        }
        field(70658578; "Gen. Posting Type Filter TJP"; Enum "General Posting Type")
        {
            Caption = 'Gen. Posting Type Filter';
            FieldClass = FlowFilter;
        }
        field(70658579; "Amount (for Tax) TJP"; Decimal)
        {
            Caption = 'Amount (for Tax)';
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("No."), "G/L Account No." = field(filter(Totaling)),
                              "Gen. Posting Type" = field("Gen. Posting Type Filter TJP"), "VAT Bus. Posting Group" = field("VAT BPG Filter TJP"),
                              "VAT Prod. Posting Group" = field("VAT PPG Filter TJP"), "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"), "Posting Date" = field("Date Filter")));
        }
        field(70658580; "VAT Amount (for Tax) TJP"; Decimal)
        {
            Caption = 'VAT Amount (for Tax)';
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry"."VAT Amount" where("G/L Account No." = field("No."), "G/L Account No." = field(filter(Totaling)),
                              "Gen. Posting Type" = field("Gen. Posting Type Filter TJP"), "VAT Bus. Posting Group" = field("VAT BPG Filter TJP"),
                              "VAT Prod. Posting Group" = field("VAT PPG Filter TJP"), "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"), "Posting Date" = field("Date Filter")));
        }
        field(70658581; "Non Amount (for Tax) TJP"; Decimal)
        {
            Caption = 'Non Amount (for Tax)';
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("No."), "G/L Account No." = field(filter(Totaling)),
                              "Gen. Posting Type" = field("Gen. Posting Type Filter TJP"), "VAT Bus. Posting Group" = field("VAT BPG Filter TJP"),
                              "VAT Prod. Posting Group" = field("VAT PPG Filter TJP"), "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"), "Posting Date" = field("Date Filter"), "VAT Amount" = const(0)));
        }
    }
}
#endif

#if OnPremise
tableextension 99001 GLAccTJP extends "G/L Account"
{
    fields
    {
        field(99000; "Name (Japanese) TJP"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Name (Japanese)';
        }
        field(99001; "VAT BPG Filter TJP"; Code[20])
        {
            Caption = 'VAT BPG Filter';
            FieldClass = FlowFilter;
            TableRelation = "VAT Business Posting Group".Code;
        }
        field(99002; "VAT PPG Filter TJP"; Code[20])
        {
            Caption = 'VAT PPG Filter';
            FieldClass = FlowFilter;
            TableRelation = "VAT Product Posting Group".Code;
        }
        field(99003; "Gen. Posting Type Filter TJP"; Enum "General Posting Type")
        {
            Caption = 'Gen. Posting Type Filter';
            FieldClass = FlowFilter;
        }
        field(99004; "Amount (for Tax) TJP"; Decimal)
        {
            Caption = 'Amount (for Tax)';
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("No."), "G/L Account No." = field(filter(Totaling)),
                              "Gen. Posting Type" = field("Gen. Posting Type Filter TJP"), "VAT Bus. Posting Group" = field("VAT BPG Filter TJP"),
                              "VAT Prod. Posting Group" = field("VAT PPG Filter TJP"), "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"), "Posting Date" = field("Date Filter")));
        }
        field(99005; "VAT Amount (for Tax) TJP"; Decimal)
        {
            Caption = 'VAT Amount (for Tax)';
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry"."VAT Amount" where("G/L Account No." = field("No."), "G/L Account No." = field(filter(Totaling)),
                              "Gen. Posting Type" = field("Gen. Posting Type Filter TJP"), "VAT Bus. Posting Group" = field("VAT BPG Filter TJP"),
                              "VAT Prod. Posting Group" = field("VAT PPG Filter TJP"), "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"), "Posting Date" = field("Date Filter")));
        }
        field(99006; "Non Amount (for Tax) TJP"; Decimal)
        {
            Caption = 'Non Amount (for Tax)';
            FieldClass = FlowField;
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("No."), "G/L Account No." = field(filter(Totaling)),
                              "Gen. Posting Type" = field("Gen. Posting Type Filter TJP"), "VAT Bus. Posting Group" = field("VAT BPG Filter TJP"),
                              "VAT Prod. Posting Group" = field("VAT PPG Filter TJP"), "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"), "Posting Date" = field("Date Filter"), "VAT Amount" = const(0)));
        }
    }
}
#endif