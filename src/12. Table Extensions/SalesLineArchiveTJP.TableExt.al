#if AppSource
tableextension 70658599 "Sales Line Archive TJP" extends "Sales Line Archive"
{
    fields
    {
        field(70658575; "Document Date TJP"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(70658576; "Order Date TJP"; Date)
        {
            Caption = 'Order Date';
            DataClassification = CustomerContent;
        }
        field(70658577; "Posting Date TJP"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(70658578; "Due Date TJP"; Date)
        {
            Caption = 'Due Date';
            DataClassification = CustomerContent;
        }
        field(70658579; "Ext. Document No. TJP"; Code[35])
        {
            Caption = 'External Document No.';
            DataClassification = CustomerContent;
        }
        field(70658580; "Assigned User ID TJP"; Code[50])
        {
            Caption = 'Assigned User ID';
            TableRelation = "User Setup";
            DataClassification = CustomerContent;
        }
        field(70658581; "Sell-to Customer Name TJP"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(70658582; "Sell-to Customer Name 2 TJP"; Text[100])
        {
            Caption = 'Sell-to Customer Name 2';
            TableRelation = Customer."Name 2";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(70658583; "Salesperson Code TJP"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }
        field(70658584; "Salesperson Name TJP"; Text[50])
        {
            Caption = 'Salesperson Name';
            TableRelation = "Salesperson/Purchaser".Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(70658585; "Status TJP"; Enum "Sales Document Status")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
    }
}
#endif

#if OnPremise
tableextension 99024 "Sales Line Archive TJP" extends "Sales Line Archive"
{
    fields
    {
        field(99000; "Document Date TJP"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(99001; "Order Date TJP"; Date)
        {
            Caption = 'Order Date';
            DataClassification = CustomerContent;
        }
        field(99002; "Posting Date TJP"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(99003; "Due Date TJP"; Date)
        {
            Caption = 'Due Date';
            DataClassification = CustomerContent;
        }
        field(99004; "Ext. Document No. TJP"; Code[35])
        {
            Caption = 'External Document No.';
            DataClassification = CustomerContent;
        }
        field(99005; "Assigned User ID TJP"; Code[50])
        {
            Caption = 'Assigned User ID';
            TableRelation = "User Setup";
            DataClassification = CustomerContent;
        }
        field(99006; "Sell-to Customer Name TJP"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(99007; "Sell-to Customer Name 2 TJP"; Text[100])
        {
            Caption = 'Sell-to Customer Name 2';
            TableRelation = Customer."Name 2";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(99008; "Salesperson Code TJP"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }
        field(99009; "Salesperson Name TJP"; Text[50])
        {
            Caption = 'Salesperson Name';
            TableRelation = "Salesperson/Purchaser".Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(99010; "Status TJP"; Enum "Sales Document Status")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
    }
}
#endif