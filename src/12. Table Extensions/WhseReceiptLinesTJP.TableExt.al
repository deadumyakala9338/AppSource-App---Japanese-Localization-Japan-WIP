#if AppSource
tableextension 70658600 "Whse. Receipt Lines TJP" extends "Warehouse Receipt Line"
{
    fields
    {
        field(70658575; "Assigned User ID TJP"; Code[50])
        {
            Caption = 'Assigned User ID';
            TableRelation = "User Setup";
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
        field(70658578; "Requested Receipt Date TJP"; Date)
        {
            Caption = 'Requested Receipt Date';
            DataClassification = CustomerContent;
        }
        field(70658579; "Promised Receipt Date TJP"; Date)
        {
            Caption = 'Promised Receipt Date';
            DataClassification = CustomerContent;
        }
        field(70658580; "Buy-from Vendor No. TJP"; Code[20])
        {
            Caption = 'Buy-from Vendor No.';
            TableRelation = Vendor;
            DataClassification = CustomerContent;
        }
        field(70658581; "Buy-from Vendor Name TJP"; Text[100])
        {
            Caption = 'Buy-from Vendor Name';
            TableRelation = Vendor.Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(70658582; "Buy-from Vendor Name 2 TJP"; Text[100])
        {
            Caption = 'Buy-from Vendor Name 2';
            TableRelation = Vendor."Name 2";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(70658583; "Purchaser Code TJP"; Code[20])
        {
            Caption = 'Purchaser Code';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }
        field(70658584; "Purchaser Name TJP"; Text[50])
        {
            Caption = 'Purchaser Name';
            TableRelation = "Salesperson/Purchaser".Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
    }
}
#endif

#if OnPremise
tableextension 99025 "Whse. Receipt Lines TJP" extends "Warehouse Receipt Line"
{
    fields
    {
        field(99000; "Assigned User ID TJP"; Code[50])
        {
            Caption = 'Assigned User ID';
            TableRelation = "User Setup";
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
        field(99003; "Requested Receipt Date TJP"; Date)
        {
            Caption = 'Requested Receipt Date';
            DataClassification = CustomerContent;
        }
        field(99004; "Promised Receipt Date TJP"; Date)
        {
            Caption = 'Promised Receipt Date';
            DataClassification = CustomerContent;
        }
        field(99005; "Buy-from Vendor No. TJP"; Code[20])
        {
            Caption = 'Buy-from Vendor No.';
            TableRelation = Vendor;
            DataClassification = CustomerContent;
        }
        field(99006; "Buy-from Vendor Name TJP"; Text[100])
        {
            Caption = 'Buy-from Vendor Name';
            TableRelation = Vendor.Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(99007; "Buy-from Vendor Name 2 TJP"; Text[100])
        {
            Caption = 'Buy-from Vendor Name 2';
            TableRelation = Vendor."Name 2";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(99008; "Purchaser Code TJP"; Code[20])
        {
            Caption = 'Purchaser Code';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }
        field(99009; "Purchaser Name TJP"; Text[50])
        {
            Caption = 'Purchaser Name';
            TableRelation = "Salesperson/Purchaser".Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
    }
}
#endif