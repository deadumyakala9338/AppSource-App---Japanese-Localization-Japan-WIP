#if AppSource
page 70658742 "Purchase Lines Archive TJP"
#endif
#if OnPremise
page 99025 "Purchase Lines Archive TJP"
#endif
{
    Caption = 'Purchase Lines Archive';
    PageType = List;
    SourceTable = "Purchase Line Archive";
    UsageCategory = Lists;
    ApplicationArea = All;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    Style = Strong;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Style = Strong;
                    ToolTip = 'TBD', Locked = true;

                    trigger OnDrillDown()
                    var
                        PurchaseHeaderArchive: Record "Purchase Header Archive";
                    begin
                        if (Rec."Document Type" = Rec."Document Type"::Quote) then begin
                            PurchaseHeaderArchive.SetCurrentKey("No.");
                            PurchaseHeaderArchive.SetAscending("No.", false);
                            PurchaseHeaderArchive.SetRange("No.", Rec."Document No.");
                            Page.Run(Page::"Purchase Quote Archive", PurchaseHeaderArchive);
                        end;
                        if (Rec."Document Type" = Rec."Document Type"::Order) then begin
                            PurchaseHeaderArchive.SetCurrentKey("No.");
                            PurchaseHeaderArchive.SetAscending("No.", false);
                            PurchaseHeaderArchive.SetRange("No.", Rec."Document No.");
                            Page.Run(Page::"Purchase Order Archive", PurchaseHeaderArchive);
                        end;
                    end;
                }
                field("Version No."; Rec."Version No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;

                    trigger OnDrillDown()
                    var
                        Vendor: Record Vendor;
                    begin
                        Vendor.SetCurrentKey("No.");
                        Vendor.SetAscending("No.", false);
                        Vendor.SetRange("No.", Rec."Buy-from Vendor No.");
                        Page.Run(Page::"Vendor Card", Vendor);
                    end;
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
                field("Document Date TJP"; Rec."Document Date TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Posting Date TJP"; Rec."Posting Date TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Due Date TJP"; Rec."Due Date TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Requested Receipt Date"; Rec."Requested Receipt Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Promised Receipt Date"; Rec."Promised Receipt Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Vendor Invoice No. TJP"; Rec."Vendor Invoice No. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Assigned User ID TJP"; Rec."Assigned User ID TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Status TJP"; Rec."Status TJP")
                {
                    ApplicationArea = All;
                    Style = Strong;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Type"; Rec."Type")
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
                        Item: Record Item;
                    begin
                        Item.SetCurrentKey("No.");
                        Item.SetAscending("No.", false);
                        Item.SetRange("No.", Rec."No.");
                        Page.Run(Page::"Item Card", Item);
                    end;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                    Visible = false;
                }
                field("Item Reference No."; Rec."Item Reference No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
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
                    Visible = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Purchaser Code TJP"; Rec."Purchaser Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;

                    trigger OnDrillDown()
                    var
                        SalespersonPurchaser: Record "Salesperson/Purchaser";
                    begin
                        SalespersonPurchaser.SetCurrentKey(Code);
                        SalespersonPurchaser.SetAscending(Code, false);
                        SalespersonPurchaser.SetRange(Code, Rec."Purchaser Code TJP");
                        Page.Run(Page::"Salespersons/Purchasers", SalespersonPurchaser);
                    end;
                }
                field("Purchaser Name TJP"; Rec."Purchaser Name TJP")
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
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Qty. to Receive"; Rec."Qty. to Receive")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Quantity Received"; Rec."Quantity Received")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Qty. to Invoice"; Rec."Qty. to Invoice")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Quantity Invoiced"; Rec."Quantity Invoiced")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Outstanding Amount"; Rec."Outstanding Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Outstanding Amount (LCY)"; Rec."Outstanding Amount (LCY)")
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
            action(OpenDocument)
            {
                Image = ShowChart;
                ApplicationArea = all;
                Caption = 'Open Document';
                ToolTip = 'TBD', Locked = true;

                trigger OnAction()
                var
                    PurchaseHeaderArchive: Record "Purchase Header Archive";
                    PurchaseQuoteArchive: Page "Purchase Quote Archive";
                    PurchaseOrderArchive: Page "Purchase Order Archive";
                begin
                    if (Rec."Document Type" = Rec."Document Type"::Quote) then begin
                        PurchaseHeaderArchive.SetRange("No.", Rec."Document No.");
                        if PurchaseHeaderArchive.FindFirst() then begin
                            PurchaseQuoteArchive.SetTableView(PurchaseHeaderArchive);
                            PurchaseQuoteArchive.RunModal();
                        end;
                    end;
                    if (Rec."Document Type" = Rec."Document Type"::Order) then begin
                        PurchaseHeaderArchive.SetRange("No.", Rec."Document No.");
                        if PurchaseHeaderArchive.FindFirst() then begin
                            PurchaseOrderArchive.SetTableView(PurchaseHeaderArchive);
                            PurchaseOrderArchive.RunModal();
                        end;
                    end;
                end;
            }

            action(OpenVendor)
            {
                Image = Vendor;
                ApplicationArea = all;
                Caption = 'Open Vendor';
                ToolTip = 'TBD', Locked = true;

                trigger OnAction()
                var
                    Vendor: Record "Vendor";
                    VendorCard: Page "Vendor Card";
                begin
                    Vendor.SetRange("No.", Rec."Buy-from Vendor No.");
                    if Vendor.FindFirst() then begin
                        VendorCard.SetTableView(Vendor);
                        VendorCard.RunModal();
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