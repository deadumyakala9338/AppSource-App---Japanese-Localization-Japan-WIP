#if AppSource
page 70658578 "Vendor Promissory Note TJP"
#endif
#if OnPremise
page 99003 "Vendor Promissory Note TJP"
#endif
{
    Caption = 'Vendor Promissory Note';
    PageType = Card;
    SourceTable = "Promissory Note TJP";
    SourceTableView = SORTING("Issuer Type", "No.")
                      WHERE("Issuer Type" = CONST(Vendor));
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
                    Caption = 'Vendor No.';
                    ToolTip = 'Specifies the Issuer No. for Vendor promissory note.';
                }
                field("Issuer Name"; Rec."Issuer Name")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Name';
                    ToolTip = 'Specifies the Issuer Name for Vendor promissory note.';
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
                    ToolTip = 'Specifies the total amount that the Vendor promissory note entry consists of.';
                }
                field(Endorser; Rec.Endorser)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the endorser of Vendor promissory note.';
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
                    ToolTip = 'Specifies type of promissory entry.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the Customer bank account code for this Vendor promissory note.';
                }
                field("Transaction Status"; Rec."Transaction Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the Customer bank account name for this Vendor promissory note.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Convert as Issue")
            {
                Caption = 'Convert as Issue';
                ToolTip = 'Specifies the Convert promissory note status to Issue.';
                ApplicationArea = Basic, Suite;
                Image = IssueFinanceCharge;

                trigger OnAction()
                var
                    PNTemp: Record "Promissory Note TJP";
                    Convert: Report "Journalize P-Note Trans. TJP";
                begin
                    CurrPage.SetSelectionFilter(PNTemp);
                    Convert.SetTableView(PNTemp);
                    Convert.SetParameter(Rec."Document Status"::"Note Issued".AsInteger());
                    Convert.Run();
                end;
            }
            action("Convert as Due Date Bank-Out")
            {
                Caption = 'Convert as Due Date Bank-Out';
                ToolTip = 'Specifies the Convert promissory note status to Issue Due Date Bank-Out.';
                ApplicationArea = Basic, Suite;
                Image = ExportToBank;

                trigger OnAction()
                var
                    PNTemp: Record "Promissory Note TJP";
                    Convert: Report "Journalize P-Note Trans. TJP";
                begin
                    CurrPage.SetSelectionFilter(PNTemp);
                    Convert.SetTableView(PNTemp);
                    Convert.SetParameter(Rec."Document Status"::"Cash Paid".AsInteger());
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