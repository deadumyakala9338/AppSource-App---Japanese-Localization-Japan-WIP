#if AppSource
page 70658599 "APIL10N Countries/Regions TJP"
#endif
#if OnPremise
page 99024 "APIL10N Countries/Regions TJP"
#endif
{
    PageType = API;
    Caption = 'Countries/Regions';
    APIPublisher = 'tecturaJP';
    APIGroup = 'japanLocalization';
    APIVersion = 'v1.0';
    EntityName = 'countryRegionTJP';
    EntitySetName = 'countriesRegionsTJP';
    SourceTable = "Country/Region";
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
                field(code; Rec.Code)
                {
                    Caption = 'Code';
                }
                field(addressFormatExtendedTJP; Rec."Address Format (Extended) TJP")
                {
                    Caption = 'Address Format (Extended) TJP';
                }
            }
        }
    }
}