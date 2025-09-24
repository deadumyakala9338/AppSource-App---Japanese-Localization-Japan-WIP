#if AppSource
page 70658744 "Whse. Rcpt. Lines TJP"
#endif
#if OnPremise
page 99027 "Whse. Rcpt. Lines TJP"
#endif
{
    Caption = 'Warehouse Receipt Lines';
    PageType = List;
    SourceTable = "Warehouse Receipt Line";
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
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                    trigger OnDrillDown()
                    var
                        WarehouseReceiptHeader: Record "Warehouse Receipt Header";
                    begin
                        WarehouseReceiptHeader.SetCurrentKey("No.");
                        WarehouseReceiptHeader.SetAscending("No.", false);
                        WarehouseReceiptHeader.SetRange("No.", Rec."No.");
                        Page.Run(Page::"Warehouse Receipt", WarehouseReceiptHeader);
                    end;
                }
                field("Source Document"; Rec."Source Document")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Source No."; Rec."Source No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;

                    trigger OnDrillDown()
                    var
                        PurchaseHeader: Record "Purchase Header";
                        TransferHeader: Record "Transfer Header";
                    begin
                        if (Rec."Source Document" = Rec."Source Document"::"Purchase Order") then begin
                            PurchaseHeader.SetCurrentKey("No.");
                            PurchaseHeader.SetAscending("No.", false);
                            PurchaseHeader.SetRange("No.", Rec."Source No.");
                            Page.Run(Page::"Purchase Order", PurchaseHeader);
                        end;
                        if (Rec."Source Document" = Rec."Source Document"::"Inbound Transfer") then begin
                            TransferHeader.SetCurrentKey("No.");
                            TransferHeader.SetAscending("No.", false);
                            TransferHeader.SetRange("No.", Rec."Source No.");
                            Page.Run(Page::"Transfer Order", TransferHeader);
                        end;
                    end;
                }
                field("Buy-from Vendor No. TJP"; Rec."Buy-from Vendor No. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Buy-from Vendor Name TJP"; Rec."Buy-from Vendor Name TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Buy-from Vendor Name 2 TJP"; Rec."Buy-from Vendor Name 2 TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                    Visible = false;
                }
                field("Posting Date TJP"; Rec."Posting Date TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Order Date TJP"; Rec."Order Date TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                    Visible = false;
                }
                field("Requested Receipt Date TJP"; Rec."Requested Receipt Date TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Promised Receipt Date TJP"; Rec."Promised Receipt Date TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Purchaser Code TJP"; Rec."Purchaser Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Purchaser Name TJP"; Rec."Purchaser Name TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Assigned User ID TJP"; Rec."Assigned User ID TJP")
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
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Qty. to Receive"; Rec."Qty. to Receive")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Qty. Received"; Rec."Qty. Received")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Qty. Outstanding"; Rec."Qty. Outstanding")
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
                Caption = 'Open Purchase Order';
                ToolTip = 'TBD', Locked = true;

                trigger OnAction()
                var
                    PurchaseHeader: Record "Purchase Header";
                    PurchaseOrder: Page "Purchase Order";
                begin
                    PurchaseHeader.SetRange("Document Type", PurchaseHeader."Document Type"::Order);
                    PurchaseHeader.SetRange("No.", Rec."Source No.");
                    if PurchaseHeader.FindFirst() then begin
                        PurchaseOrder.SetTableView(PurchaseHeader);
                        PurchaseOrder.RunModal();
                    end;
                end;
            }

            action(OpenWhseReceipt)
            {
                Image = Warehouse;
                ApplicationArea = all;
                Caption = 'Open Warehouse Receipt';
                ToolTip = 'TBD', Locked = true;

                trigger OnAction()
                var
                    WarehouseReceiptHeader: Record "Warehouse Receipt Header";
                    WarehouseReceipt: Page "Warehouse Receipt";
                begin
                    WarehouseReceiptHeader.SetRange("No.", Rec."No.");
                    if WarehouseReceiptHeader.FindFirst() then begin
                        WarehouseReceipt.SetTableView(WarehouseReceiptHeader);
                        WarehouseReceipt.RunModal();
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