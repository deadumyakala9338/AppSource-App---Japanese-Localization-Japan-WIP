#if AppSource
codeunit 70658593 "EventSubcriberLinePageMgtTJP"
#endif
#if OnPremise
codeunit 99007 "EventSubcriberLinePageMgtTJP"
#endif
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ArchiveManagement, 'OnAfterStoreSalesLineArchive', '', false, false)]
    local procedure ECOnAfterStoreSalesLineArchiveTJP(var SalesLineArchive: Record "Sales Line Archive"; var SalesHeaderArchive: Record "Sales Header Archive")
    var
        CompanyInformationRec: Record "Company Information";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        SalesLineArchive."Document Date TJP" := SalesHeaderArchive."Document Date";
        SalesLineArchive."Order Date TJP" := SalesHeaderArchive."Order Date";
        SalesLineArchive."Posting Date TJP" := SalesHeaderArchive."Posting Date";
        SalesLineArchive."Due Date TJP" := SalesHeaderArchive."Due Date";
        SalesLineArchive."Ext. Document No. TJP" := SalesHeaderArchive."External Document No.";
        SalesLineArchive."Assigned User ID TJP" := SalesHeaderArchive."Assigned User ID";
        SalesLineArchive."Sell-to Customer Name TJP" := SalesHeaderArchive."Sell-to Customer Name";
        SalesLineArchive."Sell-to Customer Name 2 TJP" := SalesHeaderArchive."Sell-to Customer Name 2";
        SalesLineArchive."Salesperson Code TJP" := SalesHeaderArchive."Salesperson Code";
        if SalespersonPurchaser.Get(SalesHeaderArchive."Salesperson Code") then;
        SalesLineArchive."Salesperson Name TJP" := SalespersonPurchaser.Name;
        SalesLineArchive."Status TJP" := SalesHeaderArchive.Status;
        SalesLineArchive.Modify();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeSalesInvLineInsert', '', false, false)]
    local procedure OnBeforeSalesInvLineInsertTJP(var SalesInvLine: Record "Sales Invoice Line";
                                                      SalesInvHeader: Record "Sales Invoice Header";
                                                      SalesHeader: Record "Sales Header";
                                                      SalesLine: Record "Sales Line";
                                                      SalesShipmentHeader: Record "Sales Shipment Header")
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        SalesInvLine."Document Date TJP" := SalesHeader."Document Date";
        SalesInvLine."Order Date TJP" := SalesHeader."Order Date";
        SalesInvLine."Due Date TJP" := SalesHeader."Due Date";
        SalesInvLine."Ext. Document No. TJP" := SalesHeader."External Document No.";
        SalesInvLine."Assigned User ID TJP" := SalesHeader."Assigned User ID";
        SalesInvLine."Salesperson Code TJP" := SalesHeader."Salesperson Code";
        SalesInvLine."Status TJP" := SalesHeader.Status;
        SalesInvLine."Sell-to Customer Name TJP" := SalesHeader."Sell-to Customer Name";
        SalesInvLine."Sell-to Customer Name 2 TJP" := SalesHeader."Sell-to Customer Name 2";
        SalesInvLine."Sell-to Address TJP" := SalesHeader."Sell-to Address";
        SalesInvLine."Sell-to Address 2 TJP" := SalesHeader."Sell-to Address 2";
        SalesInvLine."Sell-to City TJP" := SalesHeader."Sell-to City";
        SalesInvLine."Sell-to Post Code TJP" := SalesHeader."Sell-to Post Code";
        SalesInvLine."Sell-to Cntry/Region Code TJP" := SalesHeader."Sell-to Country/Region Code";
        SalesInvLine."Bill-to Name TJP" := SalesHeader."Bill-to Name";
        SalesInvLine."Bill-to Name 2 TJP" := SalesHeader."Bill-to Name 2";
        SalesInvLine."Bill-to Address TJP" := SalesHeader."Bill-to Address";
        SalesInvLine."Bill-to Address 2 TJP" := SalesHeader."Bill-to Address 2";
        SalesInvLine."Bill-to City TJP" := SalesHeader."Bill-to City";
        SalesInvLine."Bill-to Post Code TJP" := SalesHeader."Bill-to Post Code";
        SalesInvLine."Bill-to Cntry/Region Code TJP" := SalesHeader."Bill-to Country/Region Code";
        SalesInvLine."Payment Terms Code TJP" := SalesHeader."Payment Terms Code";
        SalesInvLine."Payment Method Code TJP" := SalesHeader."Payment Method Code";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeSalesCrMemoLineInsert', '', false, false)]
    local procedure OnBeforeSalesCrMemoLineInsertTJP(var SalesCrMemoLine: Record "Sales Cr.Memo Line";
                                                         SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                                                         SalesLine: Record "Sales Line";
                                                         var SalesHeader: Record "Sales Header";
                                                         var SalesShptHeader: Record "Sales Shipment Header")
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        SalesCrMemoLine."Document Date TJP" := SalesCrMemoHeader."Document Date";
        SalesCrMemoLine."Due Date TJP" := SalesCrMemoHeader."Due Date";
        SalesCrMemoLine."Ext. Document No. TJP" := SalesCrMemoHeader."External Document No.";
        SalesCrMemoLine."Assigned User ID TJP" := SalesCrMemoHeader."User ID";
        SalesCrMemoLine."Salesperson Code TJP" := SalesCrMemoHeader."Salesperson Code";
        SalesCrMemoLine."Sell-to Customer Name TJP" := SalesCrMemoHeader."Sell-to Customer Name";
        SalesCrMemoLine."Sell-to Customer Name 2 TJP" := SalesCrMemoHeader."Sell-to Customer Name 2";
        SalesCrMemoLine."Sell-to Address TJP" := SalesCrMemoHeader."Sell-to Address";
        SalesCrMemoLine."Sell-to Address 2 TJP" := SalesCrMemoHeader."Sell-to Address 2";
        SalesCrMemoLine."Sell-to City TJP" := SalesCrMemoHeader."Sell-to City";
        SalesCrMemoLine."Sell-to Post Code TJP" := SalesCrMemoHeader."Sell-to Post Code";
        SalesCrMemoLine."Sell-to Cntry/Region Code TJP" := SalesCrMemoHeader."Sell-to Country/Region Code";
        SalesCrMemoLine."Bill-to Name TJP" := SalesCrMemoHeader."Bill-to Name";
        SalesCrMemoLine."Bill-to Name 2 TJP" := SalesCrMemoHeader."Bill-to Name 2";
        SalesCrMemoLine."Bill-to Address TJP" := SalesCrMemoHeader."Bill-to Address";
        SalesCrMemoLine."Bill-to Address 2 TJP" := SalesCrMemoHeader."Bill-to Address 2";
        SalesCrMemoLine."Bill-to City TJP" := SalesCrMemoHeader."Bill-to City";
        SalesCrMemoLine."Bill-to Post Code TJP" := SalesCrMemoHeader."Bill-to Post Code";
        SalesCrMemoLine."Bill-to Cntry/Region Code TJP" := SalesCrMemoHeader."Bill-to Country/Region Code";
        SalesCrMemoLine."Payment Terms Code TJP" := SalesCrMemoHeader."Payment Terms Code";
        SalesCrMemoLine."Payment Method Code TJP" := SalesCrMemoHeader."Payment Method Code";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ArchiveManagement, 'OnAfterStorePurchLineArchive', '', false, false)]
    local procedure ECOnAfterStorePurchLineArchiveTJP(var PurchLineArchive: Record "Purchase Line Archive"; var PurchHeaderArchive: Record "Purchase Header Archive")
    var
        CompanyInformationRec: Record "Company Information";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        TempStatusText: Text;
        TempStatusInteger: Integer;
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        PurchLineArchive."Document Date TJP" := PurchHeaderArchive."Document Date";
        PurchLineArchive."Posting Date TJP" := PurchHeaderArchive."Posting Date";
        PurchLineArchive."Due Date TJP" := PurchHeaderArchive."Due Date";
        PurchLineArchive."Vendor Invoice No. TJP" := PurchHeaderArchive."Vendor Invoice No.";
        PurchLineArchive."Assigned User ID TJP" := PurchHeaderArchive."Assigned User ID";
        PurchLineArchive."Buy-from Vendor Name TJP" := PurchHeaderArchive."Buy-from Vendor Name";
        PurchLineArchive."Buy-from Vendor Name 2 TJP" := PurchHeaderArchive."Buy-from Vendor Name 2";
        PurchLineArchive."Purchaser Code TJP" := PurchHeaderArchive."Purchaser Code";
        if SalespersonPurchaser.Get(PurchHeaderArchive."Purchaser Code") then;
        PurchLineArchive."Purchaser Name TJP" := SalespersonPurchaser.Name;
        //PurchLineArchive."Status TJP" := PurchHeaderArchive.Status;
        TempStatusText := Format(PurchHeaderArchive.Status, 0, 2);
        if Evaluate(TempStatusInteger, TempStatusText) then
            PurchLineArchive."Status TJP" := TempStatusInteger;
        PurchLineArchive.Modify();
    end;

#if not CLEAN23
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Create Source Document", 'OnBeforeCreateShptLineFromSalesLine', '', false, false)]
#endif
#if CLEAN23
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Warehouse Mgt.", 'OnBeforeCreateShptLineFromSalesLine', '', false, false)]
#endif
    local procedure OnBeforeCreateShptLineFromSalesLineTJP(var WarehouseShipmentLine: Record "Warehouse Shipment Line"; WarehouseShipmentHeader: Record "Warehouse Shipment Header"; SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    var
        CompanyInformationRec: Record "Company Information";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        ShipmentMethod: Record "Shipment Method";
        ShippingAgent: Record "Shipping Agent";
        shippingAgentService: Record "Shipping Agent Services";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        WarehouseShipmentLine."Assigned User ID TJP" := WarehouseShipmentHeader."Assigned User ID";
        WarehouseShipmentLine."Posting Date TJP" := WarehouseShipmentHeader."Posting Date";
        WarehouseShipmentLine."Sell-to Customer No. TJP" := SalesHeader."Sell-to Customer No.";
        WarehouseShipmentLine."Sell-to Customer Name TJP" := SalesHeader."Sell-to Customer Name";
        WarehouseShipmentLine."Sell-to Customer Name 2 TJP" := SalesHeader."Sell-to Customer Name 2";
        WarehouseShipmentLine."Ship-to Code TJP" := SalesHeader."Ship-to Code";
        WarehouseShipmentLine."Ship-to Name TJP" := SalesHeader."Ship-to Name";
        WarehouseShipmentLine."Ship-to Name 2 TJP" := SalesHeader."Ship-to Name 2";
        WarehouseShipmentLine."Ship-to Address TJP" := SalesHeader."Ship-to Address";
        WarehouseShipmentLine."Ship-to Address 2 TJP" := SalesHeader."Ship-to Address 2";
        WarehouseShipmentLine."Ship-to City TJP" := SalesHeader."Ship-to City";
        WarehouseShipmentLine."Ship-to Post Code TJP" := SalesHeader."Ship-to Post Code";
        WarehouseShipmentLine."Ship-to Cntry/Region Code TJP" := SalesHeader."Ship-to Country/Region Code";
        WarehouseShipmentLine."Order Date TJP" := SalesHeader."Order Date";
        WarehouseShipmentLine."Ext. Document No. TJP" := SalesHeader."External Document No.";
        WarehouseShipmentLine."Salesperson Code TJP" := SalesHeader."Salesperson Code";
        if SalespersonPurchaser.Get(SalesHeader."Salesperson Code") then;
        WarehouseShipmentLine."Salesperson Name TJP" := SalespersonPurchaser.Name;
        WarehouseShipmentLine."Requested Delivery Date TJP" := SalesLine."Requested Delivery Date";
        WarehouseShipmentLine."Promised Delivery Date TJP" := SalesLine."Promised Delivery Date";
        WarehouseShipmentLine."Shipment Method Code TJP" := WarehouseShipmentHeader."Shipment Method Code";
        if ShipmentMethod.Get(WarehouseShipmentHeader."Shipment Method Code") then;
        WarehouseShipmentLine."Shipment Method Desc. TJP" := ShipmentMethod.Description;
        WarehouseShipmentLine."Shipping Agent Code TJP" := WarehouseShipmentHeader."Shipping Agent Code";
        if ShippingAgent.Get(WarehouseShipmentHeader."Shipping Agent Code") then;
        WarehouseShipmentLine."Shipping Agent Description TJP" := ShippingAgent.Name;
        WarehouseShipmentLine."Ship. Agent Service Code TJP" := WarehouseShipmentHeader."Shipping Agent Service Code";
        if shippingAgentService.Get(WarehouseShipmentHeader."Shipping Agent Code", WarehouseShipmentHeader."Shipping Agent Service Code") then;
        WarehouseShipmentLine."Ship. Agent Service Desc. TJP" := shippingAgentService.Description;
    end;

#if not CLEAN23
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Create Source Document", 'OnPurchLine2ReceiptLineOnAfterUpdateReceiptLine', '', false, false)]
    local procedure OnPurchLine2ReceiptLineOnAfterUpdateReceiptLineTJP(var WhseReceiptLine: Record "Warehouse Receipt Line"; PurchaseLine: Record "Purchase Line"; var WhseReceiptHeader: Record "Warehouse Receipt Header")
#endif
#if CLEAN23
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purchases Warehouse Mgt.", 'OnPurchLine2ReceiptLineOnAfterUpdateReceiptLine', '', false, false)]
    local procedure OnPurchLine2ReceiptLineOnAfterUpdateReceiptLineTJP(var WarehouseReceiptLine: Record "Warehouse Receipt Line"; PurchaseLine: Record "Purchase Line"; var WhseReceiptHeader: Record "Warehouse Receipt Header")
#endif
    var
        CompanyInformationRec: Record "Company Information";
        PurchaseHeader: Record "Purchase Header";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
#if not CLEAN23
        if PurchaseHeader.Get(PurchaseLine."Document Type", PurchaseLine."Document No.") then;
        WhseReceiptLine."Assigned User ID TJP" := WhseReceiptHeader."Assigned User ID";
        WhseReceiptLine."Posting Date TJP" := WhseReceiptHeader."Posting Date";
        WhseReceiptLine."Buy-from Vendor No. TJP" := PurchaseHeader."Buy-from Vendor No.";
        WhseReceiptLine."Buy-from Vendor Name TJP" := PurchaseHeader."Buy-from Vendor Name";
        WhseReceiptLine."Buy-from Vendor Name 2 TJP" := PurchaseHeader."Buy-from Vendor Name 2";
        WhseReceiptLine."Order Date TJP" := PurchaseHeader."Order Date";
        WhseReceiptLine."Purchaser Code TJP" := PurchaseHeader."Purchaser Code";
        if SalespersonPurchaser.Get(PurchaseHeader."Purchaser Code") then;
        WhseReceiptLine."Purchaser Name TJP" := SalespersonPurchaser.Name;
        WhseReceiptLine."Requested Receipt Date TJP" := PurchaseLine."Requested Receipt Date";
        WhseReceiptLine."Promised Receipt Date TJP" := PurchaseLine."Promised Receipt Date";
#endif
#if CLEAN23
        if PurchaseHeader.Get(PurchaseLine."Document Type", PurchaseLine."Document No.") then;
        WarehouseReceiptLine."Assigned User ID TJP" := WhseReceiptHeader."Assigned User ID";
        WarehouseReceiptLine."Posting Date TJP" := WhseReceiptHeader."Posting Date";
        WarehouseReceiptLine."Buy-from Vendor No. TJP" := PurchaseHeader."Buy-from Vendor No.";
        WarehouseReceiptLine."Buy-from Vendor Name TJP" := PurchaseHeader."Buy-from Vendor Name";
        WarehouseReceiptLine."Buy-from Vendor Name 2 TJP" := PurchaseHeader."Buy-from Vendor Name 2";
        WarehouseReceiptLine."Order Date TJP" := PurchaseHeader."Order Date";
        WarehouseReceiptLine."Purchaser Code TJP" := PurchaseHeader."Purchaser Code";
        if SalespersonPurchaser.Get(PurchaseHeader."Purchaser Code") then;
        WarehouseReceiptLine."Purchaser Name TJP" := SalespersonPurchaser.Name;
        WarehouseReceiptLine."Requested Receipt Date TJP" := PurchaseLine."Requested Receipt Date";
        WarehouseReceiptLine."Promised Receipt Date TJP" := PurchaseLine."Promised Receipt Date";
#endif
    end;

    [EventSubscriber(ObjectType::Table, Database::"Warehouse Shipment Header", 'OnAfterValidateEvent', 'Posting Date', false, false)]
    local procedure WhseShipOnPostingDateOnAfterValidateEventTJP(var Rec: Record "Warehouse Shipment Header"; var xRec: Record "Warehouse Shipment Header")
    var
        CompanyInformationRec: Record "Company Information";
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        if Rec."Posting Date" <> xRec."Posting Date" then begin
            WarehouseShipmentLine.Reset();
            WarehouseShipmentLine.SetRange("No.", Rec."No.");
            if WarehouseShipmentLine.FindSet() then
                repeat
                    WarehouseShipmentLine."Posting Date TJP" := Rec."Posting Date";
                    WarehouseShipmentLine.Modify()
                until WarehouseShipmentLine.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Warehouse Shipment Header", 'OnAfterValidateEvent', 'Assigned User ID', false, false)]
    local procedure WhseShipOnAssignedUserIDOnAfterValidateEventTJP(var Rec: Record "Warehouse Shipment Header"; var xRec: Record "Warehouse Shipment Header")
    var
        CompanyInformationRec: Record "Company Information";
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        if Rec."Assigned User ID" <> xRec."Assigned User ID" then begin
            WarehouseShipmentLine.Reset();
            WarehouseShipmentLine.SetRange("No.", Rec."No.");
            if WarehouseShipmentLine.FindSet() then
                repeat
                    WarehouseShipmentLine."Assigned User ID TJP" := Rec."Assigned User ID";
                    WarehouseShipmentLine.Modify()
                until WarehouseShipmentLine.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Warehouse Shipment Header", 'OnAfterValidateEvent', 'Shipment Method Code', false, false)]
    local procedure WhseShipShipmentMethodCodeOnAfterValidateEventTJP(var Rec: Record "Warehouse Shipment Header"; var xRec: Record "Warehouse Shipment Header")
    var
        CompanyInformationRec: Record "Company Information";
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
        ShipmentMethod: Record "Shipment Method";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        if Rec."Shipment Method Code" <> xRec."Shipment Method Code" then begin
            WarehouseShipmentLine.Reset();
            WarehouseShipmentLine.SetRange("No.", Rec."No.");
            if WarehouseShipmentLine.FindSet() then
                repeat
                    if ShipmentMethod.Get(Rec."Shipment Method Code") then;
                    WarehouseShipmentLine."Shipment Method Code TJP" := Rec."Shipment Method Code";
                    WarehouseShipmentLine."Shipment Method Desc. TJP" := ShipmentMethod.Description;
                    WarehouseShipmentLine.Modify()
                until WarehouseShipmentLine.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Warehouse Shipment Header", 'OnAfterValidateEvent', 'Shipping Agent Code', false, false)]
    local procedure WhseShipShippingAgentCodeOnAfterValidateEventTJP(var Rec: Record "Warehouse Shipment Header"; var xRec: Record "Warehouse Shipment Header")
    var
        CompanyInformationRec: Record "Company Information";
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
        ShippingAgent: Record "Shipping Agent";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        if Rec."Shipping Agent Code" <> xRec."Shipping Agent Code" then begin
            WarehouseShipmentLine.Reset();
            WarehouseShipmentLine.SetRange("No.", Rec."No.");
            if WarehouseShipmentLine.FindSet() then
                repeat
                    if ShippingAgent.Get(Rec."Shipping Agent Code") then;
                    WarehouseShipmentLine."Shipping Agent Code TJP" := Rec."Shipping Agent Code";
                    WarehouseShipmentLine."Shipping Agent Description TJP" := ShippingAgent.Name;
                    WarehouseShipmentLine."Ship. Agent Service Code TJP" := '';
                    WarehouseShipmentLine."Ship. Agent Service Desc. TJP" := '';
                    WarehouseShipmentLine.Modify()
                until WarehouseShipmentLine.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Warehouse Shipment Header", 'OnAfterValidateEvent', 'Shipping Agent Service Code', false, false)]
    local procedure WhseShipShippingAgentServiceCodeOnAfterValidateEventTJP(var Rec: Record "Warehouse Shipment Header"; var xRec: Record "Warehouse Shipment Header")
    var
        CompanyInformationRec: Record "Company Information";
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
        ShippingAgentService: Record "Shipping Agent Services";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        if Rec."Shipping Agent Service Code" <> xRec."Shipping Agent Service Code" then begin
            WarehouseShipmentLine.Reset();
            WarehouseShipmentLine.SetRange("No.", Rec."No.");
            if WarehouseShipmentLine.FindSet() then
                repeat
                    if ShippingAgentService.Get(Rec."Shipping Agent Code", Rec."Shipping Agent Service Code") then;
                    WarehouseShipmentLine."Ship. Agent Service Code TJP" := Rec."Shipping Agent Service Code";
                    WarehouseShipmentLine."Ship. Agent Service Desc. TJP" := ShippingAgentService.Description;
                    WarehouseShipmentLine.Modify()
                until WarehouseShipmentLine.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Warehouse Receipt Header", 'OnAfterValidateEvent', 'Posting Date', false, false)]
    local procedure WhseRcptOnPostingDateOnAfterValidateEventTJP(var Rec: Record "Warehouse Receipt Header"; var xRec: Record "Warehouse Receipt Header")
    var
        CompanyInformationRec: Record "Company Information";
        WarehouseReceiptLine: Record "Warehouse Receipt Line";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        if Rec."Posting Date" <> xRec."Posting Date" then begin
            WarehouseReceiptLine.Reset();
            WarehouseReceiptLine.SetRange("No.", Rec."No.");
            if WarehouseReceiptLine.FindSet() then
                repeat
                    WarehouseReceiptLine."Posting Date TJP" := Rec."Posting Date";
                    WarehouseReceiptLine.Modify()
                until WarehouseReceiptLine.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Warehouse Receipt Header", 'OnAfterValidateEvent', 'Assigned User ID', false, false)]
    local procedure WhseRcptOnAssignedUserIDOnAfterValidateEventTJP(var Rec: Record "Warehouse Receipt Header"; var xRec: Record "Warehouse Receipt Header")
    var
        CompanyInformationRec: Record "Company Information";
        WarehouseReceiptLine: Record "Warehouse Receipt Line";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        if Rec."Assigned User ID" <> xRec."Assigned User ID" then begin
            WarehouseReceiptLine.Reset();
            WarehouseReceiptLine.SetRange("No.", Rec."No.");
            if WarehouseReceiptLine.FindSet() then
                repeat
                    WarehouseReceiptLine."Assigned User ID TJP" := Rec."Assigned User ID";
                    WarehouseReceiptLine.Modify()
                until WarehouseReceiptLine.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePurchRcptLineInsert', '', false, false)]
    local procedure OnBeforePurchRcptLineInsertTJP(var PurchRcptLine: Record "Purch. Rcpt. Line"; var PurchRcptHeader: Record "Purch. Rcpt. Header")
    var
        CompanyInformationRec: Record "Company Information";
    begin
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;

        PurchRcptLine."Buy-from Vend. Name TJP" := PurchRcptHeader."Buy-from Vendor Name";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePurchInvLineInsert', '', false, false)]
    local procedure OnBeforePurchInvLineInsertTJP(var PurchInvLine: Record "Purch. Inv. Line"; var PurchInvHeader: Record "Purch. Inv. Header")
    var
        CompanyInformationRec: Record "Company Information";
    begin
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;

        PurchInvLine."Buy-from Vend. Name TJP" := PurchInvHeader."Buy-from Vendor Name";
    end;
}