#if AppSource
tableextension 70658582 "Purchase Line TJP" extends "Purchase Line"
{
    fields
    {
        field(70658700; "Document Date TJP"; Date)
        {
            Caption = 'Document Date';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Document Date" where("No." = field("Document No.")));
        }
        field(70658701; "Due Date TJP"; Date)
        {
            Caption = 'Due Date';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Due Date" where("No." = field("Document No.")));
        }
        field(70658702; "Vendor Invoice No. TJP"; Code[35])
        {
            Caption = 'Vendor Invoice No.';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Vendor Invoice No." where("No." = field("Document No.")));
        }
        field(70658703; "Vendor Order No. TJP"; Code[35])
        {
            Caption = 'Vendor Order No.';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Vendor Order No." where("No." = field("Document No.")));
        }
        field(70658704; "Payment Terms Code TJP"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Payment Terms Code" where("No." = field("Document No.")));
        }
        field(70658705; "Payment Method Code TJP"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Payment Method Code" where("No." = field("Document No.")));
        }
        field(70658706; "Assigned User ID TJP"; Code[50])
        {
            Caption = 'Assigned User ID';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Assigned User ID" where("No." = field("Document No.")));
            TableRelation = "User Setup";
        }
        field(70658707; "Purchaser Code TJP"; Code[20])
        {
            Caption = 'Purchaser Code';
            TableRelation = "Salesperson/Purchaser";
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Purchaser Code" where("No." = field("Document No.")));
        }
        field(70658708; "Status TJP"; Enum "Sales Document Status")
        {
            Caption = 'Status';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Status" where("No." = field("Document No.")));
        }
        field(70658709; "Buy-from Vendor Name TJP"; Text[100])
        {
            Caption = 'Buy-from Vendor Name';
            TableRelation = Vendor.Name;
            ValidateTableRelation = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Buy-from Vendor Name" where("No." = field("Document No.")));
        }
        field(70658710; "Buy-from Address TJP"; Text[100])
        {
            Caption = 'Buy-from Address';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Buy-from Address" where("No." = field("Document No.")));
        }
        field(70658711; "Buy-from Address 2 TJP"; Text[50])
        {
            Caption = 'Buy-from Address 2';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Buy-from Address 2" where("No." = field("Document No.")));
        }
        field(70658712; "Buy-from City TJP"; Text[30])
        {
            Caption = 'Buy-from City';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Buy-from City" where("No." = field("Document No.")));
        }
        field(70658713; "Buy-from Post Code TJP"; Code[20])
        {
            Caption = 'Buy-from Post Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Buy-from Post Code" where("No." = field("Document No.")));
        }
        field(70658714; "Buy-from Cntry/Region Code TJP"; Code[10])
        {
            Caption = 'Buy-from Country/Region Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Buy-from Country/Region Code" where("No." = field("Document No.")));
        }
        field(70658715; "Pay-to Name TJP"; Text[100])
        {
            Caption = 'Pay-to Name';
            TableRelation = Vendor.Name;
            ValidateTableRelation = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Pay-to Name" where("No." = field("Document No.")));
        }
        field(70658716; "Pay-to Address TJP"; Text[100])
        {
            Caption = 'Pay-to Address';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Pay-to Address" where("No." = field("Document No.")));
        }
        field(70658717; "Pay-to Address 2 TJP"; Text[50])
        {
            Caption = 'Pay-to Address 2';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Pay-to Address 2" where("No." = field("Document No.")));
        }
        field(70658718; "Pay-to City TJP"; Text[30])
        {
            Caption = 'Pay-to City';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Pay-to City" where("No." = field("Document No.")));
        }
        field(70658719; "Pay-to Post Code TJP"; Code[20])
        {
            Caption = 'Pay-to Post Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Pay-to Post Code" where("No." = field("Document No.")));
        }
        field(70658720; "Pay-to Country/Region Code TJP"; Code[10])
        {
            Caption = 'Pay-to Country/Region Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Pay-to Country/Region Code" where("No." = field("Document No.")));
        }

    }
}
#endif

#if OnPremise
tableextension 99007 "Purchase Line TJP" extends "Purchase Line"
{
    fields
    {
        field(99000; "Document Date TJP"; Date)
        {
            Caption = 'Document Date';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Document Date" where("No." = field("Document No.")));
        }
        field(99001; "Due Date TJP"; Date)
        {
            Caption = 'Due Date';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Due Date" where("No." = field("Document No.")));
        }
        field(99002; "Vendor Invoice No. TJP"; Code[35])
        {
            Caption = 'Vendor Invoice No.';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Vendor Invoice No." where("No." = field("Document No.")));
        }
        field(99003; "Vendor Order No. TJP"; Code[35])
        {
            Caption = 'Vendor Order No.';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Vendor Order No." where("No." = field("Document No.")));
        }
        field(99004; "Payment Terms Code TJP"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Payment Terms Code" where("No." = field("Document No.")));
        }
        field(99005; "Payment Method Code TJP"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Payment Method Code" where("No." = field("Document No.")));
        }
        field(99006; "Assigned User ID TJP"; Code[50])
        {
            Caption = 'Assigned User ID';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Assigned User ID" where("No." = field("Document No.")));
            TableRelation = "User Setup";
        }
        field(99007; "Purchaser Code TJP"; Code[20])
        {
            Caption = 'Purchaser Code';
            TableRelation = "Salesperson/Purchaser";
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Purchaser Code" where("No." = field("Document No.")));
        }
        field(99008; "Status TJP"; Enum "Sales Document Status")
        {
            Caption = 'Status';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Status" where("No." = field("Document No.")));
        }
        field(99009; "Buy-from Vendor Name TJP"; Text[100])
        {
            Caption = 'Buy-from Vendor Name';
            TableRelation = Vendor.Name;
            ValidateTableRelation = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Buy-from Vendor Name" where("No." = field("Document No.")));
        }
        field(99010; "Buy-from Address TJP"; Text[100])
        {
            Caption = 'Buy-from Address';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Buy-from Address" where("No." = field("Document No.")));
        }
        field(99011; "Buy-from Address 2 TJP"; Text[50])
        {
            Caption = 'Buy-from Address 2';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Buy-from Address 2" where("No." = field("Document No.")));
        }
        field(99012; "Buy-from City TJP"; Text[30])
        {
            Caption = 'Buy-from City';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Buy-from City" where("No." = field("Document No.")));
        }
        field(99013; "Buy-from Post Code TJP"; Code[20])
        {
            Caption = 'Buy-from Post Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Buy-from Post Code" where("No." = field("Document No.")));
        }
        field(99014; "Buy-from Cntry/Region Code TJP"; Code[10])
        {
            Caption = 'Buy-from Country/Region Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Buy-from Country/Region Code" where("No." = field("Document No.")));
        }
        field(99015; "Pay-to Name TJP"; Text[100])
        {
            Caption = 'Pay-to Name';
            TableRelation = Vendor.Name;
            ValidateTableRelation = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Pay-to Name" where("No." = field("Document No.")));
        }
        field(99016; "Pay-to Address TJP"; Text[100])
        {
            Caption = 'Pay-to Address';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Pay-to Address" where("No." = field("Document No.")));
        }
        field(99017; "Pay-to Address 2 TJP"; Text[50])
        {
            Caption = 'Pay-to Address 2';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Pay-to Address 2" where("No." = field("Document No.")));
        }
        field(99018; "Pay-to City TJP"; Text[30])
        {
            Caption = 'Pay-to City';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Pay-to City" where("No." = field("Document No.")));
        }
        field(99019; "Pay-to Post Code TJP"; Code[20])
        {
            Caption = 'Pay-to Post Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Pay-to Post Code" where("No." = field("Document No.")));
        }
        field(99020; "Pay-to Country/Region Code TJP"; Code[10])
        {
            Caption = 'Pay-to Country/Region Code';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header"."Pay-to Country/Region Code" where("No." = field("Document No.")));
        }

    }
}
#endif