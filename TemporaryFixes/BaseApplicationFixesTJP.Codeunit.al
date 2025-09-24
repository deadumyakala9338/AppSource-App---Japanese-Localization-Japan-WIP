/// <summary>
/// Codeunit Platform Fixes TJP
/// </summary>
#if AppSource
codeunit 70658585 "Base Application Fixes TJP"
#endif
#if OnPremise
codeunit 99006 "Base Application Fixes TJP"
#endif
{
    //TJP1.00 DHA 2020/09/23 New Object creation

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Service-Quote to Order", 'OnBeforeTransferQuoteLineToOrderLineLoop', '', false, false)]
    /// <summary> 
    /// TJP1.00 2020/09/23 DHA
    /// To skip error while converting Service Quote to Service Order :"The primary key in the reservation entry table can contain only one field, and its type must be integer".
    /// </summary>
    /// <param name="IsHandled">Parameter of type Boolean.</param>
    local procedure SkipServiceOrderLineReservedQtyBaseValidate(var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;
}