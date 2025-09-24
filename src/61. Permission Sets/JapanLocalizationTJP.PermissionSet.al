/* -------------------------------------------------------------------------------------------------
This permission set should have succeeded the permission set with xml, but was released without
 "Assignable" property and thus needed to be left as it is with minimum permission. 
------------------------------------------------------------------------------------------------- */
#if AppSource
permissionset 70658575 "Japan Localization TJP"
#endif
#if OnPremise
permissionset 99000 "Japan Localization TJP"
#endif
{
    Caption = 'Japan Localization';

    Permissions =
        tabledata "Fixed Asset Rates TJP" = R;
}