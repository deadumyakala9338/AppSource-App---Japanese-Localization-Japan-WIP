/* -------------------------------------------------------------------------------------------------
2022/02 Tectura Japan K.K. / Anada, Masamichi

    If a posted document, editing is not possible.

------------------------------------------------------------------------------------------------- */
#if AppSource
pageextension 70658668 "Doc Attachment Details TJP" extends "Document Attachment Details"
#endif
#if OnPremise
pageextension 99023 "Doc Attachment Details TJP" extends "Document Attachment Details"
#endif
{
    // trigger OnOpenPage()
    // var
    //     SalesReceivablesSetup: Record "Sales & Receivables Setup";
    //     PurchasePayableSetup: Record "Purchases & Payables Setup";
    //     TableID: Text;
    // begin
    //     TableID := Rec.GetFilter("Table ID");
    //     case TableID of
    //         Format(Database::"Sales Invoice Header"):   // Posted Sales Invoice
    //             begin
    //                 SalesReceivablesSetup.Get('');
    //                 if SalesReceivablesSetup."Allow Attach After Post TJP" = false then
    //                     CurrPage.Editable := false;
    //             end;
    //         Format(Database::"Sales Cr.Memo Header"):   // Posted Sales Cr. Memo
    //             begin
    //                 SalesReceivablesSetup.Get('');
    //                 if SalesReceivablesSetup."Allow Attach After Post TJP" = false then
    //                     CurrPage.Editable := false;
    //             end;
    //         Format(Database::"Purch. Inv. Header"):   // Posted Purchase Invoice
    //             begin
    //                 PurchasePayableSetup.Get('');
    //                 if PurchasePayableSetup."Allow Attach After Post TJP" = false then
    //                     CurrPage.Editable := false;
    //             end;
    //         Format(Database::"Purch. Cr. Memo Hdr."):   // Posted Purchase Cr. Memo
    //             begin
    //                 PurchasePayableSetup.Get('');
    //                 if PurchasePayableSetup."Allow Attach After Post TJP" = false then
    //                     CurrPage.Editable := false;
    //             end;
    //     end;
    // end;
}