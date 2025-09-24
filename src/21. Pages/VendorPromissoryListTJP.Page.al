#if AppSource
page 70658577 "Vendor Promissory List TJP"
#endif
#if OnPremise
page 99002 "Vendor Promissory List TJP"
#endif
{
    Caption = 'Vendor Promissory Note List';
    CardPageID = "Vendor Promissory Note TJP";
    UsageCategory = Lists;
    ApplicationArea = All;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "Promissory Note TJP";
    SourceTableView = SORTING("Posting Date")
                      WHERE("Issuer Type" = CONST(Vendor));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(PNoteNoFilter; PNoteNoFilter)
                {
                    ApplicationArea = All;
                    Caption = 'P-Note No. Filter';
                    ToolTip = 'Specifies to filter on promissory note no.';

                    trigger OnValidate()
                    begin
                        PNoteNoFilterOnAfterValidate();
                    end;
                }
                field(NoteStatusFilter; NoteStatusFilter)
                {
                    ApplicationArea = All;
                    Caption = 'Note Status Filter';
                    ToolTip = 'Specifies to filter different promissory note options.';

                    trigger OnValidate()
                    begin
                        NoteStatusFilterOnAfterValidat();
                    end;
                }
                field(DueDateFilter; DueDateFilter)
                {
                    ApplicationArea = All;
                    Caption = 'Due Date Filter';
                    ToolTip = 'Specifies filter for when the related promissory note must be paid.';

                    trigger OnValidate()
                    begin
                        DueDateFilterOnAfterValidate();
                    end;
                }
                field(ShowOnlyMaturedNotes; ShowOnlyMaturedNotes)
                {
                    ApplicationArea = All;
                    Caption = 'Only Matured Notes';
                    ToolTip = 'Specifies to filter on completed promissory notes.';

                    trigger OnValidate()
                    begin
                        ShowOnlyMaturedNotesOnAfterVal();
                    end;
                }
            }
            repeater(Control1)
            {
                Editable = false;
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies type of promissory entry.';
                }
                field("Issuer Type"; Rec."Issuer Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the Issuer Type for Vendor promissory note.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the posting of the promissory document will be recorded.';
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the date when the issuing of the promissory document will be recorded.';
                }
                field("Issuer No."; Rec."Issuer No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the Issuer No. for Vendor promissory note.';
                }
                field("Issuer Name"; Rec."Issuer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Issuer No. for Vendor promissory note.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    Editable = false;
                    ToolTip = 'Specifies the total amount that the Vendor promissory note entry consists of.';
                }
                field("Bank Account Code"; Rec."Bank Account Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the number used by the bank for the bank account.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the name of the bank where you have the bank account.';
                }
                field(Endorser; Rec.Endorser)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the endorser of Vendor promissory note.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies when the related promissory note entry must be paid.';
                }
                field(NoteIsMatured; Rec.NoteIsMatured())
                {
                    ApplicationArea = All;
                    Caption = 'Matured';
                    ToolTip = 'Specifies whether promissory note mature or not.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the document status for Vendor promissory note.';
                }
                field("Transaction Status"; Rec."Transaction Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the transaction status for Vendor promissory note.';
                }
                field("Customer Bank Account Code"; Rec."Customer Bank Account Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Customer bank account code for this Vendor promissory note.';
                }
                field("Customer Bank Name"; Rec."Customer Bank Name")
                {
                    ApplicationArea = All;
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
                ApplicationArea = All;
                Image = IssueFinanceCharge;

                trigger OnAction()
                var
                    PNote: Record "Promissory Note TJP";
                    Convert: Report "Journalize P-Note Trans. TJP";
                begin
                    Rec.TestField("Issuer Type", Rec."Issuer Type"::Vendor);

                    CurrPage.SetSelectionFilter(PNote);
                    Convert.SetTableView(PNote);
                    Convert.SetParameter(Rec."Document Status"::"Note Issued".AsInteger());
                    Convert.Run();

                end;
            }
            action("Convert as Due Date Bank-Out")
            {
                Caption = 'Convert as Due Date Bank-Out';
                ToolTip = 'Specifies the Convert promissory note status to Issue Due Date Bank-Out.';
                ApplicationArea = All;
                Image = ExportToBank;

                trigger OnAction()
                var
                    PNote: Record "Promissory Note TJP";
                    Convert: Report "Journalize P-Note Trans. TJP";
                begin
                    Rec.TestField("Issuer Type", Rec."Issuer Type"::Vendor);

                    CurrPage.SetSelectionFilter(PNote);
                    Convert.SetTableView(PNote);
                    Convert.SetParameter(Rec."Document Status"::"Cash Paid".AsInteger());
                    Convert.Run();

                end;
            }
            action("General Journal")
            {
                ApplicationArea = All;
                Caption = 'General Journals';
                Image = Journal;
                RunObject = Page "General Journal";
                ToolTip = 'Specifies for Promissory Note General Journal Entries';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        xRec := Rec;
        SetCtrlStates();
    end;

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
        //
        //MnuPayablesFunctionsVisible := true;
        //MnuReceivablesFunctionsVisible := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        xRec := Rec;
        SetCtrlStates();
    end;

    var
        PNoteNoFilter: Text[250];
        NoteStatusFilter: Enum "Promissory Note Status TJP";
        DueDateFilter: Text[250];
        ShowOnlyMaturedNotes: Boolean;
    //[InDataSet]  //DHA 2023.112.06
    //MnuReceivablesFunctionsVisible: Boolean;
    //[InDataSet]  //DHA 2023.112.06
    //MnuPayablesFunctionsVisible: Boolean;

    procedure GetRecFilters()
    begin
        if Rec.GetFilters <> '' then begin
            PNoteNoFilter := copystr(Rec.GetFilter("No."), 1, MaxStrLen(PNoteNoFilter));

            if Rec.GetFilter("Document Status") <> '' then
                NoteStatusFilter := Rec."Document Status"
            else
                NoteStatusFilter := NoteStatusFilter::"All Notes";

            DueDateFilter := copystr(Rec.GetFilter("Due Date"), 1, MaxStrLen(DueDateFilter));
        end;
    end;

    procedure SetRecFilters()
    begin
        if PNoteNoFilter <> '' then
            Rec.SetFilter("No.", PNoteNoFilter)
        else
            Rec.SetRange("No.");

        if NoteStatusFilter <> NoteStatusFilter::"All Notes" then
            Rec.SetRange("Document Status", NoteStatusFilter)
        else
            Rec.SetRange("Document Status");

        if DueDateFilter <> '' then
            Rec.SetFilter("Due Date", DueDateFilter)
        else
            Rec.SetRange("Due Date");

        CurrPage.Update();
    end;

    procedure SetCtrlStates()
    begin
        case Rec."Issuer Type" of
        //Rec."Issuer Type"::Customer:
        //begin
        //MnuReceivablesFunctionsVisible := true;
        //MnuPayablesFunctionsVisible := false;
        //end;
        //Rec."Issuer Type"::Vendor:
        //begin
        //MnuReceivablesFunctionsVisible := false;
        //MnuPayablesFunctionsVisible := true;
        //end;
        end;
    end;

    local procedure PNoteNoFilterOnAfterValidate()
    begin
        SetRecFilters();
    end;

    local procedure NoteStatusFilterOnAfterValidat()
    begin
        SetRecFilters();
    end;

    local procedure DueDateFilterOnAfterValidate()
    begin
        SetRecFilters();
    end;

    local procedure ShowOnlyMaturedNotesOnAfterVal()
    begin
        if ShowOnlyMaturedNotes then
            DueDateFilter := '..' + Format(Today)
        else
            Clear(DueDateFilter);

        SetRecFilters();
    end;
}

