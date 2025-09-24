#if AppSource
report 70658598 "Sales - Shipment TJP"
#endif
#if OnPremise
report 99023 "Sales - Shipment TJP"
#endif
{
    RDLCLayout = 'TecturaJP/JapanLocalization/SalesShipmentJP.rdlc';
    Caption = 'Sales - Shipment';
    DefaultLayout = RDLC;
    EnableHyperlinks = true;
    PreviewMode = PrintLayout;
    WordMergeDataItem = Header;
    UsageCategory = None;

    dataset
    {
        dataitem(Header; "Sales Shipment Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Sales Shipment';
            column(CompanyPhoneNo_Lbl; PhoneNoLbl)
            {
            }
            column(CompanyGiroNo; CompanyInformation."Giro No.")
            {
            }
            column(CompanyGiroNo_Lbl; CompanyInfoGiroNoLbl)
            {
            }
            column(CompanyBankName; CompanyBankAccount.Name)
            {
            }
            column(CompanyBankName_Lbl; CompanyInfoBankNameLbl)
            {
            }
            column(CompanyBankBranchNo; CompanyBankAccount."Bank Branch No.")
            {
            }
            column(CompanyBankBranchNo_Lbl; CompanyBankAccount.FieldCaption("Bank Branch No."))
            {
            }
            column(CompanyBankAccountNo; CompanyBankAccount."Bank Account No.")
            {
            }
            column(CompanyBankAccountNo_Lbl; CompanyInfoBankAccNoLbl)
            {
            }
            column(CompanyIBAN; CompanyBankAccount.IBAN)
            {
            }
            column(CompanyIBAN_Lbl; CompanyBankAccount.FieldCaption(IBAN))
            {
            }
            column(CompanySWIFT; CompanyBankAccount."SWIFT Code")
            {
            }
            column(CompanySWIFT_Lbl; CompanyBankAccount.FieldCaption("SWIFT Code"))
            {
            }
            column(CompanyLogoPosition; CompanyLogoPosition)
            {
            }
            column(CompanyRegistrationNumber; CompanyInformation.GetRegistrationNumber())
            {
            }
            column(CompanyRegistrationNumber_Lbl; CompanyInformation.GetRegistrationNumberLbl())
            {
            }
            column(CompanyVATRegNo_Lbl; CompanyInformation.GetVATRegistrationNumberLbl())
            {
            }
            column(CompanyVATRegistrationNo; CompanyInformation.GetVATRegistrationNumber())
            {
            }
            column(CompanyVATRegistrationNo_Lbl; CompanyInformation.GetVATRegistrationNumberLbl())
            {
            }
            /*   //2023.12.04 DHA
            column(CompanyLegalOffice; CompanyInformation.GetLegalOffice())
            {
            }
            column(CompanyLegalOffice_Lbl; CompanyInformation.GetLegalOfficeLbl())
            {
            }
            column(CompanyCustomGiro; CompanyInformation.GetCustomGiro())
            {
            }
            column(CompanyCustomGiro_Lbl; CompanyInformation.GetCustomGiroLbl())
            {
            }
            */   //2023.12.04 DHA
            column(CompanyLegalStatement; GetLegalStatement())
            {
            }
            column(BilltoAddressCaption; BilltoAddressCaptionLbl)
            {
            }
            column(CustomerPostalBarCode; FormatAddress.PostalBarCode(1))
            {
            }
            column(YourReference; "Your Reference")
            {
            }
            column(YourReference_Lbl; FieldCaption("Your Reference"))
            {
            }
            column(ShipmentMethodDescription_Lbl; ShptMethodDescLbl)
            {
            }
            column(ShipmentDate_Lbl; FieldCaption("Shipment Date"))
            {
            }
            column(Shipment_Lbl; ShipmentLbl)
            {
            }
            column(ShowCustAddress; ShowCustAddr)
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
            column(BilltoCustumerNo; "Bill-to Customer No.")
            {
            }
            column(BilltoCustomerNo_Lbl; FieldCaption("Bill-to Customer No."))
            {
            }
            column(DocumentDate_Lbl; FieldCaption("Document Date"))
            {
            }
            column(DueDate; Format("Due Date", 0, 4))
            {
            }
            column(DueDate_Lbl; FieldCaption("Due Date"))
            {
            }
            column(DocumentNo_Lbl; ShipmentNoLbl)
            {
            }
            column(OrderNo_Lbl; FieldCaption("Order No."))
            {
            }
            column(PricesIncludingVAT; "Prices Including VAT")
            {
            }
            column(PricesIncludingVAT_Lbl; FieldCaption("Prices Including VAT"))
            {
            }
            column(PricesIncludingVATYesNo; Format("Prices Including VAT"))
            {
            }
            column(SalesPerson_Lbl; SalespersonLbl)
            {
            }
            column(SalesPersonBlank_Lbl; SalesPersonText)
            {
            }
            column(SelltoCustomerNo_Lbl; FieldCaption("Sell-to Customer No."))
            {
            }
            column(VATRegistrationNo; GetCustomerVATRegistrationNumber())
            {
            }
            column(VATRegistrationNo_Lbl; GetCustomerVATRegistrationNumberLbl())
            {
            }
            column(GlobalLocationNumber; GetCustomerGlobalLocationNumber())
            {
            }
            column(GlobalLocationNumber_Lbl; GetCustomerGlobalLocationNumberLbl())
            {
            }
            column(SellToPhoneNo; "Sell-to Phone No.")
            {
            }
            column(From_Lbl; FromLbl)
            {
            }
            column(BilledTo_Lbl; BilledToLbl)
            {
            }
            column(LegalEntityType; Customer.GetLegalEntityType())
            {
            }
            column(LegalEntityType_Lbl; Customer.GetLegalEntityTypeLbl())
            {
            }
            column(Copy_Lbl; CopyLbl)
            {
            }
            column(EMail_Header_Lbl; EMailLbl)
            {
            }
            column(HomePage_Header_Lbl; HomePageLbl)
            {
            }
            column(Page_Lbl; PageLbl)
            {
            }
            column(Questions_Lbl; QuestionsLbl)
            {
            }
            column(Contact_Lbl; CompanyInformation.GetContactUsText())
            {
            }
            column(DocumentTitle_Lbl; DocumentCaption())
            {
            }
            column(YourDocumentTitle_Lbl; YourSalesShipmentLbl)
            {
            }
            column(Thanks_Lbl; ThanksLbl)
            {
            }
            column(ShowWorkDescription; ShowWorkDescription)
            {
            }
            column(Subtotal_Lbl; SubtotalLbl)
            {
            }
            column(Total_Lbl; TotalLbl)
            {
            }
            column(PackageTrackingNo; "Package Tracking No.")
            {
            }
            column(PackageTrackingNo_Lbl; FieldCaption("Package Tracking No."))
            {
            }
            column(ShippingAgentCode; "Shipping Agent Code")
            {
            }
            column(ShippingAgentCode_Lbl; FieldCaption("Shipping Agent Code"))
            {
            }
            column(ExternalDocumentNo_Lbl; FieldCaption("External Document No."))
            {
            }
            column(CompanyAddress1; CompanyAddr[1]) { }
            column(CompanyAddress2; CompanyAddr[2]) { }
            column(CompanyAddress3; CompanyAddr[3]) { }
            column(CompanyAddress4; CompanyAddr[4]) { }
            column(CompanyAddress5; CompanyAddr[5]) { }
            column(CompanyAddress6; CompanyAddr[6]) { }
            column(CompanyAddress7; CompanyAddr[7]) { }
            column(CompanyAddress8; CompanyAddr[8]) { }
            column(CustomerAddress1; CustAddr[1]) { }
            column(CustomerAddress2; CustAddr[2]) { }
            column(CustomerAddress3; CustAddr[3]) { }
            column(CustomerAddress4; CustAddr[4]) { }
            column(CustomerAddress5; CustAddr[5]) { }
            column(CustomerAddress6; CustAddr[6]) { }
            column(CustomerAddress7; CustAddr[7]) { }
            column(CustomerAddress8; CustAddr[8]) { }
            column(ShipToAddress1; ShipToAddr[1]) { }
            column(ShipToAddress2; ShipToAddr[2]) { }
            column(ShipToAddress3; ShipToAddr[3]) { }
            column(ShipToAddress4; ShipToAddr[4]) { }
            column(ShipToAddress5; ShipToAddr[5]) { }
            column(ShipToAddress6; ShipToAddr[6]) { }
            column(ShipToAddress7; ShipToAddr[7]) { }
            column(ShipToAddress8; ShipToAddr[8]) { }
            column(CompanyVATRegNo; CompVATRegNoLbl + ' : ' + CompanyInformation.GetVATRegistrationNumber()) { }
            column(CompanyPicture; CompanyInformation2.Picture) { }
            column(SellToCustNoLbl; SellToCustNoLbl) { }
            column(ShipmentNoLbl; ShipmentNoLbl) { }
            column(DocDateLbl; DocDateLbl) { }
            column(PostedShipmentDateLbl; PostedShipmentDateLbl) { }
            column(PurchaseOrderNoLbl; PurchaseOrderNoLbl) { }
            column(OurDocumentNoLbl; OurDocumentNoLbl) { }
            column(ShptMethodDescLbl; ShptMethodDescLbl) { }
            column(SalespersonLbl; SalespersonLbl) { }
            column(PhoneNoLbl; PhoneNoLbl) { }
            column(EMailLbl; EMailLbl) { }
            column(HomePageLbl; HomePageLbl) { }
            column(ShipToAddress_Lbl; ShiptoAddrLbl) { }
            column(SelltoCustomerNo; "Sell-to Customer No.") { }
            column(DocumentNo; "No.") { }
            column(DocumentDate; Format("Document Date")) { }
            column(ShipmentDate; Format("Shipment Date")) { }
            column(ExternalDocumentNo; "External Document No.") { }
            column(OrderNo; "Order No.") { }
            column(ShipmentMethodDescription; ShipmentMethod.Description) { }
            column(SalesPersonName; SalespersonPurchaser.Name) { }
            column(CompanyPhoneNo; CompanyInformation."Phone No.") { }
            column(CompanyEMail; CompanyInformation."E-Mail") { }
            column(CompanyHomePage; CompanyInformation."Home Page") { }
            column(CompanyBankAccHolderTxt; CompanyBankAccHolderTxt) { }
            column(CompanyBankNameTxt; CompanyBankNameTxt) { }
            column(BankAccTypeLbl; BankAccTypeLbl) { }
            column(CompanyBankAccTypeTxt; CompanyBankAccTypeTxt) { }
            column(WorkDescriptionCaption; WorkDescriptionLbl) { }
            column(QuantityCaption; QuantityCaptionLbl) { }
            column(SerialNoCaption; SerialNoCaptionLbl) { }
            column(LotNoCaption; LotNoCaptionLbl) { }
            column(DescriptionCaption; DescriptionCaptionLbl) { }
            column(NoCaption; NoCaptionLbl) { }
            column(ShowLotSN; ShowLotSN) { }
            dataitem(Line; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = Header;
                DataItemTableView = sorting("Document No.", "Line No.");
                column(LineNo_Line; "Line No.")
                {
                }
                column(Description_Line; Description)
                {
                }
                column(Description_Line_Lbl; ItemDescLbl)
                {
                }
                column(ItemNo_Line; "No.")
                {
                }
                column(ItemNo_Line_Lbl; ItemNoLbl)
                {
                }
                column(ItemReferenceNo_Line; "Item Reference No.")
                {
                }
                column(ItemReferenceNo_Line_Lbl; FieldCaption("Item Reference No."))
                {
                }
                column(ShipmentDate_Line; Format("Shipment Date"))
                {
                }
                column(ShipmentDate_Line_Lbl; PostedShipmentDateLbl)
                {
                }
                column(Quantity_Line; FormattedQuantity)
                {
                }
                column(Quantity_Line_Lbl; ItemQtyLbl)
                {
                }
                column(Type_Line; Format(Type))
                {
                }
                column(UnitOfMeasure; UoMText)
                {
                }
                column(UnitOfMeasure_Lbl; ItemUoMLbl)
                {
                }
                column(JobTaskNo_Lbl; JobTaskNoLabel)
                {
                }
                column(JobTaskNo; JobTaskNo)
                {
                }
                column(JobTaskDescription; JobTaskDescription)
                {
                }
                column(JobTaskDesc_Lbl; JobTaskDescLbl)
                {
                }
                column(JobNo_Lbl; JobNoLabel)
                {
                }
                column(JobNo; JobNo)
                {
                }
                column(Unit_Lbl; UnitLbl)
                {
                }
                column(Qty_Lbl; QtyLbl)
                {
                }
                column(Unit_Gross_Weight_Lbl; GrossWeightLbl)
                {
                }
                column(Unit_Gross_Weight; "Gross Weight")
                {
                }
                column(Unit_Net_Weight_Lbl; NetWeightLbl)
                {
                }
                column(Unit_Net_Weight; "Net Weight")
                {
                }
                column(Unit_Volume_Lbl; UnitVolumeLbl)
                {
                }
                column(Unit_Volume; "Unit Volume")
                {
                }
                column(Units_per_Parcel_Lbl; UnitsperParcelLbl)
                {
                }
                column(Units_per_Parcel; "Units per Parcel")
                {
                }
                dataitem(AssemblyLine; "Posted Assembly Line")
                {
                    DataItemTableView = sorting("Document No.", "Line No.");
                    UseTemporary = true;
                    column(LineNo_AssemblyLine; "No.")
                    {
                    }
                    column(Description_AssemblyLine; Description)
                    {
                    }
                    column(Quantity_AssemblyLine; Quantity)
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(UnitOfMeasure_AssemblyLine; GetUOMText("Unit of Measure Code"))
                    {
                    }
                    column(VariantCode_AssemblyLine; "Variant Code")
                    {
                    }

                    trigger OnPreDataItem()
                    var
                        ValueEntry: Record "Value Entry";
                    begin
                        Clear(AssemblyLine);
                        if not DisplayAssemblyInformation then
                            CurrReport.Break();
                        GetAssemblyLinesForDocument(
                          AssemblyLine, ValueEntry."Document Type"::"Sales Shipment", Line."Document No.", Line."Line No.");
                    end;
                }

                trigger OnAfterGetRecord()
                var
                    EnvironmentInfo: Codeunit "Environment Information";
                begin
                    if not ShowCorrectionLines and Correction then
                        CurrReport.Skip();

                    if Type = Type::"G/L Account" then
                        "No." := '';

                    OnBeforeLineOnAfterGetRecord(Header, Line);

                    Clear(UoMText);
                    UoMText := GeneralFunctionsTJP.GetUoMDescriptionInCurrentLanguage("Unit of Measure Code", LangSel);

                    if FirstLineHasBeenOutput then
                        Clear(CompanyInformation2.Picture);
                    FirstLineHasBeenOutput := true;

                    if ("Job No." <> '') and (not EnvironmentInfo.IsSaaS()) then
                        JobNo := ''
                    else
                        JobNo := "Job No.";
                    if ("Job Task No." <> '') and (not EnvironmentInfo.IsSaaS()) then
                        JobTaskNo := ''
                    else
                        JobTaskNo := "Job Task No.";

                    if JobTaskNo <> '' then begin
                        JobTaskNoLabel := JobTaskNoLbl;
                        JobTaskDescription := GetJobTaskDescription(JobNo, JobTaskNo);
                    end else begin
                        JobTaskDescription := '';
                        JobTaskNoLabel := '';
                    end;

                    if JobNo <> '' then
                        JobNoLabel := JobNoLbl
                    else
                        JobNoLabel := '';

                    if HasTypeToFillMandatoryFields() then
                        FormattedQuantity := Format(Quantity)
                    else
                        FormattedQuantity := '';
                end;

                trigger OnPreDataItem()
                begin
                    MoreLines := Find('+');
                    while MoreLines and (Description = '') and ("No." = '') and (Quantity = 0) do
                        MoreLines := Next(-1) <> 0;
                    if not MoreLines then
                        CurrReport.Break();
                    SetRange("Line No.", 0, "Line No.");
                    FirstLineHasBeenOutput := false;
                    CompanyInformation2.Picture := CompanyInformation.Picture;

                    OnAfterLineOnPreDataItem(Header, Line);
                end;

                trigger OnPostDataItem()
                var
                    TempLocalTrackingSpecBuffer: Record "Tracking Specification" temporary;
                begin
                    if ShowLotSN then begin
                        ItemTrackingDocManagement.SetRetrieveAsmItemTracking(true);
                        TrackingSpecCount :=
                          ItemTrackingDocManagement.RetrieveDocumentItemTracking(TempLocalTrackingSpecBuffer,
                            Header."No.", Database::"Sales Shipment Header", 0);
                        ItemTrackingDocManagement.SetRetrieveAsmItemTracking(false);
                        UpdateTrackingSpecBuffer(TempLocalTrackingSpecBuffer);
                    end;
                end;
            }
            dataitem(ItemTrackingLine; "Integer")
            {
                DataItemTableView = sorting(Number);
                column(TrackingSpecBufferEntryNo; TempTrackingSpecification."Entry No.")
                {
                }
                column(TrackingSpecBufferNo; TempTrackingSpecification."Item No.")
                {
                }
                column(TrackingSpecBufferDesc; TempTrackingSpecification.Description)
                {
                }
                column(TrackingSpecBufferLotNo; TempTrackingSpecification."Lot No.")
                {
                }
                column(TrackingSpecBufferSerNo; TempTrackingSpecification."Serial No.")
                {
                }
                column(TrackingSpecBufferQty; TempTrackingSpecification."Quantity (Base)")
                {
                }
                trigger OnAfterGetRecord()
                begin
                    if Number = 1 then
                        TempTrackingSpecification.FindSet()
                    else
                        TempTrackingSpecification.Next();
                end;

                trigger OnPreDataItem()
                begin
                    if TrackingSpecCount = 0 then
                        CurrReport.Break();
                    SetRange(Number, 1, TempTrackingSpecification.Count());
                end;
            }
            dataitem(WorkDescriptionLines; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = filter(1 .. 99999));
                column(WorkDescriptionLineNumber; Number)
                {
                }
                column(WorkDescriptionLine; WorkDescriptionLine)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if WorkDescriptionInstream.EOS then
                        CurrReport.Break();
                    WorkDescriptionInstream.ReadText(WorkDescriptionLine);
                end;

                trigger OnPostDataItem()
                begin
                    Clear(WorkDescriptionInstream)
                end;

                trigger OnPreDataItem()
                begin
                    if not ShowWorkDescription then
                        CurrReport.Break();
                    Header."Work Description".CreateInStream(WorkDescriptionInstream, TextEncoding::UTF8);
                end;
            }
            dataitem(LeftHeader; "Name/Value Buffer")
            {
                DataItemTableView = sorting(ID);
                UseTemporary = true;
                column(LeftHeaderName; Name)
                {
                }
                column(LeftHeaderValue; Value)
                {
                }
            }
            dataitem(RightHeader; "Name/Value Buffer")
            {
                DataItemTableView = sorting(ID);
                UseTemporary = true;
                column(RightHeaderName; Name)
                {
                }
                column(RightHeaderValue; Value)
                {
                }
            }
            dataitem(LetterText; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                column(GreetingText; GreetingLbl)
                {
                }
                column(BodyText; BodyLbl)
                {
                }
                column(ClosingText; ClosingLbl)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                if LangSel = '' then begin
                    Customer.Get("Bill-to Customer No.");
                    Customer.TestField("Language Code");
                    LangSel := Customer."Language Code";
                end;

                CurrReport.Language := Language2.GetLanguageID(LangSel);

                if not IsReportInPreviewMode() then
                    Codeunit.Run(Codeunit::"Sales Shpt.-Printed", Header);

                CalcFields("Work Description");
                ShowWorkDescription := "Work Description".HasValue;

                FormatAddressFields(Header);
                FormatDocumentFields(Header);
                if SellToContact.Get("Sell-to Contact No.") then;
                if BillToContact.Get("Bill-to Contact No.") then;

                if not CompanyBankAccount.Get(Header."Company Bank Account Code") then
                    CompanyBankAccount.CopyBankFieldsFromCompanyInfo(CompanyInformation);

                FillLeftHeader();
                FillRightHeader();

                if not Customer.Get("Bill-to Customer No.") then
                    Clear(Customer);

                TempTrackingSpecification.Reset();
                TempTrackingSpecification.DeleteAll();

                OnAfterGetSalesHeader(Header);
            end;

            trigger OnPreDataItem()
            begin
                FirstLineHasBeenOutput := false;
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
                    field(LogInteractionControl; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies that interactions with the contact are logged.';
                    }
                    field(DisplayAsmInformation; DisplayAssemblyInformation)
                    {
                        ApplicationArea = Assembly;
                        Caption = 'Show Assembly Components';
                        ToolTip = 'Specifies if you want the report to include information about components that were used in linked assembly orders that supplied the item(s) being sold. (Only possible for RDLC report layout.)';
                    }
                    field("Show Correction Lines"; ShowCorrectionLines)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Correction Lines';
                        ToolTip = 'Specifies if the correction lines of an undoing of quantity posting will be shown on the report.';
                    }
                    field(ShowLotSNControl; ShowLotSN)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Serial/Lot Number Appendix';
                        ToolTip = 'Specifies if you want to print an appendix to the sales shipment report showing the lot and serial numbers in the shipment.';
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
        CompanyInformation.SetAutoCalcFields(Picture);
        CompanyInformation.Get();
        SalesReceivablesSetup.Get();
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not IsReportInPreviewMode() then
            if Header.FindSet() then
                repeat
                    if Header."Bill-to Contact No." <> '' then
                        SegManagement.LogDocument(
                          4, Header."No.", 0, 0, Database::Contact, Header."Bill-to Contact No.", Header."Salesperson Code",
                          Header."Campaign No.", Header."Posting Description", '')
                    else
                        SegManagement.LogDocument(
                          4, Header."No.", 0, 0, Database::Customer, Header."Bill-to Customer No.", Header."Salesperson Code",
                          Header."Campaign No.", Header."Posting Description", '');
                until Header.Next() = 0;
    end;

    trigger OnPreReport()
    begin
        if Header.GetFilters = '' then
            Error(NoFilterSetErr);

        if not CurrReport.UseRequestPage then
            InitLogInteraction();

        CompanyLogoPosition := SalesReceivablesSetup."Logo Position on Documents";
    end;

    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        ShipmentMethod: Record "Shipment Method";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        CompanyBankAccount: Record "Bank Account";
        CompanyInformation: Record "Company Information";
        CompanyInformation2: Record "Company Information";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        Customer: Record Customer;
        ResponsibilityCenter: Record "Responsibility Center";
        SellToContact: Record Contact;
        BillToContact: Record Contact;
        Language2: Codeunit Language;
        FormatAddress: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        ItemTrackingDocManagement: Codeunit "Item Tracking Doc. Management";
        GeneralFunctionsTJP: Codeunit "General Functions TJP";
        WorkDescriptionInstream: InStream;
        JobNo: Code[20];
        JobTaskNo: Code[20];
        JobNoLabel: Text;
        JobTaskNoLabel: Text;
        FormattedQuantity: Text;
        WorkDescriptionLine: Text;
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        CompanyLogoPosition: Integer;
        TrackingSpecCount: Integer;
        MoreLines: Boolean;
        ShowWorkDescription: Boolean;
        ShowCustAddr: Boolean;
        LogInteraction: Boolean;
        //[InDataSet]   //2023.12.01 DHA
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        ShowCorrectionLines: Boolean;
        ShowLotSN: Boolean;
        FirstLineHasBeenOutput: Boolean;
        LangSel: Code[10];
        SalesPersonText: Text[50];
        CompanyBankNameTxt: Text;
        CompanyBankAccTypeTxt: Text;
        CompanyBankAccHolderTxt: Text;
        CompanyBankAccNoTxt: Text;
        UoMText: Text;
        SalesShipmentLbl: Label 'Sales Shipment';
        PageLbl: Label 'Page';
        SellToCustNoLbl: Label 'Sell-to Customer No.';
        ShipmentNoLbl: Label 'Shipment No.';
        DocDateLbl: Label 'Document Date';
        PostedShipmentDateLbl: Label 'Shipment Date';
        PurchaseOrderNoLbl: Label 'Purchase Order No.';
        OurDocumentNoLbl: Label 'Our Document No.';
        ShptMethodDescLbl: Label 'Shipment Method';
        CompVATRegNoLbl: Label 'VAT Registration No.';
        SalespersonLbl: Label 'Sales Person';
        CompanyInfoBankAccNoLbl: Label 'Account No.';
        CompanyInfoBankNameLbl: Label 'Bank';
        CompanyInfoGiroNoLbl: Label 'Giro No.';
        BankAccTypeLbl: Label 'Account Type';
        CopyLbl: Label 'Copy';
        PhoneNoLbl: Label 'Phone No.';
        EMailLbl: Label 'Email';
        HomePageLbl: Label 'Home Page';
        YourSalesShipmentLbl: Label 'Your Shipment';
        ShipmentLbl: Label 'Sales Shipment';
        ShiptoAddrLbl: Label 'Ship-to Address';
        SubtotalLbl: Label 'Subtotal';
        TotalLbl: Label 'Total';
        WorkDescriptionLbl: Label 'Work Description';
        ItemNoLbl: Label 'Item No.';
        ItemDescLbl: Label 'Item Name';
        ItemQtyLbl: Label 'Quantity';
        ItemUoMLbl: Label 'UoM';
        FromLbl: Label 'From';
        BilledToLbl: Label 'Billed to';
        QuestionsLbl: Label 'Questions?';
        ThanksLbl: Label 'Thank You!';
        JobNoLbl: Label 'Job No.';
        JobTaskNoLbl: Label 'Job Task No.';
        JobTaskDescription: Text[100];
        JobTaskDescLbl: Label 'Job Task Description';
        UnitLbl: Label 'Unit';
        QtyLbl: Label 'Qty', Comment = 'Short form of Quantity';
        SellToContactPhoneNoLbl: Label 'Sell-to Contact Phone No.';
        SellToContactMobilePhoneNoLbl: Label 'Sell-to Contact Mobile Phone No.';
        SellToContactEmailLbl: Label 'Sell-to Contact E-Mail';
        BillToContactPhoneNoLbl: Label 'Bill-to Contact Phone No.';
        BillToContactMobilePhoneNoLbl: Label 'Bill-to Contact Mobile Phone No.';
        BillToContactEmailLbl: Label 'Bill-to Contact E-Mail';
        BilltoAddressCaptionLbl: Label 'Bill-to Address';
        QuantityCaptionLbl: Label 'Quantity';
        SerialNoCaptionLbl: Label 'Serial No.';
        LotNoCaptionLbl: Label 'Lot No.';
        DescriptionCaptionLbl: Label 'Description';
        NoCaptionLbl: Label 'No.';
        GrossWeightLbl: Label 'Unit Gross Weight';
        NetWeightLbl: Label 'Unit Net Weight';
        UnitVolumeLbl: Label 'Unit Volume';
        UnitsperParcelLbl: Label 'Units per Parcel';
        GreetingLbl: Label 'Hello';
        ClosingLbl: Label 'Sincerely';
        BodyLbl: Label 'Thank you for your business. Your shipment is attached to this message.';
        NoFilterSetErr: Label 'You must specify one or more filters to avoid accidently printing all documents.';

    protected var
        TempTrackingSpecification: Record "Tracking Specification" temporary;

    [Obsolete('Variable is no longer used.', '24.0')]       // 2024/05/07 added by Anada
                                                            //TempTrackingSpecBuffer: Record "Tracking Specification" temporary;    // 2023/04/25 Anada (Will get breaking change error without this)

    procedure InitLogInteraction()   //Changed procedure from local to global
    begin
        LogInteraction := SegManagement.FindInteractionTemplateCode(Enum::"Interaction Log Entry Document Type"::"Sales Shpt. Note") <> ''; //2023.12.01 DHA
    end;

    local procedure DocumentCaption(): Text
    var
        DocCaption: Text;
    begin
        OnBeforeGetDocumentCaption(Header, DocCaption);
        if DocCaption <> '' then
            exit(DocCaption);
        exit(SalesShipmentLbl);
    end;

    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean; DisplayAsmInfo: Boolean; NewShowCorrectionLines: Boolean; NewShowLotSN: Boolean)
    begin
        LogInteraction := NewLogInteraction;
        DisplayAssemblyInformation := DisplayAsmInfo;
        ShowCorrectionLines := NewShowCorrectionLines;
        ShowLotSN := NewShowLotSN;
    end;

    local procedure UpdateTrackingSpecBuffer(var LocalTrackingSpecBuffer: Record "Tracking Specification" temporary)
    var
        ItemNo: Code[20];
        ItemTotalQty: Decimal;
        EntryNo: Integer;
        FirstRow: Boolean;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeUpdateTrackingSpecBuffer(ShowCorrectionLines, LocalTrackingSpecBuffer, TempTrackingSpecification, IsHandled);
        if IsHandled then
            exit;

        ItemTotalQty := 0;
        if not ShowCorrectionLines then
            LocalTrackingSpecBuffer.SetRange(Correction, false);
        if LocalTrackingSpecBuffer.FindSet() then begin
            ItemNo := LocalTrackingSpecBuffer."Item No.";
            FirstRow := true;
            repeat
                if ItemNo <> LocalTrackingSpecBuffer."Item No." then begin
                    EntryNo += 1;
                    TempTrackingSpecification.Init();
                    TempTrackingSpecification."Entry No." := EntryNo;
                    TempTrackingSpecification."Quantity (Base)" := ItemTotalQty;
                    TempTrackingSpecification.Insert();
                    ItemTotalQty := 0;
                    FirstRow := true;
                end;
                if LocalTrackingSpecBuffer.Correction then
                    LocalTrackingSpecBuffer."Quantity (Base)" := -LocalTrackingSpecBuffer."Quantity (Base)";
                TempTrackingSpecification.TransferFields(LocalTrackingSpecBuffer);
                EntryNo += 1;
                TempTrackingSpecification."Entry No." := EntryNo;
                if not FirstRow then begin
                    TempTrackingSpecification."Item No." := '';
                    TempTrackingSpecification.Description := '';
                end;
                TempTrackingSpecification.Insert();

                ItemNo := LocalTrackingSpecBuffer."Item No.";
                ItemTotalQty := ItemTotalQty + LocalTrackingSpecBuffer."Quantity (Base)";
                if FirstRow then
                    FirstRow := false;
            until LocalTrackingSpecBuffer.Next() = 0;

            EntryNo += 1;
            TempTrackingSpecification.Init();
            TempTrackingSpecification."Entry No." := EntryNo;
            TempTrackingSpecification."Quantity (Base)" := ItemTotalQty;
            TempTrackingSpecification.Insert();
        end;
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody());
    end;

    local procedure GetUOMText(UOMCode: Code[10]): Text[50]
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        if not UnitOfMeasure.Get(UOMCode) then
            exit(UOMCode);
        exit(UnitOfMeasure.Description);
    end;

    local procedure FillLeftHeader()
    begin
        LeftHeader.DeleteAll();

        FillNameValueTable(LeftHeader, SellToCustNoLbl, Header."Sell-to Customer No.");
        FillNameValueTable(LeftHeader, ShipmentNoLbl, Header."No.");
        FillNameValueTable(LeftHeader, DocDateLbl, Format(Header."Document Date"));
        FillNameValueTable(LeftHeader, PostedShipmentDateLbl, Format(Header."Shipment Date"));
        FillNameValueTable(LeftHeader, PurchaseOrderNoLbl, Header."External Document No.");
        FillNameValueTable(LeftHeader, OurDocumentNoLbl, Header."Order No.");
        FillNameValueTable(LeftHeader, ShptMethodDescLbl, ShipmentMethod.Description);
    end;

    local procedure FillRightHeader()
    begin
        RightHeader.DeleteAll();

        FillNameValueTable(RightHeader, SalespersonLbl, SalespersonPurchaser.Name);
        FillNameValueTable(RightHeader, PhoneNoLbl, CompanyInformation."Phone No.");
        FillNameValueTable(RightHeader, EMailLbl, CompanyInformation."E-Mail");
        FillNameValueTable(RightHeader, HomePageLbl, CompanyInformation."Home Page");
    end;

    local procedure FillNameValueTable(var NameValueBuffer: Record "Name/Value Buffer"; Name: Text; Value: Text)
    var
        KeyIndex: Integer;
    begin
        if Value <> '' then begin
            Clear(NameValueBuffer);
            if NameValueBuffer.FindLast() then
                KeyIndex := NameValueBuffer.ID + 1;

            NameValueBuffer.Init();
            NameValueBuffer.ID := KeyIndex;
            NameValueBuffer.Name := CopyStr(Name, 1, MaxStrLen(NameValueBuffer.Name));
            NameValueBuffer.Value := CopyStr(Value, 1, MaxStrLen(NameValueBuffer.Value));
            NameValueBuffer.Insert();
        end;
    end;

    local procedure FormatAddressFields(var SalesShipmentHeader: Record "Sales Shipment Header")
    begin
        GeneralFunctionsTJP.GetCompanyAdd(SalesShipmentHeader."Responsibility Center", ResponsibilityCenter, CompanyInformation, CompanyAddr, LangSel);
        FormatAddress.SalesShptBillTo(CustAddr, ShipToAddr, SalesShipmentHeader);
        FormatAddress.SalesShptShipTo(ShipToAddr, SalesShipmentHeader);
        ShowCustAddr := FormatAddress.SalesShptBillTo(CustAddr, ShipToAddr, SalesShipmentHeader);
    end;

    local procedure FormatDocumentFields(SalesShipmentHeader: Record "Sales Shipment Header")
    begin
        FormatDocument.SetSalesPerson(SalespersonPurchaser, SalesShipmentHeader."Salesperson Code", SalesPersonText);
        FormatDocument.SetShipmentMethod(ShipmentMethod, SalesShipmentHeader."Shipment Method Code", LangSel);
        GeneralFunctionsTJP.TranslateCompBankAccFields(CompanyInformation, CompanyBankAccHolderTxt, CompanyBankNameTxt, CompanyBankAccNoTxt, CompanyBankAccTypeTxt, LangSel);
    end;

    local procedure GetJobTaskDescription(pJobNo: Code[20]; pJobTaskNo: Code[20]): Text[100]
    var
        JobTask: Record "Job Task";
    begin
        JobTask.SetRange("Job No.", pJobNo);
        JobTask.SetRange("Job Task No.", pJobTaskNo);
        if JobTask.FindFirst() then
            exit(JobTask.Description);

        exit('');
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterLineOnPreDataItem(var SalesShipmentHeader: Record "Sales Shipment Header"; var SalesShipmentLine: Record "Sales Shipment Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeLineOnAfterGetRecord(var SalesShipmentHeader: Record "Sales Shipment Header"; var SalesShipmentLine: Record "Sales Shipment Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetDocumentCaption(SalesShipmentHeader: Record "Sales Shipment Header"; var DocCaption: Text)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeUpdateTrackingSpecBuffer(ShowCorrectionLines: Boolean; var TempTrackingSpecificationLocal: Record "Tracking Specification" temporary; var TempTrackingSpecification: Record "Tracking Specification" temporary; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterGetSalesHeader(SalesShipmentHeader: Record "Sales Shipment Header")
    begin
    end;

    //Obsolute Procedures [start](Will get breaking change error without this)
    [Obsolete('Event is no longer used.', '24.0')]   // 2024/05/07 added by Anada
    [IntegrationEvent(true, false)]
    local procedure OnAfterInitReport()
    begin
    end;

    [Obsolete('Event is no longer used', '24.0')]   // 2024/05/07 added by Anada
    [IntegrationEvent(true, false)]
    local procedure OnAfterPostDataItem(var SalesShipmentHeader: Record "Sales Shipment Header")
    begin
    end;
    //Obsolute Procedures [end](Will get breaking change error without this)

    procedure BlanksForIndent(): Text[10]
    begin
        exit(PadStr('', 2, ' '));
    end;
}

