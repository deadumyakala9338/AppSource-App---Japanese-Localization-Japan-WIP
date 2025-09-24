#if AppSource
tableextension 70658598 "Purch. Line Archive TJP" extends "Purchase Line Archive"
{
    fields
    {
        field(70658575; "Document Date TJP"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(70658576; "Posting Date TJP"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(70658577; "Due Date TJP"; Date)
        {
            Caption = 'Due Date';
            DataClassification = CustomerContent;
        }
        field(70658578; "Vendor Invoice No. TJP"; Code[35])
        {
            Caption = 'Vendor Invoice No.';
            DataClassification = CustomerContent;
        }
        field(70658579; "Assigned User ID TJP"; Code[50])
        {
            Caption = 'Assigned User ID';
            TableRelation = "User Setup";
            DataClassification = CustomerContent;
        }
        field(70658580; "Buy-from Vendor Name TJP"; Text[100])
        {
            Caption = 'Buy-from Vendor Name';
            TableRelation = Vendor.Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(70658581; "Buy-from Vendor Name 2 TJP"; Text[100])
        {
            Caption = 'Buy-from Vendor Name 2';
            TableRelation = Vendor."Name 2";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(70658582; "Purchaser Code TJP"; Code[20])
        {
            Caption = 'Purchaser Code';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }
        field(70658583; "Purchaser Name TJP"; Text[50])
        {
            Caption = 'Purchaser Name';
            TableRelation = "Salesperson/Purchaser".Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(70658584; "Status TJP"; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
            DataClassification = CustomerContent;
        }
    }
}
#endif

#if OnPremise
tableextension 99023 "Purch. Line Archive TJP" extends "Purchase Line Archive"
{
    fields
    {
        field(99000; "Document Date TJP"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(99001; "Posting Date TJP"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(99002; "Due Date TJP"; Date)
        {
            Caption = 'Due Date';
            DataClassification = CustomerContent;
        }
        field(99003; "Vendor Invoice No. TJP"; Code[35])
        {
            Caption = 'Vendor Invoice No.';
            DataClassification = CustomerContent;
        }
        field(99004; "Assigned User ID TJP"; Code[50])
        {
            Caption = 'Assigned User ID';
            TableRelation = "User Setup";
            DataClassification = CustomerContent;
        }
        field(99005; "Buy-from Vendor Name TJP"; Text[100])
        {
            Caption = 'Buy-from Vendor Name';
            TableRelation = Vendor.Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(99006; "Buy-from Vendor Name 2 TJP"; Text[100])
        {
            Caption = 'Buy-from Vendor Name 2';
            TableRelation = Vendor."Name 2";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(99007; "Purchaser Code TJP"; Code[20])
        {
            Caption = 'Purchaser Code';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }
        field(99008; "Purchaser Name TJP"; Text[50])
        {
            Caption = 'Purchaser Name';
            TableRelation = "Salesperson/Purchaser".Name;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(99009; "Status TJP"; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
            DataClassification = CustomerContent;
        }
    }
}
#endif