#if AppSource
report 70658577 "Collective Invoice TJP"
#endif
#if OnPremise
report 99002 "Collective Invoice TJP"
#endif
{
    DefaultLayout = RDLC;
    RDLCLayout = 'TecturaJP/JapanLocalization/CollectiveInvoice.rdlc';
    Caption = 'Collective Invoice';
    PreviewMode = PrintLayout;
    //UsageCategory = ReportsAndAnalysis;
    UsageCategory = None;    //DHA 2023.112.06 Not Required to show in BC search 
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
                Requestfilterfields = "No.", "Date filter", "Collective Invoice Date TJP";
                column(CustNo; "No.")
                {
                }
                column(CurrSymbol; GeneralLedgerSetup."Local Currency Symbol")
                {
                }
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    PrintOnlyIfDetail = true;
                    column(ReportTitleCaption; ReportTitleCaptionLbl)
                    {
                    }
                    column(InvoiceNoCaption; InvoiceNoCaptionLbl)
                    {
                    }
                    column(AmountNoteCaption; AmountNoteCaptionLbl)
                    {
                    }
                    column(PrevAmtCaption; PrevAmtCaptionLbl)
                    {
                    }
                    column(PrevPaidCaption; PrevPaidCaptionLbl)
                    {
                    }
                    column(PrevRemainCaption; PrevRemainCaptionLbl)
                    {
                    }
                    column(InvCntCaption; InvCntCaptionLbl)
                    {
                    }
                    column(AmtExclVATCaption; AmtExclVATCaptionLbl)
                    {
                    }
                    column(VATAmountCaption; VATAmountCaptionLbl)
                    {
                    }
                    column(AmtInclVATCaption; AmtInclVATCaptionLbl)
                    {
                    }
                    column(CurrBalCaption; CurrBalCaptionLbl)
                    {
                    }
                    column(DocNoCaption; DocNoCaptionLbl)
                    {
                    }
                    column(PostingDateCaption; PostingDateCaptionLbl)
                    {
                    }
                    column(ItemNoCaption; ItemNoCaptionLbl)
                    {
                    }
                    column(DescCaption; DescCaptionLbl)
                    {
                    }
                    column(QtyCaption; QtyCaptionLbl)
                    {
                    }
                    column(UoMCaption; UoMCaptionLbl)
                    {
                    }
                    column(UnitPriceCaption; UnitPriceCaptionLbl)
                    {
                    }
                    column(LineAmtCaption; LineAmtCaptionLbl)
                    {
                    }
                    column(LineNoCaption; LineNoCaptionLbl)
                    {
                    }
                    column(ShipNameCaption; ShipNameCaptionLbl)
                    {
                    }
                    column(SellCustNoCaption; SellCustNoCaptionLbl)
                    {
                    }
                    column(TotalAmtInclVATCaption; TotalAmtInclVATCaptionLbl)
                    {
                    }
                    column(FooterDueDateCaption; FooterDueDateCaptionLbl)
                    {
                    }
                    column(FooterVatCaption; FooterVatCaptionLbl)
                    {
                    }
                    column(BankDetailCaption; BankDetailCaptionLbl)
                    {
                    }
                    column(CopyIdentifier; CopyIdentifier)
                    {
                    }
                    column(Shimekiri; JapanDate + TextShimekiriLbl)
                    {
                    }
                    column(InvoiceNo; VarText + '-' + Customer."No.")
                    {
                    }
                    column(BillCustNo; StrSubstNo('(%1)', Customer."No."))
                    {
                    }
                    column(NoOfDocs; NoOfDocs)
                    {
                        DecimalPlaces = 0 : 2;
                    }
                    column(SCSetupSales; SourceCodeSetup.Sales)
                    {
                    }
                    column(SCSetupServMgnt; SourceCodeSetup."Service Management")
                    {
                    }
                    column(ShowDetail; ShowDetail)
                    {
                    }
                    column(OutputNoVal; OutputNo)
                    {
                    }
                    column(PageLoopNumber; Number)
                    {
                    }
                    column(CustAddr1; CustAddr[1])
                    {
                    }
                    column(CustAddr2; CustAddr[2])
                    {
                    }
                    column(CustAddr3; CustAddr[3])
                    {
                    }
                    column(CustAddr4; CustAddr[4])
                    {
                    }
                    column(CustAddr5; CustAddr[5])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(CompanyChop; CompanyInformation."Chop TJP")
                    {
                    }
                    column(CompanyPhone; CompanyInformation."Phone No.")
                    {
                    }
                    dataitem(CurrencyLoop; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                        PrintOnlyIfDetail = true;
                        column(CurrencyCode; TempCurrency.Code)
                        {
                        }
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
                            DataItemTableView = sorting("Customer No.", "Posting Date", "Currency Code") where("Document Type" = filter(Invoice .. "Credit Memo"), "Sales (LCY)" = filter(<> 0));
                            column(EntryNo; "Entry No.")
                            {
                            }
                            column(SourceCode; "Source Code")
                            {
                            }
                            column(SellCustName; Customer3.Name)
                            {
                            }
                            column(SellCustNo; "Sell-to Customer No.")
                            {
                            }
                            column(Body3DocumentNo; "Document No.")
                            {
                            }
                            column(Body3DelPoint; DelPoint)
                            {
                            }
                            column(Body3CommentLine; SalesCommentLine.Comment)
                            {
                            }
                            column(Body3SalesDate; Format(SalesDate, 0, '<Year4>/<Month,2>/<Day,2>'))
                            {
                            }
                            column(Body4SalesDate; Format(SalesDate, 0, '<Year4>/<Month,2>/<Day,2>'))
                            {
                            }
                            column(Body4DocumentNo; "Document No.")
                            {
                            }
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
                            column(FooterDueDate; CIDueDate)
                            {
                            }
                            column(FooterBankDetail; CompanyInformation."Bank Name" + ' ' + CompanyInformation."Bank Branch No." + ' ' + CompanyInformation."Bank Account No.")
                            {
                            }
                            column(FooterCompanyName; CompanyInformation."Bank Account Holder Name TJP")
                            {
                            }
                            dataitem(SalesInvoiceLine; "Sales Invoice Line")
                            {
                                DataItemLink = "Document No." = field("Document No.");
                                DataItemTableView = sorting("Document No.", "Line No.") where("No." = filter(<> ''));
                                column(IBody1No; "No.")
                                {
                                }
                                column(IBody1Description; Description)
                                {
                                }
                                column(IBody1Qty; Quantity)
                                {
                                }
                                column(IBody1Uom; "Unit of Measure")
                                {
                                }
                                column(IBody1Amt; Amount)
                                {
                                }
                                column(IBody1LineAmt; "Line Amount")
                                {
                                }
                                column(IBody1UnitPrice; "Unit Price")
                                {
                                }
                                column(IBody1Type; Type)
                                {
                                }
                                column(IBodyDocNo; "Document No.")
                                {
                                }
                                column(IBody1LineNo; Format(LineNo, 0, '<Integer,2>'))
                                {
                                }

                                trigger OnAfterGetRecord()
                                begin
                                    //DiscAmount := "Line Discount Amount" + "Inv. Discount Amount";

                                    LineNo := LineNo + 1;
                                    VATAmount := ("Amount Including VAT" - Amount);
                                    AmtExclVAT := Amount;
                                    AmtInclVAT := "Amount Including VAT";
                                    AccumulateTotals();

                                    DocAmt += "Amount Including VAT";
                                    DocVAT += ("Amount Including VAT" - Amount);

                                    if not ShowDetail then
                                        CurrReport.Skip();
                                end;

                                trigger OnPreDataItem()
                                begin
                                    if "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::"Credit Memo" then
                                        CurrReport.Break();
                                end;
                            }
                            dataitem(SalesCrMemoLine; "Sales Cr.Memo Line")
                            {
                                DataItemLink = "Document No." = field("Document No.");
                                DataItemTableView = sorting("Document No.", "Line No.") where("No." = filter(<> ''));
                                column(CBody1No; "No.")
                                {
                                }
                                column(CBody1Description; Description)
                                {
                                }
                                column(CBody1Uom; "Unit of Measure")
                                {
                                }
                                column(CBody1Qty; Quantity)
                                {
                                }
                                column(CBody1PriceDisc; PriceDiscText)
                                {
                                }
                                column(CBody1Amt; Amount)
                                {
                                }
                                column(CBody1LineAmt; "Line Amount")
                                {
                                }
                                column(CBody1UnitPrice; "Unit Price")
                                {
                                }
                                column(CBody1Type; Type)
                                {
                                }
                                column(CBody1DocNo; "Document No.")
                                {
                                }
                                column(CBody1LineNo; Format(LineNo, 0, '<Integer,2>'))
                                {
                                }

                                trigger OnAfterGetRecord()
                                begin
                                    //DiscAmount := "Line Discount Amount" + "Inv. Discount Amount";

                                    "Amount Including VAT" := "Amount Including VAT" * (-1);
                                    Amount *= (-1);

                                    LineNo := LineNo + 1;
                                    VATAmount := ("Amount Including VAT" - Amount);
                                    AmtExclVAT := Amount;
                                    AmtInclVAT := "Amount Including VAT";
                                    AccumulateTotals();

                                    DocAmt += "Amount Including VAT";
                                    DocVAT += ("Amount Including VAT" - Amount);

                                    if not ShowDetail then
                                        CurrReport.Skip();
                                end;

                                trigger OnPreDataItem()
                                begin
                                    if "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::Invoice then
                                        CurrReport.Break();
                                end;
                            }
                            dataitem(ServiceInvoiceLine; "Service Invoice Line")
                            {
                                DataItemLink = "Document No." = field("Document No.");
                                DataItemTableView = sorting("Document No.", "Line No.") where("No." = filter(<> ''));
                                column(SBody1No; "No.")
                                {
                                }
                                column(SBody1Description; Description)
                                {
                                }
                                column(SBody1Qty; Quantity)
                                {
                                }
                                column(SBody1Uom; "Unit of Measure")
                                {
                                }
                                column(SBody1PriceDisc; PriceDiscText)
                                {
                                }
                                column(SBody1Amt; Amount)
                                {
                                }
                                column(SBody1UnitPrice; "Unit Price")
                                {
                                }
                                column(SBody1LineAmt; "Line Amount")
                                {
                                }
                                column(SBody1Type; Type)
                                {
                                }
                                column(SBody1DocNo; "Document No.")
                                {
                                }
                                column(SBody1LineNo; Format(LineNo, 0, '<Integer,2>'))
                                {
                                }

                                trigger OnAfterGetRecord()
                                begin
                                    //DiscAmount := "Line Discount Amount" + "Inv. Discount Amount";

                                    LineNo := LineNo + 1;
                                    VATAmount := ("Amount Including VAT" - Amount);
                                    AmtExclVAT := Amount;
                                    AmtInclVAT := "Amount Including VAT";
                                    AccumulateTotals();

                                    DocAmt += "Amount Including VAT";
                                    DocVAT += ("Amount Including VAT" - Amount);

                                    if not ShowDetail then
                                        CurrReport.Skip();
                                end;

                                trigger OnPreDataItem()
                                begin
                                    if "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::"Credit Memo" then
                                        CurrReport.Break();
                                end;
                            }
                            dataitem(ServiceCrMemoLine; "Service Cr.Memo Line")
                            {
                                DataItemLink = "Document No." = field("Document No.");
                                DataItemTableView = sorting("Document No.", "Line No.") where("No." = filter(<> ''));
                                column(SCBody1No; "No.")
                                {
                                }
                                column(SCBody1Description; Description)
                                {
                                }
                                column(SCBody1Qty; Quantity)
                                {
                                }
                                column(SCBody1Uom; "Unit of Measure")
                                {
                                }
                                column(SCBody1PriceDisc; PriceDiscText)
                                {
                                }
                                column(SCBody1Amt; Amount)
                                {
                                }
                                column(SCBody1UnitPrice; "Unit Price")
                                {
                                }
                                column(SCBody1LineAmt; "Line Amount")
                                {
                                }
                                column(SCBody1Type; Type)
                                {
                                }
                                column(SCBody1DocNo; "Document No.")
                                {
                                }
                                column(SCBody1LineNo; Format(LineNo, 0, '<Integer,2>'))
                                {
                                }

                                trigger OnAfterGetRecord()
                                begin
                                    //DiscAmount := "Line Discount Amount" + "Inv. Discount Amount";

                                    "Amount Including VAT" := "Amount Including VAT" * (-1);
                                    Amount *= (-1);

                                    LineNo := LineNo + 1;
                                    VATAmount := ("Amount Including VAT" - Amount);
                                    AmtExclVAT := Amount;
                                    AmtInclVAT := "Amount Including VAT";
                                    AccumulateTotals();

                                    DocAmt += "Amount Including VAT";
                                    DocVAT += ("Amount Including VAT" - Amount);

                                    if not ShowDetail then
                                        CurrReport.Skip();
                                end;

                                trigger OnPreDataItem()
                                begin
                                    if "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::Invoice then
                                        CurrReport.Break();
                                end;
                            }
                            dataitem(DocStatistics; "Integer")
                            {
                                DataItemTableView = sorting(Number) where(Number = filter(1));
                                column(DocStatiticDocVAT; DocVAT)
                                {
                                    DecimalPlaces = 0 : 0;
                                }
                                column(DocStatiticDocAmt; DocAmt)
                                {
                                    DecimalPlaces = 0 : 0;
                                }
                                column(DocStatiticNumber; Number)
                                {
                                }

                                trigger OnPreDataItem()
                                begin
                                    if LineNo = 0 then
                                        CurrReport.Break();
                                end;
                            }

                            trigger OnAfterGetRecord()
                            var
                                TxtTemp1: Text[40];
                                TxtTemp2: Text[40];
                            begin
                                if IsResetImage then
                                    Clear(CompanyInformation."Chop TJP");
                                IsResetImage := true;

                                TxtTemp1 := copystr(GeneralFunctionsTJP.ConvKanaToSingle(Customer3."No."), 1, MaxStrLen(TxtTemp1));
                                TxtTemp2 := copystr(GeneralFunctionsTJP.ConvKanaToSingle("Sell-to Customer No."), 1, MaxStrLen(TxtTemp2));
                                if TxtTemp1 <> TxtTemp2 then begin
                                    TotalAmtExclVAT := 0;
                                    TotalVATAmt := 0;
                                    TotalAmtInclVAT := 0;
                                end;

                                DocAmt := 0;
                                DocVAT := 0;

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
                                                DelPoint := SalesInvoiceHeader."Ship-to Name";

                                            if "Source Code" = SourceCodeSetup."Service Management" then
                                                if ServiceInvoiceHeader.Get("Cust. Ledger Entry"."Document No.") then
                                                    DelPoint := ServiceInvoiceHeader."Ship-to Name"
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
                                                DelPoint := SalesCrMemoHeader."Ship-to Name";

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
                                    SetCurrentKey("Sell-to Customer No.", "Document Date");
                                    SetRange("Document Date", StartDate, EndDate);
                                end;

                                SetRange("Currency Code", TempCurrency.Code);

                                Clear(DocCountNo);
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then
                                TempCurrency.FindSet()
                            else
                                if TempCurrency.Next() = 0 then
                                    CurrReport.Break();

                            Clear(PrevPeriodInvAmt);
                            Clear(PrevPeriodPaidAmt);
                            Clear(PrevPeriodRemAmt);
                            Clear(CurrPeriodAmtExclVAT);
                            Clear(CurrPeriodVATAmt);
                            Clear(CurrPeriodAmtInclVAT);
                            Clear(CurrPeriodOutstdAmt);
                            Clear(CurrPeriodPaidAmt);

                            CalcColInvStatistics(Customer, TempCurrency.Code);

                            CompanyInformation.Calcfields("Chop TJP");
                            IsResetImage := false;
                        end;

                        trigger OnPreDataItem()
                        begin
                            Customer.Copyfilter("Currency filter", TempCurrency.Code);
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

                    PrintLine := false;
                    Customer2 := Customer;
                    Copyfilter("Currency filter", TempCurrency.Code);
                    if PrintAllHavingBal then
                        if TempCurrency.Find('-') then
                            repeat
                                Customer2.SetRange("Date filter", 0D, EndDate);
                                Customer2.SetRange("Currency filter", TempCurrency.Code);
                                Customer2.Calcfields("Net Change");
                                PrintLine := Customer2."Net Change" <> 0;
                            until (TempCurrency.Next() = 0) or PrintLine;

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
                        Customer.Copyfilter("Currency filter", "Cust. Ledger Entry"."Currency Code");
                        PrintLine := "Cust. Ledger Entry".Find('-');
                    end;
                    if not PrintLine then
                        CurrReport.Skip();

                    FormatAddress.Customer(CustAddr, Customer);

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
                    StartDate := GetRangeMin("Date filter");
                    EndDate := GetRangeMax("Date filter");

                    //Previous month date range
                    PrevPeriodEndDate := CalcDate('<-1D>', StartDate);
                    //PrevPeriodStartDate := CalcDate('<-CM>', PrevPeriodEndDate);

                    TempCurrency.Code := '';
                    if not TempCurrency.Insert() then;
                    Copyfilter("Currency filter", Currency.Code);
                    if Currency.Find('-') then
                        repeat
                            TempCurrency := Currency;
                            if not TempCurrency.Insert() then;
                        until Currency.Next() = 0;

                    JapanDate := StrSubstNo(TextJPNDateTxt, Date2DMY(EndDate, 3), Date2DMY(EndDate, 2), Date2DMY(EndDate, 1));
                    InvoiceNo := (Date2DMY(EndDate, 3) - 2000) * 10000 + (Date2DMY(EndDate, 2)) * 100 + Date2DMY(EndDate, 1);
                    VarText := Format(Round(InvoiceNo, 1, '='));
                    VarText := DelChr(VarText, '<=>', ',');
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
        SourceCodeSetup: Record "Source Code Setup";
        GeneralLedgerSetup: Record "General Ledger Setup";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        VATEntry: Record "VAT Entry";
        SalesCommentLine: Record "Sales Comment Line";
        CompanyInformation: Record "Company Information";
        Customer2: Record Customer;
        Customer3: Record Customer;
        Currency: Record Currency;
        TempCurrency: Record Currency temporary;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        ServiceInvoiceHeader: Record "Service Invoice Header";
        PaymentTerms: Record "Payment Terms";
        Language2: Codeunit Language;
        FormatAddress: Codeunit "Format Address";
        GeneralFunctionsTJP: Codeunit "General Functions TJP";
        LangSel: Code[10];
        CustAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        JapanDate: Text[20];
        VarText: Text[30];
        DelPoint: Text[100];
        PriceDiscText: Text[30];
        CopyIdentifier: Text[40];
        StartDate: Date;
        EndDate: Date;
        CIDueDate: Date;
        SalesDate: Date;
        PrevPeriodEndDate: Date;
        LineNo: Integer;
        DocCountNo: Integer;
        OutputNo: Integer;
        NoOfDocs: Decimal;
        InvoiceNo: Decimal;
        VATAmount: Decimal;
        //DiscAmount: Decimal;
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
        DocAmt: Decimal;
        DocVAT: Decimal;
        TextShimekiriLbl: Label ' Period';
        InvoiceNoCaptionLbl: Label 'Invoice No.';
        PrevAmtCaptionLbl: Label 'Prev. Amt.';
        PrevPaidCaptionLbl: Label 'Prev. Paid';
        PrevRemainCaptionLbl: Label 'Prev. Remain';
        InvCntCaptionLbl: Label 'Inv. Count';
        AmtExclVATCaptionLbl: Label 'Amount Excluding VAT';
        VATAmountCaptionLbl: Label 'VAT';
        AmtInclVATCaptionLbl: Label 'Amount Including VAT';
        CurrBalCaptionLbl: Label 'Curr Bal.';
        AmountNoteCaptionLbl: Label 'We will request the following.';
        PostingDateCaptionLbl: Label 'Posting Date';
        ItemNoCaptionLbl: Label 'Item No.';
        DescCaptionLbl: Label 'Description';
        QtyCaptionLbl: Label 'Qty.';
        UoMCaptionLbl: Label 'UOM';
        UnitPriceCaptionLbl: Label 'Unit Price';
        LineAmtCaptionLbl: Label 'Line Amount';
        DocNoCaptionLbl: Label 'Doc No.';
        LineNoCaptionLbl: Label 'Line No.';
        ShipNameCaptionLbl: Label 'Ship-to Name';
        SellCustNoCaptionLbl: Label 'Sell-to Cust. No. :';
        TotalAmtInclVATCaptionLbl: Label 'Total Amount Including VAT';
        FooterDueDateCaptionLbl: Label 'Due Date';
        FooterVatCaptionLbl: Label '* VAT Amount is shown below total amount.';
        BankDetailCaptionLbl: Label 'Bank Details:';
        ReportTitleCaptionLbl: Label 'Invoice';
        TextJPNDateTxt: Label '%1/%2/%3', Comment = 'Year=%1/Month=%2/Day=%3';
        IsResetImage: Boolean;
        PrintAllHavingEntry: Boolean;
        PrintAllHavingBal: Boolean;
        PrintLine: Boolean;
        ShowDetail: Boolean;

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
        LCustLedgerEntry.Setfilter("Document Type", '%1|%2', LCustLedgerEntry."Document Type"::Invoice, LCustLedgerEntry."Document Type"::"Credit Memo");
        LCustLedgerEntry.SetRange("Customer No.", LCustomer2."No.");
        LCustLedgerEntry.Setfilter("Posting Date", '..%1', PrevPeriodEndDate);
        LCustLedgerEntry.Setfilter("Date filter", '..%1', PrevPeriodEndDate);
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
        LCustLedgerEntry.Setfilter("Posting Date", '%1..%2', StartDate, EndDate);
        LCustLedgerEntry.Setfilter("Document Type", '%1|%2', LCustLedgerEntry."Document Type"::Invoice, LCustLedgerEntry."Document Type"::"Credit Memo");
        LCustLedgerEntry.Setfilter("Date filter", '..%1', EndDate);
        LCustLedgerEntry.SetRange("Currency Code", LCurrCode);
        NoOfDocs := LCustLedgerEntry.Count;
        if LCustLedgerEntry.FindSet() then begin
            repeat
                LCustLedgerEntry.Calcfields(Amount);
                CurrPeriodAmtInclVAT := CurrPeriodAmtInclVAT + LCustLedgerEntry.Amount;
                LDetailedCustLedgEntry.SetCurrentKey("Cust. Ledger Entry No.", "Posting Date");
                LDetailedCustLedgEntry.SetRange("Cust. Ledger Entry No.", LCustLedgerEntry."Entry No.");
                LDetailedCustLedgEntry.Setfilter("Posting Date", '..%1', EndDate);
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
}

