#if AppSource
tableextension 70658584 VATEntryTJP extends "VAT Entry"
{
    fields
    {
        field(70658575; "No. Type TJP"; Enum "No. Type VAT Entry TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'No. Type';
            Editable = false;
        }
        field(70658576; "Bill/Pay-to No. (Extended) TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Bill-to/Pay-to No. (Extended)';
            TableRelation = IF ("No. Type TJP" = CONST(Customer)) Customer ELSE
            IF ("No. Type TJP" = CONST(Vendor)) Vendor;
        }
    }
}
#endif

#if OnPremise
tableextension 99009 VATEntryTJP extends "VAT Entry"
{
    fields
    {
        field(99000; "No. Type TJP"; Enum "No. Type VAT Entry TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'No. Type';
            Editable = false;
        }
        field(99001; "Bill/Pay-to No. (Extended) TJP"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Bill-to/Pay-to No. (Extended)';
            TableRelation = IF ("No. Type TJP" = CONST(Customer)) Customer ELSE
            IF ("No. Type TJP" = CONST(Vendor)) Vendor;
        }
    }
}
#endif