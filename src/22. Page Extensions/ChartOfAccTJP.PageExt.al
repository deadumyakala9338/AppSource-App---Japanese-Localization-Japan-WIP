#if AppSource
pageextension 70658577 ChartOfAccTJP extends "Chart of Accounts"
#endif
#if OnPremise
pageextension 99002 ChartOfAccTJP extends "Chart of Accounts"
#endif
{
    layout
    {
        addafter(Name)
        {
            field("Name (Japanese) TJP"; Rec."Name (Japanese) TJP")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the name of the general ledger account.';
                Width = 35;
                Visible = TheCompanyIsInJapan;
            }
        }
        modify(Control1)
        {
            FreezeColumn = "Name (Japanese) TJP";
        }
    }
    actions
    {
        // addafter("Detail Trial Balance")
        // {
        //     action("Detail Trial Balance TJP")
        //     {
        //         Caption = 'Detail Trial Balance';
        //         ToolTip = 'View a detail trial balance for the general ledger accounts that you specify.';
        //         ApplicationArea = All;
        //         Image = "Report";
        //         Promoted = true;
        //         PromotedCategory = "Report";
        //         PromotedOnly = true;
        //         RunObject = Report "Detail Trial Balance TJP";
        //         Visible = false;
        //         ObsoleteState = Pending;
        //         ObsoleteReason = 'No longer needed';
        //         ObsoleteTag = '23.0';
        //     }
        // }
        // addafter("Trial Balance")
        // {
        //     action("Trial Balance TJP")
        //     {
        //         Caption = 'Trial Balance';
        //         ToolTip = 'View the chart of accounts that have balances and net changes.';
        //         ApplicationArea = All;
        //         Image = "Report";
        //         Promoted = true;
        //         PromotedCategory = "Report";
        //         PromotedOnly = true;
        //         RunObject = Report "Trial Balance TJP";
        //         Visible = false;
        //         ObsoleteState = Pending;
        //         ObsoleteReason = 'No longer needed';
        //         ObsoleteTag = '23.0';
        //     }
        // }
        // addafter("G/L Register")
        // {
        //     action("G/L Register TJP")
        //     {
        //
        //         Caption = 'G/L Register';
        //         ToolTip = 'View posted G/L entries.';
        //         ApplicationArea = All;
        //         Image = "Report";
        //         Promoted = true;
        //         PromotedCategory = "Report";
        //         PromotedOnly = true;
        //         RunObject = Report "G/L Register TJP";
        //         Visible = false;
        //         ObsoleteState = Pending;
        //         ObsoleteReason = 'No longer needed';
        //         ObsoleteTag = '23.0';
        //     }
        // }
    }

    trigger OnOpenPage()
    var
        CompanyInformationRec: Record "Company Information";
    begin
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') = 1 then
            TheCompanyIsInJapan := true
        else
            TheCompanyIsInJapan := false;
    end;

    var
        TheCompanyIsInJapan: Boolean;
}