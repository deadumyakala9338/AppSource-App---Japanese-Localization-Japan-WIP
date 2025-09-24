#if AppSource
pageextension 70658592 FixedAssetListTJP extends "Fixed Asset List"
#endif
#if OnPremise
pageextension 99016 FixedAssetListTJP extends "Fixed Asset List"
#endif
{
    actions
    {
        // modify(CalculateDepreciation)        // 2024-11-22 Anada
        // {                                    // 2024-11-22 Anada
        //     Visible = false;                 // 2024-11-22 Anada
        // }                                    // 2024-11-22 Anada
        addafter(CalculateDepreciation)
        {
            action(CalculateDepreciationTJP)
            {
                ApplicationArea = FixedAssets;
                Caption = 'Calculate Depreciation (Japanese Depreciation Method)';
                Ellipsis = true;
                Image = CalculateDepreciation;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Calculate depreciation according to conditions that you specify. If the related depreciation book is set up to integrate with the general ledger, then the calculated entries are transferred to the fixed asset general ledger journal. Otherwise, the calculated entries are transferred to the fixed asset journal. You can then review the entries and post the journal.';

                trigger OnAction()
                begin
                    REPORT.RunModal(REPORT::"Calculate Depreciation TJP", true, false, Rec);
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        CompanyInformationRec: Record "Company Information";
    begin
        CompanyInformationRec.Get();
        //if StrPos(CompanyInformationRec."Country/Region Code", 'JP') = 1 then
        //TheCompanyIsInJapan := true
        //else
        //TheCompanyIsInJapan := false;
    end;

    var
    //TheCompanyIsInJapan: Boolean;
}