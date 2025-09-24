#if AppSource
page 70658594 "APIL10N Company Infos TJP"
#endif
#if OnPremise
page 99019 "APIL10N Company Infos TJP"
#endif
{
    PageType = API;
    Caption = 'Company Informations';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'companyInformationTJP';
    EntitySetName = 'companyInformationsTJP';
    SourceTable = "Company Information";
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    Extensible = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'ID';
                }
                field(primaryKey; Rec."Primary Key")
                {
                    Caption = 'Primary Key';
                }
                field(reportingLanguageTJP; Rec."Reporting Language TJP")
                {
                    Caption = 'Reporting Language TJP';
                }
                field(englishNameTJP; Rec."English Name TJP")
                {
                    Caption = 'English Name TJP';
                }
                field(englishName2TJP; Rec."English Name 2 TJP")
                {
                    Caption = 'English Name 2 TJP';
                }
                field(englishAddressTJP; Rec."English Address TJP")
                {
                    Caption = 'English Address TJP';
                }
                field(englishAddress2TJP; Rec."English Address 2 TJP")
                {
                    Caption = 'English Address 2 TJP';
                }
                field(englishCityTJP; Rec."English City TJP")
                {
                    Caption = 'English City TJP';
                }
                field(englishPostCodeTJP; Rec."English Post Code TJP")
                {
                    Caption = 'English Post Code TJP';
                }
                field(englishCountyTJP; Rec."English County TJP")
                {
                    Caption = 'English County TJP';
                }
                field(engCountryRegionCodeTJP; Rec."Eng. Country/Region Code TJP")
                {
                    Caption = 'Eng. Country/Region Code TJP';
                }
                field(chopTJP; Rec."Chop TJP")
                {
                    Caption = 'Chop TJP';
                }
                field(bankAccountHolderNameTJP; Rec."Bank Account Holder Name TJP")
                {
                    Caption = 'Bank Account Holder Name TJP';
                }
            }
        }
    }
}