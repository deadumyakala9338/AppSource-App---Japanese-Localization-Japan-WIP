#if AppSource
tableextension 70658592 "Sales Line TJP" extends "Sales Line"
{
    fields
    {
        field(70658575; "Document Date TJP"; Date)
        {
            Caption = 'Document Date';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Document Date" where("No." = field("Document No.")));
        }
        field(70658576; "Order Date TJP"; Date)
        {
            Caption = 'Order Date';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Order Date" where("No." = field("Document No.")));
        }
        field(70658577; "Due Date TJP"; Date)
        {
            Caption = 'Due Date';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Due Date" where("No." = field("Document No.")));
        }
        field(70658578; "Ext. Document No. TJP"; Code[35])
        {
            Caption = 'External Document No.';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."External Document No." where("No." = field("Document No.")));
        }
        field(70658579; "Assigned User ID TJP"; Code[50])
        {
            Caption = 'Assigned User ID';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Assigned User ID" where("No." = field("Document No.")));
            TableRelation = "User Setup";
        }
        field(70658580; "Salesperson Code TJP"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Salesperson Code" where("No." = field("Document No.")));
        }
        field(70658581; "Status TJP"; Enum "Sales Document Status")
        {
            Caption = 'Status';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Status" where("No." = field("Document No.")));
        }
        field(70658582; "Sell-to Customer Name TJP"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Sell-to Customer Name" where("No." = field("Document No.")));
        }
        field(70658583; "Sell-to Address TJP"; Text[100])
        {
            Caption = 'Sell-to Address';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Sell-to Address" where("No." = field("Document No.")));
        }
        field(70658584; "Sell-to Address 2 TJP"; Text[50])
        {
            Caption = 'Sell-to Address 2';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Sell-to Address 2" where("No." = field("Document No.")));
        }
        field(70658585; "Sell-to City TJP"; Text[30])
        {
            Caption = 'Sell-to City';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Sell-to City" where("No." = field("Document No.")));
        }
        field(70658586; "Sell-to Post Code TJP"; Code[20])
        {
            Caption = 'Sell-to Post Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Sell-to Post Code" where("No." = field("Document No.")));
        }
        field(70658587; "Sell-to Cntry/Region Code TJP"; Code[10])
        {
            Caption = 'Sell-to Country/Region Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Sell-to Country/Region Code" where("No." = field("Document No.")));
        }
        field(70658588; "Bill-to Name TJP"; Text[100])
        {
            Caption = 'Bill-to Name';
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Bill-to Name" where("No." = field("Document No.")));
        }
        field(70658589; "Bill-to Address TJP"; Text[100])
        {
            Caption = 'Bill-to Address';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Bill-to Address" where("No." = field("Document No.")));
        }
        field(70658590; "Bill-to Address 2 TJP"; Text[50])
        {
            Caption = 'Bill-to Address 2';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Bill-to Address 2" where("No." = field("Document No.")));
        }
        field(70658591; "Bill-to City TJP"; Text[30])
        {
            Caption = 'Bill-to City';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Bill-to City" where("No." = field("Document No.")));
        }
        field(70658592; "Bill-to Post Code TJP"; Code[20])
        {
            Caption = 'Bill-to Post Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Bill-to Post Code" where("No." = field("Document No.")));
        }
        field(70658593; "Bill-to Cntry/Region Code TJP"; Code[10])
        {
            Caption = 'Bill-to Country/Region Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Bill-to Country/Region Code" where("No." = field("Document No.")));
        }
        field(70658594; "Payment Terms Code TJP"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Payment Terms Code" where("No." = field("Document No.")));
        }
        field(70658595; "Payment Method Code TJP"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Payment Method Code" where("No." = field("Document No.")));
        }
    }
}
#endif

#if OnPremise
tableextension 99017 "Sales Line TJP" extends "Sales Line"
{
    fields
    {
        field(99000; "Document Date TJP"; Date)
        {
            Caption = 'Document Date';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Document Date" where("No." = field("Document No.")));
        }
        field(99001; "Order Date TJP"; Date)
        {
            Caption = 'Order Date';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Order Date" where("No." = field("Document No.")));
        }
        field(99002; "Due Date TJP"; Date)
        {
            Caption = 'Due Date';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Due Date" where("No." = field("Document No.")));
        }
        field(99003; "Ext. Document No. TJP"; Code[35])
        {
            Caption = 'External Document No.';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."External Document No." where("No." = field("Document No.")));
        }
        field(99004; "Assigned User ID TJP"; Code[50])
        {
            Caption = 'Assigned User ID';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Assigned User ID" where("No." = field("Document No.")));
            TableRelation = "User Setup";
        }
        field(99005; "Salesperson Code TJP"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Salesperson Code" where("No." = field("Document No.")));
        }
        field(99006; "Status TJP"; Enum "Sales Document Status")
        {
            Caption = 'Status';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Status" where("No." = field("Document No.")));
        }
        field(99007; "Sell-to Customer Name TJP"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Sell-to Customer Name" where("No." = field("Document No.")));
        }
        field(99008; "Sell-to Address TJP"; Text[100])
        {
            Caption = 'Sell-to Address';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Sell-to Address" where("No." = field("Document No.")));
        }
        field(99009; "Sell-to Address 2 TJP"; Text[50])
        {
            Caption = 'Sell-to Address 2';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Sell-to Address 2" where("No." = field("Document No.")));
        }
        field(99010; "Sell-to City TJP"; Text[30])
        {
            Caption = 'Sell-to City';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Sell-to City" where("No." = field("Document No.")));
        }
        field(99011; "Sell-to Post Code TJP"; Code[20])
        {
            Caption = 'Sell-to Post Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Sell-to Post Code" where("No." = field("Document No.")));
        }
        field(99012; "Sell-to Cntry/Region Code TJP"; Code[10])
        {
            Caption = 'Sell-to Country/Region Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Sell-to Country/Region Code" where("No." = field("Document No.")));
        }
        field(99013; "Bill-to Name TJP"; Text[100])
        {
            Caption = 'Bill-to Name';
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Bill-to Name" where("No." = field("Document No.")));
        }
        field(99014; "Bill-to Address TJP"; Text[100])
        {
            Caption = 'Bill-to Address';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Bill-to Address" where("No." = field("Document No.")));
        }
        field(99015; "Bill-to Address 2 TJP"; Text[50])
        {
            Caption = 'Bill-to Address 2';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Bill-to Address 2" where("No." = field("Document No.")));
        }
        field(99016; "Bill-to City TJP"; Text[30])
        {
            Caption = 'Bill-to City';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Bill-to City" where("No." = field("Document No.")));
        }
        field(99017; "Bill-to Post Code TJP"; Code[20])
        {
            Caption = 'Bill-to Post Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Bill-to Post Code" where("No." = field("Document No.")));
        }
        field(99018; "Bill-to Cntry/Region Code TJP"; Code[10])
        {
            Caption = 'Bill-to Country/Region Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Bill-to Country/Region Code" where("No." = field("Document No.")));
        }
        field(99019; "Payment Terms Code TJP"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Payment Terms Code" where("No." = field("Document No.")));
        }
        field(99020; "Payment Method Code TJP"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Payment Method Code" where("No." = field("Document No.")));
        }
    }
}
#endif