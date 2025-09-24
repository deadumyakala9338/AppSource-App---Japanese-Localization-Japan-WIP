#if AppSource
permissionset 70658576 "Japan L10N All TJP"
#endif
#if OnPremise
permissionset 99001 "Japan L10N All TJP"
#endif
{
    Assignable = true;
    Caption = 'Japan Localization';

    Permissions =
        tabledata "Bank Fee Setup TJP" = RIMD,
        table "Bank Fee Setup TJP" = X,
        tabledata "Promissory Note TJP" = RIMD,
        table "Promissory Note TJP" = X,
        tabledata "Fixed Asset Rates TJP" = RIMD,
        table "Fixed Asset Rates TJP" = X;
}