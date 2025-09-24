#if AppSource
tableextension 70658579 VendTJP extends Vendor
{
    fields
    {
        field(70658575; "Bank Fee Addition TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Fee Addition';

            trigger OnValidate()
            begin
                if "Bank Fee Vendor Pay TJP" then
                    if NOT "Bank Fee Addition TJP" then
                        Error('Bank Fee caluclation match case not found:\Available cases\1. Bank Fee Addiotion=false and Bank Fee Vendor Pay=false\2. Bank Fee Addition=true and Bank Fee Vendor Pay=false\3.Bank Fee Addition=true and Bank Fee Vendor Pay=true');
            end;
        }
        field(70658576; "Outstanding PNotes TJP"; Decimal)
        {
            Caption = 'Outstanding Promissory Notes';
            FieldClass = FlowField;
            CalcFormula = Sum("Promissory Note TJP".Amount
                        WHERE("Issuer Type" = CONST(Vendor), "Issuer No." = FIELD("No."),
                              "Document Status" = FILTER(Open | "Note Issued")
                             )
                             );
            Editable = false;
        }
        field(70658577; "Bank Fee Vendor Pay TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Fee Vendor Pay';

            trigger OnValidate()
            begin
                if "Bank Fee Vendor Pay TJP" then
                    if NOT "Bank Fee Addition TJP" then
                        Error('Bank Fee caluclation match not found:\Available cases\1. Bank Fee Addiotion=false and Bank Fee Vendor Pay=false\2. Bank Fee Addition=true and Bank Fee Vendor Pay=false\3.Bank Fee Addition=true and Bank Fee Vendor Pay=true');
            end;
        }
        field(70658578; "BankFee Threshold Ven. Pay TJP"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Fee Threshold Vendor Pay';
        }
    }
}
#endif

#if OnPremise
tableextension 99004 VendTJP extends Vendor
{
    fields
    {
        field(99000; "Bank Fee Addition TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Fee Addition';

            trigger OnValidate()
            begin
                if "Bank Fee Vendor Pay TJP" then
                    if NOT "Bank Fee Addition TJP" then
                        Error('Bank Fee caluclation match case not found:\Available cases\1. Bank Fee Addiotion=false and Bank Fee Vendor Pay=false\2. Bank Fee Addition=true and Bank Fee Vendor Pay=false\3.Bank Fee Addition=true and Bank Fee Vendor Pay=true');
            end;
        }
        field(99001; "Outstanding PNotes TJP"; Decimal)
        {
            Caption = 'Outstanding Promissory Notes';
            FieldClass = FlowField;
            CalcFormula = Sum("Promissory Note TJP".Amount
                        WHERE("Issuer Type" = CONST(Vendor), "Issuer No." = FIELD("No."),
                              "Document Status" = FILTER(Open | "Note Issued")
                             )
                             );
            Editable = false;
        }
        field(99002; "Bank Fee Vendor Pay TJP"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Fee Vendor Pay';

            trigger OnValidate()
            begin
                if "Bank Fee Vendor Pay TJP" then
                    if NOT "Bank Fee Addition TJP" then
                        Error('Bank Fee caluclation match not found:\Available cases\1. Bank Fee Addiotion=false and Bank Fee Vendor Pay=false\2. Bank Fee Addition=true and Bank Fee Vendor Pay=false\3.Bank Fee Addition=true and Bank Fee Vendor Pay=true');
            end;
        }
        field(99003; "BankFee Threshold Ven. Pay TJP"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Fee Threshold Vendor Pay';
        }
    }
}
#endif