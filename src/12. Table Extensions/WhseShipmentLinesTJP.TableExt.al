#if AppSource
tableextension 70658601 "Whse. Shipment Lines TJP" extends "Warehouse Shipment Line"
{
    fields
    {
        field(70658575; "Assigned User ID TJP"; Code[50])
        {
            Caption = 'Assigned User ID';
            TableRelation = "User Setup";
            DataClassification = CustomerContent;
        }
        field(70658576; "Sell-to Customer No. TJP"; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }
        field(70658577; "Sell-to Customer Name TJP"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(70658578; "Sell-to Customer Name 2 TJP"; Text[100])
        {
            Caption = 'Sell-to Customer Name 2';
            TableRelation = Customer."Name 2";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(70658579; "Ship-to Name TJP"; Text[100])
        {
            Caption = 'Ship-to Name';
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(70658580; "Salesperson Code TJP"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }
        field(70658581; "Salesperson Name TJP"; Text[50])
        {
            Caption = 'Salesperson Name';
            TableRelation = "Salesperson/Purchaser".Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(70658582; "Posting Date TJP"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(70658583; "Order Date TJP"; Date)
        {
            Caption = 'Order Date';
            DataClassification = CustomerContent;
        }
        field(70658584; "Ext. Document No. TJP"; Code[35])
        {
            Caption = 'External Document No.';
            DataClassification = CustomerContent;
        }
        field(70658585; "Requested Delivery Date TJP"; Date)
        {
            Caption = 'Requested Delivery Date';
            DataClassification = CustomerContent;
        }
        field(70658586; "Promised Delivery Date TJP"; Date)
        {
            Caption = 'Promised Delivery Date';
            DataClassification = CustomerContent;
        }
        field(70658587; "Shipment Method Code TJP"; Code[10])
        {
            Caption = 'Shipment Method Code';
            TableRelation = "Shipment Method";
            DataClassification = CustomerContent;
        }
        field(70658588; "Shipment Method Desc. TJP"; Text[100])
        {
            Caption = 'Shipment Method Description';
            DataClassification = CustomerContent;
        }
        field(70658589; "Shipping Agent Code TJP"; Code[10])
        {
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
            DataClassification = CustomerContent;
        }
        field(70658590; "Shipping Agent Description TJP"; Text[100])
        {
            Caption = 'Shipping Agent Description';
            DataClassification = CustomerContent;
        }
        field(70658591; "Ship. Agent Service Code TJP"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code where("Shipping Agent Code" = field("Shipping Agent Code TJP"));
            DataClassification = CustomerContent;
        }
        field(70658592; "Ship. Agent Service Desc. TJP"; Text[100])
        {
            Caption = 'Shipping Agent Service Description';
            DataClassification = CustomerContent;
        }
        field(70658593; "Ship-to Code TJP"; Code[10])
        {
            Caption = 'Ship-to Code';
            DataClassification = CustomerContent;
        }
        field(70658594; "Ship-to Name 2 TJP"; Text[50])
        {
            Caption = 'Ship-to Name 2';
            DataClassification = CustomerContent;
        }
        field(70658595; "Ship-to Address TJP"; Text[100])
        {
            Caption = 'Ship-to Address';
            DataClassification = CustomerContent;
        }
        field(70658596; "Ship-to Address 2 TJP"; Text[50])
        {
            Caption = 'Ship-to Address 2';
            DataClassification = CustomerContent;
        }
        field(70658597; "Ship-to City TJP"; Text[30])
        {
            Caption = 'Ship-to City';
            DataClassification = CustomerContent;
        }
        field(70658598; "Ship-to Post Code TJP"; Code[20])
        {
            Caption = 'Ship-to Post Code';
            DataClassification = CustomerContent;
        }
        field(70658599; "Ship-to Cntry/Region Code TJP"; Code[10])
        {
            Caption = 'Ship-to Country/Region Code';
            DataClassification = CustomerContent;
        }
    }
}
#endif

#if OnPremise
tableextension 99026 "Whse. Shipment Lines TJP" extends "Warehouse Shipment Line"
{
    fields
    {
        field(99000; "Assigned User ID TJP"; Code[50])
        {
            Caption = 'Assigned User ID';
            TableRelation = "User Setup";
            DataClassification = CustomerContent;
        }
        field(99001; "Sell-to Customer No. TJP"; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }
        field(99002; "Sell-to Customer Name TJP"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(99003; "Sell-to Customer Name 2 TJP"; Text[100])
        {
            Caption = 'Sell-to Customer Name 2';
            TableRelation = Customer."Name 2";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(99004; "Ship-to Name TJP"; Text[100])
        {
            Caption = 'Ship-to Name';
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(99005; "Salesperson Code TJP"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }
        field(99006; "Salesperson Name TJP"; Text[50])
        {
            Caption = 'Salesperson Name';
            TableRelation = "Salesperson/Purchaser".Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(99007; "Posting Date TJP"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(99008; "Order Date TJP"; Date)
        {
            Caption = 'Order Date';
            DataClassification = CustomerContent;
        }
        field(99009; "Ext. Document No. TJP"; Code[35])
        {
            Caption = 'External Document No.';
            DataClassification = CustomerContent;
        }
        field(99010; "Requested Delivery Date TJP"; Date)
        {
            Caption = 'Requested Delivery Date';
            DataClassification = CustomerContent;
        }
        field(99011; "Promised Delivery Date TJP"; Date)
        {
            Caption = 'Promised Delivery Date';
            DataClassification = CustomerContent;
        }
        field(99012; "Shipment Method Code TJP"; Code[10])
        {
            Caption = 'Shipment Method Code';
            TableRelation = "Shipment Method";
            DataClassification = CustomerContent;
        }
        field(99013; "Shipment Method Desc. TJP"; Text[100])
        {
            Caption = 'Shipment Method Description';
            DataClassification = CustomerContent;
        }
        field(99014; "Shipping Agent Code TJP"; Code[10])
        {
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
            DataClassification = CustomerContent;
        }
        field(99015; "Shipping Agent Description TJP"; Text[100])
        {
            Caption = 'Shipping Agent Description';
            DataClassification = CustomerContent;
        }
        field(99016; "Ship. Agent Service Code TJP"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code where("Shipping Agent Code" = field("Shipping Agent Code TJP"));
            DataClassification = CustomerContent;
        }
        field(99017; "Ship. Agent Service Desc. TJP"; Text[100])
        {
            Caption = 'Shipping Agent Service Description';
            DataClassification = CustomerContent;
        }
        field(99018; "Ship-to Code TJP"; Code[10])
        {
            Caption = 'Ship-to Code';
            DataClassification = CustomerContent;
        }
        field(99019; "Ship-to Name 2 TJP"; Text[50])
        {
            Caption = 'Ship-to Name 2';
            DataClassification = CustomerContent;
        }
        field(99020; "Ship-to Address TJP"; Text[100])
        {
            Caption = 'Ship-to Address';
            DataClassification = CustomerContent;
        }
        field(99021; "Ship-to Address 2 TJP"; Text[50])
        {
            Caption = 'Ship-to Address 2';
            DataClassification = CustomerContent;
        }
        field(99022; "Ship-to City TJP"; Text[30])
        {
            Caption = 'Ship-to City';
            DataClassification = CustomerContent;
        }
        field(99023; "Ship-to Post Code TJP"; Code[20])
        {
            Caption = 'Ship-to Post Code';
            DataClassification = CustomerContent;
        }
        field(99024; "Ship-to Cntry/Region Code TJP"; Code[10])
        {
            Caption = 'Ship-to Country/Region Code';
            DataClassification = CustomerContent;
        }
    }
}
#endif