/*----------------------------------------------------------------------------------------------------------------------
  Tectura Japan K.K.   DHA   2023.01.30 : New Object
----------------------------------------------------------------------------------------------------------------------*/
#if AppSource
page 70658743 "Sales Lines Archive TJP"
#endif
#if OnPremise
page 99026 "Sales Lines Archive TJP"
#endif
{
    Caption = 'Sales Lines Archive';
    PageType = List;
    SourceTable = "Sales Line Archive";
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
                        SalesHeaderArchive: Record "Sales Header Archive";
                    begin
                        if (Rec."Document Type" = Rec."Document Type"::Quote) then begin
                            SalesHeaderArchive.SetCurrentKey("No.");
                            SalesHeaderArchive.SetAscending("No.", false);
                            SalesHeaderArchive.SetRange("No.", Rec."Document No.");
                            Page.Run(Page::"Sales Quote Archive", SalesHeaderArchive);
                        end;
                        if (Rec."Document Type" = Rec."Document Type"::Order) then begin
                            SalesHeaderArchive.SetCurrentKey("No.");
                            SalesHeaderArchive.SetAscending("No.", false);
                            SalesHeaderArchive.SetRange("No.", Rec."Document No.");
                            Page.Run(Page::"Sales Order Archive", SalesHeaderArchive);
                        end;
                    end;
                }
                field("Version No."; Rec."Version No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;

                    trigger OnDrillDown()
                    var
                        Customer: Record Customer;
                    begin
                        Customer.SetCurrentKey("No.");
                        Customer.SetAscending("No.", false);
                        Customer.SetRange("No.", Rec."Sell-to Customer No.");
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
                field("Document Date TJP"; Rec."Document Date TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Order Date TJP"; Rec."Order Date TJP")
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
                field("Requested Delivery Date"; Rec."Requested Delivery Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Promised Delivery Date"; Rec."Promised Delivery Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Ext. Document No. TJP"; Rec."Ext. Document No. TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Assigned User ID TJP"; Rec."Assigned User ID TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Salesperson Code TJP"; Rec."Salesperson Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;

                    trigger OnDrillDown()
                    var
                        SalespersonPurchaser: Record "Salesperson/Purchaser";
                    begin
                        SalespersonPurchaser.SetCurrentKey(Code);
                        SalespersonPurchaser.SetAscending(Code, false);
                        SalespersonPurchaser.SetRange(Code, Rec."Salesperson Code TJP");
                        Page.Run(Page::"Salespersons/Purchasers", SalespersonPurchaser);
                    end;
                }
                field("Salesperson Name TJP"; Rec."Salesperson Name TJP")
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
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Qty. to Ship"; Rec."Qty. to Ship")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Quantity Shipped"; Rec."Quantity Shipped")
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
                    SalesHeaderArchive: Record "Sales Header Archive";
                    SalesQuoteArchive: Page "Sales Quote Archive";
                    SalesOrderArchive: Page "Sales Order Archive";
                begin
                    if (Rec."Document Type" = Rec."Document Type"::Quote) then begin
                        SalesHeaderArchive.SetRange("No.", Rec."Document No.");
                        if SalesHeaderArchive.FindFirst() then begin
                            SalesQuoteArchive.SetTableView(SalesHeaderArchive);
                            SalesQuoteArchive.RunModal();
                        end;
                    end;
                    if (Rec."Document Type" = Rec."Document Type"::Order) then begin
                        SalesHeaderArchive.SetRange("No.", Rec."Document No.");
                        if SalesHeaderArchive.FindFirst() then begin
                            SalesOrderArchive.SetTableView(SalesHeaderArchive);
                            SalesOrderArchive.RunModal();
                        end;
                    end;
                end;

            }

            action(OpenCustomer)
            {
                Image = Customer;
                ApplicationArea = all;
                Caption = 'Open Customer';
                ToolTip = 'TBD', Locked = true;

                trigger OnAction()
                var
                    Customer: Record "Customer";
                    CustomerCard: Page "Customer Card";
                begin
                    Customer.SetRange("No.", Rec."Sell-to Customer No.");
                    if Customer.FindFirst() then begin
                        CustomerCard.SetTableView(Customer);
                        CustomerCard.RunModal();
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
