#if AppSource
tableextension 70658595 "Employee TJP" extends Employee
{
    fields
    {
        field(70658575; "Zengin Bank/Branch No. TJP"; Text[7])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Bank/Branch No.';
        }
        field(70658576; "Zengin Bank Name Kana TJP"; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Bank Name Kana';
        }
        field(70658577; "Zengin Branch Name Kana TJP"; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Branch Name Kana';
        }
        field(70658578; "Zengin Account Type TJP"; Enum "Zengin Account Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Account Type';
        }
        field(70658579; "Zengin Account No. TJP"; Text[7])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Account No.';
        }
        field(70658580; "Zengin Account Holder Kana TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Account Holder Kana';
        }
        field(70658581; "Last Name In Kana TJP"; Text[30])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Last Name In Kana';
        }
        field(70658582; "First Name In Kana TJP"; Text[30])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'First Name In Kana';
        }
        field(70658583; "Last Name (English) TJP"; Text[30])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Last Name (English)';
        }
        field(70658584; "First Name (English) TJP"; Text[30])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'First Name (English)';
        }
        field(70658585; "User Name TJP"; Code[50])
        {
            Caption = 'User Name';
            DataClassification = EndUserIdentifiableInformation;
            NotBlank = true;
            TableRelation = User."User Name";
            ValidateTableRelation = false;

            trigger OnValidate()
            var
                UserSelection: Codeunit "User Selection";
            begin
                UserSelection.ValidateUserName("User Name TJP");
            end;
        }
    }
}
#endif

#if OnPremise
tableextension 99020 "Employee TJP" extends Employee
{
    fields
    {
        field(99000; "Zengin Bank/Branch No. TJP"; Text[7])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Bank/Branch No.';
        }
        field(99001; "Zengin Bank Name Kana TJP"; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Bank Name Kana';
        }
        field(99002; "Zengin Branch Name Kana TJP"; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Branch Name Kana';
        }
        field(99003; "Zengin Account Type TJP"; Enum "Zengin Account Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Account Type';
        }
        field(99004; "Zengin Account No. TJP"; Text[7])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Account No.';
        }
        field(99005; "Zengin Account Holder Kana TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Zengin Account Holder Kana';
        }
        field(99006; "Last Name In Kana TJP"; Text[30])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Last Name In Kana';
        }
        field(99007; "First Name In Kana TJP"; Text[30])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'First Name In Kana';
        }
        field(99008; "Last Name (English) TJP"; Text[30])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Last Name (English)';
        }
        field(99009; "First Name (English) TJP"; Text[30])
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'First Name (English)';
        }
        field(99010; "User Name TJP"; Code[50])
        {
            Caption = 'User Name';
            DataClassification = EndUserIdentifiableInformation;
            NotBlank = true;
            TableRelation = User."User Name";
            ValidateTableRelation = false;

            trigger OnValidate()
            var
                UserSelection: Codeunit "User Selection";
            begin
                UserSelection.ValidateUserName("User Name TJP");
            end;
        }
    }
}
#endif