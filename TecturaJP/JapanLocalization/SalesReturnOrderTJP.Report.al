#if AppSource
report 70658597 "Sales - Return Order TJP"
#endif
#if OnPremise
report 99022 "Sales - Return Order TJP"
#endif
{
    DefaultLayout = RDLC;
    RDLCLayout = 'TecturaJP/JapanLocalization/SalesReturnOrderJP.rdlc';
    Caption = 'Sales - Return Order';
    PreviewMode = PrintLayout;
    UsageCategory = None;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const("Return Order"));
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Sales Return Order';
            column(DocType_SalesHdr; "Document Type")
            {
            }
            column(No_SalesHdr; "No.")
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(VATPercentageCaption; VATPercentageCaptionLbl)
            {
            }
            column(VATBaseCaption; VATBaseCaptionLbl)
            {
            }
            column(VATAmountCaption; VATAmountCaptionLbl)
            {
            }
            column(VATIdentifierCaption; VATIdentifierCaptionLbl)
            {
            }
            column(InvDiscAmtCaption; InvDiscAmtCaptionLbl)
            {
            }
            column(SellToContactPhoneNoLbl; SellToContactPhoneNoLbl)
            {
            }
            column(SellToContactMobilePhoneNoLbl; SellToContactMobilePhoneNoLbl)
            {
            }
            column(SellToContactEmailLbl; SellToContactEmailLbl)
            {
            }
            column(BillToContactPhoneNoLbl; BillToContactPhoneNoLbl)
            {
            }
            column(BillToContactMobilePhoneNoLbl; BillToContactMobilePhoneNoLbl)
            {
            }
            column(BillToContactEmailLbl; BillToContactEmailLbl)
            {
            }
            column(SellToContactPhoneNo; SellToContact."Phone No.")
            {
            }
            column(SellToContactMobilePhoneNo; SellToContact."Mobile Phone No.")
            {
            }
            column(SellToContactEmail; SellToContact."E-Mail")
            {
            }
            column(BillToContactPhoneNo; BillToContact."Phone No.")
            {
            }
            column(BillToContactMobilePhoneNo; BillToContact."Mobile Phone No.")
            {
            }
            column(BillToContactEmail; BillToContact."E-Mail")
            {
            }
            column(ReducedTaxNoteLbl; ReducedTaxNoteLbl) { }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = sorting(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    column(ReportTitleCopyText; StrSubstNo(Text004Txt, CopyText))
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
                    column(CustAddr6; CustAddr[6])
                    {
                    }
                    column(CustAddr7; CustAddr[7])
                    {
                    }
                    column(CustAddr8; CustAddr[8])
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
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(AmountCaption; AmountCaptionLbl)
                    {
                    }
                    column(UnitPriceCaption; UnitPriceCaptionLbl)
                    {
                    }
                    column(SubtotalCaption; SubtotalCaptionLbl)
                    {
                    }
                    column(SalesLineInvDiscAmtCaptn; SalesLineInvDiscAmtCaptnLbl)
                    {
                    }
                    column(TotalExclVATText; TotalExclVATText)
                    {
                    }
                    column(VATAmount; VATAmount)
                    {
                        AutoFormatExpression = "Sales Header"."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(TotalInclVATText; TotalInclVATText)
                    {
                    }
                    column(VATAmtLineVATAmtText; TempVATAmountLine.VATAmountText())
                    {
                    }
                    column(VATDiscountAmountCaption; VATDiscountAmountCaptionLbl)
                    {
                    }
                    column(TotalText; TotalText)
                    {
                    }
                    column(SalesLineLineDiscCaption; SalesLineLineDiscCaptionLbl)
                    {
                    }
                    column(CompanyInfoVATRegNo; CompVATRegNoLbl + ' : ' + CompanyInformation."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInformation."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyBankNameTxt)
                    {
                    }
                    column(CompanyInfoBankAccNo; CompanyBankAccNoTxt)
                    {
                    }
                    column(CompanyPhNo; 'TEL: ' + CompanyInformation."Phone No.") { }
                    column(CompanyInfoHomePage; CompanyInformation."Home Page")
                    {
                    }
                    column(BilltoCustNo_SalesHdr; "Sales Header"."Bill-to Customer No.")
                    {
                    }
                    column(DocDate_SalesHdr; Format("Sales Header"."Document Date"))
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(VATRegNo_SalesHdr; "Sales Header"."VAT Registration No.")
                    {
                    }
                    column(SalesPersonText; SalespersonLbl)
                    {
                    }
                    column(SalesPurchPersonName; SalesPersonNameText)
                    {
                    }
                    column(SalespersonPhNo; SalespersonPurchaser."Phone No.")
                    {
                    }
                    column(SalespersonEmail; SalespersonPurchaser."E-Mail")
                    {
                    }
                    column(ReferenceText; YourRefLbl)
                    {
                    }
                    column(YourReference_SalesHdr; "Sales Header"."Your Reference")
                    {
                    }
                    column(PricesInclVAT_SalesHdr; "Sales Header"."Prices Including VAT")
                    {
                    }
                    column(PageCaption; StrSubstNo(Text005Lbl, ''))
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PricesInclVATYesNo_SalesHdr; Format("Sales Header"."Prices Including VAT"))
                    {
                    }
                    column(SelltoCustNo_SalesHdr; "Sales Header"."Sell-to Customer No.")
                    {
                    }
                    column(PhNoCaption; PhNoCaptionLbl)
                    {
                    }
                    column(FaxNoCaption; FaxNoCaptionLbl)
                    {
                    }
                    column(VATRegNoCaption; VATRegNoCaptionLbl)
                    {
                    }
                    column(GiroNoCaption; GiroNoCaptionLbl)
                    {
                    }
                    column(BankNameCaption; BankNameCaptionLbl)
                    {
                    }
                    column(AccNoCaption; AccNoCaptionLbl)
                    {
                    }
                    column(ReturnOrderNoCaption; ReturnOrderNoCaptionLbl)
                    {
                    }
                    column(EmailCaption; EmailCaptionLbl)
                    {
                    }
                    column(HomePageCaption; HomePageCaptionLbl)
                    {
                    }
                    column(DocDateCaption; DocDateCaptionLbl)
                    {
                    }
                    column(BilltoCustNo_SalesHdrCaption; BillToCustNoLbl)
                    {
                    }
                    column(PricesInclVAT_SalesHdrCaption; "Sales Header".fieldCaption("Prices Including VAT"))
                    {
                    }
                    column(SelltoCustNo_SalesHdrCaption; SellToCustNoLbl)
                    {
                    }
                    column(BankAccHolderNameLbl; BankAccHolderNameLbl) { }
                    column(CompanyBankAccHolderTxt; CompanyBankAccHolderTxt) { }
                    column(CompanyPicture; CompanyInformation.Picture) { }
                    column(ExternalDocumentNoLbl; ExternalDocumentNoLbl) { }
                    column(ExternalDocumentNo; "Sales Header"."External Document No.") { }
                    column(DocumentCaptionLbl; DocumentCaptionLbl) { }
                    column(BankAccTypeLbl; BankAccTypeLbl) { }
                    column(CompanyBankAccTypeTxt; CompanyBankAccTypeTxt) { }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(DimensionLoop1Number; Number)
                        {
                        }
                        column(HdrDimCaption; HdrDimCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not DimensionSetEntry1.FindSet() then
                                    CurrReport.Break();
                            end else
                                if not Continue then
                                    CurrReport.Break();

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := CopyStr(DimText, 1, 75);
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 %2', DimensionSetEntry1."Dimension Code", DimensionSetEntry1."Dimension Value Code")
                                else
                                    DimText :=
                                      CopyStr(StrSubstNo(
                                        '%1, %2 %3', DimText,
                                        DimensionSetEntry1."Dimension Code", DimensionSetEntry1."Dimension Value Code"), 1, 120);
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until DimensionSetEntry1.Next() = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfo then
                                CurrReport.Break();
                        end;
                    }
                    dataitem("Sales Line"; "Sales Line")
                    {
                        DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = sorting("Document Type", "Document No.", "Line No.");

                        trigger OnPreDataItem()
                        begin
                            CurrReport.Break();
                        end;
                    }
                    dataitem(RoundLoop; "Integer")
                    {
                        DataItemTableView = sorting(Number);
                        column(TypeInt; TypeInt)
                        {
                        }
                        column(SalesLineNo; SalesLineNo)
                        {
                        }
                        column(SalesLineLineNo; SalesLineLineNo)
                        {
                        }
                        column(SalesLineLineAmt; TempSalesLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Desc_SalesLine; LineDescription)
                        {
                        }
                        column(DocNo_SalesLine; TempSalesLine."Document No.")
                        {
                        }
                        column(No2_SalesLine; "Sales Line"."No.")
                        {
                        }
                        column(Qty_SalesLine; "Sales Line".Quantity)
                        {
                        }
                        column(UOM_SalesLine; UoMText)
                        {
                        }
                        column(UnitPrice_SalesLine; "Sales Line"."Unit Price")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 2;
                        }
                        column(LineDisc_SalesLine; "Sales Line"."Line Discount %")
                        {
                        }
                        column(AllowInvDisc_SalesLine; "Sales Line"."Allow Invoice Disc.")
                        {
                            IncludeCaption = false;
                        }
                        column(VATIdentifier_SalesLine; "Sales Line"."VAT Identifier")
                        {
                        }
                        column(AllowInvDiscYesNo_SalesLine; Format("Sales Line"."Allow Invoice Disc."))
                        {
                        }
                        column(SalesLineInvDiscAmt; -TempSalesLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SalesLineAmtAfterLineDisc; TempSalesLine."Line Amount" - TempSalesLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SalesLineAmtExclVATAmount; TempSalesLine."Line Amount" - TempSalesLine."Inv. Discount Amount" + VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATDiscountAmount; -VATDiscountAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATBaseDiscount_SalesHdr; "Sales Header"."VAT Base Discount %")
                        {
                        }
                        column(VATBaseAmount; VATBaseAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmount2; VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmountInclVAT; TotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AllowInvDiscCaption; AllowInvDiscCaptionLbl)
                        {
                        }
                        column(Desc_SalesLineCaption; ItemDescLbl)
                        {
                        }
                        column(No2_SalesLineCaption; ItemNoLbl)
                        {
                        }
                        column(Qty_SalesLineCaption; ItemQtyLbl)
                        {
                        }
                        column(UOM_SalesLineCaption; ItemUoMLbl)
                        {
                        }
                        column(VATIdentifier_SalesLineCaption; "Sales Line".fieldCaption("VAT Identifier"))
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                            column(DimText2; DimText)
                            {
                            }
                            column(DimensionLoop2Number; Number)
                            {
                            }
                            column(LineDimensionsCaption; LineDimensionsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then begin
                                    if not DimensionSetEntry2.FindSet() then
                                        CurrReport.Break();
                                end else
                                    if not Continue then
                                        CurrReport.Break();

                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := CopyStr(DimText, 1, 75);
                                    if DimText = '' then
                                        DimText := StrSubstNo('%1 %2', DimensionSetEntry2."Dimension Code", DimensionSetEntry2."Dimension Value Code")
                                    else
                                        DimText :=
                                          CopyStr(StrSubstNo(
                                            '%1, %2 %3', DimText,
                                            DimensionSetEntry2."Dimension Code", DimensionSetEntry2."Dimension Value Code"), 1, 120);
                                    if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until DimensionSetEntry2.Next() = 0;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not ShowInternalInfo then
                                    CurrReport.Break();

                                DimensionSetEntry2.SetRange("Dimension Set ID", "Sales Line"."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then
                                TempSalesLine.Find('-')
                            else
                                TempSalesLine.Next();
                            "Sales Line" := TempSalesLine;

                            if (TempSalesLine.Type = TempSalesLine.Type::"G/L Account") and (not ShowInternalInfo) then begin
                                SalesLineNo := "Sales Line"."No.";
                                "Sales Line"."No." := '';
                            end;

                            TypeInt := "Sales Line".Type.AsInteger();
                            SalesLineLineNo := "Sales Line"."Line No.";

                            Clear(UoMText);
                            UoMText := GeneralFunctionsTJP.GetUoMDescriptionInCurrentLanguage("Sales Line"."Unit of Measure Code", LangSel);

                            Clear(LineDescription);
                            LineDescription := "Sales Line".Description;
                            if VATProductPostingGroup.Get("Sales Line"."VAT Prod. Posting Group") then
                                if VATProductPostingGroup."Reduced Tax TJP" then
                                    LineDescription := "Sales Line".Description + ' ' + ReduceTaxLbl;
                        end;

                        trigger OnPostDataItem()
                        begin
                            TempSalesLine.DeleteAll();
                        end;

                        trigger OnPreDataItem()
                        begin
                            MoreLines := TempSalesLine.Find('+');
                            while MoreLines and (TempSalesLine.Description = '') and (TempSalesLine."Description 2" = '') and
                                  (TempSalesLine."No." = '') and (TempSalesLine.Quantity = 0) and
                                  (TempSalesLine.Amount = 0)
                            do
                                MoreLines := TempSalesLine.Next(-1) <> 0;
                            if not MoreLines then
                                CurrReport.Break();
                            TempSalesLine.SetRange("Line No.", 0, TempSalesLine."Line No.");
                            SetRange(Number, 1, TempSalesLine.Count);
                        end;
                    }
                    dataitem(VATCounter; "Integer")
                    {
                        DataItemTableView = sorting(Number);
                        column(VATAmtLineVATBase; TempVATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmt; TempVATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineLineAmt; TempVATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscBaseAmt; TempVATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscAmt; TempVATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATPercentage; TempVATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier; TempVATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATAmtSpecificationCaptn; VATAmtSpecificationCaptnLbl)
                        {
                        }
                        column(VATAmtLineVATIdentifrCptn; VATAmtLineVATIdentifrCptnLbl)
                        {
                        }
                        column(InvDiscBaseAmtCaption; InvDiscBaseAmtCaptionLbl)
                        {
                        }
                        column(LineAmtCaption; LineAmtCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            TempVATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            if VATAmount = 0 then
                                CurrReport.Break();
                            SetRange(Number, 1, TempVATAmountLine.Count);
                        end;
                    }
                    dataitem(VATCounterLCY; "Integer")
                    {
                        DataItemTableView = sorting(Number);
                        column(VALExchRate; VALExchRate)
                        {
                        }
                        column(VALSpecLCYHeader; VALSpecLCYHeader)
                        {
                        }
                        column(VALVATBaseLCY; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATAmountLCY; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATPercentage2; TempVATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier2; TempVATAmountLine."VAT Identifier")
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            TempVATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            if (not GeneralLedgerSetup."Print VAT specification in LCY") or
                               ("Sales Header"."Currency Code" = '') or
                               (TempVATAmountLine.GetTotalVATAmount() = 0)
                            then
                                CurrReport.Break();

                            SetRange(Number, 1, TempVATAmountLine.Count);
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));
                        column(ShipToAddr8; ShipToAddr[8])
                        {
                        }
                        column(ShipToAddr7; ShipToAddr[7])
                        {
                        }
                        column(ShipToAddr6; ShipToAddr[6])
                        {
                        }
                        column(ShipToAddr5; ShipToAddr[5])
                        {
                        }
                        column(ShipToAddr4; ShipToAddr[4])
                        {
                        }
                        column(ShipToAddr3; ShipToAddr[3])
                        {
                        }
                        column(ShipToAddr2; ShipToAddr[2])
                        {
                        }
                        column(ShipToAddr1; ShipToAddr[1])
                        {
                        }
                        column(ShowShippingAddr; ShowShippingAddr)
                        {
                        }
                        column(ShiptoAddrCaption; ShiptoAddrCaptionLbl)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if not ShowShippingAddr then
                                CurrReport.Break();
                        end;
                    }
                    dataitem(VATBreakupBufferTJP; "VAT Breakup Buffer TJP")
                    {
                        DataItemLink = "Document No." = field("No.");
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = sorting("VAT %");
                        column(VATPer_VATBreakupBufferTJP; VATBreakupBufferTJP."VAT %") { }
                        column(LabelText_VATBreakupBufferTJP; VATBreakupBufferTJP."Report Label Text") { }
                        column(TotalAmount_VATBreakupBufferTJP; VATBreakupBufferTJP."Report Breakup Amount") { }
                    }
                }

                trigger OnAfterGetRecord()
                var
                    SalesPost: Codeunit "Sales-Post";
                begin
                    Clear(TempSalesLine);
                    Clear(SalesPost);
                    TempSalesLine.DeleteAll();
                    TempVATAmountLine.DeleteAll();
                    SalesPost.GetSalesLines("Sales Header", TempSalesLine, 0);
                    TempSalesLine.CalcVATAmountLines(0, "Sales Header", TempSalesLine, TempVATAmountLine);
                    TempSalesLine.UpdateVATOnLines(0, "Sales Header", TempSalesLine, TempVATAmountLine);
                    VATAmount := TempVATAmountLine.GetTotalVATAmount();
                    VATBaseAmount := TempVATAmountLine.GetTotalVATBase();
                    VATDiscountAmount :=
                      TempVATAmountLine.GetTotalVATDiscount("Sales Header"."Currency Code", "Sales Header"."Prices Including VAT");
                    TotalAmountInclVAT := TempVATAmountLine.GetTotalAmountInclVAT();

                    if Number > 1 then begin
                        CopyText := FormatDocument.GetCOPYText();
                        OutputNo += 1;
                    end;

                    InsertVATLineBreakupTJP(VATBreakupBufferTJP, TempSalesLine);
                end;

                trigger OnPostDataItem()
                begin
                    if not IsReportInPreviewMode() then
                        Codeunit.Run(Codeunit::"Sales-Printed", "Sales Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := Abs(NoOfCopies) + 1;
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if LangSel = '' then begin
                    Customer.Get("Bill-to Customer No.");
                    Customer.Testfield("Language Code");
                    LangSel := Customer."Language Code";
                end;

                CurrReport.Language := Language2.GetLanguageIdOrDefault(LangSel);

                FormatAddressfields("Sales Header");
                FormatDocumentfields("Sales Header");
                if SellToContact.Get("Sell-to Contact No.") then;
                if BillToContact.Get("Bill-to Contact No.") then;

                DimensionSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");
            end;

            trigger OnPostDataItem()
            begin
                OnAfterPostDataItem("Sales Header");
            end;
        }
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
                    field(pNoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = SalesReturnOrder;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(pShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = SalesReturnOrder;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if you want the printed report to show information that is only for internal use.';
                    }
                    field(pLogInteraction; LogInteraction)
                    {
                        ApplicationArea = SalesReturnOrder;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want to record the reports that you print as interactions.';
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

        trigger OnInit()
        begin
            LogInteractionEnable := true;
        end;

        trigger OnOpenPage()
        begin
            InitLogInteraction();
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        GeneralLedgerSetup.Get();
        CompanyInformation.SetAutoCalcfields(Picture);
        CompanyInformation.Get();
        SalesReceivablesSetup.Get();

        OnAfterInitReport();
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not IsReportInPreviewMode() then
            if "Sales Header".FindSet() then
                repeat
                    if "Sales Header"."Bill-to Contact No." <> '' then
                        SegManagement.LogDocument(18, "Sales Header"."No.", 0, 0, DATABASE::Contact,
                          "Sales Header"."Bill-to Contact No.", "Sales Header"."Salesperson Code",
                          "Sales Header"."Campaign No.", "Sales Header"."Posting Description", "Sales Header"."Opportunity No.")
                    else
                        SegManagement.LogDocument(18, "Sales Header"."No.", 0, 0, DATABASE::Customer,
                          "Sales Header"."Bill-to Customer No.", "Sales Header"."Salesperson Code",
                          "Sales Header"."Campaign No.", "Sales Header"."Posting Description", "Sales Header"."Opportunity No.");
                until "Sales Header".Next() = 0;
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then
            InitLogInteraction();
    end;

    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        CompanyInformation: Record "Company Information";
        TempVATAmountLine: Record "VAT Amount Line" temporary;
        TempSalesLine: Record "Sales Line" temporary;
        DimensionSetEntry1: Record "Dimension Set Entry";
        DimensionSetEntry2: Record "Dimension Set Entry";
        ResponsibilityCenter: Record "Responsibility Center";
        SellToContact: Record Contact;
        BillToContact: Record Contact;
        Customer: Record Customer;
        VATProductPostingGroup: Record "VAT Product Posting Group";
        GeneralFunctionsTJP: Codeunit "General Functions TJP";
        Language2: Codeunit Language;
        FormatAddress: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        SalesPersonNameText: Text[50];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        CopyText: Text[30];
        DimText: Text[120];
        OldDimText: Text[75];
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        SalesLineNo: Code[20];
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        OutputNo: Integer;
        TypeInt: Integer;
        SalesLineLineNo: Integer;
        VATAmount: Decimal;
        VATBaseAmount: Decimal;
        VATDiscountAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        LogInteraction: Boolean;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        //[InDataSet]  //2023.12.01 DHA
        LogInteractionEnable: Boolean;
        ShowShippingAddr: Boolean;
        MoreLines: Boolean;
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LangSel: Code[10];
        CompanyBankAccHolderTxt: Text;
        CompanyBankNameTxt: Text;
        CompanyBankAccTypeTxt: Text;
        CompanyBankAccNoTxt: Text;
        UoMText: Text;
        LineDescription: Text;
        TotAmtExclVATTxt: Text[100];
        VATPerTxt: Text[100];
        DocumentCaptionLbl: Label 'Return Order';
        BillToCustNoLbl: Label 'Bill-to Customer No.';
        SellToCustNoLbl: Label 'Sell-to Customer No.';
        YourRefLbl: Label 'Your Reference';
        SalespersonLbl: Label 'Sales Person';
        ExternalDocumentNoLbl: Label 'Ext. Document No.';
        ItemNoLbl: Label 'Item No.';
        ItemDescLbl: Label 'Item Name';
        ItemQtyLbl: Label 'Quantity';
        ItemUoMLbl: Label 'UoM';
        //UnitPriceLbl: Label 'Unit Price';
        AmountCaptionLbl: Label 'Amount';
        UnitPriceCaptionLbl: Label 'Unit Price';
        SubtotalCaptionLbl: Label 'Subtotal';
        PhNoCaptionLbl: Label 'Phone No.';
        FaxNoCaptionLbl: Label 'Fax No.';
        VATRegNoCaptionLbl: Label 'VAT Reg. No.';
        CompVATRegNoLbl: Label 'VAT Registration No.';
        GiroNoCaptionLbl: Label 'Giro No.';
        BankNameCaptionLbl: Label 'Bank';
        AccNoCaptionLbl: Label 'Account No.';
        BankAccHolderNameLbl: Label 'Bank Account Holder';
        BankAccTypeLbl: Label 'Account Type';
        ReturnOrderNoCaptionLbl: Label 'Return Order No.';
        EmailCaptionLbl: Label 'Email';
        HomePageCaptionLbl: Label 'Home Page';
        DocDateCaptionLbl: Label 'Document Date';
        HdrDimCaptionLbl: Label 'Header Dimensions';
        AllowInvDiscCaptionLbl: Label 'Allow Invoice Discount';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        VATAmtSpecificationCaptnLbl: Label 'VAT Amount Specification';
        VATAmtLineVATIdentifrCptnLbl: Label 'VAT Identifier';
        InvDiscBaseAmtCaptionLbl: Label 'Inv. Disc. Base Amount';
        LineAmtCaptionLbl: Label 'Line Amount';
        ShiptoAddrCaptionLbl: Label 'Ship-to Address';
        TotalCaptionLbl: Label 'Total';
        VATPercentageCaptionLbl: Label 'VAT %';
        ReduceTaxLbl: Label '*';
        ReducedTaxNoteLbl: Label 'Products marked with * are subject to a reduced tax rate.';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATAmountCaptionLbl: Label 'VAT Amount';
        VATIdentifierCaptionLbl: Label 'VAT Identifier';
        SalesLineInvDiscAmtCaptnLbl: Label 'Invoice Discount';
        VATDiscountAmountCaptionLbl: Label 'Payment Discount on VAT';
        SalesLineLineDiscCaptionLbl: Label 'Discount %';
        InvDiscAmtCaptionLbl: Label 'Invoice Discount Amount';
        SellToContactPhoneNoLbl: Label 'Sell-to Contact Phone No.';
        SellToContactMobilePhoneNoLbl: Label 'Sell-to Contact Mobile Phone No.';
        SellToContactEmailLbl: Label 'Sell-to Contact E-Mail';
        BillToContactPhoneNoLbl: Label 'Bill-to Contact Phone No.';
        BillToContactMobilePhoneNoLbl: Label 'Bill-to Contact Mobile Phone No.';
        BillToContactEmailLbl: Label 'Bill-to Contact E-Mail';
        Text004Txt: Label 'Return Order Confirmation %1', Comment = '%1 = Document No.';
        Text005Lbl: Label 'Page %1', Comment = '%1 = Page No.';

    procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractionTemplateCode(Enum::"Interaction Log Entry Document Type"::"Sales Return Order") <> '';  //20231101 DHA
    end;

    procedure InitializeRequest(ShowInternalInfoFrom: Boolean; LogInteractionFrom: Boolean)
    begin
        InitLogInteraction();
        ShowInternalInfo := ShowInternalInfoFrom;
        LogInteraction := LogInteractionFrom;
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody());
    end;

    local procedure FormatAddressfields(var SalesHeader: Record "Sales Header")
    begin
        GeneralFunctionsTJP.GetCompanyAdd(SalesHeader."Responsibility Center", ResponsibilityCenter, CompanyInformation, CompanyAddr, LangSel);
        FormatAddress.SalesHeaderBillTo(CustAddr, SalesHeader);
        ShowShippingAddr := FormatAddress.SalesHeaderShipTo(ShipToAddr, CustAddr, SalesHeader);
        OnAfterFormatAddressfields(ShipToAddr, CustAddr, SalesHeader, ShowShippingAddr);
    end;

    local procedure FormatDocumentfields(SalesHeader: Record "Sales Header")
    begin
        GeneralFunctionsTJP.SetTotalLabelsTJP(SalesHeader.GetCurrencySymbol(), TotalText, TotalInclVATText, TotalExclVATText);
        FormatDocument.SetSalesPerson(SalespersonPurchaser, SalesHeader."Salesperson Code", SalesPersonNameText);

        ReferenceText := FormatDocument.SetText(SalesHeader."Your Reference" <> '', CopyStr(SalesHeader.fieldCaption("Your Reference"), 1, 80));
        VATNoText := FormatDocument.SetText(SalesHeader."VAT Registration No." <> '', CopyStr(SalesHeader.fieldCaption("VAT Registration No."), 1, 80));
        GeneralFunctionsTJP.TranslateCompBankAccfields(CompanyInformation, CompanyBankAccHolderTxt, CompanyBankNameTxt, CompanyBankAccNoTxt, CompanyBankAccTypeTxt, LangSel);
    end;

    local procedure InsertVATLineBreakupTJP(var VATBreakupBufferTJP: Record "VAT Breakup Buffer TJP"; pSalesLine: Record "Sales Line")
    var
        EntryNo: Integer;
    begin
        EntryNo := 1;
        if TempVATAmountLine.FindSet() then
            repeat
                GeneralFunctionsTJP.SetVATBreakupLabelsTJP(pSalesLine."Currency Code", TempVATAmountLine, TotAmtExclVATTxt, VATPerTxt);

                VATBreakupBufferTJP.Init();
                VATBreakupBufferTJP."Entry No." := EntryNo;
                VATBreakupBufferTJP."Document No." := pSalesLine."Document No.";
                VATBreakupBufferTJP."Customer Code" := pSalesLine."Sell-to Customer No.";
                VATBreakupBufferTJP."VAT %" := TempVATAmountLine."VAT %";
                VATBreakupBufferTJP."Report Breakup Amount" := TempVATAmountLine."VAT Base";
                VATBreakupBufferTJP."Report Label Text" := TotAmtExclVATTxt;
                VATBreakupBufferTJP.Insert();

                VATBreakupBufferTJP.Init();
                VATBreakupBufferTJP."Entry No." := EntryNo + 1;
                VATBreakupBufferTJP."VAT %" := TempVATAmountLine."VAT %";
                VATBreakupBufferTJP."Report Breakup Amount" := TempVATAmountLine."VAT Amount";
                VATBreakupBufferTJP."Report Label Text" := VATPerTxt;
                VATBreakupBufferTJP.Insert();
                EntryNo := VATBreakupBufferTJP."Entry No." + 1;
            until TempVATAmountLine.Next() = 0;
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterInitReport()
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterFormatAddressfields(var ShipToAddr: array[8] of Text[100]; var CustAddr: array[8] of Text[100]; var SalesHeader: Record "Sales Header"; var ShowShippingAddr: Boolean)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterPostDataItem(var SalesHeader: Record "Sales Header")
    begin
    end;
}

