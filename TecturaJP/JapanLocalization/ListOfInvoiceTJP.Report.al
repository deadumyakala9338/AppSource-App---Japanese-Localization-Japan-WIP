#if AppSource
report 70658602 "List Of Invoice TJP"
#endif
#if OnPremise
report 99027 "List Of Invoice TJP"
#endif
{
    DefaultLayout = RDLC;
    RDLCLayout = 'TecturaJP/JapanLocalization/ListOfInvoiceJP.rdlc';
    Caption = 'List of Invoices';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(CopyLoop; "Integer")
        {
            DataItemTableView = sorting(Number);
            dataitem(Customer; Customer)
            {
                DataItemTableView = sorting("No.");
                PrintOnlyIfDetail = true;
                RequestFilterFields = "No.", "Date Filter", "Collective Invoice Date TJP";
                column(CustNo; "No.") { }
                column(CurrSymbol; GeneralLedgerSetup."Local Currency Symbol") { }
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    PrintOnlyIfDetail = true;
                    column(ReportTitleCaption; ReportTitleCaptionLbl) { }
                    column(AmountNoteCaption; AmountNoteCaptionLbl) { }
                    column(InvoiceNoCaption; InvoiceNoCaptionLbl) { }
                    column(PrevAmtCaption; PrevAmtCaptionLbl) { }
                    column(PrevPaidCaption; PrevPaidCaptionLbl) { }
                    column(PrevRemainCaption; PrevRemainCaptionLbl) { }
                    column(InvCountCaption; InvCountCaptionLbl) { }
                    column(LineDiscAmtLbl; LineDiscAmtLbl) { }
                    column(InvDiscAmtLbl; InvDiscAmtLbl) { }
                    column(SubTotalLbl; SubTotalLbl) { }
                    column(AmtExclVATCaption; AmtExclVATCaptionLbl) { }
                    column(VATAmountCaption; VATAmountCaptionLbl) { }
                    column(AmtInclVATCaption; AmtInclVATCaptionLbl) { }
                    column(TotAmtExclVATLbl; TotAmtExclVATLbl) { }
                    column(TotVATAmtLbl; TotVATAmtLbl) { }
                    column(TotAmtInclVATLbl; TotAmtInclVATLbl) { }
                    column(CurrBalCaption; CurrBalCaptionLbl) { }
                    column(PostingDateCaption; PostingDateCaptionLbl) { }
                    column(ItemNoCaption; ItemNoCaptionLbl) { }
                    column(DescCaption; DescCaptionLbl) { }
                    column(QtyCaption; QtyCaptionLbl) { }
                    column(UoMCaption; UoMCaptionLbl) { }
                    column(UnitPriceCaption; UnitPriceCaptionLbl) { }
                    column(LineAmtCaption; LineAmtCaptionLbl) { }
                    column(DocNoCaption; DocNoCaptionLbl) { }
                    column(LineNoCaption; LineNoCaptionLbl) { }
                    column(LineNo2CaptionLbl; LineNo2CaptionLbl) { }
                    column(ShipNameCaption; ShipNameCaptionLbl) { }
                    column(ShipName2CaptionLbl; ShipName2CaptionLbl) { }
                    column(SellCustNoCaption; SellCustNoCaptionLbl) { }
                    column(DueDateCaption; DueDateCaptionLbl) { }
                    column(VatTextCaption; VatTextCaptionLbl) { }
                    column(BankNameLbl; BankNameLbl) { }
                    column(BankAccTypeLbl; BankAccTypeLbl) { }
                    column(BankAccNoLbl; BankAccNoLbl) { }
                    column(BankAccHolderLbl; BankAccHolderLbl) { }
                    column(InvoiceNo; VarText + '-' + Customer."No.") { }
                    column(Shimekiri; JapanDate + TextShimekiriTxt) { }
                    column(DateFilter; DateFilterLbl) { }
                    column(StartDateText; StartDateText) { }
                    column(EndDateText; EndDateText) { }
                    column(SelectedDateFilter; SelectedDateFilter) { }
                    column(NoOfDocs; NoOfDocs) { }
                    column(BillCustNo; CustomerNoLbl + ': ' + Customer."No.") { }
                    column(TotalCustLbl; TotalCustLbl) { }
                    column(BillToCustName; Customer."No." + ' ' + Customer.Name) { }
                    column(TotalAmountLbl; TotalAmountLbl) { }
                    column(SCSetupSales; SourceCodeSetup.Sales) { }
                    column(SCSetupServMgmt; SourceCodeSetup."Service Management") { }
                    column(ShowDetail; ShowDetail) { }
                    column(ShowBankDetails; ShowBankDetails) { }
                    column(ShowVATRegNo; ShowVATRegNo) { }
                    column(PrintCompStamp; PrintCompStamp) { }
                    column(OutputNoVal; OutputNo) { }
                    column(CopyIdentifier; CopyIdentifier) { }
                    column(CustAddr1; CustAddr[1]) { }
                    column(CustAddr2; CustAddr[2]) { }
                    column(CustAddr3; CustAddr[3]) { }
                    column(CustAddr4; CustAddr[4]) { }
                    column(CustAddr5; CustAddr[5]) { }
                    column(CompanyAddr1; CompanyAddr[1]) { }
                    column(CompanyAddr2; CompanyAddr[2]) { }
                    column(CompanyAddr3; CompanyAddr[3]) { }
                    column(CompanyAddr4; CompanyAddr[4]) { }
                    column(CompanyAddr5; 'TEL: ' + CompanyInformation."Phone No.") { }
                    column(CompanyAddr6; CompanyInformation."Chop TJP") { }
                    column(CompanyVATRegNo; CompVATRegNoLbl + ' : ' + CompanyInformation.GetVATRegistrationNumber()) { }
                    dataitem(CurrencyLoop; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                        PrintOnlyIfDetail = true;
                        column(CurrencyCode; TempCurrency2.Code) { }
                        column(PrevPeriodInvAmt; PrevPeriodInvAmt)
                        {
                            DecimalPlaces = 0 : 0;
                        }
                        column(PrevPeriodPaidAmt; PrevPeriodPaidAmt)
                        {
                            DecimalPlaces = 0 : 0;
                        }
                        column(PrevPeriodRemAmt; PrevPeriodRemAmt)
                        {
                            DecimalPlaces = 0 : 0;
                        }
                        column(CurrPeriodOutstdAmt; CurrPeriodOutstdAmt)
                        {
                            DecimalPlaces = 0 : 0;
                        }
                        column(CurrPeriodAmtExclVAT; CurrPeriodAmtExclVAT)
                        {
                            DecimalPlaces = 0 : 0;
                        }
                        column(CurrPeriodVATAmt; CurrPeriodVATAmt)
                        {
                            DecimalPlaces = 0 : 0;
                        }
                        column(CurrPeriodAmtInclVAT; CurrPeriodAmtInclVAT)
                        {
                            DecimalPlaces = 0 : 0;
                        }
                        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
                        {
                            DataItemLink = "Customer No." = field("No.");
                            DataItemLinkReference = Customer;
                            DataItemTableView = sorting("Customer No.", "Posting Date") where("Document Type" = filter(Invoice .. "Credit Memo"), "Sales (LCY)" = filter(<> 0));
                            column(EntryNo; "Entry No.") { }
                            column(SourceCode; "Source Code") { }
                            column(SellCustNo; "Sell-to Customer No.") { }
                            column(SellCustName; Customer3.Name) { }
                            column(Body3DocumentNo; "Document No.") { }
                            column(Body3DelPoint; DelPoint) { }
                            column(Body3CommentLine; SalesCommentLine.Comment) { }
                            column(Body3SalesDate; FORMAT(SalesDate, 0, '<Year4>/<Month,2>/<Day,2>')) { }
                            column(Body4SalesDate; FORMAT(SalesDate, 0, '<Year4>/<Month,2>/<Day,2>')) { }
                            column(Body4DocumentNo; "Document No.") { }
                            column(Body4VATAmount; VATAmount)
                            {
                                DecimalPlaces = 0 : 0;
                            }
                            column(Body4AmtInclVAT; AmtInclVAT)
                            {
                                DecimalPlaces = 0 : 0;
                            }
                            column(Body4AmtExclVAT; AmtExclVAT)
                            {
                                DecimalPlaces = 0 : 0;
                            }
                            column(TotalVATAmt; TotalVATAmt)
                            {
                                DecimalPlaces = 0 : 0;
                            }
                            column(TotalAmtExclVAT; TotalAmtExclVAT)
                            {
                                DecimalPlaces = 0 : 0;
                            }
                            column(TotalAmtInclVAT; TotalAmtInclVAT)
                            {
                                DecimalPlaces = 0 : 0;
                            }
                            column(DueDate; CIDueDate) { }
                            column(BankNameTxt; BankNameTxt + ' ' + CompanyInformation."Bank Branch No.") { }
                            column(BankAccTypeTxt; BankAccTypeTxt) { }
                            column(BankAccNoTxt; BankAccNoTxt) { }
                            column(BankAccHolderTxt; BankAccHolderTxt) { }

                            dataitem(SalesInvoiceLine; "Sales Invoice Line")
                            {
                                DataItemLink = "Document No." = field("Document No.");
                                DataItemTableView = sorting("Document No.", "Line No.") where("No." = filter(<> ''));
                                column(IBody1DocNo; "Document No.") { }
                                column(IBody1No; "No.") { }
                                column(IBody1Description; Description) { }
                                column(IBody1Qty; Quantity) { }
                                column(IBody1Uom; "Unit of Measure") { }
                                column(IBody1PriceDisc; PriceDiscText) { }
                                column(IBody1Amt; Amount) { }
                                column(IBody1LineAmt; "Line Amount") { }
                                column(IBody1UnitPrice; "Unit Price") { }
                                column(IBody1Type; Type) { }
                                column(IBody1LineNo; Format(LineNo, 0, '<Integer,2>')) { }

                                trigger OnAfterGetRecord()
                                begin
                                    if ("No." = '') and (Description = '') then
                                        CurrReport.Skip();

                                    //DiscAmount := "Line Discount Amount" + "Inv. Discount Amount";

                                    LineNo := LineNo + 1;
                                    VATAmount := ("Amount Including VAT" - Amount);
                                    AmtExclVAT := Amount;
                                    AmtInclVAT := "Amount Including VAT";
                                    AccumulateTotals();


                                    DocSubTot += "Line Amount";
                                    DocExclVAT += Amount;
                                    DocAmt += "Amount Including VAT";
                                    DocVAT += ("Amount Including VAT" - Amount);
                                    DocLineDiscAmt -= "Line Discount Amount";
                                    DocInvDiscAmt -= "Inv. Discount Amount";

                                    InsertSalesInvoiceVATAmountLine(TempVATAmountLine, SalesInvoiceLine);
                                    LineCount += 1;

                                    if LineCount = Count then
                                        InsertSalesInvoiceVATLineBreakupTJP(VATBreakupBufferTJP, SalesInvoiceLine);
                                end;

                                trigger OnPreDataItem()
                                begin
                                    LineCount := 0;
                                    TempVATAmountLine.DeleteAll();

                                    if "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::"Credit Memo" then
                                        CurrReport.Break();
                                end;
                            }
                            dataitem(SalesCrMemoLine; "Sales Cr.Memo Line")
                            {
                                DataItemLink = "Document No." = field("Document No.");
                                DataItemTableView = sorting("Document No.", "Line No.") where("No." = filter(<> ''));
                                column(CBody1DocNo; "Document No.") { }
                                column(CBody1No; "No.") { }
                                column(CBody1Description; Description) { }
                                column(CBody1Uom; "Unit of Measure") { }
                                column(CBody1Qty; Quantity) { }
                                column(CBody1PriceDisc; PriceDiscText) { }
                                column(CBody1Amt; Amount) { }
                                column(CBody1LineAmt; "Line Amount") { }
                                column(CBody1UnitPrice; -"Unit Price") { }
                                column(CBody1Type; Type) { }
                                column(CBody1LineNo; Format(LineNo, 0, '<Integer,2>')) { }

                                trigger OnAfterGetRecord()
                                begin
                                    if ("No." = '') and (Description = '') then
                                        CurrReport.Skip();

                                    //DiscAmount := "Line Discount Amount" + "Inv. Discount Amount";

                                    "Amount Including VAT" := "Amount Including VAT" * (-1);
                                    Amount *= (-1);
                                    "Line Amount" *= (-1);

                                    LineNo := LineNo + 1;
                                    VATAmount := ("Amount Including VAT" - Amount);
                                    AmtExclVAT := Amount;
                                    AmtInclVAT := "Amount Including VAT";
                                    AccumulateTotals();

                                    DocSubTot += "Line Amount";
                                    DocExclVAT += Amount;
                                    DocAmt += "Amount Including VAT";
                                    DocVAT += ("Amount Including VAT" - Amount);
                                    DocLineDiscAmt += "Line Discount Amount";
                                    DocInvDiscAmt += "Inv. Discount Amount";

                                    InsertSalesCrMemoVATAmountLine(TempVATAmountLine, SalesCrMemoLine);
                                    LineCount += 1;

                                    if LineCount = Count then
                                        InsertSalesCrMemoVATLineBreakupTJP(VATBreakupBufferTJP, SalesCrMemoLine);
                                end;

                                trigger OnPreDataItem()
                                begin
                                    LineCount := 0;
                                    TempVATAmountLine.DeleteAll();

                                    if "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::Invoice then
                                        CurrReport.Break();
                                end;
                            }
                            dataitem(ServiceInvoiceLine; "Service Invoice Line")
                            {
                                DataItemLink = "Document No." = field("Document No.");
                                DataItemTableView = sorting("Document No.", "Line No.") where("No." = filter(<> ''));
                                column(SBody1DocNo; "Document No.") { }
                                column(SBody1No; "No.") { }
                                column(SBody1Description; Description) { }
                                column(SBody1Qty; Quantity) { }
                                column(SBody1Uom; "Unit of Measure") { }
                                column(SBody1PriceDisc; PriceDiscText) { }
                                column(SBody1Amt; Amount) { }
                                column(SBody1UnitPrice; "Unit Price") { }
                                column(SBody1LineAmt; "Line Amount") { }
                                column(SBody1Type; Type) { }
                                column(SBody1LineNo; Format(LineNo, 0, '<Integer,2>')) { }

                                trigger OnAfterGetRecord()
                                begin
                                    if ("No." = '') and (Description = '') then
                                        CurrReport.Skip();

                                    //DiscAmount := "Line Discount Amount" + "Inv. Discount Amount";

                                    LineNo := LineNo + 1;
                                    VATAmount := ("Amount Including VAT" - Amount);
                                    AmtExclVAT := Amount;
                                    AmtInclVAT := "Amount Including VAT";
                                    AccumulateTotals();

                                    DocSubTot += "Line Amount";
                                    DocExclVAT += Amount;
                                    DocAmt += "Amount Including VAT";
                                    DocVAT += ("Amount Including VAT" - Amount);
                                    DocLineDiscAmt -= "Line Discount Amount";
                                    DocInvDiscAmt -= "Inv. Discount Amount";

                                    InsertServiceInvoiceVATAmountLine(TempVATAmountLine, ServiceInvoiceLine);
                                    LineCount += 1;

                                    if LineCount = Count then
                                        InsertServiceInvoiceVATLineBreakupTJP(VATBreakupBufferTJP, ServiceInvoiceLine);
                                end;

                                trigger OnPreDataItem()
                                begin
                                    LineCount := 0;
                                    TempVATAmountLine.DeleteAll();

                                    if "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::"Credit Memo" then
                                        CurrReport.Break();
                                end;
                            }
                            dataitem(ServiceCrMemoLine; "Service Cr.Memo Line")
                            {
                                DataItemLink = "Document No." = field("Document No.");
                                DataItemTableView = sorting("Document No.", "Line No.") where("No." = filter(<> ''));
                                column(SCBody1DocNo; "Document No.") { }
                                column(SCBody1No; "No.") { }
                                column(SCBody1Description; Description) { }
                                column(SCBody1Qty; Quantity) { }
                                column(SCBody1Uom; "Unit of Measure") { }
                                column(SCBody1PriceDisc; PriceDiscText) { }
                                column(SCBody1Amt; Amount) { }
                                column(SCBody1UnitPrice; -"Unit Price") { }
                                column(SCBody1LineAmt; "Line Amount") { }
                                column(SCBody1Type; Type) { }
                                column(SCBody1LineNo; Format(LineNo, 0, '<Integer,2>')) { }

                                trigger OnAfterGetRecord()
                                begin
                                    if ("No." = '') and (Description = '') then
                                        CurrReport.Skip();

                                    //DiscAmount := "Line Discount Amount" + "Inv. Discount Amount";

                                    "Amount Including VAT" := "Amount Including VAT" * (-1);
                                    Amount *= (-1);
                                    "Line Amount" *= (-1);

                                    LineNo := LineNo + 1;
                                    VATAmount := ("Amount Including VAT" - Amount);
                                    AmtExclVAT := Amount;
                                    AmtInclVAT := "Amount Including VAT";
                                    AccumulateTotals();

                                    DocSubTot += "Line Amount";
                                    DocExclVAT += Amount;
                                    DocAmt += "Amount Including VAT";
                                    DocVAT += ("Amount Including VAT" - Amount);
                                    DocLineDiscAmt += "Line Discount Amount";
                                    DocInvDiscAmt += "Inv. Discount Amount";

                                    InsertServiceCrMemoVATAmountLine(TempVATAmountLine, ServiceCrMemoLine);
                                    LineCount += 1;

                                    if LineCount = Count then
                                        InsertServiceCrMemoVATLineBreakupTJP(VATBreakupBufferTJP, ServiceCrMemoLine);
                                end;

                                trigger OnPreDataItem()
                                begin
                                    LineCount := 0;
                                    TempVATAmountLine.DeleteAll();

                                    if "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::Invoice then
                                        CurrReport.Break();
                                end;
                            }
                            dataitem(DocStatistics; "Integer")
                            {
                                DataItemTableView = sorting(Number) where(Number = filter(1));
                                column(DocLineDiscAmt; DocLineDiscAmt)
                                {
                                    DecimalPlaces = 0 : 0;
                                }
                                column(DocStatiticDocSubTot; DocSubTot)
                                {
                                    DecimalPlaces = 0 : 0;
                                }
                                column(DocInvDiscAmt; DocInvDiscAmt)
                                {
                                    DecimalPlaces = 0 : 0;
                                }
                                column(DocStatiticDocExclVAT; DocExclVAT)
                                {
                                    DecimalPlaces = 0 : 0;
                                }
                                column(DocStatiticDocVAT; DocVAT)
                                {
                                    DecimalPlaces = 0 : 0;
                                }
                                column(DocStatiticDocAmt; DocAmt)
                                {
                                    DecimalPlaces = 0 : 0;
                                }
                                column(DocStatiticNumber; Number) { }

                                trigger OnPreDataItem()
                                begin
                                    if LineNo = 0 then
                                        CurrReport.Break();
                                end;
                            }
                            dataitem(VATBreakupBufferTJP; "VAT Breakup Buffer TJP")
                            {
                                DataItemTableView = sorting("VAT %");
                                DataItemLink = "Document No." = field("Document No.");
                                UseTemporary = true;
                                column(VATPer_VATBreakupBufferTJP; VATBreakupBufferTJP."VAT %") { }
                                column(LabelText_VATBreakupBufferTJP; VATBreakupBufferTJP."Report Label Text") { }
                                column(TotalAmount_VATBreakupBufferTJP; VATBreakupBufferTJP."Report Breakup Amount") { }
                            }

                            trigger OnAfterGetRecord()
                            var
                                TextTemp1: Text[40];
                                TextTemp2: Text[40];
                            begin
                                if ResetImage then
                                    Clear(CompanyInformation."Chop TJP");
                                ResetImage := true;

                                TextTemp1 := copystr(GeneralFunctionsTJP.ConvKanaToSingle(Customer3."No."), 1, MaxStrLen(TextTemp1));
                                TextTemp2 := copystr(GeneralFunctionsTJP.ConvKanaToSingle("Sell-to Customer No."), 1, MaxStrLen(TextTemp2));
                                if TextTemp1 <> TextTemp2 then begin
                                    TotalAmtExclVAT := 0;
                                    TotalVATAmt := 0;
                                    TotalAmtInclVAT := 0;
                                end;

                                DocSubTot := 0;
                                DocAmt := 0;
                                DocVAT := 0;
                                DocExclVAT := 0;
                                DocInvDiscAmt := 0;
                                DocLineDiscAmt := 0;

                                Customer3.Get("Sell-to Customer No.");

                                if SalesReceivablesSetup."Coll. Invoice Base Date TJP" = SalesReceivablesSetup."Coll. Invoice Base Date TJP"::"Posting Date" then
                                    SalesDate := "Posting Date"
                                else
                                    SalesDate := "Document Date";

                                SalesCommentLine.Init();
                                case "Cust. Ledger Entry"."Document Type" of
                                    "Cust. Ledger Entry"."Document Type"::Invoice:
                                        begin
                                            SalesInvoiceHeader.SetRange("No.", "Cust. Ledger Entry"."Document No.");
                                            if SalesInvoiceHeader.FindFirst() then
                                                DelPoint := copystr(SalesInvoiceHeader."Ship-to Name", 1, MaxStrLen(DelPoint));
                                            if "Source Code" = SourceCodeSetup."Service Management" then
                                                if ServiceInvoiceHeader.Get("Cust. Ledger Entry"."Document No.") then
                                                    DelPoint := copystr(ServiceInvoiceHeader."Ship-to Name", 1, MaxStrLen(DelPoint))
                                                else
                                                    DelPoint := '';

                                            SalesCommentLine.Reset();
                                            SalesCommentLine.SetRange("Document Type", SalesCommentLine."Document Type"::"Posted Invoice");
                                            SalesCommentLine.SetRange("No.", "Cust. Ledger Entry"."Document No.");
                                            if not SalesCommentLine.FindFirst() then
                                                SalesCommentLine.Init();
                                        end;
                                    "Cust. Ledger Entry"."Document Type"::"Credit Memo":
                                        begin
                                            SalesCrMemoHeader.SetRange("No.", "Cust. Ledger Entry"."Document No.");
                                            if SalesCrMemoHeader.FindFirst() then
                                                DelPoint := copystr(SalesCrMemoHeader."Ship-to Name", 1, MaxStrLen(DelPoint));

                                            SalesCommentLine.Reset();
                                            SalesCommentLine.SetRange("Document Type", SalesCommentLine."Document Type"::"Posted Credit Memo");
                                            SalesCommentLine.SetRange("No.", "Cust. Ledger Entry"."Document No.");
                                            if not SalesCommentLine.FindFirst() then
                                                SalesCommentLine.Init();
                                        end;
                                end;

                                DocCountNo := DocCountNo + 1;

                                Clear(LineNo);
                                Clear(VATAmount);
                                Clear(AmtExclVAT);
                                Clear(AmtInclVAT);

                                if ("Source Code" <> SourceCodeSetup.Sales) and ("Source Code" <> SourceCodeSetup."Service Management") then begin
                                    VATEntry.Reset();
                                    VATEntry.SetCurrentKey("Document No.");
                                    VATEntry.SetRange("Document No.", "Document No.");
                                    case "Document Type" of
                                        "Document Type"::Invoice:
                                            VATEntry.SetRange("Document Type", VATEntry."Document Type"::Invoice);
                                        "Document Type"::"Credit Memo":
                                            VATEntry.SetRange("Document Type", VATEntry."Document Type"::"Credit Memo");
                                    end;
                                    if VATEntry.FindSet() then
                                        repeat
                                            VATAmount := VATAmount + Amount;
                                        until VATEntry.Next() = 0;
                                    Calcfields(Amount);
                                    AmtInclVAT := Amount;
                                    VATAmount := VATAmount;
                                    AmtExclVAT := AmtInclVAT - VATAmount;
                                    AccumulateTotals();
                                end;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if SalesReceivablesSetup."Coll. Invoice Base Date TJP" = SalesReceivablesSetup."Coll. Invoice Base Date TJP"::"Posting Date" then begin
                                    SetCurrentKey("Sell-to Customer No.", "Posting Date");
                                    SetRange("Posting Date", StartDate, EndDate);
                                end else begin
                                    SetCurrentKey("Customer No.", "Document Date");
                                    SetRange("Document Date", StartDate, EndDate);
                                end;

                                SetRange("Currency Code", TempCurrency2.Code);

                                Clear(DocCountNo);
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then
                                TempCurrency2.Find('-')
                            else
                                if TempCurrency2.Next() = 0 then
                                    CurrReport.Break();

                            Clear(PrevPeriodInvAmt);
                            Clear(PrevPeriodPaidAmt);
                            Clear(PrevPeriodRemAmt);
                            Clear(CurrPeriodAmtExclVAT);
                            Clear(CurrPeriodVATAmt);
                            Clear(CurrPeriodAmtInclVAT);
                            Clear(CurrPeriodOutstdAmt);
                            Clear(CurrPeriodPaidAmt);

                            CalcColInvStatistics(Customer, TempCurrency2.Code);

                            CompanyInformation.Calcfields("Chop TJP");
                            ResetImage := false;
                        end;

                        trigger OnPreDataItem()
                        begin
                            Customer.CopyFilter("Currency Filter", TempCurrency2.Code);
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    if LangSel = '' then begin
                        Customer.Testfield("Language Code");
                        LangSel := Customer."Language Code";
                    end;

                    CurrReport.Language := Language2.GetLanguageID(LangSel);

                    CompanyInformation.Get();
                    if LangSel = CompanyInformation."Reporting Language TJP" then
                        GeneralFunctionsTJP.CompanyENU(CompanyAddr, CompanyInformation)
                    else
                        GeneralFunctionsTJP.CompanyJPN(CompanyAddr, CompanyInformation);

                    PrintDate := StrSubstNo(TextJapaneseDateTxt, Date2DMY(WorkDate(), 3), Date2DMY(WorkDate(), 2), Date2DMY(WorkDate(), 1));
                    JapanDate := StrSubstNo(TextJapaneseDateTxt, Date2DMY(EndDate, 3), Date2DMY(EndDate, 2), Date2DMY(EndDate, 1));
                    InvoiceNo := (Date2DMY(EndDate, 3) - 2000) * 10000 + (Date2DMY(EndDate, 2)) * 100 + Date2DMY(EndDate, 1);
                    VarText := Format(Round(InvoiceNo, 1, '='));
                    VarText := DelChr(VarText, '<=>', ',');

                    StartDateText := StrSubstNo(TextJapaneseDateTxt, Date2DMY(StartDate, 3), Date2DMY(StartDate, 2), Date2DMY(StartDate, 1));
                    EndDateText := StrSubstNo(TextJapaneseDateTxt, Date2DMY(EndDate, 3), Date2DMY(EndDate, 2), Date2DMY(EndDate, 1));

                    GeneralFunctionsTJP.TranslateCompBankAccFields(CompanyInformation, BankAccHolderTxt, BankNameTxt, BankAccNoTxt, BankAccTypeTxt, LangSel);
                    SelectedDateFilter := Customer.GetFilter("Date Filter");

                    PrintLine := false;
                    Customer2 := Customer;
                    CopyFilter("Currency Filter", TempCurrency2.Code);
                    if PrintAllHavingBal then
                        if TempCurrency2.Find('-') then
                            repeat
                                Customer2.SetRange("Date Filter", 0D, EndDate);
                                Customer2.SetRange("Currency Filter", TempCurrency2.Code);
                                Customer2.Calcfields("Net Change");
                                PrintLine := Customer2."Net Change" <> 0;
                            until (TempCurrency2.Next() = 0) or PrintLine;

                    if (not PrintLine) and PrintAllHavingEntry then begin
                        "Cust. Ledger Entry".Reset();
                        if SalesReceivablesSetup."Coll. Invoice Base Date TJP" = SalesReceivablesSetup."Coll. Invoice Base Date TJP"::"Posting Date" then begin
                            "Cust. Ledger Entry".SetCurrentKey("Customer No.", "Posting Date");
                            "Cust. Ledger Entry".SetRange("Customer No.", Customer."No.");
                            "Cust. Ledger Entry".SetRange("Posting Date", StartDate, EndDate);
                        end else begin
                            "Cust. Ledger Entry".SetCurrentKey("Customer No.", "Document Date");
                            "Cust. Ledger Entry".SetRange("Customer No.", Customer."No.");
                            "Cust. Ledger Entry".SetRange("Document Date", StartDate, EndDate);
                        end;
                        Customer.CopyFilter("Currency Filter", "Cust. Ledger Entry"."Currency Code");
                        PrintLine := "Cust. Ledger Entry".FindFirst();
                    end;
                    if not PrintLine then
                        CurrReport.Skip();

                    FormatAddress.Customer(CustAddr, Customer);
                    SetCustAddInfo(Customer);

                    Customer2 := Customer;
                    Customer2.Reset();

                    if (Customer."Payment Terms Code" <> '') and (EndDate <> 0D) then begin
                        PaymentTerms.Get(Customer."Payment Terms Code");
                        CIDueDate := CalcDate(PaymentTerms."Due Date Calculation", EndDate);
                    end else
                        CIDueDate := EndDate;
                end;

                trigger OnPreDataItem()
                begin
                    StartDate := GetRangeMin("Date Filter");
                    EndDate := GetRangeMax("Date Filter");

                    //Previous month date range
                    PrevPeriodEndDate := CalcDate('<-1D>', StartDate);
                    //PrevPeriodStartDate := CalcDate('<-CM>', PrevPeriodEndDate);

                    TempCurrency2.Code := '';
                    if not TempCurrency2.Insert() then;
                    CopyFilter("Currency Filter", Currency.Code);
                    if Currency.Find('-') then
                        repeat
                            TempCurrency2 := Currency;
                            if not TempCurrency2.Insert() then;
                        until Currency.Next() = 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                OutputNo := Number;
                case Number of
                    1:
                        CopyIdentifier := SalesReceivablesSetup."Col. Inv. Copy Identifier1 TJP";
                    2:
                        CopyIdentifier := SalesReceivablesSetup."Col. Inv. Copy Identifier2 TJP";
                    3:
                        CopyIdentifier := SalesReceivablesSetup."Col. Inv. Copy Identifier3 TJP";
                end;
                if CopyIdentifier <> '' then
                    CopyIdentifier := copystr(StrSubstNo('(%1)', CopyIdentifier), 1, MaxStrLen(CopyIdentifier));

                Clear(TotalAmtExclVAT);
                Clear(TotalVATAmt);
                Clear(TotalAmtInclVAT);
                Clear(PrevPeriodInvAmt);
                Clear(PrevPeriodPaidAmt);
                Clear(PrevPeriodRemAmt);
                Clear(CurrPeriodAmtExclVAT);
                Clear(CurrPeriodVATAmt);
                Clear(CurrPeriodAmtInclVAT);
                Clear(CurrPeriodOutstdAmt);
                Clear(CurrPeriodPaidAmt);
            end;

            trigger OnPreDataItem()
            begin
                OutputNo := 1;

                if SalesReceivablesSetup."Col. Inv. No. of Copies TJP" <= 0 then
                    SetRange(Number, 1)
                else
                    SetRange(Number, 1, SalesReceivablesSetup."Col. Inv. No. of Copies TJP" + 1);
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ShowDetailPageOption; ShowDetail)
                    {
                        ApplicationArea = All;
                        Caption = 'Show Detail';
                        ToolTip = 'Specifies detailed information';
                    }
                    field(RepShowBankDetails; ShowBankDetails)
                    {
                        ApplicationArea = All;
                        Caption = 'Show Bank Details';
                        ToolTip = 'TBD';
                    }
                    field(ReqShowVATRegNo; ShowVATRegNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Show VAT Registration No.';
                        ToolTip = 'Show VAT Registration No.';
                    }
                    field(ReqPrintCompStamp; PrintCompStamp)
                    {
                        ApplicationArea = All;
                        Caption = 'Print Company Stamp';
                        ToolTip = 'Print Company Stamp';
                    }
                    field(RepLangSel; LangSel)
                    {
                        ApplicationArea = All;
                        Caption = 'Language Selection';
                        TableRelation = Language;
                        ToolTip = 'Specifies for system which language report labels to display';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            ShowDetail := true;
            ShowBankDetails := true;
            ShowVATRegNo := true;
            PrintCompStamp := false;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    var
        CompanyInformationRec: Record "Company Information";
        OnlyAvailableInJapanMsg: Label 'This report is only available for companies in Japan.';
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then begin
            Message(OnlyAvailableInJapanMsg);
            Error('');
        end;
        //
        GeneralLedgerSetup.Get();
        SalesReceivablesSetup.Get();

        CompanyInformation.Get();
        clear(LangSel);

        PrintAllHavingBal := true;
    end;

    trigger OnPreReport()
    begin
        SourceCodeSetup.Get();
    end;

    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        CompanyInformation: Record "Company Information";
        Customer2: Record Customer;
        Customer3: Record Customer;
        Currency: Record Currency;
        TempCurrency2: Record Currency temporary;
        PaymentTerms: Record "Payment Terms";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        ServiceInvoiceHeader: Record "Service Invoice Header";
        SourceCodeSetup: Record "Source Code Setup";
        SalesCommentLine: Record "Sales Comment Line";
        VATEntry: Record "VAT Entry";
        TempVATAmountLine: Record "VAT Amount Line" temporary;
        FormatAddress: Codeunit "Format Address";
        GeneralFunctionsTJP: Codeunit "General Functions TJP";
        Language2: Codeunit Language;
        LangSel: Code[10];
        SelectedDateFilter: Text;
        CustAddInfo: array[4] of Text[100];
        CustAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        DelPoint: Text[50];
        CopyIdentifier: Text[40];
        PriceDiscText: Text[30];
        JapanDate: Text[30];
        VarText: Text[30];
        PrintDate: Text[30];
        StartDateText: Text[50];
        EndDateText: Text[50];
        BankNameTxt: Text;
        BankAccTypeTxt: Text;
        BankAccNoTxt: Text;
        BankAccHolderTxt: Text;
        OutputNo: Integer;
        LineNo: Integer;
        DocCountNo: Integer;
        NoOfDocs: Integer;
        PrevPeriodInvAmt: Decimal;
        PrevPeriodPaidAmt: Decimal;
        PrevPeriodRemAmt: Decimal;
        CurrPeriodAmtExclVAT: Decimal;
        CurrPeriodVATAmt: Decimal;
        CurrPeriodAmtInclVAT: Decimal;
        CurrPeriodOutstdAmt: Decimal;
        CurrPeriodPaidAmt: Decimal;
        AmtExclVAT: Decimal;
        AmtInclVAT: Decimal;
        TotalAmtExclVAT: Decimal;
        TotalVATAmt: Decimal;
        TotalAmtInclVAT: Decimal;
        DocSubTot: Decimal;
        DocAmt: Decimal;
        DocVAT: Decimal;
        DocExclVAT: Decimal;
        DocInvDiscAmt: Decimal;
        DocLineDiscAmt: Decimal;
        TextJapaneseDateTxt: Label '%1/%2/%3', Comment = '%1=/,%2=/,%3=/';
        TextShimekiriTxt: Label ' Period';
        DateFilterLbl: Label 'Invoicing Period';
        CustomerNoLbl: Label 'Customer No.';
        ReportTitleCaptionLbl: Label 'List of Invoices';
        CompVATRegNoLbl: Label 'VAT Registration No.';
        AmountNoteCaptionLbl: Label 'This is the summary list but not the invoice.';
        PrevAmtCaptionLbl: Label 'Prev. Amt.';
        PrevPaidCaptionLbl: Label 'Prev. Paid';
        PrevRemainCaptionLbl: Label 'Prev. Remain';
        InvoiceNoCaptionLbl: Label 'Invoice No.';
        SubTotalLbl: Label 'Subtotal';
        AmtExclVATCaptionLbl: Label 'Amount Excluding VAT';
        VATAmountCaptionLbl: Label 'VAT Amount';
        AmtInclVATCaptionLbl: Label 'Amount Including VAT';
        InvCountCaptionLbl: Label 'Inv. Count';
        CurrBalCaptionLbl: Label 'Curr Bal.';
        PostingDateCaptionLbl: Label 'Posting Date';
        ItemNoCaptionLbl: Label 'Item No.';
        DescCaptionLbl: Label 'Item Name';
        QtyCaptionLbl: Label 'Qty.';
        UoMCaptionLbl: Label 'UOM';
        UnitPriceCaptionLbl: Label 'Unit Price';
        LineAmtCaptionLbl: Label 'Amount';
        DocNoCaptionLbl: Label 'Doc No.';
        LineNoCaptionLbl: Label 'Line';
        LineNo2CaptionLbl: Label 'No.';
        ShipNameCaptionLbl: Label 'Ship-to';
        ShipName2CaptionLbl: Label 'Name';
        SellCustNoCaptionLbl: Label 'Sell-to Cust. No. :';
        DueDateCaptionLbl: Label 'Due Date';
        VatTextCaptionLbl: Label '* VAT Amount is shown below total amount.';
        LineDiscAmtLbl: Label 'Total Line Discount';
        InvDiscAmtLbl: Label 'Invoice Discount';
        TotalCustLbl: Label 'Customer';
        TotalAmountLbl: Label 'Total';
        BankNameLbl: Label 'Bank Name';
        BankAccTypeLbl: Label 'Account Type';
        BankAccNoLbl: Label 'Account No.';
        BankAccHolderLbl: Label 'Account Holder';
        TotAmtExclVATLbl: Label 'Total Amount Excluding VAT';
        TotVATAmtLbl: Label 'Total VAT Amount';
        TotAmtInclVATLbl: Label 'Total Amount Including VAT';
        InvoiceNo: Decimal;
        VATAmount: Decimal;
        //DiscAmount: Decimal;
        PrevPeriodEndDate: Date;
        SalesDate: Date;
        CIDueDate: Date;
        StartDate: Date;
        EndDate: Date;
        ShowDetail: Boolean;
        ShowBankDetails: Boolean;
        ShowVATRegNo: Boolean;
        PrintCompStamp: Boolean;
        ResetImage: Boolean;
        PrintAllHavingEntry: Boolean;
        PrintAllHavingBal: Boolean;
        PrintLine: Boolean;
        LineCount: Integer;
        TotAmtExclVATTxt: Text[100];
        VATPerTxt: Text[100];

    procedure AccumulateTotals()
    begin
        TotalAmtExclVAT := TotalAmtExclVAT + AmtExclVAT;
        TotalVATAmt := TotalVATAmt + VATAmount;
        TotalAmtInclVAT := TotalAmtInclVAT + AmtInclVAT;
    end;

    procedure CalcColInvStatistics(var LCustomer: Record Customer; LCurrCode: Code[20])
    var
        LCustomer2: Record Customer;
        LCustLedgerEntry: Record "Cust. Ledger Entry";
        LDetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        LVATEntry: Record "VAT Entry";
    begin
        LCustomer2 := LCustomer;

        //Previous period-related statistics
        LCustLedgerEntry.Reset();
        LCustLedgerEntry.SetCurrentKey("Document Type", "Customer No.", "Posting Date");
        LCustLedgerEntry.SetFilter("Document Type", '%1|%2', LCustLedgerEntry."Document Type"::Invoice, LCustLedgerEntry."Document Type"::"Credit Memo");
        LCustLedgerEntry.SetRange("Customer No.", LCustomer2."No.");
        LCustLedgerEntry.SetFilter("Posting Date", '..%1', PrevPeriodEndDate);
        LCustLedgerEntry.SetFilter("Date Filter", '..%1', PrevPeriodEndDate);
        LCustLedgerEntry.SetRange("Currency Code", LCurrCode);
        if LCustLedgerEntry.FindSet() then
            repeat
                LCustLedgerEntry.Calcfields("Remaining Amount");
                if LCustLedgerEntry."Remaining Amount" <> 0 then begin
                    PrevPeriodInvAmt := PrevPeriodInvAmt + LCustLedgerEntry."Remaining Amount";
                    LDetailedCustLedgEntry.SetCurrentKey("Cust. Ledger Entry No.", "Posting Date");
                    LDetailedCustLedgEntry.SetRange("Cust. Ledger Entry No.", LCustLedgerEntry."Entry No.");
                    LDetailedCustLedgEntry.SetRange("Posting Date", StartDate, EndDate);
                    LDetailedCustLedgEntry.SetRange("Document Type", LDetailedCustLedgEntry."Document Type"::Payment);
                    LDetailedCustLedgEntry.SetRange("Entry Type", LDetailedCustLedgEntry."Entry Type"::Application);
                    if LDetailedCustLedgEntry.FindSet() then
                        repeat
                            PrevPeriodPaidAmt := PrevPeriodPaidAmt - LDetailedCustLedgEntry.Amount;
                        until LDetailedCustLedgEntry.Next() = 0;
                end;
            until LCustLedgerEntry.Next() = 0;

        PrevPeriodRemAmt := PrevPeriodInvAmt - PrevPeriodPaidAmt;

        //Current period-related statistics
        LCustLedgerEntry.Reset();
        LCustLedgerEntry.SetCurrentKey("Customer No.", "Posting Date");
        LCustLedgerEntry.SetRange("Customer No.", LCustomer2."No.");
        LCustLedgerEntry.SetFilter("Posting Date", '%1..%2', StartDate, EndDate);
        LCustLedgerEntry.SetFilter("Document Type", '%1|%2', LCustLedgerEntry."Document Type"::Invoice, LCustLedgerEntry."Document Type"::"Credit Memo");
        LCustLedgerEntry.SetFilter("Date Filter", '..%1', EndDate);
        LCustLedgerEntry.SetRange("Currency Code", LCurrCode);
        NoOfDocs := LCustLedgerEntry.Count;
        if LCustLedgerEntry.FindSet() then begin
            repeat
                LCustLedgerEntry.Calcfields(Amount);
                CurrPeriodAmtInclVAT := CurrPeriodAmtInclVAT + LCustLedgerEntry.Amount;

                LDetailedCustLedgEntry.SetCurrentKey("Cust. Ledger Entry No.", "Posting Date");
                LDetailedCustLedgEntry.SetRange("Cust. Ledger Entry No.", LCustLedgerEntry."Entry No.");
                LDetailedCustLedgEntry.SetFilter("Posting Date", '..%1', EndDate);
                LDetailedCustLedgEntry.SetRange("Document Type", LDetailedCustLedgEntry."Document Type"::Payment);
                LDetailedCustLedgEntry.SetRange("Entry Type", LDetailedCustLedgEntry."Entry Type"::Application);
                if LDetailedCustLedgEntry.FindSet() then
                    repeat
                        CurrPeriodPaidAmt := CurrPeriodPaidAmt - LDetailedCustLedgEntry.Amount;
                    until LDetailedCustLedgEntry.Next() = 0;

                LVATEntry.SetCurrentKey("Transaction No.");
                LVATEntry.SetRange("Transaction No.", LCustLedgerEntry."Transaction No.");
                LVATEntry.SetRange("Document No.", LCustLedgerEntry."Document No.");
                LVATEntry.SetRange("Posting Date", LCustLedgerEntry."Posting Date");
                if LVATEntry.FindSet() then
                    repeat
                        CurrPeriodVATAmt := CurrPeriodVATAmt - LVATEntry.Amount;
                    until LVATEntry.Next() = 0;
            until LCustLedgerEntry.Next() = 0;

            CurrPeriodAmtExclVAT := CurrPeriodAmtInclVAT - CurrPeriodVATAmt;
        end;
        CurrPeriodOutstdAmt := CurrPeriodAmtInclVAT + PrevPeriodRemAmt - CurrPeriodPaidAmt;
    end;

    procedure SetCustAddInfo(var Cust: Record Customer)
    var
        Text01Txt: Label 'Customer No.: %1', Comment = 'Customer No.=%1';
        Text02Txt: Label 'TEL  : %1', Comment = 'TEL =%1';
        Text03Txt: Label 'FAX  : %1', Comment = 'FAX =%1';
    begin
        Clear(CustAddInfo);
        if Cust."No." <> '' then begin
            CustAddInfo[1] := StrSubstNo(Text01Txt, Cust."No.");
            if Cust."Phone No." <> '' then
                CustAddInfo[2] := StrSubstNo(Text02Txt, Cust."Phone No.");
            if Cust."Fax No." <> '' then
                CustAddInfo[3] := StrSubstNo(Text03Txt, Cust."Fax No.");
            CompressArray(CustAddInfo);
        end;
    end;

    local procedure InsertSalesInvoiceVATAmountLine(var VATAmountLine2: Record "VAT Amount Line"; SalesInvoiceLine: Record "Sales Invoice Line")
    begin
        VATAmountLine2.Init();
        VATAmountLine2."VAT Identifier" := SalesInvoiceLine."VAT Identifier";
        VATAmountLine2."VAT Calculation Type" := SalesInvoiceLine."VAT Calculation Type";
        VATAmountLine2."Tax Group Code" := SalesInvoiceLine."Tax Group Code";
        VATAmountLine2."VAT %" := SalesInvoiceLine."VAT %";
        VATAmountLine2."VAT Base" := SalesInvoiceLine.Amount;
        VATAmountLine2."Amount Including VAT" := SalesInvoiceLine."Amount Including VAT";
        VATAmountLine2."Line Amount" := SalesInvoiceLine."Line Amount";
        if SalesInvoiceLine."Allow Invoice Disc." then
            VATAmountLine2."Inv. Disc. Base Amount" := SalesInvoiceLine."Line Amount";
        VATAmountLine2."Invoice Discount Amount" := SalesInvoiceLine."Inv. Discount Amount";
        VATAmountLine2."VAT Clause Code" := SalesInvoiceLine."VAT Clause Code";
        VATAmountLine2.InsertLine();
    end;

    local procedure InsertSalesCrMemoVATAmountLine(var VATAmountLine2: Record "VAT Amount Line"; SalesCrMemoLine: Record "Sales Cr.Memo Line")
    begin
        VATAmountLine2.Init();
        VATAmountLine2."VAT Identifier" := SalesCrMemoLine."VAT Identifier";
        VATAmountLine2."VAT Calculation Type" := SalesCrMemoLine."VAT Calculation Type";
        VATAmountLine2."Tax Group Code" := SalesCrMemoLine."Tax Group Code";
        VATAmountLine2."VAT %" := SalesCrMemoLine."VAT %";
        VATAmountLine2."VAT Base" := SalesCrMemoLine.Amount;
        VATAmountLine2."Amount Including VAT" := SalesCrMemoLine."Amount Including VAT";
        VATAmountLine2."Line Amount" := SalesCrMemoLine."Line Amount";
        if SalesCrMemoLine."Allow Invoice Disc." then
            VATAmountLine2."Inv. Disc. Base Amount" := SalesCrMemoLine."Line Amount";
        VATAmountLine2."Invoice Discount Amount" := SalesCrMemoLine."Inv. Discount Amount";
        VATAmountLine2."VAT Clause Code" := SalesCrMemoLine."VAT Clause Code";
        VATAmountLine2.InsertLine();
    end;

    local procedure InsertServiceInvoiceVATAmountLine(var VATAmountLine2: Record "VAT Amount Line"; ServiceInvoiceLine: Record "Service Invoice Line")
    begin
        VATAmountLine2.Init();
        VATAmountLine2."VAT Identifier" := ServiceInvoiceLine."VAT Identifier";
        VATAmountLine2."VAT Calculation Type" := ServiceInvoiceLine."VAT Calculation Type";
        VATAmountLine2."Tax Group Code" := ServiceInvoiceLine."Tax Group Code";
        VATAmountLine2."VAT %" := ServiceInvoiceLine."VAT %";
        VATAmountLine2."VAT Base" := ServiceInvoiceLine.Amount;
        VATAmountLine2."Amount Including VAT" := ServiceInvoiceLine."Amount Including VAT";
        VATAmountLine2."Line Amount" := ServiceInvoiceLine."Line Amount";
        if ServiceInvoiceLine."Allow Invoice Disc." then
            VATAmountLine2."Inv. Disc. Base Amount" := ServiceInvoiceLine."Line Amount";
        VATAmountLine2."Invoice Discount Amount" := ServiceInvoiceLine."Inv. Discount Amount";
        VATAmountLine2."VAT Clause Code" := ServiceInvoiceLine."VAT Clause Code";
        VATAmountLine2.InsertLine();
    end;

    local procedure InsertServiceCrMemoVATAmountLine(var VATAmountLine2: Record "VAT Amount Line"; ServiceCrMemoLine: Record "Service Cr.Memo Line")
    begin
        VATAmountLine2.Init();
        VATAmountLine2."VAT Identifier" := ServiceCrMemoLine."VAT Identifier";
        VATAmountLine2."VAT Calculation Type" := ServiceCrMemoLine."VAT Calculation Type";
        VATAmountLine2."Tax Group Code" := ServiceCrMemoLine."Tax Group Code";
        VATAmountLine2."VAT %" := ServiceCrMemoLine."VAT %";
        VATAmountLine2."VAT Base" := ServiceCrMemoLine.Amount;
        VATAmountLine2."Amount Including VAT" := ServiceCrMemoLine."Amount Including VAT";
        VATAmountLine2."Line Amount" := ServiceCrMemoLine."Line Amount";
        if ServiceCrMemoLine."Allow Invoice Disc." then
            VATAmountLine2."Inv. Disc. Base Amount" := ServiceCrMemoLine."Line Amount";
        VATAmountLine2."Invoice Discount Amount" := ServiceCrMemoLine."Inv. Discount Amount";
        VATAmountLine2."VAT Clause Code" := ServiceCrMemoLine."VAT Clause Code";
        VATAmountLine2.InsertLine();
    end;

    local procedure InsertSalesInvoiceVATLineBreakupTJP(var VATBreakupBufferTJP: Record "VAT Breakup Buffer TJP"; SalesInvoiceLine: Record "Sales Invoice Line")
    var
        EntryNo: Integer;
    begin
        EntryNo := 1;
        TempVATAmountLine.SetCurrentKey("VAT %");
        if TempVATAmountLine.FindSet() then
            repeat
                GeneralFunctionsTJP.SetVATBreakupLabelsTJP(SalesInvoiceLine.GetCurrencyCode(), TempVATAmountLine, TotAmtExclVATTxt, VATPerTxt);

                VATBreakupBufferTJP.Init();
                VATBreakupBufferTJP."Entry No." := EntryNo;
                VATBreakupBufferTJP."Document No." := SalesInvoiceLine."Document No.";
                VATBreakupBufferTJP."Customer Code" := SalesInvoiceLine."Sell-to Customer No.";
                VATBreakupBufferTJP."VAT %" := TempVATAmountLine."VAT %";
                VATBreakupBufferTJP."Report Breakup Amount" := TempVATAmountLine."VAT Base";
                VATBreakupBufferTJP."Report Label Text" := TotAmtExclVATTxt;
                VATBreakupBufferTJP.Insert();

                VATBreakupBufferTJP.Init();
                VATBreakupBufferTJP."Entry No." := EntryNo + 1;
                VATBreakupBufferTJP."Document No." := SalesInvoiceLine."Document No.";
                VATBreakupBufferTJP."Customer Code" := SalesInvoiceLine."Sell-to Customer No.";
                VATBreakupBufferTJP."VAT %" := TempVATAmountLine."VAT %";
                VATBreakupBufferTJP."Report Breakup Amount" := TempVATAmountLine."VAT Amount";
                VATBreakupBufferTJP."Report Label Text" := VATPerTxt;
                VATBreakupBufferTJP.Insert();
                EntryNo := VATBreakupBufferTJP."Entry No." + 1;
            until TempVATAmountLine.Next() = 0;
    end;

    local procedure InsertSalesCrMemoVATLineBreakupTJP(var VATBreakupBufferTJP: Record "VAT Breakup Buffer TJP"; SalesCrMemoLine: Record "Sales Cr.Memo Line")
    var
        EntryNo: Integer;
    begin
        EntryNo := 1;
        TempVATAmountLine.SetCurrentKey("VAT %");
        if TempVATAmountLine.FindSet() then
            repeat
                GeneralFunctionsTJP.SetVATBreakupLabelsTJP(SalesCrMemoLine.GetCurrencyCode(), TempVATAmountLine, TotAmtExclVATTxt, VATPerTxt);

                VATBreakupBufferTJP.Init();
                VATBreakupBufferTJP."Entry No." := EntryNo;
                VATBreakupBufferTJP."Document No." := SalesCrMemoLine."Document No.";
                VATBreakupBufferTJP."Customer Code" := SalesCrMemoLine."Sell-to Customer No.";
                VATBreakupBufferTJP."VAT %" := TempVATAmountLine."VAT %";
                VATBreakupBufferTJP."Report Breakup Amount" := TempVATAmountLine."VAT Base";
                VATBreakupBufferTJP."Report Label Text" := TotAmtExclVATTxt;
                VATBreakupBufferTJP.Insert();

                VATBreakupBufferTJP.Init();
                VATBreakupBufferTJP."Entry No." := EntryNo + 1;
                VATBreakupBufferTJP."Document No." := SalesCrMemoLine."Document No.";
                VATBreakupBufferTJP."Customer Code" := SalesCrMemoLine."Sell-to Customer No.";
                VATBreakupBufferTJP."VAT %" := TempVATAmountLine."VAT %";
                VATBreakupBufferTJP."Report Breakup Amount" := TempVATAmountLine."VAT Amount";
                VATBreakupBufferTJP."Report Label Text" := VATPerTxt;
                VATBreakupBufferTJP.Insert();
                EntryNo := VATBreakupBufferTJP."Entry No." + 1;
            until TempVATAmountLine.Next() = 0;
    end;

    local procedure InsertServiceInvoiceVATLineBreakupTJP(var VATBreakupBufferTJP: Record "VAT Breakup Buffer TJP"; ServiceInvoiceLine: Record "Service Invoice Line")
    var
        EntryNo: Integer;
    begin
        EntryNo := 1;
        TempVATAmountLine.SetCurrentKey("VAT %");
        if TempVATAmountLine.FindSet() then
            repeat
                GeneralFunctionsTJP.SetVATBreakupLabelsTJP(ServiceInvoiceLine.GetCurrencyCode(), TempVATAmountLine, TotAmtExclVATTxt, VATPerTxt);

                VATBreakupBufferTJP.Init();
                VATBreakupBufferTJP."Entry No." := EntryNo;
                VATBreakupBufferTJP."Document No." := ServiceInvoiceLine."Document No.";
                VATBreakupBufferTJP."Customer Code" := ServiceInvoiceLine."Customer No.";
                VATBreakupBufferTJP."VAT %" := TempVATAmountLine."VAT %";
                VATBreakupBufferTJP."Report Breakup Amount" := TempVATAmountLine."VAT Base";
                VATBreakupBufferTJP."Report Label Text" := TotAmtExclVATTxt;
                VATBreakupBufferTJP.Insert();

                VATBreakupBufferTJP.Init();
                VATBreakupBufferTJP."Entry No." := EntryNo + 1;
                VATBreakupBufferTJP."Document No." := ServiceInvoiceLine."Document No.";
                VATBreakupBufferTJP."Customer Code" := ServiceInvoiceLine."Customer No.";
                VATBreakupBufferTJP."VAT %" := TempVATAmountLine."VAT %";
                VATBreakupBufferTJP."Report Breakup Amount" := TempVATAmountLine."VAT Amount";
                VATBreakupBufferTJP."Report Label Text" := VATPerTxt;
                VATBreakupBufferTJP.Insert();
                EntryNo := VATBreakupBufferTJP."Entry No." + 1;
            until TempVATAmountLine.Next() = 0;
    end;

    local procedure InsertServiceCrMemoVATLineBreakupTJP(var VATBreakupBufferTJP: Record "VAT Breakup Buffer TJP"; ServiceCrMemoLine: Record "Service Cr.Memo Line")
    var
        EntryNo: Integer;
    begin
        EntryNo := 1;
        TempVATAmountLine.SetCurrentKey("VAT %");
        if TempVATAmountLine.FindSet() then
            repeat
                GeneralFunctionsTJP.SetVATBreakupLabelsTJP(ServiceCrMemoLine.GetCurrencyCode(), TempVATAmountLine, TotAmtExclVATTxt, VATPerTxt);

                VATBreakupBufferTJP.Init();
                VATBreakupBufferTJP."Entry No." := EntryNo;
                VATBreakupBufferTJP."Document No." := ServiceCrMemoLine."Document No.";
                VATBreakupBufferTJP."Customer Code" := ServiceCrMemoLine."Customer No.";
                VATBreakupBufferTJP."VAT %" := TempVATAmountLine."VAT %";
                VATBreakupBufferTJP."Report Breakup Amount" := TempVATAmountLine."VAT Base";
                VATBreakupBufferTJP."Report Label Text" := TotAmtExclVATTxt;
                VATBreakupBufferTJP.Insert();

                VATBreakupBufferTJP.Init();
                VATBreakupBufferTJP."Entry No." := EntryNo + 1;
                VATBreakupBufferTJP."Document No." := ServiceCrMemoLine."Document No.";
                VATBreakupBufferTJP."Customer Code" := ServiceCrMemoLine."Customer No.";
                VATBreakupBufferTJP."VAT %" := TempVATAmountLine."VAT %";
                VATBreakupBufferTJP."Report Breakup Amount" := TempVATAmountLine."VAT Amount";
                VATBreakupBufferTJP."Report Label Text" := VATPerTxt;
                VATBreakupBufferTJP.Insert();
                EntryNo := VATBreakupBufferTJP."Entry No." + 1;
            until TempVATAmountLine.Next() = 0;
    end;
}

