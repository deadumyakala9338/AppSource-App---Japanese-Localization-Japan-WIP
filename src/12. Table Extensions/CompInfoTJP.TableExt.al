#if AppSource
tableextension 70658580 CompInfoTJP extends "Company Information"
{
    fields
    {
        field(70658575; "Reporting Language TJP"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'English Reporting Language';
            TableRelation = Language;
        }
        field(70658576; "English Name TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'English Name';
        }
        field(70658577; "English Name 2 TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'English Name 2';
        }
        field(70658578; "English Address TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'English Address';
        }
        field(70658579; "English Address 2 TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'English Address 2';
        }
        field(70658580; "English City TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'English City';
        }
        field(70658581; "English Post Code TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'English Post Code';
            TableRelation = "Post Code";
            ValidateTableRelation = false;
        }
        field(70658582; "English County TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'English County';
        }
        field(70658583; "Eng. Country/Region Code TJP"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'English Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(70658584; "Chop TJP"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Chop';
            Subtype = Bitmap;
        }
        field(70658585; "Bank Account Holder Name TJP"; Text[40])
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Account Holder Name';
        }
        field(70658586; "Eng. Bank Acc. Holder Name TJP"; Text[40])
        {
            DataClassification = CustomerContent;
            Caption = 'English Bank Account Holder Name';
        }
        field(70658587; "Eng. Bank Acc. Name TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'English Bank Name';
        }
        field(70658588; "Eng. Bank Acc. No. TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'English Bank Account No.';
        }
        field(70658589; "Account Type TJP"; Enum "Zengin Account Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Account Type';
        }
        field(70658590; "Eng. Account Type TJP"; Enum "Zengin Account Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'English Account Type';
        }
        field(70658591; "Eng. Phone No. TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'English Phone No.';
        }
        field(70658592; "Eng. Fax No. TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'English Fax No.';
        }
    }
}
#endif

#if OnPremise
tableextension 99005 CompInfoTJP extends "Company Information"
{
    fields
    {
        field(99000; "Reporting Language TJP"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'English Reporting Language';
            TableRelation = Language;
        }
        field(99001; "English Name TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'English Name';
        }
        field(99002; "English Name 2 TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'English Name 2';
        }
        field(99003; "English Address TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'English Address';
        }
        field(99004; "English Address 2 TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'English Address 2';
        }
        field(99005; "English City TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'English City';
        }
        field(99006; "English Post Code TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'English Post Code';
            TableRelation = "Post Code";
            ValidateTableRelation = false;
        }
        field(99007; "English County TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'English County';
        }
        field(99008; "Eng. Country/Region Code TJP"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'English Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(99009; "Chop TJP"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Chop';
            Subtype = Bitmap;
        }
        field(99010; "Bank Account Holder Name TJP"; Text[40])
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Account Holder Name';
        }
        field(99011; "Eng. Bank Acc. Holder Name TJP"; Text[40])
        {
            DataClassification = CustomerContent;
            Caption = 'English Bank Account Holder Name';
        }
        field(99012; "Eng. Bank Acc. Name TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'English Bank Name';
        }
        field(99013; "Eng. Bank Acc. No. TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'English Bank Account No.';
        }
        field(99014; "Account Type TJP"; Enum "Zengin Account Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Account Type';
        }
        field(99015; "Eng. Account Type TJP"; Enum "Zengin Account Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'English Account Type';
        }
        field(99016; "Eng. Phone No. TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'English Phone No.';
        }
        field(99017; "Eng. Fax No. TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'English Fax No.';
        }
    }
}
#endif