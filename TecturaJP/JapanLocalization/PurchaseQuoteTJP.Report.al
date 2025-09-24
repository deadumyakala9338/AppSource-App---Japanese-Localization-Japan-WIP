#if AppSource
report 70658589 "Purchase - Quote TJP"
#endif
#if OnPremise
report 99014 "Purchase - Quote TJP"
#endif
{
    DefaultLayout = RDLC;
    RDLCLayout = 'TecturaJP/JapanLocalization/PurchaseQuoteJP.rdlc';
    Caption = 'Purchase - Quote';
    PreviewMode = PrintLayout;
    UsageCategory = None;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const(Quote));
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            RequestFilterHeading = 'Purchase Quote';
            column(DocType_PurchHead; "Document Type")
            {
            }
            column(PurchHeadNo; "No.")
            {
            }
            column(CompanyInfoPhoneNoCap; CompanyInfoPhoneNoCapLbl)
            {
            }
            column(CompanyInfoVATRegNoCap; CompanyInfoVATRegNoCapLbl)
            {
            }
            column(CompanyInfoGiroNoCap; CompanyInfoGiroNoCapLbl)
            {
            }
            column(CompanyInfoBankNameCap; CompanyInfoBankNameCapLbl)
            {
            }
            column(CompInfoBankAccNoCap; CompInfoBankAccNoCapLbl)
            {
            }
            column(DocumentDateCap; DocumentDateCapLbl)
            {
            }
            column(PageNoCaption; PageNoCaptionLbl)
            {
            }
            column(ShipmentMethodDescCap; ShipmentMethodDescCapLbl)
            {
            }
            column(PurchLineVendItemNoCap; PurchLineVendItemNoCapLbl)
            {
            }
            column(PurchaseLineDescCap; PurchaseLineDescCapLbl)
            {
            }
            column(PurchaseLineQuantityCap; PurchaseLineQuantityCapLbl)
            {
            }
            column(PurchaseLineUOMCaption; PurchaseLineUOMCaptionLbl)
            {
            }
            column(PurchaseLineNoCaption; PurchaseLineNoCaptionLbl)
            {
            }
            column(PurchaserTextCaption; PurchaserTextCaptionLbl)
            {
            }
            column(ReferenceTextCaption; ReferenceTextCaptionLbl)
            {
            }
            column(HomePageCaption; HomePageCaptionLbl)
            {
            }
            column(EMailCaption; EMailCaptionLbl)
            {
            }
            column(VatRegistrationNoCaption; VatRegistrationNoCaptionLbl)
            {
            }
            column(CompanyPicture; CompanyInformation.Picture) { }
            column(BankAccHolderNameLbl; BankAccHolderNameLbl) { }
            column(CompanyBankAccHolderTxt; CompanyBankAccHolderTxt) { }
            column(CompanyBankNameTxt; CompanyBankNameTxt) { }
            column(BankAccTypeLbl; BankAccTypeLbl) { }
            column(CompanyBankAccTypeTxt; CompanyBankAccTypeTxt) { }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = sorting(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    column(PurchaseQuoteCopyText; DocumentCaptionLbl)
                    {
                    }
                    column(VendAddr1; VendAddr[1])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(VendAddr2; VendAddr[2])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(VendAddr3; VendAddr[3])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(VendAddr4; VendAddr[4])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(VendAddr5; VendAddr[5])
                    {
                    }
                    column(PurchaserPhNo; SalespersonPurchaser."Phone No.")
                    {
                        IncludeCaption = false;
                    }
                    column(VendAddr6; VendAddr[6])
                    {
                    }
                    column(CompanyInfoVatRegNo; CompanyInfoVATRegNoCapLbl + ' : ' + CompanyInformation."VAT Registration No.")
                    {
                        IncludeCaption = false;
                    }
                    column(CompanyInfoGiroNo; CompanyInformation."Giro No.")
                    {
                        IncludeCaption = false;
                    }
                    column(CompanyInfoBankName; CompanyBankNameTxt)
                    {
                        IncludeCaption = false;
                    }
                    column(CompanyInfoBankAccNo; CompanyBankAccNoTxt)
                    {
                        IncludeCaption = false;
                    }
                    column(CompanyInfoHomePage; CompanyInformation."Home Page")
                    {
                    }
                    column(PurchaserEMail; SalespersonPurchaser."E-Mail")
                    {
                    }
                    column(PaytoVendNo_PurchHdr; "Purchase Header"."Pay-to Vendor No.")
                    {
                    }
                    column(DocDate_PurchHdr; Format("Purchase Header"."Document Date"))
                    {
                    }
                    column(VatNoText; VATNoText)
                    {
                    }
                    column(VatTRegNo_PurchHdr; "Purchase Header"."VAT Registration No.")
                    {
                    }
                    column(ExpctRecpDt_PurchHdr; Format("Purchase Header"."Expected Receipt Date"))
                    {
                    }
                    column(PurchaserText; PurchaserCodeLbl)
                    {
                    }
                    column(SalesPurchPersonName; PurchaserNameText)
                    {
                    }
                    column(No1_PurchaseHdr; "Purchase Header"."No.")
                    {
                    }
                    column(ReferenceText; YourRefLbl)
                    {
                    }
                    column(YourRef_PurchHdr; "Purchase Header"."Your Reference")
                    {
                    }
                    column(VendAddr7; VendAddr[7])
                    {
                    }
                    column(VendAddr8; VendAddr[8])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; 'TEL: ' + CompanyInformation."Phone No.")
                    {
                    }
                    column(ShipMethodDesc; ShipmentMethod.Description)
                    {
                    }
                    column(OutpuNo; OutputNo)
                    {
                    }
                    column(BuyfromVendNo_PurchHdr; "Purchase Header"."Buy-from Vendor No.")
                    {
                    }
                    column(ExpectedDateCaption; ExpectedDateCaptionLbl)
                    {
                    }
                    column(QuoteNoCaption; QuoteNoCaptionLbl)
                    {
                    }
                    column(PaytoVendNo_PurchHdrCaption; PayToVendNoLbl)
                    {
                    }
                    column(BuyfromVendNo_PurchHdrCaption; BuyFromVendnoLbl)
                    {
                    }
                    column(ReqRcptDateLbl; ReqRcptDateLbl) { }
                    column(ReqRcptDate_PurchHdr; "Purchase Header"."Requested Receipt Date") { }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Purchase Header";
                        DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(Number_DimensionLoop1; Number)
                        {
                        }
                        column(HeaderDimensionsCaption; HeaderDimensionsCaptionLbl)
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
                                OldDimText := copystr(DimText, 1, MaxStrLen(OldDimText));
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 - %2', DimensionSetEntry1."Dimension Code", DimensionSetEntry1."Dimension Value Code")
                                else
                                    DimText :=
                                      copystr(StrSubstNo(
                                        '%1; %2 - %3', DimText,
                                        DimensionSetEntry1."Dimension Code", DimensionSetEntry1."Dimension Value Code"), 1, MaxStrLen(DimText));
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
                    dataitem("Purchase Line"; "Purchase Line")
                    {
                        DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                        DataItemLinkReference = "Purchase Header";
                        DataItemTableView = sorting("Document Type", "Document No.", "Line No.");

                        trigger OnPreDataItem()
                        begin
                            CurrReport.Break();
                        end;
                    }
                    dataitem(RoundLoop; "Integer")
                    {
                        DataItemTableView = sorting(Number);
                        column(ShowInternalInfo; ShowInternalInfo)
                        {
                        }
                        column(ArchiveDocument; ArchiveDocument)
                        {
                        }
                        column(LogInteraction; LogInteraction)
                        {
                        }
                        column(Type_PurchaseLine; Format("Purchase Line".Type, 0, 2))
                        {
                            IncludeCaption = false;
                        }
                        column(LineNo_PurchaseLine; "Purchase Line"."Line No.")
                        {
                            IncludeCaption = false;
                        }
                        column(Description_PurchaseLine; "Purchase Line".Description)
                        {
                            IncludeCaption = false;
                        }
                        column(Quantity_PurchaseLine; "Purchase Line".Quantity)
                        {
                            IncludeCaption = false;
                        }
                        column(UnitOfMeasure_PurchaseLine; UoMText)
                        {
                            IncludeCaption = false;
                        }
                        column(ExpcRecpDt_PurchHdr; Format("Purchase Line"."Expected Receipt Date"))
                        {
                            IncludeCaption = false;
                        }
                        column(No_PurchaseLine; "Purchase Line"."No.")
                        {
                        }
                        column(VendItemNo_PurchLine; "Purchase Line"."Vendor Item No.")
                        {
                            IncludeCaption = false;
                        }
                        column(PurchaseLineNoOurNoCap; PurchaseLineNoOurNoCapLbl)
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                            column(DimText1; DimText)
                            {
                            }
                            column(Number2_DimensionLoop; Number)
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
                                    OldDimText := copystr(DimText, 1, MaxStrLen(OldDimText));
                                    if DimText = '' then
                                        DimText := StrSubstNo('%1 - %2', DimensionSetEntry2."Dimension Code", DimensionSetEntry2."Dimension Value Code")
                                    else
                                        DimText :=
                                          copystr(StrSubstNo(
                                            '%1; %2 - %3', DimText,
                                            DimensionSetEntry2."Dimension Code", DimensionSetEntry2."Dimension Value Code"), 1, MaxStrLen(DimText));
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
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then
                                TempPurchaseLine.Find('-')
                            else
                                TempPurchaseLine.Next();
                            "Purchase Line" := TempPurchaseLine;
                            if ("Purchase Line"."Item Reference No." <> '') and (not ShowInternalInfo) then
                                "Purchase Line"."No." := CopyStr("Purchase Line"."Item Reference No.", 1, 20);

                            DimensionSetEntry2.SetRange("Dimension Set ID", "Purchase Line"."Dimension Set ID");

                            Clear(UoMText);
                            UoMText := GeneralFunctionsTJP.GetUoMDescriptionInCurrentLanguage("Purchase Line"."Unit of Measure Code", LangSel);
                        end;

                        trigger OnPostDataItem()
                        begin
                            TempPurchaseLine.DeleteAll();
                        end;

                        trigger OnPreDataItem()
                        begin
                            MoreLines := TempPurchaseLine.Find('+');
                            while MoreLines and (TempPurchaseLine.Description = '') and (TempPurchaseLine."Description 2" = '') and
                                  (TempPurchaseLine."No." = '') and (TempPurchaseLine.Quantity = 0) and
                                  (TempPurchaseLine.Amount = 0)
                            do
                                MoreLines := TempPurchaseLine.Next(-1) <> 0;
                            if not MoreLines then
                                CurrReport.Break();
                            TempPurchaseLine.SetRange("Line No.", 0, TempPurchaseLine."Line No.");
                            SetRange(Number, 1, TempPurchaseLine.Count);
                        end;
                    }
                    dataitem(Total3; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));
                        column(SelltoCustNo_PurchHdr; "Purchase Header"."Sell-to Customer No.")
                        {
                        }
                        column(ShipToAddr1; ShipToAddr[1])
                        {
                        }
                        column(ShipToAddr2; ShipToAddr[2])
                        {
                        }
                        column(ShipToAddr3; ShipToAddr[3])
                        {
                        }
                        column(ShipToAddr4; ShipToAddr[4])
                        {
                        }
                        column(ShipToAddr5; ShipToAddr[5])
                        {
                        }
                        column(ShipToAddr6; ShipToAddr[6])
                        {
                        }
                        column(ShipToAddr7; ShipToAddr[7])
                        {
                        }
                        column(ShipToAddr8; ShipToAddr[8])
                        {
                        }
                        column(ShiptoAddressCaption; ShiptoAddressCaptionLbl)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if ("Purchase Header"."Sell-to Customer No." = '') and (ShipToAddr[1] = '') then
                                CurrReport.Break();
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    Clear(TempPurchaseLine);
                    Clear(PurchPost);
                    TempPurchaseLine.DeleteAll();
                    PurchPost.GetPurchLines("Purchase Header", TempPurchaseLine, 0);

                    if Number > 1 then begin
                        CopyText := FormatDocument.GetCOPYText();
                        OutputNo += 1;
                    end;
                end;

                trigger OnPostDataItem()
                begin
                    if not IsReportInPreviewMode() then
                        Codeunit.Run(Codeunit::"Purch.Header-Printed", "Purchase Header");
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
            var
                Vend: Record Vendor;
            begin
                if LangSel = '' then begin
                    Vend.Get("Buy-from Vendor No.");
                    Vend.Testfield("Language Code");
                    LangSel := Vend."Language Code";
                end;

                CurrReport.Language := Language2.GetLanguageID(LangSel);

                FormatAddressfields("Purchase Header");
                FormatDocumentfields("Purchase Header");

                DimensionSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");

                if not IsReportInPreviewMode() then
                    if ArchiveDocument then
                        ArchiveManagement.StorePurchDocument("Purchase Header", LogInteraction);
            end;

            trigger OnPostDataItem()
            begin
                OnAfterPostDataItem("Purchase Header");
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
                    field(RepNoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = Suite;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(RepShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if you want the printed report to show information that is only for internal use.';
                    }
                    field(RepArchiveDocument; ArchiveDocument)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Archive Document';
                        ToolTip = 'Specifies if the document is archived after you print it.';

                        trigger OnValidate()
                        begin
                            if not ArchiveDocument then
                                LogInteraction := false;
                        end;
                    }
                    field(RepLogInteraction; LogInteraction)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want the program to log this interaction.';

                        trigger OnValidate()
                        begin
                            if LogInteraction then
                                ArchiveDocument := ArchiveDocumentEnable;
                        end;
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

            case PurchasesPayablesSetup."Archive Quotes" of
                PurchasesPayablesSetup."Archive Quotes"::Never:
                    ArchiveDocument := false;
                PurchasesPayablesSetup."Archive Quotes"::Always:
                    ArchiveDocument := true;
            end;
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
        Clear(LangSel);
        CompanyInformation.SetAutoCalcfields(Picture);
        CompanyInformation.Get();
        PurchasesPayablesSetup.Get();

        OnAfterInitReport();
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not IsReportInPreviewMode() then
            if "Purchase Header".FindSet() then
                repeat
                    "Purchase Header".Calcfields("No. of Archived Versions");
                    SegManagement.LogDocument(
                      11, "Purchase Header"."No.", "Purchase Header"."Doc. No. Occurrence", "Purchase Header"."No. of Archived Versions",
                      DATABASE::Vendor, "Purchase Header"."Pay-to Vendor No.", "Purchase Header"."Purchaser Code", '',
                      "Purchase Header"."Posting Description", '');
                until "Purchase Header".Next() = 0;
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then
            InitLogInteraction();
    end;

    var
        ShipmentMethod: Record "Shipment Method";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        CompanyInformation: Record "Company Information";
        TempPurchaseLine: Record "Purchase Line" temporary;
        DimensionSetEntry1: Record "Dimension Set Entry";
        DimensionSetEntry2: Record "Dimension Set Entry";
        ResponsibilityCenter: Record "Responsibility Center";
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
        GeneralFunctionsTJP: Codeunit "General Functions TJP";
        Language2: Codeunit Language;
        PurchPost: Codeunit "Purch.-Post";
        FormatAddress: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        ArchiveManagement: Codeunit ArchiveManagement;
        VendAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        PurchaserNameText: Text[50];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        CopyText: Text[30];
        DimText: Text[120];
        OldDimText: Text[75];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        ArchiveDocument: Boolean;
        LogInteraction: Boolean;
        OutputNo: Integer;
        //[InDataSet]  //2023.12.01 DHA
        ArchiveDocumentEnable: Boolean;
        //[InDataSet]  //2023.12.01 DHA
        LogInteractionEnable: Boolean;
        LangSel: Code[10];
        CompanyBankNameTxt: Text;
        CompanyBankAccTypeTxt: Text;
        CompanyBankAccNoTxt: Text;
        CompanyBankAccHolderTxt: Text;
        UoMText: Text;
        DocumentCaptionLbl: Label 'Purchase - Quote';
        PayToVendNoLbl: Label 'Pay-to Vendor No.';
        BuyFromVendnoLbl: Label 'Buy-from Vendor No.';
        ExpectedDateCaptionLbl: Label 'Exp. Rcpt. Date';
        ReqRcptDateLbl: Label 'Req. Receipt Date';
        QuoteNoCaptionLbl: Label 'Quote No.';
        YourRefLbl: Label 'Your Reference';
        PurchaserCodeLbl: Label 'Purchaser Code';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        PurchaseLineNoOurNoCapLbl: Label 'Our No.';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        ShiptoAddressCaptionLbl: Label 'Ship-to Address';
        CompanyInfoPhoneNoCapLbl: Label 'Phone No.';
        CompanyInfoVATRegNoCapLbl: Label 'VAT Registration No.';
        CompanyInfoGiroNoCapLbl: Label 'Giro No.';
        CompanyInfoBankNameCapLbl: Label 'Bank';
        CompInfoBankAccNoCapLbl: Label 'Account No.';
        BankAccHolderNameLbl: Label 'Bank Account Holder';
        BankAccTypeLbl: Label 'Account Type';
        DocumentDateCapLbl: Label 'Document Date';
        PageNoCaptionLbl: Label 'Page';
        ShipmentMethodDescCapLbl: Label 'Shipment Method';
        PurchLineVendItemNoCapLbl: Label 'Vend. Item No.';
        PurchaseLineDescCapLbl: Label 'Item Name';
        PurchaseLineQuantityCapLbl: Label 'Quantity';
        PurchaseLineUOMCaptionLbl: Label 'UoM';
        PurchaseLineNoCaptionLbl: Label 'Item No.';
        PurchaserTextCaptionLbl: Label 'Purchaser';
        ReferenceTextCaptionLbl: Label 'Your Reference';
        HomePageCaptionLbl: Label 'Home Page';
        EMailCaptionLbl: Label 'Email';
        VatRegistrationNoCaptionLbl: Label 'VAT Registration No.';
    //Text002Txt: Label 'Purchase - Quote %1', Comment = '%1 = Document No.';

    procedure IntializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewArchiveDocument: Boolean; NewLogInteraction: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        ArchiveDocument := NewArchiveDocument;
        LogInteraction := NewLogInteraction;
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody());
    end;

    local procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractionTemplateCode(Enum::"Interaction Log Entry Document Type"::"Purch.Qte.") <> '';   //20231101 DHA
    end;

    local procedure FormatAddressfields(PurchaseHeader: Record "Purchase Header")
    begin
        GeneralFunctionsTJP.GetCompanyAdd(PurchaseHeader."Responsibility Center", ResponsibilityCenter, CompanyInformation, CompanyAddr, LangSel);
        FormatAddress.PurchHeaderPayTo(VendAddr, PurchaseHeader);
        FormatAddress.PurchHeaderShipTo(ShipToAddr, PurchaseHeader);
    end;

    local procedure FormatDocumentfields(PurchaseHeader: Record "Purchase Header")
    begin
        GeneralFunctionsTJP.GetSalesPurchaserNameTJP(SalespersonPurchaser, PurchaseHeader."Purchaser Code", PurchaserNameText, LangSel);
        FormatDocument.SetShipmentMethod(ShipmentMethod, PurchaseHeader."Shipment Method Code", LangSel);
        ReferenceText := FormatDocument.SetText(PurchaseHeader."Your Reference" <> '', copystr(PurchaseHeader.fieldCaption("Your Reference"), 1, MaxStrLen(ReferenceText)));
        VATNoText := FormatDocument.SetText(PurchaseHeader."VAT Registration No." <> '', copystr(PurchaseHeader.fieldCaption("VAT Registration No."), 1, MaxStrLen(VATNoText)));
        GeneralFunctionsTJP.TranslateCompBankAccfields(CompanyInformation, CompanyBankAccHolderTxt, CompanyBankNameTxt, CompanyBankAccNoTxt, CompanyBankAccTypeTxt, LangSel);
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterInitReport()
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterPostDataItem(var PurchaseHeader: Record "Purchase Header")
    begin
    end;
}

