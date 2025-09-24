page 70658777 "Transfer Lines TJP"
{
    Caption = 'Transfer Order Lines';
    PageType = List;
    SourceTable = "Transfer Line";
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
                field("Document No"; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Style = Strong;
                    ToolTip = 'TBD', Locked = true;
                    trigger OnDrillDown()
                    var
                        TransferHeader: Record "Transfer Header";
                    begin
                        TransferHeader.SetCurrentKey("No.");
                        TransferHeader.SetAscending("No.", false);
                        TransferHeader.SetRange("No.", Rec."Document No.");
                        Page.Run(Page::"Transfer Order", TransferHeader);
                    end;
                }
                field("Transfer-from Code"; Rec."Transfer-from Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Transfer-from Name TJP"; Rec."Transfer-from Name TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Transfer-from Name 2 TJP"; Rec."Transfer-from Name 2 TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Transfer-from Address TJP"; Rec."Transfer-from Address TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Transfer-from Address 2 TJP"; Rec."Transfer-from Address 2 TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Transfer-from Post Code TJP"; Rec."Transfer-from Post Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Transfer-from City TJP"; Rec."Transfer-from City TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Transfer-from County TJP"; Rec."Transfer-from County TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Trsf.-from CountryReg Code TJP"; Rec."Trsf.-from CountryReg Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Transfer-to Code"; Rec."Transfer-to Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Transfer-to Name TJP"; Rec."Transfer-to Name TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Transfer-to Name 2 TJP"; Rec."Transfer-to Name 2 TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Transfer-to Address TJP"; Rec."Transfer-to Address TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Transfer-to Address 2 TJP"; Rec."Transfer-to Address 2 TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Transfer-to Post Code TJP"; Rec."Transfer-to Post Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Transfer-to City TJP"; Rec."Transfer-to City TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Transfer-to County TJP"; Rec."Transfer-to County TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Trsf.-to CountryReg Code TJP"; Rec."Trsf.-to CountryReg Code TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Posting Date TJP"; Rec."Posting Date TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Assigned User ID TJP"; Rec."Assigned User ID TJP")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                    begin
                        Item.SetCurrentKey("No.");
                        Item.SetAscending("No.", false);
                        Item.SetRange("No.", Rec."Item No.");
                        Page.Run(Page::"Item Card", Item);
                    end;
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
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Qty. to Ship"; Rec."Qty. to Ship")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Qty. to Receive"; Rec."Qty. to Receive")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Quantity Shipped"; Rec."Quantity Shipped")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Quantity Received"; Rec."Quantity Received")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("In-Transit Code"; Rec."In-Transit Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Qty. in Transit (Base)"; Rec."Qty. in Transit (Base)")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Receipt Date"; Rec."Receipt Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Direct Transfer"; Rec."Direct Transfer")
                {
                    ApplicationArea = All;
                    ToolTip = 'TBD', Locked = true;
                }
                field("Item Category Code"; Rec."Item Category Code")
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
                    TransferHeader: Record "Transfer Header";
                    TransferOrder: Page "Transfer Order";
                begin
                    TransferHeader.SetRange("No.", Rec."Document No.");
                    if TransferHeader.FindFirst() then begin
                        TransferOrder.SetTableView(TransferHeader);
                        TransferOrder.RunModal();
                    end;
                end;

            }
        }
    }

    trigger OnInit()
    var
        CompanyInfo: Record "Company Information";
        OnlyAvailableInJapanMsg: Label 'This page is only available for companies in Japan.';
    begin
        // Exit if the company's country/region is not Japan
        CompanyInfo.Get();
        if StrPos(CompanyInfo."Country/Region Code", 'JP') <> 1 then begin
            Message(OnlyAvailableInJapanMsg);
            Error('');
        end;
    end;
}
