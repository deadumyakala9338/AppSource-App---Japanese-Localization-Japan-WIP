#if AppSource
report 70658599 "Service Quote TJP"
#endif
#if OnPremise
report 99024 "Service Quote TJP"
#endif
{
    DefaultLayout = RDLC;
    RDLCLayout = 'TecturaJP/JapanLocalization/ServiceQuoteJP.rdlc';
    ApplicationArea = All;
    UsageCategory = None;
    Caption = 'Service Quote';

    dataset
    {
        dataitem("Service Header"; "Service Header")
        {
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const(Quote));
            RequestFilterFields = "No.", "Customer No.";
            column(DocumentType_ServHeader; "Document Type")
            {
            }
            column(No_ServHeader; "No.")
            {
            }
            column(HomePageCaption; HomePageCaptionLbl)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = sorting(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    column(CompanyInfo1Picture; CompanyInformation1.Picture)
                    {
                    }
                    column(CompanyInfo2Picture; CompanyInformation2.Picture)
                    {
                    }
                    column(CompanyInfo3Picture; CompanyInformation3.Picture)
                    {
                    }
                    column(CompanyPicture; CompanyInformation.Picture) { }
                    column(HomePage; CompanyInformation."Home Page")
                    {
                    }
                    column(Email; SalespersonPurchaser."E-Mail")
                    {
                    }
                    column(OrderTime_ServHeader; "Service Header"."Order Time")
                    {
                    }
                    column(OrderDate_ServHeader; Format("Service Header"."Order Date"))
                    {
                    }
                    column(Status_ServHeader; "Service Header".Status)
                    {
                    }
                    column(No1_ServHeader; "Service Header"."No.")
                    {
                    }
                    column(CustAddr6; CustAddr[6])
                    {
                    }
                    column(CustAddr5; CustAddr[5])
                    {
                    }
                    column(CustAddr4; CustAddr[4])
                    {
                    }
                    column(CustAddr3; CustAddr[3])
                    {
                    }
                    column(CustAddr2; CustAddr[2])
                    {
                    }
                    column(CustAddr1; CustAddr[1])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(OrderConfirmationCopyText; StrSubstNo(Text001Lbl, CopyText))
                    {
                    }
                    column(CompanyInfoPhNo; 'TEL: ' + CompanyInformation."Phone No.")
                    {
                    }
                    column(SalespersonPhoneNo; SalespersonPurchaser."Phone No.")
                    {
                    }
                    column(EMail_ServHeader; "Service Header"."E-Mail")
                    {
                    }
                    column(PhoneNo_ServHeader; "Service Header"."Phone No.")
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PageCaption; StrSubstNo(Text002Lbl, ''))
                    {
                    }
                    column(SerHdrOrderDateCaption; SerHdrOrderDateCaptionLbl)
                    {
                    }
                    column(InvoicetoCaption; InvoicetoCaptionLbl)
                    {
                    }
                    column(SellToPhoneNoLbl; SellToPhoneNoLbl) { }
                    column(SellToEmailLbl; SellToEmailLbl) { }
                    column(SPPhoneNoLbl; SPPhoneNoLbl) { }
                    column(SPEmailLbl; SPEmailLbl) { }
                    column(BilltoName_ServHeader; "Service Header"."Bill-to Name")
                    {
                    }
                    column(OrderTime_ServHeaderCaption; "Service Header".fieldCaption("Order Time"))
                    {
                    }
                    column(Status_ServHeaderCaption; "Service Header".fieldCaption(Status))
                    {
                    }
                    column(No1_ServHeaderCaption; "Service Header".fieldCaption("No."))
                    {
                    }
                    column(CompVATRegNoLbl; CompVATRegNoLbl) { }
                    column(CompanyInfoVATRegNo; CompVATRegNoLbl + ' : ' + CompanyInformation."VAT Registration No.") { }
                    column(SalesPurchPersonName; SalesPersonNameText) { }
                    column(SalesPersonText; SalespersonLbl) { }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(DimensionLoopNumber; Number)
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
                                OldDimText := DimText;
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
                    dataitem("Service Order Comment"; "Service Comment Line")
                    {
                        DataItemLink = "Table Subtype" = field("Document Type"), "No." = field("No.");
                        DataItemLinkReference = "Service Header";
                        DataItemTableView = sorting("Table Name", "Table Subtype", "No.", Type, "Table Line No.", "Line No.") where("Table Name" = const("Service Header"), Type = const(General));
                        column(LineNo_ServOrderComment; "Line No.")
                        {
                        }
                        column(TblSubtype_ServOrderComm; "Table Subtype")
                        {
                        }
                        column(Type_ServOrderComment; Type)
                        {
                        }
                    }
                    dataitem("Service Item Line"; "Service Item Line")
                    {
                        DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                        DataItemLinkReference = "Service Header";
                        DataItemTableView = sorting("Document Type", "Document No.", "Line No.");
                        column(ShowInternalInfo; ShowInternalInfo)
                        {
                        }
                        column(SerialNo_ServLineType; "Serial No.")
                        {
                        }
                        column(Description_ServLineType; Description)
                        {
                        }
                        column(ServItemNo_ServLineType; "Service Item No.")
                        {
                        }
                        column(SerItmGrCode_ServLineType; "Service Item Group Code")
                        {
                        }
                        column(Warranty_ServLineType; Warranty)
                        {
                        }
                        column(ItemNo_ServLineType; "Item No.")
                        {
                        }
                        column(LoanerNo_ServLineType; "Loaner No.")
                        {
                        }
                        column(ServShelfNo_ServLineType; "Service Shelf No.")
                        {
                        }
                        column(Warranty1_ServLineType; Format(Warranty))
                        {
                        }
                        column(DocNo_ServLineType; "Document No.")
                        {
                        }
                        column(LineNo_ServLineType; "Line No.")
                        {
                        }
                        column(ServiceItemLinesCaption; ServiceItemLinesCaptionLbl)
                        {
                        }
                        column(ServiceTextLbl; ServiceTextLbl)
                        {
                        }
                        column(ServItemText1Lbl; ServItemTextLbl)
                        {
                        }
                        column(SerialNo_ServLineTypeCaption; ServSerielNoLbl)
                        {
                        }
                        column(Description_ServLineTypeCaption; ServItemNameLbl)
                        {
                        }
                        column(ServItemNo_ServLineTypeCaption; ServItemLineNoLbl)
                        {
                        }
                        column(SerItmGrCode_ServLineTypeCaption; ServItemLineGrpCodeLbl)
                        {
                        }
                        column(Warranty_ServLineTypeCaption; fieldCaption(Warranty))
                        {
                        }
                        column(ItemNo_ServLineTypeCaption; fieldCaption("Item No."))
                        {
                        }
                        column(LoanerNo_ServLineTypeCaption; fieldCaption("Loaner No."))
                        {
                        }
                        column(ServShelfNo_ServLineTypeCaption; ServItemShelfNoLbl)
                        {
                        }
                        dataitem("Fault Comment"; "Service Comment Line")
                        {
                            DataItemLink = "Table Subtype" = field("Document Type"), "No." = field("Document No."), "Table Line No." = field("Line No.");
                            DataItemTableView = sorting("Table Name", "Table Subtype", "No.", Type, "Table Line No.", "Line No.") where("Table Name" = const("Service Header"), Type = const(Fault));
                            column(Comment_FaultComment; Comment)
                            {
                            }
                            column(Number_FaultComment; Number1)
                            {
                            }
                            column(TableSubtype_FaultComment; "Table Subtype")
                            {
                            }
                            column(Type_FaultComment; Type)
                            {
                            }
                            column(LineNo_FaultComment; "Line No.")
                            {
                            }
                            column(FaultCommentsCaption; FaultCommentsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                Number2 := 0;
                                Number1 := Number1 + 1;
                            end;
                        }
                        dataitem("Resolution Comment"; "Service Comment Line")
                        {
                            DataItemLink = "Table Subtype" = field("Document Type"), "No." = field("Document No."), "Table Line No." = field("Line No.");
                            DataItemTableView = sorting("Table Name", "Table Subtype", "No.", Type, "Table Line No.", "Line No.") where("Table Name" = const("Service Header"), Type = const(Resolution));
                            column(Comment_ResolutionComment; Comment)
                            {
                            }
                            column(Number_ResolutionComment; Number2)
                            {
                            }
                            column(TblSubtype_ResolComment; "Table Subtype")
                            {
                            }
                            column(Type_ResolutionComment; Type)
                            {
                            }
                            column(LineNo_ResolutionComment; "Line No.")
                            {
                            }
                            column(ResolutionCommentsCaption; ResolutionCommentsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                Number1 := 0;
                                Number2 := Number2 + 1;
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            Number1 := 0;
                            Number2 := 0;
                        end;
                    }
                    dataitem("Service Line"; "Service Line")
                    {
                        DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                        DataItemLinkReference = "Service Header";
                        DataItemTableView = sorting("Document Type", "Document No.", "Line No.");
                        column(SerItemSlNo_ServLine; "Service Item Serial No.")
                        {
                        }
                        column(Type_ServLine; Type)
                        {
                        }
                        column(No_ServLine; "No.")
                        {
                        }
                        column(Description_ServLine; Description)
                        {
                        }
                        column(UnitPrice_ServLine; "Unit Price")
                        {
                        }
                        column(LineDiscount_ServLine; "Line Discount %")
                        {
                        }
                        column(Amt; Amt)
                        {
                        }
                        column(VariantCode_ServLine; "Variant Code")
                        {
                        }
                        column(GrossAmt; GrossAmt)
                        {
                        }
                        column(Quantity_ServLine; Quantity)
                        {
                        }
                        column(TotAmt; TotAmt)
                        {
                        }
                        column(TotGrossAmt; TotGrossAmt)
                        {
                        }
                        column(DocumentNo_ServLine; "Document No.")
                        {
                        }
                        column(LineNo_ServLine; "Line No.")
                        {
                        }
                        column(ServiceLineCaption; ServiceLineCaptionLbl)
                        {
                        }
                        column(AmtCaption; AmtCaptionLbl)
                        {
                        }
                        column(GrossAmountCaption; GrossAmountCaptionLbl)
                        {
                        }
                        column(InclVATLbl; InclVATLbl)
                        {
                        }
                        column(ServItemTextLbl; ServItemTextLbl)
                        {
                        }
                        column(SerItemSlNo_ServLineCaption; ServItemSlNoLbl)
                        {
                        }
                        column(TotalCaption; TotalCaptionLbl)
                        {
                        }
                        column(Type_ServLineCaption; fieldCaption(Type))
                        {
                        }
                        column(No_ServLineCaption; fieldCaption("No."))
                        {
                        }
                        column(Description_ServLineCaption; ServLineItemNameLbl)
                        {
                        }
                        column(UnitPrice_ServLineCaption; UnitPriceExclVATLbl)
                        {
                        }
                        column(UnitPriceExclVAT2Lbl; UnitPriceExclVAT2Lbl)
                        {
                        }
                        column(LineDiscount_ServLineCaption; LineDiscPerLbl)
                        {
                        }
                        column(LineDiscPer2Lbl; LineDiscPer2Lbl)
                        {
                        }
                        column(VariantCode_ServLineCaption; fieldCaption("Variant Code"))
                        {
                        }
                        column(Quantity_ServLineCaption; fieldCaption(Quantity))
                        {
                        }
                        dataitem(DimesionLoop2; "Integer")
                        {
                            DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                            column(DimText1; DimText)
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
                                    OldDimText := DimText;
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

                                DimensionSetEntry2.SetRange("Dimension Set ID", "Service Line"."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            Amt := "Line Amount";
                            GrossAmt := "Amount Including VAT";

                            TotAmt := TotAmt + Amt;
                            TotGrossAmt := TotGrossAmt + GrossAmt;
                        end;
                    }
                    dataitem(Shipto; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));
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
                        column(ShipToAddressCaption; ShipToAddressCaptionLbl)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if not ShowShippingAddr then
                                CurrReport.Break();
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    TotAmt := 0;
                    TotGrossAmt := 0;

                    if Number > 1 then
                        CopyText := FormatDocument.GetCOPYText();
                    OutputNo += 1;
                end;

                trigger OnPostDataItem()
                begin
                    if not IsReportInPreviewMode() then
                        Codeunit.Run(Codeunit::"Service-Printed", "Service Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := Abs(NoOfCopies) + 1;
                    if NoOfLoops <= 0 then
                        NoOfLoops := 1;
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

                FormatAddressfields("Service Header");

                DimensionSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");
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
                        ApplicationArea = Service;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(pShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = Service;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if you want the printed report to show information that is only for internal use.';
                    }
                    field(pLogInteraction; LogInteraction)
                    {
                        ApplicationArea = Service;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want to record the service quotes that you want to print as interactions and add them to the Interaction Log Entry table.';
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
            LogInteraction := SegManagement.FindInteractionTemplateCode(Enum::"Interaction Log Entry Document Type"::"Service Quote") <> '';  //20231101 DHA
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInformation.SetAutoCalcfields(Picture);
        CompanyInformation.Get();
        ServiceMgtSetup.Get();
        FormatDocument.SetLogoPosition(ServiceMgtSetup."Logo Position on Documents", CompanyInformation1, CompanyInformation2, CompanyInformation3);
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not IsReportInPreviewMode() then
            if "Service Header".FindSet() then
                repeat
                    if "Service Header"."Contact No." <> '' then
                        SegManagement.LogDocument(25, "Service Header"."No.", 0, 0, DATABASE::Contact, "Service Header"."Contact No.",
                          "Service Header"."Salesperson Code", '', '', '')
                    else
                        SegManagement.LogDocument(25, "Service Header"."No.", 0, 0, DATABASE::Customer, "Service Header"."Customer No.",
                          "Service Header"."Salesperson Code", '', '', '');
                until "Service Header".Next() = 0;
    end;

    var
        CompanyInformation: Record "Company Information";
        CompanyInformation1: Record "Company Information";
        CompanyInformation2: Record "Company Information";
        CompanyInformation3: Record "Company Information";
        ServiceMgtSetup: Record "Service Mgt. Setup";
        ResponsibilityCenter: Record "Responsibility Center";
        DimensionSetEntry1: Record "Dimension Set Entry";
        DimensionSetEntry2: Record "Dimension Set Entry";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        Customer: Record Customer;
        Language2: Codeunit Language;
        GeneralFunctionsTJP: Codeunit "General Functions TJP";
        FormatAddress: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        Number1: Integer;
        Number2: Integer;
        ShowInternalInfo: Boolean;
        ShowShippingAddr: Boolean;
        Continue: Boolean;
        CopyText: Text[30];
        CompanyAddr: array[8] of Text[100];
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        DimText: Text[120];
        OldDimText: Text[120];
        Amt: Decimal;
        TotAmt: Decimal;
        LogInteraction: Boolean;
        GrossAmt: Decimal;
        TotGrossAmt: Decimal;
        OutputNo: Integer;
        //[InDataSet]   //2023.12.01 DHA
        LogInteractionEnable: Boolean;
        LangSel: Code[10];
        SalesPersonNameText: Text[50];
        SerHdrOrderDateCaptionLbl: Label 'Order Date';
        InvoicetoCaptionLbl: Label 'Invoice to';
        SellToPhoneNoLbl: Label 'Sell-to Phone No.';
        SellToEmailLbl: Label 'Sell-to Email';
        SPPhoneNoLbl: Label 'Salesperson Phone No.';
        SPEmailLbl: Label 'Salesperson Email';
        HomePageCaptionLbl: Label 'Home Page';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        ServiceItemLinesCaptionLbl: Label 'Service Item Lines';
        ServiceTextLbl: Label 'Service';
        ServItemTextLbl: Label 'Service Item';
        ServItemLineNoLbl: Label 'Item No.';
        ServItemLineGrpCodeLbl: Label 'Group Code';
        ServSerielNoLbl: Label 'Serial No.';
        ServItemNameLbl: Label 'Service Item Name';
        ServItemShelfNoLbl: Label 'Shelf No.';
        ServItemSlNoLbl: Label 'Serial No.';
        ServLineItemNameLbl: Label 'Item Name';
        UnitPriceExclVATLbl: Label 'Unit Price';
        UnitPriceExclVAT2Lbl: Label 'Excl. VAT';
        LineDiscPerLbl: Label 'Line';
        LineDiscPer2Lbl: Label 'Disc. %';
        FaultCommentsCaptionLbl: Label 'Fault Comments';
        ResolutionCommentsCaptionLbl: Label 'Resolution Comments';
        CompVATRegNoLbl: Label 'VAT Registration No.';
        ServiceLineCaptionLbl: Label 'Service Line';
        SalespersonLbl: Label 'Sales Person';
        AmtCaptionLbl: Label 'Amount';
        GrossAmountCaptionLbl: Label 'Gross Amt.';
        InclVATLbl: Label 'Incl. VAT';
        TotalCaptionLbl: Label 'Total';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        ShipToAddressCaptionLbl: Label 'Ship-to Address';
        Text001Lbl: Label 'Service Quote%1', Comment = '%1=Service Quote No.';
        Text002Lbl: Label 'Page %1', Comment = '%1=Page No.';

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody());
    end;

    local procedure FormatAddressfields(var ServiceHeader: Record "Service Header")
    begin
        GeneralFunctionsTJP.GetCompanyAdd(ServiceHeader."Responsibility Center", ResponsibilityCenter, CompanyInformation, CompanyAddr, LangSel);
        GeneralFunctionsTJP.GetSalesPurchaserNameTJP(SalespersonPurchaser, ServiceHeader."Salesperson Code", SalesPersonNameText, LangSel);
        FormatAddress.ServiceOrderSellto(CustAddr, ServiceHeader);
        ShowShippingAddr := ServiceHeader."Ship-to Code" <> '';
        if ShowShippingAddr then
            FormatAddress.ServiceOrderShipto(ShipToAddr, ServiceHeader);
    end;
}

