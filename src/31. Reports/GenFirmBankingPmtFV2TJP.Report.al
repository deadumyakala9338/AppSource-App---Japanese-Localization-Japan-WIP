#if AppSource
report 70658600 "Gen Firm Banking Pmt F V2 TJP"
#endif
#if OnPremise
report 99025 "Gen Firm Banking Pmt F V2 TJP"
#endif
{
    Caption = 'Generate FirmBanking Pmt. File';
    ProcessingOnly = true;
    UsageCategory = None;

    dataset
    {
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(RepClientFileName; ClientFileName)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'File Name';
                        ToolTip = 'Specifies the name of the file to be exported from a business unit to a consolidated company.';
                    }
                    field(SelectBank; SelPaymBankNo)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Select Payment Bank';
                        NotBlank = true;
                        TableRelation = "Bank Account"."No.";
                        ToolTip = 'Specifies the number of the general ledger,bank account that the balancing entry is posted to, such as a cash account for cash purchases.';
                    }
                    field(RepSelectDate; SelectDate)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Select Date';
                        NotBlank = true;
                        ToolTip = 'Specifies the posting date for the payment entry.';
                    }
                    field(ShowVendorError; ShowVendNo)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Vendor for error';
                        ToolTip = 'TBD';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
        end;

        trigger OnOpenPage()
        begin
            SelPaymBankNo := PymtBankNo;
            SelectDate := PostDate;
            ClientFileName := PymtBankNo + '_' + DelChr(format(PostDate, 0, '<Year4>/<Month,2>/<Day,2>'), '=', '/');
            ServerFileName := copystr(ClientFileName + '.txt', 1, MaxStrLen(ServerFileName));
        end;
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        if ClientFileName = '' then
            Error(Text009Txt);

        ExportfirmBanking(ServerFileName);
        DownloadFromStream(DataInStream, Text007Txt, '', Text006Txt, ServerFileName);
    end;

    trigger OnPreReport()
    begin
    end;

    var
        PurchasesPayablesSetup: Record "Purchases & Payables Setup"; //DHA New Code 23.09.29
        Employee: Record Employee;    // V2
        Vendor: Record Vendor;
        GenJournalLine: Record "Gen. Journal Line";
        TempGenJournalLine: Record "Gen. Journal Line" temporary;
        BankAccount: Record "Bank Account";
        VendorBankAccount: Record "Vendor Bank Account";
        TempBlob: Codeunit "Temp Blob";
        DotNetEncoding: Codeunit DotNet_Encoding;
        DotNetStreamWriter: Codeunit DotNet_StreamWriter;
        DataInStream: InStream;
        DataOutStream: OutStream;
        Template: Code[10];
        Batch: Code[10];
        SelPaymBankNo: Code[20];
        PymtBankNo: Code[20];
        ClientFileName: Text[250];
        ServerFileName: Text;
        MMDD: Text[4];
        HeaderLine: Text[120];
        ItemLine: Text[250];
        TotalLine: Text[120];
        FooterLine: Text[120];
        DateStr: Text[8];
        PaymAmtInText: Text[10];
        CounterInText: Text[6];
        TotalAmtInText: Text[12];
        SelectDate: Date;
        PostDate: Date;
        IndentType: Option Left,Right;
        BankType: Option Bank,Branch;
        CheckType: Option Header,Data,Trail,Last;
        TransCounter: Integer;
        PaymentTotal: Decimal;
        ShowVendNo: Boolean;
        Text000Txt: Label 'Payment bank does not exist!';
        Text001Txt: Label 'Vendor %1 do not have any banker', Comment = '%1=Vendor No.';
        Text002Txt: Label ''' ''';
        Text003Txt: Label '''0''';
        Text004Txt: Label 'There is no data with Date: %1, Bank Account: %2.', Comment = 'Selected Date=%1 and Bank Account Code=%2';
        Text006Txt: Label 'Text Files (*.txt)|*.txt|All Files (*.*)|*.*';
        Text007Txt: Label 'Export to Text File';
        Text008Txt: Label 'Please enter the bank account code.';
        Text009Txt: Label 'You must enter a file name.';
        JnlTemplateTxt: Label 'PAYMENT';

    procedure SetBatchTemplate(_Template: Code[10]; _Batch: Code[10]; _PayBankNo: Code[20]; _PostDate: Date)
    begin
        Template := _Template;
        Batch := _Batch;
        PymtBankNo := _PayBankNo;
        PostDate := _PostDate;
    end;

    procedure ExportfirmBanking(FileName: Text)
    begin
        TempBlob.CreateOutStream(DataOutStream);
        DotNetEncoding.Encoding(932);                                    //New code
        DotNetStreamWriter.StreamWriter(DataOutStream, DotNetEncoding);  //New code
        SetHeaderLine();
        SetItemLine();
        SetTotalLine();
        SetFooterLine();
    end;

    procedure SetHeaderLine()
    var
        IntTemp: Integer;
    begin
        if not BankAccount.Get(SelPaymBankNo) then
            Error(Text000Txt);

        ErrorCheck(CheckType::Header);

        //All Space
        HeaderLine := PadStr(HeaderLine, 120, ' ');

        //Data Classification / Type Code & Code Classification
        HeaderLine := DelStr(HeaderLine, 1, 4);
        HeaderLine := copystr(InsStr(HeaderLine, '1210', 1), 1, MaxStrLen(HeaderLine));

        //Depositer Code
        HeaderLine := DelStr(HeaderLine, 5, 10);
        HeaderLine := copystr(InsStr(HeaderLine, SetLength(10, IndentType::Right, Format(BankAccount."Company Code TJP")), 5), 1, MaxStrLen(HeaderLine));

        //Depositer Name
        HeaderLine := DelStr(HeaderLine, 15, 40);
        HeaderLine := copystr(InsStr(HeaderLine, SetLength(40, IndentType::Left, BankAccount."Zengin Account Holder Kana TJP"), 15), 1, MaxStrLen(HeaderLine));

        //Workdate
        //DateStr := FORMAT(WORKDATE,0,3);
        DateStr := Format(SelectDate, 0, 3);
        DateStr := DelStr(DateStr, 1, 3);
        MMDD := copystr(DelStr(DateStr, 3, 1), 1, MaxStrLen(MMDD));
        HeaderLine := DelStr(HeaderLine, 55, 4);
        HeaderLine := copystr(InsStr(HeaderLine, MMDD, 55), 1, MaxStrLen(HeaderLine));

        //Wire Bank Account Number
        HeaderLine := DelStr(HeaderLine, 59, 4);
        HeaderLine := copystr(InsStr(HeaderLine, GetBankNo(BankType::Bank, BankAccount."Zengin Bank Branch No. TJP"), 59), 1, MaxStrLen(HeaderLine));

        //Bank Name
        HeaderLine := DelStr(HeaderLine, 63, 15);
        HeaderLine := copystr(InsStr(HeaderLine, SetLength(15, IndentType::Left, BankAccount."Zengin Bank Name Kana TJP"), 63), 1, MaxStrLen(HeaderLine));

        //Wire Branch Number
        HeaderLine := DelStr(HeaderLine, 78, 3);
        HeaderLine := copystr(InsStr(HeaderLine, GetBankNo(BankType::Branch, BankAccount."Zengin Bank Branch No. TJP"), 78), 1, MaxStrLen(HeaderLine));

        //Bank Branch Name
        HeaderLine := DelStr(HeaderLine, 81, 15);
        HeaderLine := copystr(InsStr(HeaderLine, SetLength(15, IndentType::Left, BankAccount."Zengin Branch Name Kana TJP"), 81), 1, MaxStrLen(HeaderLine));

        HeaderLine := DelStr(HeaderLine, 96, 1);
        IntTemp := BankAccount."Zengin Account Type TJP".AsInteger();
        HeaderLine := copystr(InsStr(HeaderLine, Format(IntTemp), 96), 1, MaxStrLen(HeaderLine));

        HeaderLine := DelStr(HeaderLine, 97, 7);
        HeaderLine := copystr(InsStr(HeaderLine, SetLength(7, IndentType::Right, Format(BankAccount."Zengin Bank Account No. TJP")), 97), 1, MaxStrLen(HeaderLine));

        TempBlob.CreateInStream(DataInStream);

        //DataOutStream.Write(HeaderLine);                               //Add comment
        //DataOutStream.WriteText();                                     //Add comment

        DotNetStreamWriter.WriteLine(HeaderLine);                        //New code
        DotNetStreamWriter.Flush();                                      //New code

        //SET Payment Journal
        if Template = '' then
            GenJournalLine.SetRange("Journal Template Name", JnlTemplateTxt)
        else begin
            GenJournalLine.SetRange("Journal Template Name", Template);
            GenJournalLine.SetRange("Journal Batch Name", Batch);
        end;
        //"Gen. Journal Line".SetRange("Account Type", "Gen. Journal Line"."Account Type"::Vendor);     // V2
        GenJournalLine.SetFilter("Account Type", 'Vendor|Employee');                                    // V2
        GenJournalLine.SetRange("Document Type", GenJournalLine."Document Type"::Payment);
        GenJournalLine.SetRange("Posting Date", SelectDate);
        GenJournalLine.SetRange("Bal. Account No.", SelPaymBankNo);

        if GenJournalLine.Count = 0 then
            Error(Text004Txt, SelectDate, SelPaymBankNo);

        if Template = '' then begin
            TempGenJournalLine.Reset();
            TempGenJournalLine.SetRange("Journal Template Name", JnlTemplateTxt);
        end else begin
            TempGenJournalLine.Reset();
            TempGenJournalLine.SetRange("Journal Template Name", Template);
            TempGenJournalLine.SetRange("Journal Batch Name", Batch);
        end;

        PurchasesPayablesSetup.Get();
        if not PurchasesPayablesSetup."ShowEachPmtJnlLineZengin TJP" then begin                  //DHA New Code 23.09.29
            if GenJournalLine.FindSet() then
                repeat
                    TempGenJournalLine.SetRange("Account No.", GenJournalLine."Account No.");
                    if (TempGenJournalLine.Find('-')) then begin
                        TempGenJournalLine.Amount += GenJournalLine.Amount;
                        TempGenJournalLine.Modify();
                    end else begin
                        TempGenJournalLine := GenJournalLine;
                        TempGenJournalLine.Insert();
                    end;
                until GenJournalLine.Next() = 0;
            TempGenJournalLine.SetRange("Account No.");

            //DHA New Code 23.09.29 [start]    
        end else begin
            if GenJournalLine.FindSet() then
                repeat
                    TempGenJournalLine.SetRange("Account No.", GenJournalLine."Account No.");
                    TempGenJournalLine.SetRange("Vendor Bank Account TJP", GenJournalLine."Vendor Bank Account TJP");
                    TempGenJournalLine.SetRange("Line No.", GenJournalLine."Line No.");
                    if (TempGenJournalLine.Find('-')) then begin
                        TempGenJournalLine.Amount += GenJournalLine.Amount;
                        TempGenJournalLine.Modify();
                    end else begin
                        TempGenJournalLine := GenJournalLine;
                        TempGenJournalLine.Insert();
                    end;
                until GenJournalLine.Next() = 0;
            TempGenJournalLine.SetRange("Account No.");
            TempGenJournalLine.SetRange("Vendor Bank Account TJP");
            TempGenJournalLine.SetRange("Line No.");
        end;
        //DHA New Code 23.09.29 [end]
    end;

    procedure SetItemLine()
    var
        IntTemp: Integer;
    begin
        Clear(PaymentTotal);
        Clear(TransCounter);
        TempGenJournalLine.FindSet();
        repeat
            if (TempGenJournalLine.Amount >= 0) or (TempGenJournalLine.Amount <= 9999999999.0) then begin
                Clear(ItemLine);

                ErrorCheck(CheckType::Data);

                //Vendor.Get(GenJnlLine."Account No.");                                                                         // V2
                //if not VendorBankAcc.Get(GenJnlLine."Account No.", GenJnlLine."Vendor Bank Account TJP") then                 // V2
                //    Message(Text001Txt, GenJnlLine."Account No.");                                                            // V2
                case TempGenJournalLine."Account Type" of                                                                       // V2
                    "Gen. Journal Account Type"::Vendor:                                                                        // V2
                        begin                                                                                                   // V2
                            Vendor.Get(TempGenJournalLine."Account No.");                                                       // V2
                            if not VendorBankAccount.Get(TempGenJournalLine."Account No.", TempGenJournalLine."Vendor Bank Account TJP") then       // V2
                                Message(Text001Txt, TempGenJournalLine."Account No.");                                          // V2
                        end;                                                                                                    // V2
                    GenJournalLine."Account Type"::Employee:                                                                    // V2
                        Employee.Get(TempGenJournalLine."Account No.");                                                         // V2
                end;                                                                                                            // V2

                //All Space
                ItemLine := PadStr(ItemLine, 120, ' ');

                //Data Classification
                ItemLine := DelStr(ItemLine, 1, 1);
                ItemLine := copystr(InsStr(ItemLine, '2', 1), 1, MaxStrLen(ItemLine));

                //Bank Number
                ItemLine := DelStr(ItemLine, 2, 4);
                //ItemLine := copystr(InsStr(ItemLine, GetBankNo(BankType::Bank, VendorBankAcc."Zengin Bank Branch No. TJP"), 2), 1, MaxStrLen(ItemLine));          // V2
                case TempGenJournalLine."Account Type" of                                                                                                                   // V2
                    "Gen. Journal Account Type"::Vendor:                                                                                                            // V2
                        ItemLine := copystr(InsStr(ItemLine, GetBankNo(BankType::Bank, VendorBankAccount."Zengin Bank Branch No. TJP"), 2), 1, MaxStrLen(ItemLine));    // V2
                    "Gen. Journal Account Type"::Employee:                                                                                                          // V2
                        ItemLine := copystr(InsStr(ItemLine, GetBankNo(BankType::Bank, Employee."Zengin Bank/Branch No. TJP"), 2), 1, MaxStrLen(ItemLine));         // V2
                end;                                                                                                                                                // V2

                //Bank Name
                ItemLine := DelStr(ItemLine, 6, 15);
                //ItemLine := copystr(InsStr(ItemLine, SetLength(15, IndentType::Left, VendorBankAcc."Zengin Bank Name Kana TJP"), 6), 1, MaxStrLen(ItemLine));         // V2
                case TempGenJournalLine."Account Type" of                                                                                                                       // V2
                    "Gen. Journal Account Type"::Vendor:                                                                                                                // V2
                        ItemLine := copystr(InsStr(ItemLine, SetLength(15, IndentType::Left, VendorBankAccount."Zengin Bank Name Kana TJP"), 6), 1, MaxStrLen(ItemLine));   // V2
                    "Gen. Journal Account Type"::Employee:                                                                                                              // V2
                        ItemLine := copystr(InsStr(ItemLine, SetLength(15, IndentType::Left, Employee."Zengin Bank Name Kana TJP"), 6), 1, MaxStrLen(ItemLine));        // V2
                end;                                                                                                                                                    // V2

                //Branch Number
                ItemLine := DelStr(ItemLine, 21, 3);
                //ItemLine := copystr(InsStr(ItemLine, GetBankNo(BankType::Branch, VendorBankAcc."Zengin Bank Branch No. TJP"), 21), 1, MaxStrLen(ItemLine));           // V2
                case TempGenJournalLine."Account Type" of                                                                                                                       // V2
                    "Gen. Journal Account Type"::Vendor:                                                                                                                // V2
                        ItemLine := copystr(InsStr(ItemLine, GetBankNo(BankType::Branch, VendorBankAccount."Zengin Bank Branch No. TJP"), 21), 1, MaxStrLen(ItemLine));     // V2
                    "Gen. Journal Account Type"::Employee:                                                                                                              // V2
                        ItemLine := copystr(InsStr(ItemLine, GetBankNo(BankType::Branch, Employee."Zengin Bank/Branch No. TJP"), 21), 1, MaxStrLen(ItemLine));          // V2
                end;                                                                                                                                                    // V2

                //Branch Name
                ItemLine := DelStr(ItemLine, 24, 15);
                //ItemLine := copystr(InsStr(ItemLine, SetLength(15, IndentType::Left, VendorBankAcc."Zengin Branch Name Kana TJP"), 24), 1, MaxStrLen(ItemLine));          // V2
                case TempGenJournalLine."Account Type" of                                                                                                                           // V2
                    "Gen. Journal Account Type"::Vendor:                                                                                                                    // V2
                        ItemLine := copystr(InsStr(ItemLine, SetLength(15, IndentType::Left, VendorBankAccount."Zengin Branch Name Kana TJP"), 24), 1, MaxStrLen(ItemLine));    // V2
                    "Gen. Journal Account Type"::Employee:                                                                                                                  // V2
                        ItemLine := copystr(InsStr(ItemLine, SetLength(15, IndentType::Left, Employee."Zengin Branch Name Kana TJP"), 24), 1, MaxStrLen(ItemLine));         // V2
                end;                                                                                                                                                        // V2

                //Deposit Type
                ItemLine := DelStr(ItemLine, 43, 1);
                //IntTemp := VendorBankAcc."Zengin Account Type TJP".AsInteger();           // V2
                case TempGenJournalLine."Account Type" of                                   // V2
                    "Gen. Journal Account Type"::Vendor:                                    // V2
                        IntTemp := VendorBankAccount."Zengin Account Type TJP".AsInteger(); // V2
                    "Gen. Journal Account Type"::Employee:                                  // V2
                        IntTemp := Employee."Zengin Account Type TJP".AsInteger();          // V2
                end;                                                                        // V2
                ItemLine := copystr(InsStr(ItemLine, Format(IntTemp), 43), 1, MaxStrLen(ItemLine));

                //Account Number
                ItemLine := DelStr(ItemLine, 44, 7);
                //ItemLine := copystr(InsStr(ItemLine, SetLength(7, IndentType::Right, Format(VendorBankAcc."Zengin Bank Account No. TJP")), 44), 1, MaxStrLen(ItemLine));          // V2
                case TempGenJournalLine."Account Type" of                                                                                                                                   // V2
                    "Gen. Journal Account Type"::Vendor:                                                                                                                            // V2
                        ItemLine := copystr(InsStr(ItemLine, SetLength(7, IndentType::Right, Format(VendorBankAccount."Zengin Bank Account No. TJP")), 44), 1, MaxStrLen(ItemLine));    // V2
                    "Gen. Journal Account Type"::Employee:                                                                                                                          // V2
                        ItemLine := copystr(InsStr(ItemLine, SetLength(7, IndentType::Right, Format(Employee."Zengin Account No. TJP")), 44), 1, MaxStrLen(ItemLine));              // V2
                end;

                //Recipient Name
                //ItemLine := DelStr(ItemLine, 51, StrLen(VendorBankAcc."Zengin Account Holder Kana TJP"));                                         // V2
                //ItemLine := copystr(InsStr(ItemLine, VendorBankAcc."Zengin Account Holder Kana TJP", 51), 1, MaxStrLen(ItemLine));                // V2
                case TempGenJournalLine."Account Type" of                                                                                           // V2
                    "Gen. Journal Account Type"::Vendor:                                                                                            // V2
                        begin                                                                                                                       // V2
                            ItemLine := DelStr(ItemLine, 51, StrLen(VendorBankAccount."Zengin Account Holder Kana TJP"));                           // V2
                            ItemLine := copystr(InsStr(ItemLine, VendorBankAccount."Zengin Account Holder Kana TJP", 51), 1, MaxStrLen(ItemLine));  // V2
                        end;                                                                                                                        // V2
                    "Gen. Journal Account Type"::Employee:                                                                                          // V2
                        begin                                                                                                                       // V2
                            ItemLine := DelStr(ItemLine, 51, StrLen(Employee."Zengin Account Holder Kana TJP"));                                    // V2
                            ItemLine := copystr(InsStr(ItemLine, Employee."Zengin Account Holder Kana TJP", 51), 1, MaxStrLen(ItemLine));           // V2
                        end;                                                                                                                        // V2
                end;                                                                                                                                // V2

                //Deposit Amount - Removed +GenJnlLine."Bank Fee"
                PaymAmtInText := Format(Round((TempGenJournalLine.Amount), 1, '='), 10, 1);
                PaymAmtInText := ConvertStr(PaymAmtInText, Text002Txt, Text003Txt);
                ItemLine := DelStr(ItemLine, 81, 10);
                ItemLine := copystr(InsStr(ItemLine, PaymAmtInText, 81), 1, MaxStrLen(ItemLine));

                //Code
                ItemLine := DelStr(ItemLine, 91, 1);
                ItemLine := copystr(InsStr(ItemLine, '0', 91), 1, MaxStrLen(ItemLine));

                //Deposit Type
                ItemLine := DelStr(ItemLine, 112, 1);
                ItemLine := copystr(InsStr(ItemLine, '7', 112), 1, MaxStrLen(ItemLine));

                if ShowVendNo then begin
                    ItemLine := DelStr(ItemLine, 114, 7);
                    ItemLine := copystr(InsStr(ItemLine, TempGenJournalLine."Account No." + '          ', 114), 1, MaxStrLen(ItemLine));
                end;

                ItemLine := DelStr(ItemLine, 121);

                TempBlob.CreateInStream(DataInStream);

                //DataOutStream.Write(ItemLine);                         //Add comment
                //DataOutStream.WriteText();                             //Add comment 

                DotNetStreamWriter.WriteLine(ItemLine);                  //New code
                DotNetStreamWriter.Flush();                              //New code

                //Removed +GenJnlLine."Bank Fee"
                PaymentTotal := PaymentTotal + Round(TempGenJournalLine.Amount, 1, '=');
                TransCounter := TransCounter + 1;
            end;
        until TempGenJournalLine.Next() = 0;
    end;

    procedure SetTotalLine()
    begin
        ErrorCheck(CheckType::Trail);

        //All Space
        TotalLine := PadStr(TotalLine, 120, ' ');

        //Data Classification
        TotalLine := DelStr(TotalLine, 1, 1);
        TotalLine := copystr(InsStr(TotalLine, '8', 1), 1, MaxStrLen(TotalLine));

        //Total Record Count
        CounterInText := Format(TransCounter, 6, 1);
        CounterInText := ConvertStr(CounterInText, Text002Txt, Text003Txt);
        TotalLine := DelStr(TotalLine, 2, 6);
        TotalLine := copystr(InsStr(TotalLine, CounterInText, 2), 1, MaxStrLen(TotalLine));

        //Total Amount
        TotalAmtInText := Format(Round(PaymentTotal, 1, '='), 12, 1);
        TotalAmtInText := ConvertStr(TotalAmtInText, Text002Txt, Text003Txt);
        TotalLine := DelStr(TotalLine, 8, 12);
        TotalLine := copystr(InsStr(TotalLine, TotalAmtInText, 8), 1, MaxStrLen(TotalLine));

        TempBlob.CreateInStream(DataInStream);

        //DataOutStream.WriteText(TotalLine);                            //Add comment
        //DataOutStream.WriteText();                                     //Add comment

        DotNetStreamWriter.WriteLine(TotalLine);                         //New new code
        DotNetStreamWriter.Flush();                                      //New new code
    end;

    procedure SetFooterLine()
    begin
        ErrorCheck(CheckType::Last);

        //All Space
        FooterLine := PadStr(FooterLine, 120, ' ');

        //Data Classification
        FooterLine := DelStr(FooterLine, 1, 1);
        FooterLine := copystr(InsStr(FooterLine, '9', 1), 1, MaxStrLen(FooterLine));

        TempBlob.CreateInStream(DataInStream);

        //DataOutStream.WriteText(FooterLine);                           //Add comment 
        //DataOutStream.WriteText();                                     //Add comment

        DotNetStreamWriter.WriteLine(FooterLine);                        //New code
        DotNetStreamWriter.Flush();                                      //New code

    end;

    procedure SetLength(Length: Integer; pIndentType: Option Left,Right; RetrunText: Text[120]) r_Text: Text[120]
    var
        StringLen: Integer;
        RightPos: Integer;
        LeftPos: Integer;
        IntCounter: Integer;
        SpaceText: Text[40];
    begin
        StringLen := StrLen(RetrunText);

        if Length < StringLen then begin
            r_Text := copystr(CopyStr(RetrunText, 1, Length), 1, MaxStrLen(r_Text));
            exit(r_Text);
        end;

        case pIndentType of
            pIndentType::Right:
                begin
                    RightPos := Length - StringLen;
                    r_Text := copystr(PadStr(r_Text, RightPos, '0'), 1, MaxStrLen(r_Text));
                    r_Text := copystr(InsStr(r_Text, RetrunText, RightPos + 1), 1, MaxStrLen(r_Text));
                    exit(r_Text);
                end;
            pIndentType::Left:
                begin
                    LeftPos := Length - StringLen;
                    r_Text := RetrunText;
                    if LeftPos <> 0 then
                        repeat
                            IntCounter += 1;
                            SpaceText += ' ';
                        until LeftPos = IntCounter;
                    r_Text := copystr(InsStr(r_Text, SpaceText, StringLen + 1), 1, MaxStrLen(r_Text));
                    exit(r_Text);
                end;
        end;
    end;

    procedure GetBankNo(pBankType: Option Bank,Branch; BankNo: Text[20]) Text: Text[20]
    begin
        case pBankType of
            pBankType::Bank:
                if StrLen(CopyStr(BankNo, 1, 4)) = 4 then
                    exit(CopyStr(BankNo, 1, 4))
                else
                    exit('    ');
            pBankType::Branch:
                if StrLen(CopyStr(BankNo, 5, 3)) = 3 then
                    exit(CopyStr(BankNo, 5, 3))
                else
                    exit('   ');
        end;
    end;

    procedure ErrorValidation(TempCode: Code[10]; BatchCode: Code[10]; PayBankAccCode: Code[20]; PostingDate: Date)
    var
        _GenJournalLine: Record "Gen. Journal Line";
    begin
        _GenJournalLine.SetRange("Journal Template Name", TempCode);
        _GenJournalLine.SetRange("Journal Batch Name", BatchCode);
        _GenJournalLine.SetRange("Bal. Account No.", PayBankAccCode);
        _GenJournalLine.SetRange("Posting Date", PostingDate);
        //lGenJnlLine.SetRange("Account Type", lGenJnlLine."Account Type"::Vendor);         // V2
        _GenJournalLine.SetFilter("Account Type", 'Vendor|Employee');                       // V2
        if _GenJournalLine.FindSet() then
            repeat
                //lGenJnlLine.TestField("Vendor Bank Account TJP");                         // V2
                case _GenJournalLine."Account Type" of                                      // V2
                    _GenJournalLine."Account Type"::Vendor:                                 // V2
                        _GenJournalLine.TestField("Vendor Bank Account TJP");               // V2
                end;                                                                        // V2
                _GenJournalLine.TestField(_GenJournalLine."Bal. Account Type", _GenJournalLine."Bal. Account Type"::"Bank Account");
                _GenJournalLine.TestField("Bal. Account No.");
            until _GenJournalLine.Next() = 0;
    end;

    procedure ErrorCheck(ErrorCheckType: Integer)
    begin
        case ErrorCheckType of
            0:                //Header
                exit;
            1:                //Data
                //if GenJnlLine."Vendor Bank Account TJP" = '' then                     // V2
                //    Error(Text008Txt);                                                // V2
                case TempGenJournalLine."Account Type" of                               // V2
                    "Gen. Journal Account Type"::Vendor:                                // V2
                        if TempGenJournalLine."Vendor Bank Account TJP" = '' then       // V2 
                            Error(Text008Txt);                                          // V2
                end;                                                                    // V2
            2:                //Trail
                exit;
            3:                //Last
                exit;
        end;
    end;
}

