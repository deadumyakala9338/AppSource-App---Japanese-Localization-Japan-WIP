#if AppSource
page 70658745 "Whse. Ship. Lines TJP"
#endif
#if OnPremise
page 99028 "Whse. Ship. Lines TJP"
#endif
{
    Caption = 'Warehouse Shipment Lines';
    PageType = List;
    SourceTable = "Warehouse Shipment Line";
    UsageCategory = Lists;
    ApplicationArea = All;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Source Document"; Rec."Source Document")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;

                    trigger OnDrillDown()
                    var
                        WarehouseShipmentHeader: Record "Warehouse Shipment Header";
                    begin
                        WarehouseShipmentHeader.SetCurrentKey("No.");
                        WarehouseShipmentHeader.SetAscending("No.", false);
                        WarehouseShipmentHeader.SetRange("No.", Rec."No.");
                        Page.Run(Page::"Warehouse Shipment", WarehouseShipmentHeader);
                    end;
                }
                field("Source No."; Rec."Source No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;

                    trigger OnDrillDown()
                    var
                        SalesHeader: Record "Sales Header";
                        TransferHeader: Record "Transfer Header";
                    begin
                        if (Rec."Source Document" = Rec."Source Document"::"Sales Order") then begin
                            SalesHeader.SetCurrentKey("No.");
                            SalesHeader.SetAscending("No.", false);
                            SalesHeader.SetRange("No.", Rec."Source No.");
                            Page.Run(Page::"Sales Order", SalesHeader);
                        end;
                        if (Rec."Source Document" = Rec."Source Document"::"Outbound Transfer") then begin
                            TransferHeader.SetCurrentKey("No.");
                            TransferHeader.SetAscending("No.", false);
                            TransferHeader.SetRange("No.", Rec."Source No.");
                            Page.Run(Page::"Transfer Order", TransferHeader);
                        end;
                    end;
                }
                field("Sell-to Customer No. TJP"; Rec."Sell-to Customer No. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;

                    trigger OnDrillDown()
                    var
                        Customer: Record Customer;
                    begin
                        Customer.SetCurrentKey("No.");
                        Customer.SetAscending("No.", false);
                        Customer.SetRange("No.", Rec."Sell-to Customer No. TJP");
                        Page.Run(Page::"Customer Card", Customer);
                    end;
                }
                field("Sell-to Customer Name TJP"; Rec."Sell-to Customer Name TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Sell-to Customer Name 2 TJP"; Rec."Sell-to Customer Name 2 TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                    Visible = false;
                }
                field("Ship-to Code TJP"; Rec."Ship-to Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                    Visible = false;
                }
                field("Ship-to Name TJP"; Rec."Ship-to Name TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Ship-to Name 2 TJP"; Rec."Ship-to Name 2 TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                    Visible = false;
                }
                field("Ship-to Address TJP"; Rec."Ship-to Address TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Ship-to Address 2 TJP"; Rec."Ship-to Address 2 TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                    Visible = false;
                }
                field("Ship-to City TJP"; Rec."Ship-to City TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                    Visible = false;
                }
                field("Ship-to Post Code TJP"; Rec."Ship-to Post Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                    Visible = false;
                }
                field("Ship-to Cntry/Region Code TJP"; Rec."Ship-to Cntry/Region Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                    Visible = false;
                }
                field("Order Date TJP"; Rec."Order Date TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Requested Delivery Date TJP"; Rec."Requested Delivery Date TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Promised Delivery Date TJP"; Rec."Promised Delivery Date TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Posting Date TJP"; Rec."Posting Date TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Ext. Document No. TJP"; Rec."Ext. Document No. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Salesperson Code TJP"; Rec."Salesperson Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Salesperson Name TJP"; Rec."Salesperson Name TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Assigned User ID TJP"; Rec."Assigned User ID TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Shipment Method Code TJP"; Rec."Shipment Method Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;

                    trigger OnDrillDown()
                    var
                        ShipmentMethod: Record "Shipment Method";
                    begin
                        ShipmentMethod.SetCurrentKey(Code);
                        ShipmentMethod.SetAscending(Code, false);
                        ShipmentMethod.SetRange(Code, Rec."Shipment Method Code TJP");
                        Page.Run(Page::"Shipment Methods", ShipmentMethod);
                    end;
                }
                field("Shipment Method Desc. TJP"; Rec."Shipment Method Desc. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Shipping Agent Code TJP"; Rec."Shipping Agent Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Shipping Agent Description TJP"; Rec."Shipping Agent Description TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Ship. Agent Service Code TJP"; Rec."Ship. Agent Service Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Ship. Agent Service Desc. TJP"; Rec."Ship. Agent Service Desc. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Qty. to Ship"; Rec."Qty. to Ship")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Qty. Shipped"; Rec."Qty. Shipped")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Qty. Outstanding"; Rec."Qty. Outstanding")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenSalesDocument)
            {
                Image = ShowChart;
                ApplicationArea = all;
                Caption = 'Open Sales Order';
                ToolTip = 'TBD', Locked = true;

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    SalesOrder: Page "Sales Order";
                begin
                    SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
                    SalesHeader.SetRange("No.", Rec."Source No.");
                    if SalesHeader.FindFirst() then begin
                        SalesOrder.SetTableView(SalesHeader);
                        SalesOrder.RunModal();
                    end;
                end;
            }

            action(OpenWhseShipment)
            {
                Image = Warehouse;
                ApplicationArea = all;
                Caption = 'Open Warehouse Shipment';
                ToolTip = 'TBD', Locked = true;

                trigger OnAction()
                var
                    WarehouseShipmentheader: Record "Warehouse Shipment Header";
                    WarehouseShipment: Page "Warehouse Shipment";
                begin
                    WarehouseShipmentheader.SetRange("No.", Rec."No.");
                    if WarehouseShipmentheader.FindFirst() then begin
                        WarehouseShipment.SetTableView(WarehouseShipmentheader);
                        WarehouseShipment.RunModal();
                    end;
                end;
            }
        }
    }

    trigger OnInit()
    var
        CompanyInformationRec: Record "Company Information";
        OnlyAvailableInJapanMsg: Label 'This page is only available for companies in Japan.';
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then begin
            Message(OnlyAvailableInJapanMsg);
            Error('');
        end;
    end;
}