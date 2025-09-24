tableextension 70658607 "Transfer Line TJP" extends "Transfer Line"
{
    fields
    {
        field(70658575; "Transfer-from Name TJP"; Text[100])
        {
            Caption = 'Transfer-from Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Transfer-from Name" where("No." = field("Document No.")));
        }
        field(70658576; "Transfer-from Name 2 TJP"; Text[50])
        {
            Caption = 'Transfer-from Name 2';
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Transfer-from Name 2" where("No." = field("Document No.")));
        }
        field(70658577; "Transfer-from Address TJP"; Text[100])
        {
            Caption = 'Transfer-from Address';
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Transfer-from Address" where("No." = field("Document No.")));
        }
        field(70658578; "Transfer-from Address 2 TJP"; Text[50])
        {
            Caption = 'Transfer-from Address 2';
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Transfer-from Address 2" where("No." = field("Document No.")));
        }
        field(70658579; "Transfer-from Post Code TJP"; Code[20])
        {
            Caption = 'Transfer-from Post Code';
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Transfer-from Post Code" where("No." = field("Document No.")));
        }
        field(70658580; "Transfer-from City TJP"; Text[30])
        {
            Caption = 'Transfer-from City';
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Transfer-from City" where("No." = field("Document No.")));
        }
        field(70658581; "Transfer-from County TJP"; Text[30])
        {
            Caption = 'Transfer-from County';
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Transfer-from County" where("No." = field("Document No.")));
        }
        field(70658582; "Trsf.-from CountryReg Code TJP"; Code[10])
        {
            Caption = 'Trsf.-from Country/Region Code';
            TableRelation = "Country/Region";
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Trsf.-from Country/Region Code" where("No." = field("Document No.")));
        }
        field(70658584; "Transfer-to Name TJP"; Text[100])
        {
            Caption = 'Transfer-to Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Transfer-to Name" where("No." = field("Document No.")));
        }
        field(70658585; "Transfer-to Name 2 TJP"; Text[50])
        {
            Caption = 'Transfer-to Name 2';
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Transfer-to Name 2" where("No." = field("Document No.")));
        }
        field(70658586; "Transfer-to Address TJP"; Text[100])
        {
            Caption = 'Transfer-to Address';
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Transfer-to Address" where("No." = field("Document No.")));
        }
        field(70658587; "Transfer-to Address 2 TJP"; Text[50])
        {
            Caption = 'Transfer-to Address 2';
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Transfer-to Address 2" where("No." = field("Document No.")));
        }
        field(70658588; "Transfer-to Post Code TJP"; Code[20])
        {
            Caption = 'Transfer-to Post Code';
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Transfer-to Post Code" where("No." = field("Document No.")));
        }
        field(70658589; "Transfer-to City TJP"; Text[30])
        {
            Caption = 'Transfer-to City';
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Transfer-to City" where("No." = field("Document No.")));
        }
        field(70658590; "Transfer-to County TJP"; Text[30])
        {
            Caption = 'Transfer-to County';
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Transfer-to County" where("No." = field("Document No.")));
        }
        field(70658591; "Trsf.-to CountryReg Code TJP"; Code[10])
        {
            Caption = 'Trsf.-to Country/Region Code';
            TableRelation = "Country/Region";
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Trsf.-to Country/Region Code" where("No." = field("Document No.")));
        }
        field(70658592; "Posting Date TJP"; Date)
        {
            Caption = 'Posting Date';
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Posting Date" where("No." = field("Document No.")));
        }
        field(70658593; "Assigned User ID TJP"; Code[50])
        {
            Caption = 'Assigned User ID';
            TableRelation = "User Setup";
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Header"."Assigned User ID" where("No." = field("Document No.")));
        }
    }
}