#if AppSource
page 70658580 "Fixed Asset Rates TJP"
#endif
#if OnPremise
page 99005 "Fixed Asset Rates TJP"
#endif
{
    Caption = 'Fixed Asset Rates';
    PageType = List;
    SourceTable = "Fixed Asset Rates TJP";
    Editable = true;
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("JPDB Type"; Rec."JPDB Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the depreciation method between 200% and 250% for Japanese declining balance.';
                }
                field("Number of Years"; Rec."Number of Years")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the useful life of the fixed assets.';
                }
                field("Straight-Line Rate"; Rec."Straight-Line Rate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the depreciation percentage of straight line method.';
                }
                field("DB Rate"; Rec."DB Rate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the master data of depreciation rate for Japanese declining balance method.';
                }
                field("Adjust Depreciation"; Rec."Adjust Depreciation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Un-depreciated balance × Depreciation rate under the declining-balance method ("depreciation amount before adjustment")';
                }
                field("Guarantee %"; Rec."Guarantee %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the guaranteed depreciation amount refers to the amount calculated by multiplying the acquisition cost of the fixed asset by the guarantee rate according to its useful life.';
                }
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