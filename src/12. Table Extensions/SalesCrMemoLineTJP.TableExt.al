#if AppSource
tableextension 70658603 "Sales Cr.Memo Line TJP" extends "Sales Cr.Memo Line"
{
    fields
    {
        field(70658575; "Document Date TJP"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(70658577; "Due Date TJP"; Date)
        {
            Caption = 'Due Date';
            DataClassification = CustomerContent;
        }
        field(70658578; "Ext. Document No. TJP"; Code[35])
        {
            Caption = 'External Document No.';
            DataClassification = CustomerContent;
        }
        field(70658579; "Assigned User ID TJP"; Code[50])
        {
            Caption = 'Assigned User ID';
            TableRelation = "User Setup";
            DataClassification = CustomerContent;
        }
        field(70658580; "Salesperson Code TJP"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }
        field(70658582; "Sell-to Customer Name TJP"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(70658583; "Sell-to Address TJP"; Text[100])
        {
            Caption = 'Sell-to Address';
            DataClassification = CustomerContent;
        }
        field(70658584; "Sell-to Address 2 TJP"; Text[50])
        {
            Caption = 'Sell-to Address 2';
            DataClassification = CustomerContent;
        }
        field(70658585; "Sell-to City TJP"; Text[30])
        {
            Caption = 'Sell-to City';
            DataClassification = CustomerContent;
        }
        field(70658586; "Sell-to Post Code TJP"; Code[20])
        {
            Caption = 'Sell-to Post Code';
            DataClassification = CustomerContent;
        }
        field(70658587; "Sell-to Cntry/Region Code TJP"; Code[10])
        {
            Caption = 'Sell-to Country/Region Code';
            DataClassification = CustomerContent;
        }
        field(70658588; "Bill-to Name TJP"; Text[100])
        {
            Caption = 'Bill-to Name';
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(70658589; "Bill-to Address TJP"; Text[100])
        {
            Caption = 'Bill-to Address';
            DataClassification = CustomerContent;
        }
        field(70658590; "Bill-to Address 2 TJP"; Text[50])
        {
            Caption = 'Bill-to Address 2';
            DataClassification = CustomerContent;
        }
        field(70658591; "Bill-to City TJP"; Text[30])
        {
            Caption = 'Bill-to City';
            DataClassification = CustomerContent;
        }
        field(70658592; "Bill-to Post Code TJP"; Code[20])
        {
            Caption = 'Bill-to Post Code';
            DataClassification = CustomerContent;
        }
        field(70658593; "Bill-to Cntry/Region Code TJP"; Code[10])
        {
            Caption = 'Bill-to Country/Region Code';
            DataClassification = CustomerContent;
        }
        field(70658594; "Payment Terms Code TJP"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
            DataClassification = CustomerContent;
        }
        field(70658595; "Payment Method Code TJP"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
            DataClassification = CustomerContent;
        }
        field(70658596; "Sell-to Customer Name 2 TJP"; Text[100])
        {
            Caption = 'Sell-to Customer Name 2';
            DataClassification = CustomerContent;
        }
        field(70658597; "Bill-to Name 2 TJP"; Text[100])
        {
            Caption = 'Bill-to Name 2';
            DataClassification = CustomerContent;
        }
    }
}
#endif

#if OnPremise
tableextension 99028 "Sales Cr.Memo Line TJP" extends "Sales Cr.Memo Line"
{
    fields
    {
        field(99000; "Document Date TJP"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(99001; "Due Date TJP"; Date)
        {
            Caption = 'Due Date';
            DataClassification = CustomerContent;
        }
        field(99002; "Ext. Document No. TJP"; Code[35])
        {
            Caption = 'External Document No.';
            DataClassification = CustomerContent;
        }
        field(99003; "Assigned User ID TJP"; Code[50])
        {
            Caption = 'Assigned User ID';
            TableRelation = "User Setup";
            DataClassification = CustomerContent;
        }
        field(99004; "Salesperson Code TJP"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }
        field(99005; "Sell-to Customer Name TJP"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(99006; "Sell-to Address TJP"; Text[100])
        {
            Caption = 'Sell-to Address';
            DataClassification = CustomerContent;
        }
        field(99007; "Sell-to Address 2 TJP"; Text[50])
        {
            Caption = 'Sell-to Address 2';
            DataClassification = CustomerContent;
        }
        field(99008; "Sell-to City TJP"; Text[30])
        {
            Caption = 'Sell-to City';
            DataClassification = CustomerContent;
        }
        field(99009; "Sell-to Post Code TJP"; Code[20])
        {
            Caption = 'Sell-to Post Code';
            DataClassification = CustomerContent;
        }
        field(99010; "Sell-to Cntry/Region Code TJP"; Code[10])
        {
            Caption = 'Sell-to Country/Region Code';
            DataClassification = CustomerContent;
        }
        field(99011; "Bill-to Name TJP"; Text[100])
        {
            Caption = 'Bill-to Name';
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(99012; "Bill-to Address TJP"; Text[100])
        {
            Caption = 'Bill-to Address';
            DataClassification = CustomerContent;
        }
        field(99013; "Bill-to Address 2 TJP"; Text[50])
        {
            Caption = 'Bill-to Address 2';
            DataClassification = CustomerContent;
        }
        field(99014; "Bill-to City TJP"; Text[30])
        {
            Caption = 'Bill-to City';
            DataClassification = CustomerContent;
        }
        field(99015; "Bill-to Post Code TJP"; Code[20])
        {
            Caption = 'Bill-to Post Code';
            DataClassification = CustomerContent;
        }
        field(99016; "Bill-to Cntry/Region Code TJP"; Code[10])
        {
            Caption = 'Bill-to Country/Region Code';
            DataClassification = CustomerContent;
        }
        field(99017; "Payment Terms Code TJP"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
            DataClassification = CustomerContent;
        }
        field(99018; "Payment Method Code TJP"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
            DataClassification = CustomerContent;
        }
        field(99019; "Sell-to Customer Name 2 TJP"; Text[100])
        {
            Caption = 'Sell-to Customer Name 2';
            DataClassification = CustomerContent;
        }
        field(99020; "Bill-to Name 2 TJP"; Text[100])
        {
            Caption = 'Bill-to Name 2';
            DataClassification = CustomerContent;
        }
    }
}
#endif