#if AppSource
report 70658580 "Check FA Book Value 5% TJP"
#endif
#if OnPremise
report 99005 "Check FA Book Value 5% TJP"
#endif
{
    Caption = 'Check FA Book Value 5%';
    ProcessingOnly = true;
    UsageCategory = None;

    dataset
    {
        dataitem("FA Depreciation Book"; "FA Depreciation Book")
        {
            DataItemTableView = SORTING("Straight Line Depr. 5 % TJP") WHERE("Straight Line Depr. 5 % TJP" = CONST(true));

            trigger OnAfterGetRecord()
            var
                LastFixedDep: Decimal;
                NotPassCreateJnl: Boolean;
            begin
                FAJnlSetup.Reset();
                FAJnlSetup.Get("FA Depreciation Book"."Depreciation Book Code", UserId);
                TemplateName := FAJnlSetup."FA Jnl. Template Name";
                BatchName := FAJnlSetup."FA Jnl. Batch Name";

                if (TemplateName = '') or (BatchName = '') then
                    CurrReport.Skip();

                CalcFields("Book Value");
                CalcFields("Acquisition Cost");
                CalcFields("Salvage Value");

                if "Disposal Date" > 0D then
                    CurrReport.Skip();

                if "Book Value" = 0 then
                    CurrReport.Skip();

                if "Acquisition Cost" = 0 then
                    CurrReport.Skip();

                NotPassCreateJnl := false;

                if ("Depr. Method (Extended) TJP" = "Depr. Method (Extended) TJP"::"Straight-Line")
                  and ("Book Value" > (-1 * "Salvage Value")) then
                    NotPassCreateJnl := true;

                if ("Depr. Method (Extended) TJP" = "Depr. Method (Extended) TJP"::"Declining-Balance 1")
                  and ("Book Value" > (-1 * "Salvage Value")) then
                    NotPassCreateJnl := true;

                if NotPassCreateJnl then
                    CurrReport.Skip();

                //CHECK WHETHER BOOK VALUE ABOVE THAN 5% ACC COST
                if ("Depr. Method (Extended) TJP" = "Depr. Method (Extended) TJP"::"Straight-Line") then
                    if "Book Value" > ("Acquisition Cost" * 5 / 100) then begin
                        //GET 5% FROM ACC COST
                        FiveAcc := "Acquisition Cost" * (5 / 100);

                        //GET THE LAST DEPRECIATION VALUE
                        LastFixedDep := 0;
                        FALedgerEntry.Reset();
                        FALedgerEntry.SetCurrentKey("FA No.", "Depreciation Book Code", "FA Posting Category", "FA Posting Type", "Posting Date");
                        FALedgerEntry.SetRange("FA No.", "FA No.");
                        FALedgerEntry.SetRange("Depreciation Book Code", "Depreciation Book Code");
                        FALedgerEntry.SetRange("FA Posting Type", 1);
                        if FALedgerEntry.Find('+') then
                            LastFixedDep := FALedgerEntry.Amount;
                        Validate("Fixed Depr. Amount", LastFixedDep);
                        Modify(true);

                        //Create journal if next book value still more than 5% Acc
                        if ("Book Value" + LastFixedDep) > FiveAcc then begin
                            FAJournalLine.Init();
                            FAJournalLine."Journal Template Name" := copystr(TemplateName, 1, MaxStrLen(FAJournalLine."Journal Template Name"));
                            FAJournalLine."Journal Batch Name" := copystr(BatchName, 1, MaxStrLen(FAJournalLine."Journal Batch Name"));
                            FAJournalLine."Line No." := LineNo;
                            FAJournalLine."Document No." := Format(DocNum);
                            FAJournalLine.Validate("FA Posting Date", CalcDate('<1M>', FALedgerEntry."Posting Date"));
                            FAJournalLine.Validate("FA No.", "FA No.");
                            FAJournalLine.Validate("Depreciation Book Code", "Depreciation Book Code");
                            FAJournalLine.Validate("FA Posting Type", FAJournalLine."FA Posting Type"::Depreciation);
                            FAJournalLine.Validate(Amount, LastFixedDep);
                            if FAJournalLine.Amount = 0 then
                                CurrReport.Skip();
                            FAJournalLine.Insert(true);
                            //IsSalvageJnlCreated := true;

                            LineNo += 10000;
                            DocNum += 1;
                        end
                        else begin
                            FAJournalLine.Init();
                            FAJournalLine."Journal Template Name" := copystr(TemplateName, 1, MaxStrLen(FAJournalLine."Journal Template Name"));
                            FAJournalLine."Journal Batch Name" := copystr(BatchName, 1, MaxStrLen(FAJournalLine."Journal Batch Name"));
                            FAJournalLine."Line No." := LineNo;
                            FAJournalLine."Document No." := Format(DocNum);
                            FAJournalLine.Validate("FA Posting Date", CalcDate('<1M>', FALedgerEntry."Posting Date"));
                            FAJournalLine.Validate("FA No.", "FA No.");
                            FAJournalLine.Validate("Depreciation Book Code", "Depreciation Book Code");
                            FAJournalLine.Validate("FA Posting Type", FAJournalLine."FA Posting Type"::Depreciation);
                            FAJournalLine.Validate(Amount, -1 * ("Book Value" - FiveAcc));
                            if FAJournalLine.Amount = 0 then
                                CurrReport.Skip();
                            FAJournalLine.Insert(true);
                            //IsSalvageJnlCreated := true;

                            LineNo += 10000;
                            DocNum += 1;
                        end
                    end
                    else begin
                        //GET THE LAST DEPRECIATION VALUE
                        LastFixedDep := 0;
                        FALedgerEntry.Reset();
                        FALedgerEntry.SetCurrentKey("FA No.", "Depreciation Book Code", "FA Posting Category", "FA Posting Type", "Posting Date");
                        FALedgerEntry.SetRange("FA No.", "FA No.");
                        FALedgerEntry.SetRange("Depreciation Book Code", "Depreciation Book Code");
                        FALedgerEntry.SetRange("FA Posting Type", 1);
                        if FALedgerEntry.Find('+') then;

                        Validate("Fixed Depr. Amount", 0);
                        Validate("Depreciation Starting Date", GetNextFiscalYearStartingDate(FALedgerEntry."Posting Date"));
                        Validate("No. of Depreciation Years", 5);
                        Modify(true);
                        FAJournalLine.Init();
                        FAJournalLine."Journal Template Name" := copystr(TemplateName, 1, MaxStrLen(FAJournalLine."Journal Template Name"));
                        FAJournalLine."Journal Batch Name" := copystr(BatchName, 1, MaxStrLen(FAJournalLine."Journal Batch Name"));
                        FAJournalLine."Line No." := LineNo;
                        FAJournalLine."Document No." := Format(DocNum);
                        FAJournalLine.Validate("FA Posting Date", FALedgerEntry."Posting Date");
                        FAJournalLine.Validate("FA No.", "FA No.");
                        FAJournalLine.Validate("Depreciation Book Code", "Depreciation Book Code");
                        FAJournalLine.Validate("FA Posting Type", FAJournalLine."FA Posting Type"::"Salvage Value");
                        if "Salvage Value" = 0 then
                            FAJournalLine.Validate(Amount, -1)
                        else
                            FAJournalLine.Validate(Amount, -1 - "Salvage Value");
                        if FAJournalLine.Amount = 0 then
                            CurrReport.Skip();
                        FAJournalLine.Insert(true);
                        //IsSalvageJnlCreated := true;

                        LineNo += 10000;
                        DocNum += 1;
                    end;

                if ("Depr. Method (Extended) TJP" = "Depr. Method (Extended) TJP"::"Declining-Balance 1") then begin
                    //GET THE LAST DEPRECIATION VALUE
                    LastFixedDep := 0;
                    FALedgerEntry.Reset();
                    FALedgerEntry.SetCurrentKey("FA No.", "Depreciation Book Code", "FA Posting Category", "FA Posting Type", "Posting Date");
                    FALedgerEntry.SetRange("FA No.", "FA No.");
                    FALedgerEntry.SetRange("Depreciation Book Code", "Depreciation Book Code");
                    FALedgerEntry.SetRange("FA Posting Type", 1);
                    if FALedgerEntry.Find('+') then;

                    Validate("Fixed Depr. Amount", 0);
                    Validate("Declining-Balance %", 0);
                    Validate("Depr. Method (Extended) TJP", "Depr. Method (Extended) TJP"::"Straight-Line");
                    Validate("Depreciation Starting Date", GetNextFiscalYearStartingDate(FALedgerEntry."Posting Date"));
                    Validate("No. of Depreciation Years", 5);
                    Modify(true);
                    FAJournalLine.Init();
                    FAJournalLine."Journal Template Name" := copystr(TemplateName, 1, MaxStrLen(FAJournalLine."Journal Template Name"));
                    FAJournalLine."Journal Batch Name" := copystr(BatchName, 1, MaxStrLen(FAJournalLine."Journal Batch Name"));
                    FAJournalLine."Line No." := LineNo;
                    FAJournalLine."Document No." := Format(DocNum);
                    FAJournalLine.Validate("FA Posting Date", FALedgerEntry."Posting Date");
                    FAJournalLine.Validate("FA No.", "FA No.");
                    FAJournalLine.Validate("Depreciation Book Code", "Depreciation Book Code");
                    FAJournalLine.Validate("FA Posting Type", FAJournalLine."FA Posting Type"::"Salvage Value");
                    if "Salvage Value" = 0 then
                        FAJournalLine.Validate(Amount, -1)
                    else
                        FAJournalLine.Validate(Amount, -1 - "Salvage Value");
                    if FAJournalLine.Amount = 0 then
                        CurrReport.Skip();
                    FAJournalLine.Insert(true);
                    //IsSalvageJnlCreated := true;

                    LineNo += 10000;
                    DocNum += 1;
                end;
                //iCount += 1;
            end;

            trigger OnPreDataItem()
            begin
                FAJournalLine.Reset();
                if FAJournalLine.Find('+') then
                    LineNo := FAJournalLine."Line No." + 10000
                else
                    LineNo := 10000;

                DocNum := 1;
            end;

            trigger OnPostDataItem()
            begin
                //if IsSalvageJnlCreated then
                //Message('Salvage Journals Created, Please check and Post entries from Fixed Asset Journal Page');
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

    var
        FAJnlSetup: Record "FA Journal Setup";
        FALedgerEntry: Record "FA Ledger Entry";
        FAJournalLine: Record "FA Journal Line";
        TemplateName: Code[20];
        BatchName: Code[20];
        gDes: Text[100];
        //gNoOfDepDays: Integer;
        //iCount: Integer;
        LineNo: Integer;
        DocNum: Integer;
        FiveAcc: Decimal;
        //gFAPostDate: Date;
        //gPostDate: Date;
        //gDocDate: Date;
        //IsSalvageJnlCreated: Boolean;
        Text2000Err: Label 'Next Fiscal year start from date = %1 is not found', Comment = '%1=from date';

    procedure Setup(FAPostDate: Date; PostDate: Date; DocDate: Date; Des: Text[100]; NoOfDepDays: Integer)
    begin
        //gFAPostDate := FAPostDate;
        //gPostDate := PostDate;
        //gDocDate := DocDate;
        gDes := Des;
        //gNoOfDepDays := NoOfDepDays;
    end;

    procedure GetNextFiscalYearStartingDate(CurrDate: Date): Date
    var
        AccP: Record "Accounting Period";
    begin
        AccP.Reset();
        AccP.SetCurrentKey("New Fiscal Year", "Date Locked");
        AccP.SetRange("New Fiscal Year", true);
        AccP.SetFilter("Starting Date", '>=%1', CurrDate);
        if not AccP.FindFirst() then
            Error(Text2000Err, CurrDate);
        exit(AccP."Starting Date");
    end;
}

