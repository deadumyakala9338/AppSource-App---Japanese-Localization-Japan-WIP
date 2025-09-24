#if AppSource
report 70658576 "Journalize P-Note Trans. TJP"
#endif
#if OnPremise
report 99001 "Journalize P-Note Trans. TJP"
#endif
{
    Caption = 'Journalize P-Note Transaction';
    ProcessingOnly = true;
    UseRequestPage = false;
    UsageCategory = None;

    dataset
    {
        dataitem("Promisory Note TJP"; "Promissory Note TJP")
        {
            DataItemTableView = sorting("Issuer Type", "No.");

            trigger OnAfterGetRecord()
            var
                LastGenJnlLine: Record "Gen. Journal Line";
                Balance: Decimal;
                JnlLineIdx: Integer;
                NoOfJnlLines: Integer;
            begin
                TestField("Issuer No.");
                TestField("Issue Date");
                TestField("Due Date");
                TestField("Bank Account Code");

                case OperType of
                    "Document Status"::"Note Received".AsInteger():
                        begin
                            TestField("Issuer Type", "Issuer Type"::Customer);
                            TestField("Document Status", "Document Status"::Open);
                        end;
                    "Document Status"::"Note Issued".AsInteger():
                        begin
                            TestField("Issuer Type", "Issuer Type"::Vendor);
                            TestField("Document Status", "Document Status"::Open);
                        end;
                    "Document Status"::"Cash Received".AsInteger():
                        begin
                            TestField("Issuer Type", "Issuer Type"::Customer);
                            TestField("Document Status", "Document Status"::"Note Received");
                        end;
                    "Document Status"::"Cash Paid".AsInteger():
                        begin
                            TestField("Issuer Type", "Issuer Type"::Vendor);
                            TestField("Document Status", "Document Status"::"Note Issued");
                        end;
                    "Document Status"::Discounted.AsInteger(), "Document Status"::Dishonored.AsInteger():
                        begin
                            TestField("Issuer Type", "Issuer Type"::Customer);
                            if "Document Status".AsInteger() < "Document Status"::"Note Received".AsInteger() then
                                FIELDERROR("Document Status");
                        end;
                    "Document Status"::"Due Date Discounted".AsInteger():
                        begin
                            TestField("Issuer Type", "Issuer Type"::Customer);
                            TestField("Document Status", "Document Status"::Discounted);
                        end;
                end;

                //Create General Journal Lines
                if OperType = "Document Status"::Discounted.AsInteger() then
                    NoOfJnlLines := 2
                else
                    NoOfJnlLines := 1;

                for JnlLineIdx := 1 to NoOfJnlLines do begin
                    GetLastGenJnlLine(LastGenJnlLine);

                    Balance := 0;
                    GenJournalLine.Init();
                    GenJournalLine.SETRANGE("Journal Template Name", GenJournalBatch."Journal Template Name");
                    GenJournalLine.SETRANGE("Journal Batch Name", GenJournalBatch.Name);
                    GenJournalLine.Validate("Journal Template Name", GenJournalBatch."Journal Template Name");
                    GenJournalLine.Validate("Journal Batch Name", GenJournalBatch.Name);
                    GenJournalLine.SetUpNewLine(LastGenJnlLine, Balance, true);
                    GenJournalLine.Validate("Line No.", LastGenJnlLine."Line No." + 10000);
                    GenJournalLine.Insert(true);

                    JnlLinesCreated := JnlLinesCreated + 1;

                    GenJournalLine.Validate("Document Type", GenJournalLine."Document Type"::Payment);
                    GenJournalLine.Validate("External Document No.", "No.");
                    GenJournalLine.Validate("PNote Issuer Type TJP", "Issuer Type");
                    GenJournalLine.Validate("Promissory Note No. TJP", "No.");
                    GenJournalLine.Validate("Promissory Note Status TJP", OperType);

                    CALCFIELDS("Bank Name");

                    case OperType of
                        "Document Status"::"Note Received".AsInteger():
                            begin
                                GenJournalLine.Validate("Posting Date", "Issue Date");
                                GenJournalLine.Validate("Account Type", GenJournalLine."Account Type"::"G/L Account");
                                GenJournalLine.Validate("Account No.", "G/L Account No.");
                                GenJournalLine.Validate("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
                                GenJournalLine.Validate("Bal. Account No.", GeneralLedgerSetup."P-Note on Hand Account TJP");
                                GenJournalLine.Validate(Description, "Issuer Name");
                            end;
                        "Document Status"::"Note Issued".AsInteger():
                            begin
                                GenJournalLine.Validate("Posting Date", "Issue Date");
                                GenJournalLine.Validate("Account Type", GenJournalLine."Account Type"::Vendor);
                                GenJournalLine.Validate("Account No.", "Issuer No.");
                                GenJournalLine.Validate("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
                                GenJournalLine.Validate("Bal. Account No.", "G/L Account No.");
                                GenJournalLine.Validate(Description, "Issuer Name");
                            end;
                        "Document Status"::"Cash Received".AsInteger():
                            begin
                                GenJournalLine.Validate("Posting Date", "Due Date");
                                GenJournalLine.Validate("Account Type", GenJournalLine."Account Type"::"Bank Account");
                                GenJournalLine.Validate("Account No.", "Bank Account Code");
                                GenJournalLine.Validate("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
                                GenJournalLine.Validate("Bal. Account No.", "G/L Account No.");
                                GenJournalLine.Validate(Description, "Bank Name");
                            end;
                        "Document Status"::"Cash Paid".AsInteger():
                            begin
                                GenJournalLine.Validate("Posting Date", "Due Date");
                                GenJournalLine.Validate("Account Type", GenJournalLine."Account Type"::"G/L Account");
                                GenJournalLine.Validate("Account No.", "G/L Account No.");
                                GenJournalLine.Validate("Bal. Account Type", GenJournalLine."Bal. Account Type"::"Bank Account");
                                GenJournalLine.Validate("Bal. Account No.", "Bank Account Code");
                                GenJournalLine.Validate(Description, "Bank Name");
                            end;
                        "Document Status"::Discounted.AsInteger():
                            begin
                                BankAccount.Get("Bank Account Code");
                                BankAccount.TestField("P.Note Rec. Disc. Account TJP");
                                BankAccount.TestField("P.Note Discounted Account TJP");
                                case JnlLineIdx of
                                    1:
                                        begin
                                            GenJournalLine.Validate("Posting Date", WorkDate());
                                            GenJournalLine.Validate("Account Type", GenJournalLine."Account Type"::"G/L Account");
                                            GenJournalLine.Validate("Account No.", BankAccount."P.Note Rec. Disc. Account TJP");
                                            GenJournalLine.Validate("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
                                            GenJournalLine.Validate("Bal. Account No.", "G/L Account No.");
                                        end;
                                    2:
                                        begin
                                            GenJournalLine.Validate("Posting Date", WorkDate());
                                            GenJournalLine.Validate("Account Type", GenJournalLine."Account Type"::"Bank Account");
                                            GenJournalLine.Validate("Account No.", "Bank Account Code");
                                            GenJournalLine.Validate("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
                                            GenJournalLine.Validate("Bal. Account No.", BankAccount."P.Note Discounted Account TJP");
                                            GenJournalLine.Validate(Description, "Bank Name");
                                        end;
                                end;
                            end;
                        "Document Status"::"Due Date Discounted".AsInteger():
                            begin
                                BankAccount.Get("Bank Account Code");
                                BankAccount.TestField("P.Note Rec. Disc. Account TJP");
                                BankAccount.TestField("P.Note Discounted Account TJP");

                                GenJournalLine.Validate("Posting Date", WorkDate());
                                GenJournalLine.Validate("Account Type", GenJournalLine."Account Type"::"G/L Account");
                                GenJournalLine.Validate("Account No.", BankAccount."P.Note Discounted Account TJP");
                                GenJournalLine.Validate("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
                                GenJournalLine.Validate("Bal. Account No.", BankAccount."P.Note Rec. Disc. Account TJP");
                            end;
                        "Document Status"::Dishonored.AsInteger():
                            begin
                                BankAccount.Get("Bank Account Code");
                                BankAccount.TestField("P.Note Dishonored Account TJP");

                                GenJournalLine.Validate("Posting Date", WorkDate());
                                GenJournalLine.Validate("Account Type", GenJournalLine."Account Type"::"G/L Account");
                                GenJournalLine.Validate("Account No.", BankAccount."P.Note Dishonored Account TJP");
                                GenJournalLine.Validate("Bal. Account Type", GenJournalLine."Bal. Account Type"::"G/L Account");
                                GenJournalLine.Validate("Bal. Account No.", "G/L Account No.");
                            end;
                    end;

                    GenJournalLine.Validate(Amount, Amount);
                    GenJournalLine.Modify(true);

                    Validate("Transaction Status", "Transaction Status"::Journalized);
                    Modify();
                end;
            end;

            trigger OnPostDataItem()
            begin
                if GuiAllowed then
                    Message(Text000Msg, JnlLinesCreated);
            end;

            trigger OnPreDataItem()
            begin
                GeneralLedgerSetup.Get();
                GeneralLedgerSetup.TestField("P-Note Default Template TJP");
                GeneralLedgerSetup.TestField("P-Note Default Batch TJP");

                GenJournalBatch.Get(GeneralLedgerSetup."P-Note Default Template TJP", GeneralLedgerSetup."P-Note Default Batch TJP");
                GenJournalBatch.TestField("No. Series");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport()
    var
    begin
    end;

    trigger OnPreReport()
    var
    begin
    end;

    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        GenJournalBatch: Record "Gen. Journal Batch";
        BankAccount: Record "Bank Account";
        GenJournalLine: Record "Gen. Journal Line";
        OperType: Integer;
        JnlLinesCreated: Integer;
        Text000Msg: Label '%1 lines are created in General Journal.', Comment = '%1= Line Count';

    procedure GetLastGenJnlLine(var ToGenJnlLine: Record 81): Boolean
    begin
        ToGenJnlLine.Reset();
        ToGenJnlLine.SetRange("Journal Template Name", GenJournalBatch."Journal Template Name");
        ToGenJnlLine.SetRange("Journal Batch Name", GenJournalBatch.Name);
        if not ToGenJnlLine.FindLast() then begin
            ToGenJnlLine.Init();
            exit(false);
        end else
            exit(true);
    end;

    procedure SetParameter(SrcOperType: Integer)
    begin
        OperType := SrcOperType;
    end;
}

