#if AppSource
codeunit 70658598 "Notif At Role Center Jp Lz TJP"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Role Center Notification Mgt.", 'OnBeforeShowNotifications', '', true, true)]
    local procedure CodeunitRoleCenterNotificationMgtOnBeforeShowNotifications()
    var
        AppSrcAppSubChkJpLgTJP: Codeunit "AppSrc App Sub Chk Jp Lz TJP";
        NotifcationMessage: Notification;
        URL: Text;
        CustomerName: Text;
        NotificationMessageMsg: Label 'このテナントはまだテクトラのアプリをサブスクライブしていません (Japanese Localization (Japan))。サブスクリプションのためには、株式会社テクトラジャパンに連絡してください。| This tenant has not subscribed to the app by Tectura (Japanese Localization (Japan)). For subscription, please contact Tectura Japan K.K.', Locked = true;
    begin
        if AppSrcAppSubChkJpLgTJP.ThisTenantHasTheSubscription(URL, CustomerName) = true then
            exit
        else begin
            NotifcationMessage.Message(NotificationMessageMsg);
            NotifcationMessage.Send();
        end
    end;
}
#endif

#if OnPremise
codeunit 99011 "Notif At Role Center Jp Lz TJP"
{
}
#endif