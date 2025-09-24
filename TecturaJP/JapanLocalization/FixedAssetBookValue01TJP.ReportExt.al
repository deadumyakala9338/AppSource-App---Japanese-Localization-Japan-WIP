#if AppSource
reportextension 70658584 "Fixed Asset-Book Value 01 TJP" extends "Fixed Asset - Book Value 01"
#endif
#if OnPremise
reportextension 99000 "Fixed Asset-Book Value 01 TJP" extends "Fixed Asset - Book Value 01"
#endif
{
    RDLCLayout = 'TecturaJP\JapanLocalization\FixedAssetBookValue01TJP.rdlc';

    dataset
    {
        add("Fixed Asset")
        {
            column(GroupHeadLineDescriptionTJP; GroupHeadLineDescription)
            {
            }
            column(ColHdr_DepreciationMethodTJP; ColHdr_DepreciationMethodTJPLbl)
            {
            }
            column(ColHdr_DepreciationStartingDateTJP; ColHdr_DepreciationStartingDateTJPLbl)
            {
            }
            column(ColHdr_DepreciationYearsTJP; ColHdr_DepreciationYearsTJPLbl)
            {
            }
            column(ColHdr_DepreciationPercentTJP; ColHdr_DepreciationPercentTJPLbl)
            {
            }
            column(JPDBTypeTJP; JPDBTypeTJP)
            {
            }
            column(DepreciationStartingDateTJP; DepreciationStartingDateTJP)
            {
            }
            column(DepreciationYearsTJP; DepreciationYearsTJP)
            {
            }
            column(DepreciationPercentTJP; DepreciationPercentTJP)
            {
            }
        }
        modify("Fixed Asset")
        {
            trigger OnAfterAfterGetRecord()
            var
                CompanyInformationRec: Record "Company Information";
                FADepreciationBookRec: Record "FA Depreciation Book";
                FAPostingGroup: Record "FA Posting Group";
            begin
                CompanyInformationRec.Get();
                if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
                    exit;
                //
                if CurrentKey = FieldCaption("Fixed Asset"."FA Posting Group") then begin
                    FAPostingGroup.Get(CurrReport."Fixed Asset"."FA Posting Group");
                    GroupHeadLineDescription := FAPostingGroup."Description TJP";
                end
                else
                    GroupHeadLineDescription := '';
                FADepreciationBookRec.Get(CurrReport."Fixed Asset"."No.", DeprBookCode);
                JPDBTypeTJP := Format(FADepreciationBookRec."JPDB Type TJP");
                DepreciationStartingDateTJP := Format(FADepreciationBookRec."Depreciation Starting Date");
                if DepreciationStartingDateTJP <> '' then
                    DepreciationYearsTJP := Format(FADepreciationBookRec."Depreciation Years TJP")
                else
                    DepreciationYearsTJP := '';
                case FADepreciationBookRec."Depreciation Method" of
                    FADepreciationBookRec."Depreciation Method"::"Straight-Line":
                        DepreciationPercentTJP := Format(FADepreciationBookRec."Straight-Line %");
                    FADepreciationBookRec."Depreciation Method"::"Declining-Balance 1":
                        DepreciationPercentTJP := Format(FADepreciationBookRec."Declining-Balance %");
                end;
            end;
        }
    }

    var
        GroupHeadLineDescription: Text;
        ColHdr_DepreciationMethodTJPLbl: Label 'Depreciation Method';
        ColHdr_DepreciationStartingDateTJPLbl: Label 'Depreciation Starting Date';
        ColHdr_DepreciationYearsTJPLbl: Label 'Depreciation Years';
        ColHdr_DepreciationPercentTJPLbl: Label 'Depreciation Percent';
        JPDBTypeTJP: Text;
        DepreciationStartingDateTJP: Text;
        DepreciationYearsTJP: Text;
        DepreciationPercentTJP: Text;
}