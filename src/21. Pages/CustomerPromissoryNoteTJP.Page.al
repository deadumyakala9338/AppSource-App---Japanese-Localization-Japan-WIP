#if AppSource
page 70658576 "Customer Promissory Note TJP"
#endif
#if OnPremise
page 99001 "Customer Promissory Note TJP"
#endif
{
    Caption = 'Customer Promissory Note';
    PageType = Card;
    SourceTable = "Promissory Note TJP";
    SourceTableView = SORTING("Issuer Type", "No.")
                      WHERE("Issuer Type" = CONST(Customer));
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Issuer No."; Rec."Issuer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                    ToolTip = 'Specifies the Issuer No. for customer promissory note.';
                }
                field("Issuer Name"; Rec."Issuer Name")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                    ToolTip = 'Specifies the Issuer No. for customer promissory note.';
                }
                field("Customer Bank Account Code"; Rec."Customer Bank Account Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Customer bank account code for this customer promissory note.';
                }
                field("Customer Bank Name"; Rec."Customer Bank Name")
                {
                    ApplicationArea = All;
                    DrillDown = false;
                    ToolTip = 'Specifies the Customer bank account name for this customer promissory note.';
                }
                field("Bank Account Code"; Rec."Bank Account Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number used by the bank for the bank account.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = All;
                    DrillDown = false;
                    ToolTip = 'Specifies the name of the bank where you have the bank account.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    ToolTip = 'Specifies the total amount that the promissory note entry consists of.';
                }
                field(Endorser; Rec.Endorser)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the endorser of customer promissory note.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the posting of the promissory document will be recorded.';
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the issuing of the promissory document will be recorded.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies when the related promissory note entry must be paid.';
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies to which general ledger account is selected for.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies type of promissory entry';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the document status for customer promissory note.';
                }
                field("Transaction Status"; Rec."Transaction Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the Customer bank account name for this customer promissory note.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Convert as Receiving")
            {
                Caption = 'Convert as Receiving';
                ToolTip = 'Specifies the Convert promissory note status to receiving.';
                ApplicationArea = Basic, Suite;
                Image = "CopyDocument";

                trigger OnAction()
                var
                    PNote: Record "Promissory Note TJP";
                    Convert: Report "Journalize P-Note Trans. TJP";
                begin
                    CurrPage.SetSelectionFilter(PNote);
                    Convert.SetTableView(PNote);
                    Convert.SetParameter(Rec."Document Status"::"Note Received".AsInteger());
                    Convert.Run();
                end;
            }
            action("Convert as Due Date Cash-In")
            {
                Caption = 'Convert as Due Date Cash-In';
                ToolTip = 'Specifies the Convert promissory note status to Due Date Cash-In.';
                ApplicationArea = Basic, Suite;
                Image = CashFlow;

                trigger OnAction()
                var
                    PNote: Record "Promissory Note TJP";
                    Convert: Report "Journalize P-Note Trans. TJP";
                begin
                    CurrPage.SetSelectionFilter(PNote);
                    Convert.SetTableView(PNote);
                    Convert.SetParameter(Rec."Document Status"::"Cash Received".AsInteger());
                    Convert.Run();
                end;
            }
            action("Discounted")
            {
                Caption = 'Discounted';
                ToolTip = 'Specifies the Convert promissory note status to Discounted.';
                ApplicationArea = Basic, Suite;
                Image = Discount;

                trigger OnAction()
                var
                    PNote: Record "Promissory Note TJP";
                    Convert: Report "Journalize P-Note Trans. TJP";
                begin
                    Rec.CheckDocumentStatusError(PNote);
                    CurrPage.SetSelectionFilter(PNote);
                    Convert.SetTableView(PNote);
                    Convert.SetParameter(Rec."Document Status"::Discounted.AsInteger());
                    Convert.Run();
                end;
            }
            action("Discounted (Due Date)")
            {
                Caption = 'Discounted (Due Date)';
                ToolTip = 'Specifies the Convert promissory note status to Discounted (Due Date).';
                ApplicationArea = Basic, Suite;
                Image = LineDiscount;

                trigger OnAction()
                var
                    PNote: Record "Promissory Note TJP";
                    Convert: Report "Journalize P-Note Trans. TJP";
                begin
                    CurrPage.SetSelectionFilter(PNote);
                    Convert.SetTableView(PNote);
                    Convert.SetParameter(Rec."Document Status"::"Due Date Discounted".AsInteger());
                    Convert.Run();
                end;
            }
            action("Dishonored")
            {
                Caption = 'Dishonored';
                ToolTip = 'Specifies the Convert promissory note status to Dishonored.';
                ApplicationArea = Basic, Suite;
                Image = Closed;

                trigger OnAction()
                var
                    PNote: Record "Promissory Note TJP";
                    Convert: Report "Journalize P-Note Trans. TJP";
                begin
                    Rec.CheckDocumentStatusError(PNote);
                    CurrPage.SetSelectionFilter(PNote);
                    Convert.SetTableView(PNote);
                    Convert.SetParameter(Rec."Document Status"::Dishonored.AsInteger());
                    Convert.Run();
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

