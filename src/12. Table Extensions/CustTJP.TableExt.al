#if AppSource
tableextension 70658578 CustTJP extends Customer
{
    fields
    {
        field(70658575; "Outstanding PNotes TJP"; Decimal)
        {
            Caption = 'Outstanding Promissory Notes';
            FieldClass = FlowField;
            CalcFormula = Sum("Promissory Note TJP".Amount
                        WHERE("Issuer Type" = CONST(Customer), "Issuer No." = FIELD("No."),
                              "Document Status" = FILTER(Open | "Note Received")
                             )
                             );
            Editable = false;
        }
        field(70658576; "Collective Invoice Date TJP"; Enum "Collective Invoice Date TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Collective Invoice Date';
        }
    }
}
#endif

#if OnPremise
tableextension 99003 CustTJP extends Customer
{
    fields
    {
        field(99000; "Outstanding PNotes TJP"; Decimal)
        {
            Caption = 'Outstanding Promissory Notes';
            FieldClass = FlowField;
            CalcFormula = Sum("Promissory Note TJP".Amount
                        WHERE("Issuer Type" = CONST(Customer), "Issuer No." = FIELD("No."),
                              "Document Status" = FILTER(Open | "Note Received")
                             )
                             );
            Editable = false;
        }
        field(99001; "Collective Invoice Date TJP"; Enum "Collective Invoice Date TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Collective Invoice Date';
        }
    }
}
#endif