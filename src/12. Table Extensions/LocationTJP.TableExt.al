#if AppSource
tableextension 70658594 LocationTJP extends Location
{
    fields
    {
        field(70658575; "English Name TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Name';
        }
        field(70658576; "English Address TJP"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Address';
        }
        field(70658577; "English Address 2 TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Address 2';
        }
        field(70658578; "English City TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'City';
        }
        field(70658579; "English Post Code TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Post Code';
        }
        field(70658580; "English Country/Region TJP"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Country/Region';
            TableRelation = "Country/Region";
        }
        field(70658581; "English County TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'County';
        }
    }
}
#endif

#if OnPremise
tableextension 99019 LocationTJP extends Location
{
    fields
    {
        field(99000; "English Name TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Name';
        }
        field(99001; "English Address TJP"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Address';
        }
        field(99002; "English Address 2 TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Address 2';
        }
        field(99003; "English City TJP"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'City';
        }
        field(99004; "English Post Code TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Post Code';
        }
        field(99005; "English Country/Region TJP"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Country/Region';
            TableRelation = "Country/Region";
        }
        field(99006; "English County TJP"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'County';
        }
    }
}
#endif