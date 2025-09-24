#if AppSource
table 70658575 "Promissory Note TJP"
{
    //TJP #01 20201019 Removed With Statement

    Caption = 'Promissory Note';
    DataCaptionFields = "No.", "Issuer Type";

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; "Issuer Type"; Enum "Promissory Note Issuer Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Issuer Type';
        }
        field(3; "Issuer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Issuer No.';
            TableRelation = IF ("Issuer Type" = CONST(Customer)) Customer."No."
            ELSE
            IF ("Issuer Type" = CONST(Vendor)) Vendor."No.";

            trigger OnValidate()
            var
                Vend: Record Vendor;
                Cust: Record Customer;
            begin
                case "Issuer Type" of
                    "Issuer Type"::Customer:
                        begin
                            Cust.Get("Issuer No.");
                            "Issuer Name" := Cust.Name;
                        end;
                    "Issuer Type"::Vendor:
                        begin
                            Vend.Get("Issuer No.");
                            "Issuer Name" := Vend.Name;
                        end;
                end;
            end;
        }
        field(4; "Issuer Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Issuer Name';
            Editable = false;
        }
        field(5; "Issue Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Issue Date';
        }
        field(6; Amount; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount';
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                if Amount < 0 then
                    Error(Text004Lbl);
            end;
        }
        field(7; "Bank Account Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Account Code';
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            var
                BankAcc: Record "Bank Account";
            begin
                case "Issuer Type" of
                    "Issuer Type"::Customer:
                        begin
                            BankAcc.Get("Bank Account Code");
                            BankAcc.TestField("P.Note Receivable Account TJP");
                            "G/L Account No." := BankAcc."P.Note Receivable Account TJP"
                        end;
                    "Issuer Type"::Vendor:
                        begin
                            BankAcc.Get("Bank Account Code");
                            BankAcc.TestField("P.Note Payable Account TJP");
                            "G/L Account No." := BankAcc."P.Note Payable Account TJP";
                        end;
                end;
                CalcFields("Bank Name");
            end;
        }
        field(8; "Bank Name"; Text[100])
        {
            Caption = 'Bank Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Bank Account".Name WHERE("No." = FIELD("Bank Account Code")));
        }
        field(9; "Customer Bank Account Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Bank Account Code';
            TableRelation = IF ("Issuer Type" = CONST(Customer)) "Customer Bank Account".Code WHERE("Customer No." = FIELD("Issuer No."))
            ELSE
            IF ("Issuer Type" = CONST(Vendor)) "Vendor Bank Account".Code WHERE("Vendor No." = FIELD("Issuer No."));

            trigger OnValidate()
            var
                CustBankAcc: Record "Customer Bank Account";
                VendBankAcc: Record "Vendor Bank Account";
            begin
                case "Issuer Type" of
                    "Issuer Type"::Customer:
                        begin
                            CustBankAcc.Get("Issuer No.", "Customer Bank Account Code");
                            "Customer Bank Name" := CustBankAcc.Name;
                        end;
                    "Issuer Type"::Vendor:
                        begin
                            VendBankAcc.Get("Issuer No.", "Customer Bank Account Code");
                            "Customer Bank Name" := VendBankAcc.Name;
                        end;
                end;
            end;
        }
        field(10; "Customer Bank Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Bank Name';
            Editable = true;

            trigger OnValidate()
            var
                CustBankAcc: Record "Customer Bank Account";
            begin
                if "Customer Bank Name" <> '' then
                    TestField("Issuer Type", "Issuer Type"::Customer);

                CustBankAcc.Get("Issuer No.", "Customer Bank Account Code");
                if "Customer Bank Name" <> CustBankAcc.Name then
                    Clear("Customer Bank Account Code");
            end;
        }
        field(11; "Due Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Due Date';
        }
        field(12; Endorser; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Endorser';
        }
        field(14; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Posting Date';

            trigger OnValidate()
            begin
                if "Issue Date" = 0D then
                    "Issue Date" := "Posting Date";
            end;
        }
        field(16; "G/L Account No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'G/L Account No.';
            Editable = false;
            TableRelation = "G/L Account" WHERE("Account Type" = CONST(Posting), Blocked = CONST(false));
        }
        field(17; Type; Enum "Promissory Note Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
        }
        field(20; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(21; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(22; "Document Status"; Enum "Promissory Note Status TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Document Status';
        }
        field(23; "Transaction Status"; Enum "PNote Transaction Status TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Transaction Status';
        }
    }

    keys
    {
        key(Key1; "Issuer Type", "No.")
        {
            Clustered = true;
        }
        key(Key2; "Issuer No.")
        {
        }
        key(Key3; "Posting Date")
        {
        }
        key(Key4; "Issuer Type", "Issuer No.", "Document Status")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }
#endif

#if OnPremise
table 99000 "Promissory Note TJP"
{
    //TJP #01 20201019 Removed With Statement

    Caption = 'Promissory Note';
    DataCaptionFields = "No.", "Issuer Type";

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; "Issuer Type"; Enum "Promissory Note Issuer Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Issuer Type';
        }
        field(3; "Issuer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Issuer No.';
            TableRelation = IF ("Issuer Type" = CONST(Customer)) Customer."No."
            ELSE
            IF ("Issuer Type" = CONST(Vendor)) Vendor."No.";

            trigger OnValidate()
            var
                Vend: Record Vendor;
                Cust: Record Customer;
            begin
                case "Issuer Type" of
                    "Issuer Type"::Customer:
                        begin
                            Cust.Get("Issuer No.");
                            "Issuer Name" := Cust.Name;
                        end;
                    "Issuer Type"::Vendor:
                        begin
                            Vend.Get("Issuer No.");
                            "Issuer Name" := Vend.Name;
                        end;
                end;
            end;
        }
        field(4; "Issuer Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Issuer Name';
            Editable = false;
        }
        field(5; "Issue Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Issue Date';
        }
        field(6; Amount; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount';
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                if Amount < 0 then
                    Error(Text004Lbl);
            end;
        }
        field(7; "Bank Account Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Account Code';
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            var
                BankAcc: Record "Bank Account";
            begin
                case "Issuer Type" of
                    "Issuer Type"::Customer:
                        begin
                            BankAcc.Get("Bank Account Code");
                            BankAcc.TestField("P.Note Receivable Account TJP");
                            "G/L Account No." := BankAcc."P.Note Receivable Account TJP"
                        end;
                    "Issuer Type"::Vendor:
                        begin
                            BankAcc.Get("Bank Account Code");
                            BankAcc.TestField("P.Note Payable Account TJP");
                            "G/L Account No." := BankAcc."P.Note Payable Account TJP";
                        end;
                end;
                CalcFields("Bank Name");
            end;
        }
        field(8; "Bank Name"; Text[100])
        {
            Caption = 'Bank Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Bank Account".Name WHERE("No." = FIELD("Bank Account Code")));
        }
        field(9; "Customer Bank Account Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Bank Account Code';
            TableRelation = IF ("Issuer Type" = CONST(Customer)) "Customer Bank Account".Code WHERE("Customer No." = FIELD("Issuer No."))
            ELSE
            IF ("Issuer Type" = CONST(Vendor)) "Vendor Bank Account".Code WHERE("Vendor No." = FIELD("Issuer No."));

            trigger OnValidate()
            var
                CustBankAcc: Record "Customer Bank Account";
                VendBankAcc: Record "Vendor Bank Account";
            begin
                case "Issuer Type" of
                    "Issuer Type"::Customer:
                        begin
                            CustBankAcc.Get("Issuer No.", "Customer Bank Account Code");
                            "Customer Bank Name" := CustBankAcc.Name;
                        end;
                    "Issuer Type"::Vendor:
                        begin
                            VendBankAcc.Get("Issuer No.", "Customer Bank Account Code");
                            "Customer Bank Name" := VendBankAcc.Name;
                        end;
                end;
            end;
        }
        field(10; "Customer Bank Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Bank Name';
            Editable = true;

            trigger OnValidate()
            var
                CustBankAcc: Record "Customer Bank Account";
            begin
                if "Customer Bank Name" <> '' then
                    TestField("Issuer Type", "Issuer Type"::Customer);

                CustBankAcc.Get("Issuer No.", "Customer Bank Account Code");
                if "Customer Bank Name" <> CustBankAcc.Name then
                    Clear("Customer Bank Account Code");
            end;
        }
        field(11; "Due Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Due Date';
        }
        field(12; Endorser; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Endorser';
        }
        field(14; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Posting Date';

            trigger OnValidate()
            begin
                if "Issue Date" = 0D then
                    "Issue Date" := "Posting Date";
            end;
        }
        field(16; "G/L Account No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'G/L Account No.';
            Editable = false;
            TableRelation = "G/L Account" WHERE("Account Type" = CONST(Posting), Blocked = CONST(false));
        }
        field(17; Type; Enum "Promissory Note Type TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
        }
        field(20; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(21; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(22; "Document Status"; Enum "Promissory Note Status TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Document Status';
        }
        field(23; "Transaction Status"; Enum "PNote Transaction Status TJP")
        {
            DataClassification = CustomerContent;
            Caption = 'Transaction Status';
        }
    }

    keys
    {
        key(Key1; "Issuer Type", "No.")
        {
            Clustered = true;
        }
        key(Key2; "Issuer No.")
        {
        }
        key(Key3; "Posting Date")
        {
        }
        key(Key4; "Issuer Type", "Issuer No.", "Document Status")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }
#endif

    trigger OnDelete()
    begin
        TestField("Document Status", "Document Status"::Open);
    end;

    trigger OnInsert()
    begin
        GetGLSetup();

        if "No." = '' then begin
            TestNoSeries();
            //NoSeriesMgt.InitSeries(GetNoSeriesCode(), xRec."No. Series", WorkDate(), "No.", "No. Series");                                          // 2025-09-11 Anada
            if this.NoSeriesMgt.AreRelated(this.GetNoSeriesCode(), xRec."No. Series") then                                                            // 2025-09-11 Anada
                Rec."No. Series" := xRec."No. Series";                                                                                                // 2025-09-11 Anada
            Rec."No." := this.NoSeriesMgt.GetNextNo(Rec."No. Series", WorkDate());                                                                    // 2025-09-11 Anada
        end;

        InitRecord();
    end;

    trigger OnModify()
    begin
        TestField("Document Status", "Document Status"::Open);
    end;

    trigger OnRename()
    begin
        TestField("Document Status", "Document Status"::Open);
    end;

    var
        GLSetup: Record "General Ledger Setup";
        PromissoryNote: Record "Promissory Note TJP";
        //NoSeriesMgt: Codeunit NoSeriesManagement;                                                                                                   // 2025-09-11 Anada
        NoSeriesMgt: Codeunit "No. Series";                                                                                                           // 2025-09-11 Anada
        GLSetupRead: Boolean;
        Text001Lbl: Label 'The %1 %2already exists.', Comment = '%1 = Issuer Type;%2 = No.';
        Text004Lbl: Label 'Amount can not be less than 0.';
        Text005Lbl: Label 'Document Status must not be %1 in promissory note Issuer Type=%2, No.=%3', Comment = '%1=?,%2=?,%3=?';

    procedure AssistEdit(OldPromissoryNote: Record "Promissory Note TJP"): Boolean
    var
        PromissoryNote2: Record "Promissory Note TJP";
    begin
        //with PromissoryNote do begin
        Copy(Rec);
        GetGLSetup();
        TestNoSeries();
        //if NoSeriesMgt.SelectSeries(GetNoSeriesCode(), OldPromissoryNote."No. Series", "No. Series") then begin                                     // 2025-09-11 Anada
        if NoSeriesMgt.LookupRelatedNoSeries(GetNoSeriesCode(), OldPromissoryNote."No. Series", "No. Series") then begin                              // 2025-09-11 Anada
            //NoSeriesMgt.SetSeries("No.");                                                                                                           // 2025-09-11 Anada
            PromissoryNote."No." := NoSeriesMgt.GetNextNo(Rec."No. Series");                                                                          // 2025-09-11 Anada  
            if PromissoryNote2.Get("Issuer Type", "No.") then
                Error(Text001Lbl, Format("Issuer Type"), "No.");
            Rec := PromissoryNote;
            exit(true);
        end;
        //end;
    end;

    procedure NoteIsMatured(): Boolean
    begin
        if "Due Date" <> 0D then
            exit("Due Date" <= Today);
    end;

    procedure TestNoSeries()
    begin
        GetGLSetup();
        case "Issuer Type" of
            "Issuer Type"::Customer:
                GLSetup.TestField("P-Note Receivables Nos. TJP");
            "Issuer Type"::Vendor:
                GLSetup.TestField("P-Note Payables Nos. TJP");
        end;
    end;

    procedure GetNoSeriesCode(): Code[20]
    begin
        GLSetup.Get();
        case "Issuer Type" of
            "Issuer Type"::Customer:
                exit(GLSetup."P-Note Receivables Nos. TJP");
            "Issuer Type"::Vendor:
                exit(GLSetup."P-Note Payables Nos. TJP");
        end;
    end;

    procedure InitRecord()
    begin
        Validate("Posting Date", WorkDate());
    end;

    procedure GetGLSetup()
    begin
        if not GLSetupRead then begin
            GLSetup.Get();
            GLSetupRead := true;
        end;
    end;

    procedure CheckDocumentStatusError(var PromissoryNoteTJP: Record "Promissory Note TJP")
    begin
        if ("Document Status" = "Document Status"::"Cash Received") or
           ("Document Status" = "Document Status"::"Due Date Discounted") or
           ("Document Status" = "Document Status"::Dishonored) then
            Error(Text005Lbl, "Document Status", "Issuer Type", "No.");

    end;
}

