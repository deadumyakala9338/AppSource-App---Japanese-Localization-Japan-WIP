/* -------------------------------------------------------------------------------------------------
December, 2021  Tectura Japan K.K. / Anada, Masamichi
    
    Send telemetry data to Azure Application Insight
    (for Japanese Localization (Japan))
------------------------------------------------------------------------------------------------- */
#if AppSource
codeunit 70658582 "Event Subscriber Jp Lz TJP"
{
    //[EventSubscriber(ObjectType::Codeunit, Codeunit::LogInManagement, 'OnAfterLogInEnd', '', true, true)]
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"System Initialization", 'OnAfterLogin', '', true, true)]
    local procedure "Send Telemetry Data OnAfterLogInEnd Event"()
    var
        NAVAppInstalledApp: Record "NAV App Installed App";
        Company: Record Company;
        CompanyInformation: Record "Company Information";
        AppSrcAppSubChkJpLzTJP: Codeunit "AppSrc App Sub Chk Jp Lz TJP";
        URL: Text;
        CustomerName: Text;
        WithOrWithoutSubscription: Text;
        BaseApplicationVersion: Text;
        CompanyDisplayName: Text;
        CustomDimensions: Dictionary of [Text, Text];
        NoCompanyDisplayNameLbl: Label '(No Company Display Name)', Locked = true;
    begin
        // URL
        URL := System.GetUrl(ClientType::Current);
        if URL = '' then
            exit;
        CustomDimensions.Add('URL', URL);
        // Subscription Status & Customer Name
        if AppSrcAppSubChkJpLzTJP.ThisTenantHasTheSubscription(URL, CustomerName) = true then begin
            WithOrWithoutSubscription := 'With Subscription';
            CustomDimensions.Add('Result', 'OK');
            CustomDimensions.Add('Reason', 'Subscribed');
        end
        else begin
            WithOrWithoutSubscription := 'Without Subscription';
            CustomDimensions.Add('Result', 'NG');
            CustomDimensions.Add('Reason', 'Not Subscribed');
        end;
        // Base Application Version
        if NAVAppInstalledApp.Get('437dbf0e-84ff-417a-965d-ed2bb9650972') = true then begin
            BaseApplicationVersion := Format(NAVAppInstalledApp."Version Major") + '.' + Format(NAVAppInstalledApp."Version Minor")
                              + '.' + Format(NAVAppInstalledApp."Version Build") + '.' + Format(NAVAppInstalledApp."Version Revision");
            CustomDimensions.Add('Base Application Version', BaseApplicationVersion);
        end;
        // Company Name & Company Display Name
        CustomDimensions.Add('Company Name', CompanyName);
        if Company.Get(CompanyName) then begin
            if Company."Display Name" <> '' then
                CompanyDisplayName := Company."Display Name"
            else
                CompanyDisplayName := NoCompanyDisplayNameLbl;
            CustomDimensions.Add('Company Display Name', CompanyDisplayName);
        end;
        if CompanyInformation.Get() then
            if (WithOrWithoutSubscription = 'With Subscription') and (StrPos(CompanyInformation."Country/Region Code", 'JP') <> 1) then
                exit;
        //
        LogMessage('Log-In TJP', 'Successful Log-In' + ' | ' + WithOrWithoutSubscription + ' | ' + 'Customer Name: ' + CustomerName, Verbosity::Normal, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, CustomDimensions);
    end;
}
#endif

#if OnPremise
codeunit 99005 "Event Subscriber Jp Lz TJP"
{
    //[EventSubscriber(ObjectType::Codeunit, Codeunit::LogInManagement, 'OnAfterLogInEnd', '', true, true)]
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"System Initialization", 'OnAfterLogin', '', true, true)]
    local procedure "Send Telemetry Data OnAfterLogInEnd Event"()
    var
        NAVAppInstalledApp: Record "NAV App Installed App";
        Company: Record Company;
        CompanyInformation: Record "Company Information";
        AppSrcAppSubChkJpLzTJP: Codeunit "AppSrc App Sub Chk Jp Lz TJP";
        URL: Text;
        CustomerName: Text;
        WithOrWithoutSubscription: Text;
        BaseApplicationVersion: Text;
        CompanyDisplayName: Text;
        CustomDimensions: Dictionary of [Text, Text];
        NoCompanyDisplayNameLbl: Label '(No Company Display Name)', Locked = true;
    begin
        // URL
        URL := System.GetUrl(ClientType::Current);
        if URL = '' then
            exit;
        CustomDimensions.Add('URL', URL);
        // Subscription Status & Customer Name
        if AppSrcAppSubChkJpLzTJP.ThisTenantHasTheSubscription(URL, CustomerName) = true then begin
            WithOrWithoutSubscription := 'With Subscription';
            CustomDimensions.Add('Result', 'OK');
            CustomDimensions.Add('Reason', 'Subscribed');
        end
        else begin
            WithOrWithoutSubscription := 'Without Subscription';
            CustomDimensions.Add('Result', 'NG');
            CustomDimensions.Add('Reason', 'Not Subscribed');
        end;
        // Base Application Version
        if NAVAppInstalledApp.Get('437dbf0e-84ff-417a-965d-ed2bb9650972') = true then begin
            BaseApplicationVersion := Format(NAVAppInstalledApp."Version Major") + '.' + Format(NAVAppInstalledApp."Version Minor")
                              + '.' + Format(NAVAppInstalledApp."Version Build") + '.' + Format(NAVAppInstalledApp."Version Revision");
            CustomDimensions.Add('Base Application Version', BaseApplicationVersion);
        end;
        // Company Name & Company Display Name
        CustomDimensions.Add('Company Name', CompanyName);
        if Company.Get(CompanyName) then begin
            if Company."Display Name" <> '' then
                CompanyDisplayName := Company."Display Name"
            else
                CompanyDisplayName := NoCompanyDisplayNameLbl;
            CustomDimensions.Add('Company Display Name', CompanyDisplayName);
        end;
        if CompanyInformation.Get() then
            if (WithOrWithoutSubscription = 'With Subscription') and (StrPos(CompanyInformation."Country/Region Code", 'JP') <> 1) then
                exit;
        //
        LogMessage('Log-In TJP', 'Successful Log-In' + ' | ' + WithOrWithoutSubscription + ' | ' + 'Customer Name: ' + CustomerName, Verbosity::Normal, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, CustomDimensions);
    end;
}
#endif