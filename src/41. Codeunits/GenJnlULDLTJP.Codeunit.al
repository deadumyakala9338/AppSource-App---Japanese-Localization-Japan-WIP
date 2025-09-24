#if AppSource
codeunit 70658596 "Gen. Jnl.-UL/DL TJP"
#endif
#if OnPremise
codeunit 99010 "Gen. Jnl.-UL/DL TJP"
#endif
{
    //
    // Upload General Journal Lines from Excel sheet
    //
    procedure UploadGeneralJournalFromExcel(JournalTemplateName: Code[10]; JournalBatchName: Code[10])
    var
        //
        TempExcelBuffer: Record "Excel Buffer" temporary;
        GenJournalBatch: Record "Gen. Journal Batch";
        GenJournalLineRec: Record "Gen. Journal Line";
        GLAccountRec: Record "G/L Account";                                                         // 2025-02-21 Anada
        //NoSeriesManagement: Codeunit NoSeriesManagement;      // 2025-09-11 Anada
        NoSeriesManagement: Codeunit "No. Series";              // 2025-09-11 Anada
        //
        Filename: Text;
        ExcelSheetInStream: InStream;
        SheetNameLbl: Label 'General Journal Lines';
        SelectFileMsg: Label 'Select the Excel file...';
        CanceledMsg: Label 'Operation has been canceled.';
        SheetNotFoundMsg: Label 'Could not find sheet: "%1"', Comment = '%1=Expected Sheet Name';
        NoValueLbl: Label '(No Value)';
        CannotUseNoValueMsg: Label 'Cannot specify this value in the cell: "%1"', Comment = '%1="(No Value)"';
        LastColumnLbl: Label 'Last Column';
        //
        ConfirmDeleteMsg: Label 'Records in the current batch will be deleted.\\Do you want to continue?';
        //
        RowNo: Integer;
        ColumnNo: Integer;
        LastRowNo: Integer;
        LastColumnNo: Integer;
        //
        ListOfFields: Dictionary of [integer, Text];
        FieldNameText: Text;
        CellValueAsText: Text;
        //
        PostingDate: Date;
        DocumentType: Enum "Gen. Journal Document Type";
        DocumentNo: Code[20];
        AccountType: Enum "Gen. Journal Account Type";
        AccountNo: Code[20];
        Description: Text[100];
        CurrencyCode: Code[10];
        Amount: Decimal;
        VATAmount: Decimal;
        ExternalDocumentNo: Code[35];
        GeneralPostingType: Enum "General Posting Type";
        GeneralBusinessPostingGroup: Code[20];
        GeneralProductPostingGroup: Code[20];
        VATBusinessPostingGroup: Code[20];
        VATProductPostingGroup: Code[20];
        Comment: Text[250];
        ShortcutDimension1Code: Code[20];
        ShortcutDimension2Code: Code[20];
        ShortcutDimension3Code: Code[20];
        ShortcutDimension4Code: Code[20];
        ShortcutDimension5Code: Code[20];
        ShortcutDimension6Code: Code[20];
        ShortcutDimension7Code: Code[20];
        ShortcutDimension8Code: Code[20];
        //
        LineNo: Integer;
        //
        NoSeries: Code[20];
        LastPostingDate: Date;
        //                                                                                          // 2025-02-22 Anada
        AssignDocumentNoBoolean: Boolean;                                                           // 2025-02-22 Anada
    begin
        // Confirmation Message
        GenJournalLineRec.SetRange("Journal Template Name", JournalTemplateName);
        GenJournalLineRec.SetRange("Journal Batch Name", JournalBatchName);
        if GenJournalLineRec.Count <> 0 then
            if Confirm(ConfirmDeleteMsg, false) = false then begin
                Message(CanceledMsg);
                exit;
            end;
        GenJournalLineRec.Reset();
        // Upload from Excel File
        if UploadIntoStream(SelectFileMsg, '', '', Filename, ExcelSheetInStream) = false then begin
            Message(CanceledMsg);
            exit;
        end;
        if TempExcelBuffer.OpenBookStream(ExcelSheetInStream, SheetNameLbl) <> '' then begin
            Message(SheetNotFoundMsg, SheetNameLbl);
            exit;
        end;
        // Read Excel sheet into buffer
        TempExcelBuffer.ReadSheet();
        TempExcelBuffer.Setrange("Column No.", 1);
        TempExcelBuffer.FindLast();
        LastRowNo := TempExcelBuffer."Row No.";
        TempExcelBuffer.Reset();
        // Read column header
        for RowNo := 1 to 1 do begin
            ColumnNo := 1;
            while TempExcelBuffer.Get(RowNo, ColumnNo) = true do begin
                ListOfFields.Add(ColumnNo, CopyStr(TempExcelBuffer."Cell Value as Text", 1));
                ColumnNo := ColumnNo + 1;
            end;
            LastColumnNo := ColumnNo;
        end;
        // Fill in additional last column
        for RowNo := 1 to LastRowNo do begin
            TempExcelBuffer.SetRange("Row No.", RowNo);
            if TempExcelBuffer.FindFirst() = true then begin
                TempExcelBuffer.Init();
                TempExcelBuffer.Validate("Row No.", RowNo);
                TempExcelBuffer.Validate("Column No.", LastColumnNo);
                TempExcelBuffer.Validate("Cell Value as Text", LastColumnLbl);
                TempExcelBuffer.Insert(true);
            end;
        end;
        // Create records for blank column
        for RowNo := 1 to LastRowNo do
            for ColumnNo := 1 to LastColumnNo do begin
                if TempExcelBuffer.Get(RowNo, ColumnNo) = true then
                    if TempExcelBuffer."Cell Value as Text" = NoValueLbl then begin
                        Message(CannotUseNoValueMsg, NoValueLbl);
                        exit;
                    end;
                if TempExcelBuffer.Get(RowNo, ColumnNo) = false then begin
                    TempExcelBuffer.Init();
                    TempExcelBuffer.Validate("Row No.", RowNo);
                    TempExcelBuffer.Validate("Column No.", ColumnNo);
                    TempExcelBuffer.Validate("Cell Value as Text", NoValueLbl);
                    TempExcelBuffer.Insert(true);
                end;
            end;
        // Delete recrods from the current batch
        GenJournalLineRec.SetRange("Journal Template Name", JournalTemplateName);
        GenJournalLineRec.SetRange("Journal Batch Name", JournalBatchName);
        GenJournalLineRec.DeleteAll();
        // Create list of shortcut dimension captions
        CreateListOfShortcutDimensionCodeCaptions();
        // Check if assign Document No.                                                             // 2025-02-22 Anada
        GenJournalBatch.Get(JournalTemplateName, JournalBatchName);                                 // 2025-02-22 Anada
        if GenJournalBatch."No. Series" <> '' then                                                  // 2025-02-22 Anada
            AssignDocumentNoBoolean := true;                                                        // 2025-02-22 Anada
        // Process data in the cells
        for RowNo := 2 to LastRowNo do
            for ColumnNo := 1 to LastColumnNo do
                if TempExcelBuffer.Get(RowNo, ColumnNo) = true then begin
                    // Save value in each field
                    if ListOfFields.Get(ColumnNo, FieldNameText) = true then
                        case FieldNameText of
                            // Posting Date
                            GenJournalLineRec.FieldCaption("Posting Date"):
                                begin
                                    PostingDate := 0D;
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 10);
                                    if CellValueAsText <> NoValueLbl then
                                        Evaluate(PostingDate, CellValueAsText);
                                end;
                            // Document Type
                            GenJournalLineRec.FieldCaption("Document Type"):
                                begin
                                    DocumentType := GenJournalLineRec."Document Type"::" ";
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1);
                                    if CellValueAsText <> NoValueLbl then
                                        case CellValueAsText of
                                            Format(GenJournalLineRec."Document Type"::" "):
                                                DocumentType := GenJournalLineRec."Document Type"::" ";
                                            Format(GenJournalLineRec."Document Type"::Payment):
                                                DocumentType := GenJournalLineRec."Document Type"::Payment;
                                            Format(GenJournalLineRec."Document Type"::Invoice):
                                                DocumentType := GenJournalLineRec."Document Type"::Invoice;
                                        end;
                                end;
                            // Document No.                                                                         // 2025-02-22 Anada                                           
                            GenJournalLineRec.FieldCaption("Document No."):                                         // 2025-02-22 Anada
                                begin                                                                               // 2025-02-22 Anada
                                    DocumentNo := '';                                                               // 2025-02-22 Anada
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 20);        // 2025-02-22 Anada
                                    if CellValueAsText <> NoValueLbl then                                           // 2025-02-22 Anada
                                        DocumentNo := CopyStr(CellValueAsText, 1, 20);                              // 2025-02-22 Anada
                                end;                                                                                // 2025-02-22 Anada
                            // Account Type
                            GenJournalLineRec.FieldCaption("Account Type"):
                                begin
                                    AccountType := GenJournalLineRec."Account Type"::"G/L Account";
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1);
                                    if CellValueAsText <> NoValueLbl then
                                        case CellValueAsText of
                                            Format(GenJournalLineRec."Account Type"::"G/L Account"):
                                                AccountType := GenJournalLineRec."Account Type"::"G/L Account";
                                            Format(GenJournalLineRec."Account Type"::Customer):
                                                AccountType := GenJournalLineRec."Account Type"::Customer;
                                            Format(GenJournalLineRec."Account Type"::Vendor):
                                                AccountType := GenJournalLineRec."Account Type"::Vendor;
                                            Format(GenJournalLineRec."Account Type"::"Bank Account"):
                                                AccountType := GenJournalLineRec."Account Type"::"Bank Account";
                                        end;
                                end;
                            // Account No.
                            GenJournalLineRec.FieldCaption("Account No."):
                                begin
                                    AccountNo := '';
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 20);
                                    if CellValueAsText <> NoValueLbl then
                                        AccountNo := CopyStr(CellValueAsText, 1, 20);
                                end;
                            // Description
                            GenJournalLineRec.FieldCaption(Description):
                                begin
                                    Description := '';
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 100);
                                    if CellValueAsText <> NoValueLbl then
                                        Description := CopyStr(CellValueAsText, 1, 100);
                                end;
                            // Currency Code
                            GenJournalLineRec.FieldCaption("Currency Code"):
                                begin
                                    CurrencyCode := '';
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 10);
                                    if CellValueAsText <> NoValueLbl then
                                        CurrencyCode := CopyStr(CellValueAsText, 1, 10);
                                end;
                            // Amount
                            GenJournalLineRec.FieldCaption(Amount):
                                begin
                                    Amount := 0;
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1);
                                    if CellValueAsText <> NoValueLbl then
                                        Evaluate(Amount, CellValueAsText);
                                end;
                            // VAT Amount
                            GenJournalLineRec.FieldCaption("VAT Amount"):
                                begin
                                    VATAmount := 0;
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1);
                                    if CellValueAsText <> NoValueLbl then
                                        Evaluate(VATAmount, CellValueAsText);
                                end;
                            // External Document No.
                            GenJournalLineRec.FieldCaption("External Document No."):
                                begin
                                    ExternalDocumentNo := '';
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 35);
                                    if CellValueAsText <> NoValueLbl then
                                        ExternalDocumentNo := CopyStr(CellValueAsText, 1, 35);
                                end;
                            // General Posting Type
                            GenJournalLineRec.FieldCaption("Gen. Posting Type"):
                                begin
                                    GeneralPostingType := GenJournalLineRec."Gen. Posting Type"::" ";
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1);
                                    if CellValueAsText <> NoValueLbl then
                                        case CellValueAsText of
                                            Format(GenJournalLineRec."Gen. Posting Type"::" "):
                                                GeneralPostingType := GenJournalLineRec."Gen. Posting Type"::" ";
                                            Format(GenJournalLineRec."Gen. Posting Type"::Purchase):
                                                GeneralPostingType := GenJournalLineRec."Gen. Posting Type"::Purchase;
                                            Format(GenJournalLineRec."Gen. Posting Type"::Sale):
                                                GeneralPostingType := GenJournalLineRec."Gen. Posting Type"::Sale;
                                        end;
                                    if GeneralPostingType = GenJournalLineRec."Gen. Posting Type"::" " then                         // 2025-02-21 Anada
                                        if GLAccountRec.Get(AccountNo) = true then                                                  // 2025-02-21 Anada
                                            if GLAccountRec."Gen. Posting Type" <> GLAccountRec."Gen. Posting Type"::" " then       // 2025-02-21 Anada
                                                GeneralPostingType := GLAccountRec."Gen. Posting Type";                             // 2025-02-21 Anada
                                end;
                            // General Business Posting Group
                            GenJournalLineRec.FieldCaption("Gen. Bus. Posting Group"):
                                begin
                                    GeneralBusinessPostingGroup := '';
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 20);
                                    if CellValueAsText <> NoValueLbl then
                                        GeneralBusinessPostingGroup := CopyStr(CellValueAsText, 1, 20);
                                end;
                            // General Product Posting Group
                            GenJournalLineRec.FieldCaption("Gen. Prod. Posting Group"):
                                begin
                                    GeneralProductPostingGroup := '';
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 20);
                                    if CellValueAsText <> NoValueLbl then
                                        GeneralProductPostingGroup := CopyStr(CellValueAsText, 1, 20);
                                end;
                            // VAT Business Posting Group
                            GenJournalLineRec.FieldCaption("VAT Bus. Posting Group"):
                                begin
                                    VATBusinessPostingGroup := '';
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 20);
                                    if CellValueAsText <> NoValueLbl then
                                        VATBusinessPostingGroup := CopyStr(CellValueAsText, 1, 20);
                                end;
                            // VAT Product Posting Group
                            GenJournalLineRec.FieldCaption("VAT Prod. Posting Group"):
                                begin
                                    VATProductPostingGroup := '';
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 20);
                                    if CellValueAsText <> NoValueLbl then
                                        VATProductPostingGroup := CopyStr(CellValueAsText, 1, 20);
                                end;
                            // Comment
                            GenJournalLineRec.FieldCaption(Comment):
                                begin
                                    Comment := '';
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 250);
                                    if CellValueAsText <> NoValueLbl then
                                        Comment := CopyStr(CellValueAsText, 1, 250);
                                end;
                            // Shortcut Dimension 1
                            ShortcutDimensionCodeCaption(1):
                                begin
                                    ShortcutDimension1Code := '';
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 20);
                                    if CellValueAsText <> NoValueLbl then
                                        ShortcutDimension1Code := CopyStr(CellValueAsText, 1, 20);
                                end;
                            // Shortcut Dimension 2
                            ShortcutDimensionCodeCaption(2):
                                begin
                                    ShortcutDimension2Code := '';
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 20);
                                    if CellValueAsText <> NoValueLbl then
                                        ShortcutDimension2Code := CopyStr(CellValueAsText, 1, 20);
                                end;
                            // Shortcut Dimension 3
                            ShortcutDimensionCodeCaption(3):
                                begin
                                    ShortcutDimension3Code := '';
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 20);
                                    if CellValueAsText <> NoValueLbl then
                                        ShortcutDimension3Code := CopyStr(CellValueAsText, 1, 20);
                                end;
                            // Shortcut Dimension 4
                            ShortcutDimensionCodeCaption(4):
                                begin
                                    ShortcutDimension4Code := '';
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 20);
                                    if CellValueAsText <> NoValueLbl then
                                        ShortcutDimension4Code := CopyStr(CellValueAsText, 1, 20);
                                end;
                            // Shortcut Dimension 5
                            ShortcutDimensionCodeCaption(5):
                                begin
                                    ShortcutDimension5Code := '';
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 20);
                                    if CellValueAsText <> NoValueLbl then
                                        ShortcutDimension5Code := CopyStr(CellValueAsText, 1, 20);
                                end;
                            // Shortcut Dimension 6
                            ShortcutDimensionCodeCaption(6):
                                begin
                                    ShortcutDimension6Code := '';
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 20);
                                    if CellValueAsText <> NoValueLbl then
                                        ShortcutDimension6Code := CopyStr(CellValueAsText, 1, 20);
                                end;
                            // Shortcut Dimension 7
                            ShortcutDimensionCodeCaption(7):
                                begin
                                    ShortcutDimension7Code := '';
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 20);
                                    if CellValueAsText <> NoValueLbl then
                                        ShortcutDimension7Code := CopyStr(CellValueAsText, 1, 20);
                                end;
                            // Shortcut Dimension 8
                            ShortcutDimensionCodeCaption(8):
                                begin
                                    ShortcutDimension8Code := '';
                                    CellValueAsText := CopyStr(TempExcelBuffer."Cell Value as Text", 1, 20);
                                    if CellValueAsText <> NoValueLbl then
                                        ShortcutDimension8Code := CopyStr(CellValueAsText, 1, 20);
                                end;
                        end;
                    //
                    if ColumnNo = LastColumnNo then begin
                        // Insert a new record
                        GenJournalLineRec.init();
                        GenJournalLineRec.Validate("Journal Template Name", JournalTemplateName);
                        GenJournalLineRec.Validate("Journal Batch Name", JournalBatchName);
                        LineNo := 10000 * (RowNo - 1);
                        GenJournalLineRec.Validate("Line No.", LineNo);
                        GenJournalLineRec.Insert(true);
                        // Modify the record
                        GenJournalLineRec.Validate("Posting Date", PostingDate);    // Posting Date
                        case DocumentType of    // Document Type
                            GenJournalLineRec."Document Type"::" ":
                                GenJournalLineRec.Validate("Document Type", GenJournalLineRec."Document Type"::" ");
                            GenJournalLineRec."Document Type"::Payment:
                                GenJournalLineRec.Validate("Document Type", GenJournalLineRec."Document Type"::Payment);
                            GenJournalLineRec."Document Type"::Invoice:
                                GenJournalLineRec.Validate("Document Type", GenJournalLineRec."Document Type"::Invoice);
                        end;
                        if AssignDocumentNoBoolean = false then    // Document No.                                              // 2025-02-22 Anada
                            GenJournalLineRec.Validate("Document No.", DocumentNo);                                             // 2025-02-22 Anada
                        case AccountType of    // Account Type
                            GenJournalLineRec."Account Type"::"G/L Account":
                                GenJournalLineRec.Validate("Account Type", GenJournalLineRec."Account Type"::"G/L Account");
                            GenJournalLineRec."Account Type"::Customer:
                                GenJournalLineRec.Validate("Account Type", GenJournalLineRec."Account Type"::Customer);
                            GenJournalLineRec."Account Type"::Vendor:
                                GenJournalLineRec.Validate("Account Type", GenJournalLineRec."Account Type"::Vendor);
                            GenJournalLineRec."Account Type"::"Bank Account":
                                GenJournalLineRec.Validate("Account Type", GenJournalLineRec."Account Type"::"Bank Account");
                        end;
                        GenJournalLineRec.Validate("Account No.", AccountNo);    // Account No.
                        if Description <> '' then
                            GenJournalLineRec.Validate(Description, Description);    // Description
                        GenJournalLineRec.Validate("Currency Code", CurrencyCode);    // Currency Code
                        GenJournalLineRec.Validate(Amount, Amount);    // Amount
                        GenJournalLineRec.Validate("External Document No.", ExternalDocumentNo);    // External Document No.
                        case GeneralPostingType of    // General Posting Type
                            GenJournalLineRec."Gen. Posting Type"::" ":
                                GenJournalLineRec.Validate("Gen. Posting Type", GenJournalLineRec."Gen. Posting Type"::" ");
                            GenJournalLineRec."Gen. Posting Type"::Purchase:
                                GenJournalLineRec.Validate("Gen. Posting Type", GenJournalLineRec."Gen. Posting Type"::Purchase);
                            GenJournalLineRec."Gen. Posting Type"::Sale:
                                GenJournalLineRec.Validate("Gen. Posting Type", GenJournalLineRec."Gen. Posting Type"::Sale);
                        end;
                        if GeneralBusinessPostingGroup <> '' then    // General Business Posting Group
                            GenJournalLineRec.Validate("Gen. Bus. Posting Group", GeneralBusinessPostingGroup);
                        if GeneralProductPostingGroup <> '' then    // General Product Posting Group
                            GenJournalLineRec.Validate("Gen. Prod. Posting Group", GeneralProductPostingGroup);
                        if VATBusinessPostingGroup <> '' then    // VAT Business Posting Group
                            GenJournalLineRec.Validate("VAT Bus. Posting Group", VATBusinessPostingGroup);
                        if VATProductPostingGroup <> '' then    // VAT Product Posting Group
                            GenJournalLineRec.Validate("VAT Prod. Posting Group", VATProductPostingGroup);
                        if VATAmount <> 0 then    // VAT Amount
                            GenJournalLineRec.Validate("VAT Amount", VATAmount);
                        if Comment <> '' then    // Comment
                            GenJournalLineRec.Validate(Comment, Comment);
                        if ShortcutDimension1Code <> '' then    // Shortcut Dimension 1 Code
                            GenJournalLineRec.Validate("Shortcut Dimension 1 Code", ShortcutDimension1Code);
                        if ShortcutDimension2Code <> '' then    // Shortcut Dimension 2 Code
                            GenJournalLineRec.Validate("Shortcut Dimension 2 Code", ShortcutDimension2Code);
                        if ShortcutDimension3Code <> '' then    // Shortcut Dimension 3 Code
                            GenJournalLineRec.ValidateShortcutDimCode(3, ShortcutDimension3Code);
                        if ShortcutDimension4Code <> '' then    // Shortcut Dimension 4 Code
                            GenJournalLineRec.ValidateShortcutDimCode(4, ShortcutDimension4Code);
                        if ShortcutDimension5Code <> '' then    // Shortcut Dimension 5 Code
                            GenJournalLineRec.ValidateShortcutDimCode(5, ShortcutDimension5Code);
                        if ShortcutDimension6Code <> '' then    // Shortcut Dimension 6 Code
                            GenJournalLineRec.ValidateShortcutDimCode(6, ShortcutDimension6Code);
                        if ShortcutDimension7Code <> '' then    // Shortcut Dimension 7 Code
                            GenJournalLineRec.ValidateShortcutDimCode(7, ShortcutDimension7Code);
                        if ShortcutDimension8Code <> '' then    // Shortcut Dimension 8 Code
                            GenJournalLineRec.ValidateShortcutDimCode(8, ShortcutDimension8Code);
                        GenJournalLineRec.Modify(true);
                    end;
                end;
        // Assign Document No.
        //GenJournalBatch.Get(JournalTemplateName, JournalBatchName);                               // 2025-01-22 Anada
        if AssignDocumentNoBoolean = true then begin                                                // 2025-01-22 Anada
            NoSeries := GenJournalBatch."No. Series";
            LastPostingDate := 0D;
            GenJournalLineRec.SetRange("Journal Template Name", JournalTemplateName);
            GenJournalLineRec.SetRange("Journal Batch Name", JournalBatchName);
            GenJournalLineRec.SetCurrentKey("Posting Date");
            GenJournalLineRec.SetAscending("Posting Date", true);
            if GenJournalLineRec.Find('-') = true then
                repeat
                    if GenJournalLineRec."Posting Date" <> LastPostingDate then begin
                        DocumentNo := NoSeriesManagement.GetNextNo(NoSeries, GenJournalLineRec."Posting Date", true);
                        LastPostingDate := GenJournalLineRec."Posting Date";
                    end;
                    GenJournalLineRec.Validate("Document No.", DocumentNo);
                    GenJournalLineRec.Modify(true);
                until GenJournalLineRec.Next() = 0;
        end;                                                                                        // 2025-01-22 Anada
    end;


    //
    // Download General Journal Lines to Excel sheet
    //
    procedure DownloadGeneralJournalToExcel(JournalTemplateName: Code[10]; JournalBatchName: Code[10])
    var
    begin
        CreateExcelSheetGeneralJournalLines(JournalTemplateName, JournalBatchName);
        CreateExcelSheetGLAccounts();
        CreateExcelSheetCustomers();
        CreateExcelSheetVendors();
        CreateExcelSheetBankAccounts();
        CreateExcelFile();
    end;



    //
    // General Journal Lines
    //
    local procedure CreateExcelSheetGeneralJournalLines(JournalTemplateName: Code[10]; JournalBatchName: Code[10])
    var
        GenJournalLineRec: Record "Gen. Journal Line";
        GenJournalBatch: Record "Gen. Journal Batch";                                               // 2025-02-22 Anada
        DocumentTypeCommentTextTxt: Label 'Enter one of the following values: ';
        DocumentTypeCommentTextText: Text;
        AccountTypeCommentTextTxt: Label 'Enter one of the following values: ';
        AccountTypeCommentTextText: Text;
        SheetNameLbl: Label 'General Journal Lines';
        CRLFText: Text[2];
        BlankLbl: Label '(Blank)';
        ShortcutDimensionNo: Integer;
        AssignDocumentNoBoolean: Boolean;                                                           // 2025-02-22 Anada
    begin
        //
        CreateListOfShortcutDimensionCodeCaptions();
        //
        GenJournalBatch.Get(JournalTemplateName, JournalBatchName);                                 // 2025-02-22 Anada
        if GenJournalBatch."No. Series" <> '' then                                                  // 2025-02-22 Anada
            AssignDocumentNoBoolean := true;                                                        // 2025-02-22 Anada
        //                                                                                          // 2025-02-22 Anada
        CRLFText[1] := 13;
        CRLFText[2] := 10;
        DocumentTypeCommentTextText := DocumentTypeCommentTextTxt
            + CRLFText + Format(GenJournalLineRec."Document Type"::" ") + '                    ' + BlankLbl
            + CRLFText + Format(GenJournalLineRec."Document Type"::Payment)
            + CRLFText + Format(GenJournalLineRec."Document Type"::Invoice);
        AccountTypeCommentTextText := AccountTypeCommentTextTxt
            + CRLFText + Format(GenJournalLineRec."Account Type"::"G/L Account")
            + CRLFText + Format(GenJournalLineRec."Account Type"::Customer)
            + CRLFText + Format(GenJournalLineRec."Account Type"::Vendor)
            + CRLFText + Format(GenJournalLineRec."Account Type"::"Bank Account");
        //
        TempExcelBufferRec.Reset();
        TempExcelBufferRec.DeleteAll();
        //
        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.AddColumn(GenJournalLineRec.FieldCaption("Posting Date"), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        TempExcelBufferRec.AddColumn(GenJournalLineRec.FieldCaption("Document Type"), false, DocumentTypeCommentTextText, false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        if AssignDocumentNoBoolean = false then                                                                                                                         // 2025-01-22 Anada
            TempExcelBufferRec.AddColumn(GenJournalLineRec.FieldCaption("Document No."), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);     // 2025-02-22 Anada
        TempExcelBufferRec.AddColumn(GenJournalLineRec.FieldCaption("Account Type"), false, AccountTypeCommentTextText, false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        TempExcelBufferRec.AddColumn(GenJournalLineRec.FieldCaption("Account No."), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        TempExcelBufferRec.AddColumn(GenJournalLineRec.FieldCaption(Description), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        TempExcelBufferRec.AddColumn(GenJournalLineRec.FieldCaption("Currency Code"), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        TempExcelBufferRec.AddColumn(GenJournalLineRec.FieldCaption(Amount), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        TempExcelBufferRec.AddColumn(GenJournalLineRec.FieldCaption("VAT Amount"), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        //
        TempExcelBufferRec.AddColumn(GenJournalLineRec.FieldCaption("External Document No."), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        //
        TempExcelBufferRec.AddColumn(GenJournalLineRec.FieldCaption("Gen. Posting Type"), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        TempExcelBufferRec.AddColumn(GenJournalLineRec.FieldCaption("Gen. Bus. Posting Group"), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        TempExcelBufferRec.AddColumn(GenJournalLineRec.FieldCaption("Gen. Prod. Posting Group"), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        TempExcelBufferRec.AddColumn(GenJournalLineRec.FieldCaption("VAT Bus. Posting Group"), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        TempExcelBufferRec.AddColumn(GenJournalLineRec.FieldCaption("VAT Prod. Posting Group"), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        //
        TempExcelBufferRec.AddColumn(GenJournalLineRec.FieldCaption(Comment), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        //
        for ShortcutDimensionNo := 1 to 8 do
            if ListOfShortcutDimensionCodes.ContainsKey(ShortcutDimensionNo) then
                TempExcelBufferRec.AddColumn(ShortcutDimensionCodeCaption(ShortcutDimensionNo), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        //
        GenJournalLineRec.SetRange("Journal Template Name", JournalTemplateName);
        GenJournalLineRec.SetRange("Journal Batch Name", JournalBatchName);
        if GenJournalLineRec.Find('-') = true then
            repeat
                TempExcelBufferRec.NewRow();
                TempExcelBufferRec.AddColumn(GenJournalLineRec."Posting Date", false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Date);
                TempExcelBufferRec.AddColumn(GenJournalLineRec."Document Type", false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
                if AssignDocumentNoBoolean = false then                                                                                                                         // 2025-01-22 Anada
                    TempExcelBufferRec.AddColumn(GenJournalLineRec."Document No.", false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);                   // 2025-01-22 Anada
                TempExcelBufferRec.AddColumn(GenJournalLineRec."Account Type", false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
                TempExcelBufferRec.AddColumn(GenJournalLineRec."Account No.", false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
                TempExcelBufferRec.AddColumn(GenJournalLineRec.Description, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
                TempExcelBufferRec.AddColumn(GenJournalLineRec."Currency Code", false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
                TempExcelBufferRec.AddColumn(GenJournalLineRec.Amount, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);
                TempExcelBufferRec.AddColumn(GenJournalLineRec."VAT Amount", false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Number);
                //
                TempExcelBufferRec.AddColumn(GenJournalLineRec."External Document No.", false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
                //
                TempExcelBufferRec.AddColumn(GenJournalLineRec."Gen. Posting Type", false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
                TempExcelBufferRec.AddColumn(GenJournalLineRec."Gen. Bus. Posting Group", false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
                TempExcelBufferRec.AddColumn(GenJournalLineRec."Gen. Prod. Posting Group", false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
                TempExcelBufferRec.AddColumn(GenJournalLineRec."VAT Bus. Posting Group", false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
                TempExcelBufferRec.AddColumn(GenJournalLineRec."VAT Prod. Posting Group", false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
                //
                TempExcelBufferRec.AddColumn(GenJournalLineRec.Comment, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
                //
                for ShortcutDimensionNo := 1 to 8 do
                    if ListOfShortcutDimensionCodes.ContainsKey(ShortcutDimensionNo) then
                        TempExcelBufferRec.AddColumn(
                            DimensionValueCodeOfGeneralJournalLine(JournalTemplateName, JournalBatchName, GenJournalLineRec."Line No.",
                            ShortcutDimensionCode(ShortcutDimensionNo)), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
            until GenJournalLineRec.Next() = 0;
        //
        TempExcelBufferRec.CreateNewBook(SheetNameLbl);
        TempExcelBufferRec.WriteSheet(ReportHeaderLbl, CompanyName(), UserId());
        //
        if AssignDocumentNoBoolean = true then begin                                                // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('A', 15);    // Posting Date
            TempExcelBufferRec.SetColumnWidth('B', 15);    // Document Type
            TempExcelBufferRec.SetColumnWidth('C', 15);    // Account Type
            TempExcelBufferRec.SetColumnWidth('D', 15);    // Account No.
            TempExcelBufferRec.SetColumnWidth('E', 30);    // Description
            TempExcelBufferRec.SetColumnWidth('F', 10);    // Currency Code
            TempExcelBufferRec.SetColumnWidth('G', 15);    // Amount
            TempExcelBufferRec.SetColumnWidth('H', 15);    // VAT Amount
                                                           //
            TempExcelBufferRec.SetColumnWidth('I', 20);    // External Document No.
                                                           //
            TempExcelBufferRec.SetColumnWidth('J', 15);    // General Posting Type
            TempExcelBufferRec.SetColumnWidth('K', 25);    // General Business Posting Group
            TempExcelBufferRec.SetColumnWidth('L', 25);    // General Product Posting Group
            TempExcelBufferRec.SetColumnWidth('M', 25);    // VAT Business Posting Group
            TempExcelBufferRec.SetColumnWidth('N', 25);    // VAT Product Posting Group
                                                           //
            TempExcelBufferRec.SetColumnWidth('O', 25);    // Comment
                                                           //
            TempExcelBufferRec.SetColumnWidth('P', 20);    // Shortcut Dimension 1 Code
            TempExcelBufferRec.SetColumnWidth('Q', 20);    // Shortcut Dimension 2 Code
            TempExcelBufferRec.SetColumnWidth('R', 20);    // Shortcut Dimension 3 Code
            TempExcelBufferRec.SetColumnWidth('S', 20);    // Shortcut Dimension 4 Code
            TempExcelBufferRec.SetColumnWidth('T', 20);    // Shortcut Dimension 5 Code
            TempExcelBufferRec.SetColumnWidth('U', 20);    // Shortcut Dimension 6 Code
            TempExcelBufferRec.SetColumnWidth('V', 20);    // Shortcut Dimension 7 Code
            TempExcelBufferRec.SetColumnWidth('W', 20);    // Shortcut Dimension 8 Code
        end                                                                                         // 2025-02-22 Anada
        else begin                                                                                  // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('A', 15);    // Posting Date                          // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('B', 15);    // Document Type                         // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('C', 15);    // Document No.                          // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('D', 15);    // Account Type                          // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('E', 15);    // Account No.                           // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('F', 30);    // Description                           // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('G', 10);    // Currency Code                         // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('H', 15);    // Amount                                // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('I', 15);    // VAT Amount                            // 2025-02-22 Anada
                                                           //                                       // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('J', 20);    // External Document No.                 // 2025-02-22 Anada
                                                           //                                       // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('K', 15);    // General Posting Type                  // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('L', 25);    // General Business Posting Group        // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('M', 25);    // General Product Posting Group         // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('N', 25);    // VAT Business Posting Group            // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('O', 25);    // VAT Product Posting Group             // 2025-02-22 Anada
                                                           //                                       // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('P', 25);    // Comment                               // 2025-02-22 Anada
                                                           //                                       // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('Q', 20);    // Shortcut Dimension 1 Code             // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('R', 20);    // Shortcut Dimension 2 Code             // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('S', 20);    // Shortcut Dimension 3 Code             // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('T', 20);    // Shortcut Dimension 4 Code             // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('U', 20);    // Shortcut Dimension 5 Code             // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('V', 20);    // Shortcut Dimension 6 Code             // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('W', 20);    // Shortcut Dimension 7 Code             // 2025-02-22 Anada
            TempExcelBufferRec.SetColumnWidth('X', 20);    // Shortcut Dimension 8 Code             // 2025-02-22 Anada
        end;
    end;

    //
    // G/L Accounts
    //
    local procedure CreateExcelSheetGLAccounts()
    var
        GLAccountRec: Record "G/L Account";
        SheetNameLbl: Label 'GL Accounts';
    begin
        //
        TempExcelBufferRec.DeleteAll();
        TempExcelBufferRec.SetCurrent(0, 0);
        TempExcelBufferRec.SelectOrAddSheet(SheetNameLbl);
        //
        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.AddColumn(GLAccountRec.FieldCaption("No."), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        TempExcelBufferRec.AddColumn(GLAccountRec.FieldCaption(Name), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        //
        GLAccountRec.SetRange("Account Type", GLAccountRec."Account Type"::Posting);
        GLAccountRec.SetRange("Direct Posting", true);
        GLAccountRec.SetRange(Blocked, false);
        if GLAccountRec.Find('-') = true then
            repeat
                TempExcelBufferRec.NewRow();
                TempExcelBufferRec.AddColumn(GLAccountRec."No.", false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
                TempExcelBufferRec.AddColumn(GLAccountRec.Name, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
            until GLAccountRec.Next() = 0;
        //
        TempExcelBufferRec.WriteSheet(ReportHeaderLbl, CompanyName(), UserId());
        //
        TempExcelBufferRec.SetColumnWidth('A', 15);
        TempExcelBufferRec.SetColumnWidth('B', 50);
    end;

    //
    // Customers
    //
    local procedure CreateExcelSheetCustomers()
    var
        CustomerRec: Record Customer;
        SheetNameLbl: Label 'Customers';
    begin
        //
        TempExcelBufferRec.DeleteAll();
        TempExcelBufferRec.SetCurrent(0, 0);
        TempExcelBufferRec.SelectOrAddSheet(SheetNameLbl);
        //
        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.AddColumn(CustomerRec.FieldCaption("No."), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        TempExcelBufferRec.AddColumn(CustomerRec.FieldCaption(Name), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        //
        CustomerRec.SetRange(Blocked, CustomerRec.Blocked::" ");
        if CustomerRec.Find('-') = true then
            repeat
                TempExcelBufferRec.NewRow();
                TempExcelBufferRec.AddColumn(CustomerRec."No.", false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
                TempExcelBufferRec.AddColumn(CustomerRec.Name, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
            until CustomerRec.Next() = 0;
        //
        TempExcelBufferRec.WriteSheet(ReportHeaderLbl, CompanyName(), UserId());
        //
        TempExcelBufferRec.SetColumnWidth('A', 15);
        TempExcelBufferRec.SetColumnWidth('B', 50);
    end;

    //
    // Vendors
    //
    local procedure CreateExcelSheetVendors()
    var
        VendorRec: Record Vendor;
        SheetNameLbl: Label 'Vendors';
    begin
        //
        TempExcelBufferRec.DeleteAll();
        TempExcelBufferRec.SetCurrent(0, 0);
        TempExcelBufferRec.SelectOrAddSheet(SheetNameLbl);
        //
        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.AddColumn(VendorRec.FieldCaption("No."), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        TempExcelBufferRec.AddColumn(VendorRec.FieldCaption(Name), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        //
        VendorRec.SetRange(Blocked, VendorRec.Blocked::" ");
        if VendorRec.Find('-') = true then
            repeat
                TempExcelBufferRec.NewRow();
                TempExcelBufferRec.AddColumn(VendorRec."No.", false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
                TempExcelBufferRec.AddColumn(VendorRec.Name, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
            until VendorRec.Next() = 0;
        //
        TempExcelBufferRec.WriteSheet(ReportHeaderLbl, CompanyName(), UserId());
        //
        TempExcelBufferRec.SetColumnWidth('A', 15);
        TempExcelBufferRec.SetColumnWidth('B', 50);
    end;

    //
    // Bank Accounts
    //
    local procedure CreateExcelSheetBankAccounts()
    var
        BankAccountRec: Record "Bank Account";
        SheetNameLbl: Label 'Bank Accounts';
    begin
        //
        TempExcelBufferRec.DeleteAll();
        TempExcelBufferRec.SetCurrent(0, 0);
        TempExcelBufferRec.SelectOrAddSheet(SheetNameLbl);
        //
        TempExcelBufferRec.NewRow();
        TempExcelBufferRec.AddColumn(BankAccountRec.FieldCaption("No."), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        TempExcelBufferRec.AddColumn(BankAccountRec.FieldCaption(Name), false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
        //
        BankAccountRec.SetRange(Blocked, false);
        if BankAccountRec.Find('-') = true then
            repeat
                TempExcelBufferRec.NewRow();
                TempExcelBufferRec.AddColumn(BankAccountRec."No.", false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
                TempExcelBufferRec.AddColumn(BankAccountRec.Name, false, '', false, false, false, '', TempExcelBufferRec."Cell Type"::Text);
            until BankAccountRec.Next() = 0;
        //
        TempExcelBufferRec.WriteSheet(ReportHeaderLbl, CompanyName(), UserId());
        //
        TempExcelBufferRec.SetColumnWidth('A', 15);
        TempExcelBufferRec.SetColumnWidth('B', 50);
    end;

    //
    // Create Excel File
    //
    local procedure CreateExcelFile()
    var
        FriendlyFilenameLbl: Label 'General Journal Lines';
    begin
        TempExcelBufferRec.CloseBook();
        TempExcelBufferRec.SetFriendlyFilename(FriendlyFilenameLbl
            + '_' + Format(CurrentDateTime, 0, '<Year4><Month,2><Day,2>')
            + '-' + Format(CurrentDateTime, 0, '<Hours24,2><Filler Character,0><Minutes,2><Seconds,2>'));
        TempExcelBufferRec.OpenExcel();
    end;



    //
    // Create list of Shortcut Dimension Code captions
    //
    local procedure CreateListOfShortcutDimensionCodeCaptions()
    var
        GeneralLedgerSetupRec: Record "General Ledger Setup";
    begin
        //
        if GeneralLedgerSetupRec.Get() = false then
            exit;
        // Shortcut Dimension 1
        InsertRecordsInLists(1);
        // Shortcut Dimension 2
        InsertRecordsInLists(2);
        // Shortcut Dimension 3
        InsertRecordsInLists(3);
        // Shortcut Dimension 4
        InsertRecordsInLists(4);
        // Shortcut Dimension 5
        InsertRecordsInLists(5);
        // Shortcut Dimension 6
        InsertRecordsInLists(6);
        // Shortcut Dimension 7
        InsertRecordsInLists(7);
        // Shortcut Dimension 8
        InsertRecordsInLists(8);
    end;

    //
    // Add records in the lists for the specified Shortcut Dimension
    //
    local procedure InsertRecordsInLists(ShortcutDimensionCodeNo: Integer)
    var
        DimensionRec: Record Dimension;
        DimensionTranslationRec: record "Dimension Translation";
        GeneralLedgerSetupRecordRef: RecordRef;
        ShortcutDimensionCodeX: Code[20];
        InvalidCodeCaptionTranslationMsg: Label 'Invalid Code Caption: \\%1\"%2"\"%3"', Comment = '%1=Shortcut Dimension No., %2=Dimension Code, %3=Language ID';
        InvalidCodeCaptionErr: Label 'Invalid Code Captionn: \\%1\"%2"', Comment = '%1=Shortcut Dimension No., %2=Dimension Code';
        DimensionLbl: Label 'Dimension';
    begin
        GeneralLedgerSetupRecordRef.Open(Database::"General Ledger Setup");
        GeneralLedgerSetupRecordRef.FindFirst();
        ShortcutDimensionCodeX := GeneralLedgerSetupRecordRef.Field(80 + ShortcutDimensionCodeNo).Value;
        if ShortcutDimensionCodeX <> '' then begin
            ListOfShortcutDimensionCodes.Add(ShortcutDimensionCodeNo, ShortcutDimensionCodeX);
            if DimensionTranslationRec.Get(ShortcutDimensionCodeX, GlobalLanguage) then begin
                if DimensionTranslationRec."Code Caption" <> '' then
                    ListOfShortcutDimensionCodeCaptions.Add(ShortcutDimensionCodeNo, DimensionTranslationRec."Code Caption")
                else begin
                    Message(InvalidCodeCaptionTranslationMsg, DimensionLbl + ' ' + Format(ShortcutDimensionCodeNo), ShortcutDimensionCodeX, DimensionTranslationRec."Language ID");
                    Error('');
                end
            end
            else begin
                DimensionRec.Get(ShortcutDimensionCodeX);
                if DimensionRec."Code Caption" <> '' then
                    ListOfShortcutDimensionCodeCaptions.Add(ShortcutDimensionCodeNo, DimensionRec."Code Caption")
                else begin
                    Message(InvalidCodeCaptionErr, DimensionLbl + ' ' + Format(ShortcutDimensionCodeNo), ShortcutDimensionCodeX);
                    Error('');
                end;
            end;
            NumberOfShortcutDimensions := NumberOfShortcutDimensions + 1;
        end;
    end;

    //
    // Return the code of the specified Shortcut Dimension
    //
    local procedure ShortcutDimensionCode(ShortcutDimensionNo: Integer): Code[20]
    var
    begin
        exit(ListOfShortcutDimensionCodes.Get(ShortcutDimensionNo))
    end;

    //
    // Return the caption of the specified Shortcut Dimension
    //
    local procedure ShortcutDimensionCodeCaption(ShortcutDimensionNo: Integer): Text[80]
    var
        TempShortcutDimensionCodeCaption: Text[80];
    begin
        TempShortcutDimensionCodeCaption := ListOfShortcutDimensionCodeCaptions.Get(ShortcutDimensionNo);
        if TempShortcutDimensionCodeCaption <> '' then
            exit(TempShortcutDimensionCodeCaption)
        else
            exit('');
    end;

    //
    // Return the Dimension Value Code of the specified Journal Line
    //
    local procedure DimensionValueCodeOfGeneralJournalLine(JournalTemplateName: Code[10]; JournalBatchName: Code[10]; LineNo: Integer; DimensionCode: Code[20]): Code[20]
    var
        GenJournalLineRec: Record "Gen. Journal Line";
        DimensionSetEntryRec: Record "Dimension Set Entry";
    begin
        if GenJournalLineRec.Get(JournalTemplateName, JournalBatchName, LineNo) = true then
            if DimensionSetEntryRec.Get(GenJournalLineRec."Dimension Set ID", DimensionCode) = true then
                exit(DimensionSetEntryRec."Dimension Value Code");
    end;



    //
    // Global Variables
    //
    var
        TempExcelBufferRec: Record "Excel Buffer" temporary;
        ReportHeaderLbl: Label 'General Journal', Locked = true;
        ListOfShortcutDimensionCodes: Dictionary of [Integer, Code[20]];
        ListOfShortcutDimensionCodeCaptions: Dictionary of [Integer, Text[80]];
        NumberOfShortcutDimensions: Integer;
}