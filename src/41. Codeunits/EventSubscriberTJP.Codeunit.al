#if AppSource
codeunit 70658576 "Event Subscriber TJP"
#endif
#if OnPremise
codeunit 99001 "Event Subscriber TJP"
#endif
{
    //TJP #01 20201019 Removed With Statement

    [EventSubscriber(ObjectType::Table, 23, 'OnAfterValidateEvent', 'Preferred Bank Account Code', false, false)]
    local procedure OnAfterVendPrefAccCode(var Rec: Record Vendor; var xRec: Record Vendor; CurrFieldNo: Integer)
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF Rec."Preferred Bank Account Code" <> xRec."Preferred Bank Account Code" THEN
            UpdateDefaultVendorBank(Rec);
    end;

    local procedure UpdateDefaultVendorBank(var Vend: Record "Vendor")
    var
        CompanyInformationRec: Record "Company Information";
        VendBank: Record "Vendor Bank Account";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF VendBank.GET(Vend."No.", Vend."Preferred Bank Account Code") THEN
            IF NOT VendBank."Default Bank TJP" THEN BEGIN
                VendBank."Default Bank TJP" := TRUE;
                VendBank.MODIFY();
            END;

        VendBank.SETRANGE("Vendor No.", Vend."No.");
        VendBank.SETFILTER(Code, '<>%1', Vend."Preferred Bank Account Code");
        VendBank.MODIFYALL("Default Bank TJP", FALSE, FALSE);
    end;

    [EventSubscriber(ObjectType::Table, 79, 'OnBeforeValidateEvent', 'English City TJP', false, false)]
    local procedure OnBeforeCompCityValidate(var Rec: Record "Company Information"; var xRec: Record "Company Information"; CurrFieldNo: Integer)
    var
        CompanyInformationRec: Record "Company Information";
        PostCode: Record "Post Code";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        PostCode.ValidateCity(Rec."English City TJP", Rec."English Post Code TJP", Rec."English County TJP", Rec."Eng. Country/Region Code TJP", (CurrFieldNo <> 0) AND GUIALLOWED);
    end;

    [EventSubscriber(ObjectType::Table, 79, 'OnBeforeValidateEvent', 'English Post Code TJP', false, false)]
    local procedure OnBeforeCompPostCodeValidate(var Rec: Record "Company Information"; var xRec: Record "Company Information"; CurrFieldNo: Integer)
    var
        CompanyInformationRec: Record "Company Information";
        PostCode: Record "Post Code";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        PostCode.ValidatePostCode(Rec."English City TJP", Rec."English Post Code TJP", Rec."English County TJP", Rec."Eng. Country/Region Code TJP", (CurrFieldNo <> 0) AND GUIALLOWED);
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnAfterDeleteEvent', '', false, false)]
    local procedure OnAfterDeleteGenJnlLine(var Rec: Record "Gen. Journal Line"; RunTrigger: Boolean)
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF NOT RunTrigger THEN
            EXIT;
        UndoPromissoryNoteStatus(Rec);
    end;

    local procedure UndoPromissoryNoteStatus(var GenJnlLine: Record "Gen. Journal Line")
    var
        CompanyInformationRec: Record "Company Information";
        PNote: Record "Promissory Note TJP";
        PNoteTransStatus: Enum "PNote Transaction Status TJP";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF GenJnlLine."Promissory Note No. TJP" <> '' THEN BEGIN
            PNote.GET(GenJnlLine."PNote Issuer Type TJP", GenJnlLine."Promissory Note No. TJP");
            PNote.VALIDATE("Transaction Status", PNoteTransStatus::" ");
            PNote.MODIFY();
        END;
    end;

    local procedure CheckPromissoryNoteValue(var GenJnlLine: Record "Gen. Journal Line"; FieldNumber: Integer; CurrFieldNo: Integer)
    var
        CompanyInformationRec: Record "Company Information";
        PNote: record "Promissory Note TJP";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF (GenJnlLine."Promissory Note No. TJP" = '') OR (CurrFieldNo = 0) THEN
            EXIT
        ELSE
            PNote.GET(GenJnlLine."PNote Issuer Type TJP", GenJnlLine."Promissory Note No. TJP");

        CASE FieldNumber OF
            GenJnlLine.FIELDNO(GenJnlLine."Document Type"):
                GenJnlLine.TESTFIELD(GenJnlLine."Document Type", GenJnlLine."Document Type"::Payment);
            GenJnlLine.FIELDNO(GenJnlLine.Amount):
                GenJnlLine.TESTFIELD(GenJnlLine.Amount, PNote.Amount);
        END;
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnBeforeValidateEvent', 'Document Type', false, false)]
    local procedure OnBeforeValidateGenJnlLineDocType(var Rec: Record "Gen. Journal Line"; var xRec: Record "Gen. Journal Line"; CurrFieldNo: Integer)
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        CheckPromissoryNoteValue(Rec, Rec.FIELDNO("Document Type"), CurrFieldNo);
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnBeforeValidateEvent', 'Amount', false, false)]
    local procedure OnBeforeValidateGenJnlLineAmount(var Rec: Record "Gen. Journal Line"; var xRec: Record "Gen. Journal Line"; CurrFieldNo: Integer)
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        CheckPromissoryNoteValue(Rec, Rec.FIELDNO(Amount), CurrFieldNo);
    end;

    [EventSubscriber(ObjectType::Table, 81, 'OnAfterValidateEvent', 'Account No.', false, false)]
    local procedure OnAfterValidateGenJnlLineAccNo(var Rec: Record "Gen. Journal Line")
    var
        CompanyInformationRec: Record "Company Information";
        GenFun: Codeunit "General Functions TJP";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        if Rec."Account Type" = Rec."Account Type"::Vendor then
            GenFun.FillInVendorBankField(Rec, Rec."Account No.");
    end;

    [EventSubscriber(ObjectType::Table, 288, 'OnAfterInsertEvent', '', false, false)]
    local procedure VendBankOnInsert(var Rec: Record "Vendor Bank Account"; RunTrigger: Boolean)
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF NOT RunTrigger THEN
            EXIT;
        UpdateVendorPrefBankField(Rec, false);
    end;

    [EventSubscriber(ObjectType::Table, 288, 'OnAfterModifyEvent', '', false, false)]
    local procedure VendBankOnModify(var Rec: Record "Vendor Bank Account"; RunTrigger: Boolean)
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF NOT RunTrigger THEN
            EXIT;

        UpdateVendorPrefBankField(Rec, false);
    end;

    [EventSubscriber(ObjectType::Table, 288, 'OnAfterDeleteEvent', '', false, false)]
    local procedure VendBankOnDelete(var Rec: Record "Vendor Bank Account"; RunTrigger: Boolean)
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF NOT RunTrigger THEN
            EXIT;

        UpdateVendorPrefBankField(Rec, true);
    end;

    local procedure UpdateVendorPrefBankField(var VendBank: Record "Vendor Bank Account"; IsHandled: Boolean)
    var
        CompanyInformationRec: Record "Company Information";
        Vend: Record Vendor;
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF IsHandled THEN BEGIN
            IF Vend.GET(VendBank."Vendor No.") THEN
                IF Vend."Preferred Bank Account Code" = VendBank.Code THEN BEGIN
                    Vend."Preferred Bank Account Code" := '';
                    Vend.MODIFY();
                END;
            EXIT;
        END;

        IF Vend.GET(VendBank."Vendor No.") THEN
            IF VendBank."Default Bank TJP" THEN BEGIN
                Vend."Preferred Bank Account Code" := VendBank.Code;
                Vend.MODIFY();
            END ELSE
                IF Vend."Preferred Bank Account Code" = VendBank.Code THEN BEGIN
                    Vend."Preferred Bank Account Code" := '';
                    Vend.MODIFY();
                END;
    end;

    [EventSubscriber(ObjectType::Table, 288, 'OnAfterValidateEvent', 'Default Bank TJP', false, false)]
    local procedure OnAfterVendBankDefault(var Rec: Record "Vendor Bank Account"; var xRec: Record "Vendor Bank Account"; CurrFieldNo: Integer)
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF Rec."Default Bank TJP" AND IsDefaultVendBankExist(Rec) THEN
            UpdateDefaultVendAccCount(Rec);
        UpdVendorPrefBankField(Rec);
    end;

    local procedure IsDefaultVendBankExist(var VendBank: Record "Vendor Bank Account"): Boolean
    var
        CompanyInformationRec: Record "Company Information";
        VendBank2: Record "Vendor Bank Account";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        VendBank2.SETRANGE("Vendor No.", VendBank."Vendor No.");
        VendBank2.SETFILTER(Code, '<>%1', VendBank.Code);
        VendBank2.SETRANGE("Default Bank TJP", TRUE);
        //EXIT(VendBank2.FINDFIRST());
        if VendBank2.IsEmpty = false then
            exit(true)
        else
            exit(false)
    end;

    local procedure UpdateDefaultVendAccCount(var Rec: Record "Vendor Bank Account")
    var
        CompanyInformationRec: Record "Company Information";
        VendBank: Record "Vendor Bank Account";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        VendBank.Reset();
        VendBank.SetRange("Vendor No.", Rec."Vendor No.");
        VendBank.SetRange("Default Bank TJP", true);
        VendBank.SETFILTER(Code, '<>%1', Rec.Code);
        if VendBank.FindSet() then
            repeat
                VendBank."Default Bank TJP" := false;
                VendBank.Modify();
            until VendBank.Next() = 0;
    end;

    local procedure UpdVendorPrefBankField(var VendBank: Record "Vendor Bank Account")
    var
        CompanyInformationRec: Record "Company Information";
        Vend: Record Vendor;
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF Vend.GET(VendBank."Vendor No.") THEN
            IF VendBank."Default Bank TJP" THEN BEGIN
                Vend."Preferred Bank Account Code" := VendBank.Code;
                Vend.MODIFY();
            END ELSE begin
                Vend."Preferred Bank Account Code" := '';
                Vend.MODIFY();
            end;
    end;

    [EventSubscriber(ObjectType::Page, 39, 'OnAfterValidateEvent', 'AccName', false, false)]
    local procedure GetGLAccNameByLang(var Rec: Record "Gen. Journal Line")
    var
        CompanyInformationRec: Record "Company Information";
        GLAccount: Record "G/L Account";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        if (GlobalLanguage = 1041) and (GLAccount."Name (Japanese) TJP" <> '') then begin
            Rec.Description := GLAccount."Name (Japanese) TJP";
            Rec.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnCodeOnBeforeFinishPosting', '', false, false)]
    local procedure OnAfterGLFinishPosting(var GenJournalLine: Record "Gen. Journal Line"; Balancing: Boolean)
    var
        CompanyInformationRec: Record "Company Information";
        PromissoryNote: Record "Promissory Note TJP";
    Begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF GenJournalLine."Promissory Note No. TJP" <> '' THEN BEGIN
            PromissoryNote.GET(GenJournalLine."PNote Issuer Type TJP", GenJournalLine."Promissory Note No. TJP");
            PromissoryNote."Document Status" := GenJournalLine."Promissory Note Status TJP";
            PromissoryNote."Transaction Status" := PromissoryNote."Transaction Status"::" ";
            PromissoryNote.MODIFY();
        END;
    End;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertVATEntry', '', false, false)]
    local procedure OnBeforeInsertVATEntry(var VATEntry: Record "VAT Entry"; GenJournalLine: Record "Gen. Journal Line")
    var
        CompanyInformationRec: Record "Company Information";
        Cust: Record Customer;
        Vend: Record Vendor;
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        VATEntry.VALIDATE("Bill/Pay-to No. (Extended) TJP", GenJournalLine."Bill-to/Pay-to No.");
        IF GenJournalLine."Bill-to/Pay-to No." <> '' THEN
            CASE VATEntry.Type OF
                VATEntry.Type::Purchase:
                    IF GenJournalLine."VAT Exception TJP" THEN BEGIN
                        VATEntry."No. Type TJP" := VATEntry."No. Type TJP"::Customer;
                        IF Cust.GET(GenJournalLine."Bill-to/Pay-to No.") THEN
                            VATEntry."Country/Region Code" := Cust."Country/Region Code";
                    END ELSE BEGIN
                        VATEntry."No. Type TJP" := VATEntry."No. Type TJP"::Vendor;
                        IF Vend.GET(GenJournalLine."Bill-to/Pay-to No.") THEN
                            VATEntry."Country/Region Code" := Vend."Country/Region Code";
                    END;
                VATEntry.Type::Sale:
                    BEGIN
                        VATEntry."No. Type TJP" := VATEntry."No. Type TJP"::Customer;
                        IF Cust.GET(GenJournalLine."Bill-to/Pay-to No.") THEN
                            VATEntry."Country/Region Code" := Cust."Country/Region Code";
                    END;
            END;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Batch", 'OnBeforeCheckGenPostingType', '', false, false)]
    local procedure OnBeforeCheckGenPostingType(GenJnlLine: Record "Gen. Journal Line"; AccountType: enum "Gen. Journal Account Type"; var IsHandled: Boolean)
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF (AccountType = AccountType::Customer) and
           (GenJnlLine."Gen. Posting Type" = GenJnlLine."Gen. Posting Type"::Purchase) THEN
            GenJnlLine."VAT Exception TJP" := true;
        IF (AccountType = AccountType::Vendor) and
           (GenJnlLine."Gen. Posting Type" = GenJnlLine."Gen. Posting Type"::Sale)
        THEN
            GenJnlLine.FieldError("Gen. Posting Type");
        IF (AccountType = AccountType::Customer) and
           (GenJnlLine."Bal. Gen. Posting Type" = GenJnlLine."Bal. Gen. Posting Type"::Purchase)
        THEN
            GenJnlLine."VAT Exception TJP" := true;
        IF (AccountType = AccountType::Vendor) and
           (GenJnlLine."Bal. Gen. Posting Type" = GenJnlLine."Bal. Gen. Posting Type"::Sale)
        THEN
            GenJnlLine.FieldError("Bal. Gen. Posting Type");
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Check Line", 'OnBeforeCheckAccountType', '', false, false)]
    local procedure OnBeforeCheckAccountType(GenJnlLine: Record "Gen. Journal Line"; var IsHandled: Boolean)
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF (GenJnlLine."Account Type" = GenJnlLine."Account Type"::Customer) and
           (GenJnlLine."Gen. Posting Type" = GenJnlLine."Gen. Posting Type"::Purchase) THEN
            GenJnlLine."VAT Exception TJP" := true;
        IF (GenJnlLine."Account Type" = GenJnlLine."Account Type"::Vendor) and
           (GenJnlLine."Gen. Posting Type" = GenJnlLine."Gen. Posting Type"::Sale)
        THEN
            GenJnlLine.FieldError("Gen. Posting Type");
        IF (GenJnlLine."Account Type" = GenJnlLine."Account Type"::Customer) and
           (GenJnlLine."Bal. Gen. Posting Type" = GenJnlLine."Bal. Gen. Posting Type"::Purchase)
        THEN
            GenJnlLine."VAT Exception TJP" := true;
        IF (GenJnlLine."Account Type" = GenJnlLine."Account Type"::Vendor) and
           (GenJnlLine."Bal. Gen. Posting Type" = GenJnlLine."Bal. Gen. Posting Type"::Sale)
        THEN
            GenJnlLine.FieldError("Bal. Gen. Posting Type");
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Format Address", 'OnAfterFormatAddress', '', false, false)]
    local procedure OnFormatAddrFunction(var AddrArray: array[8] of Text[100]; Name: Text[100]; Name2: Text[100]; Contact: Text[100]; Addr: Text[100]; Addr2: Text[50]; City: Text[50]; PostCode: Code[20]; County: Text[50]; CountryCode: Code[10])
    var
        CompanyInformationRec: Record "Company Information";
        GLSetup: Record "General Ledger Setup";
        Country: Record "Country/Region";
        LTextOnChuTxt: Label '　御中';
        LTextSamaTxt: Label '　様';
        LTextPostSignTxt: Label '〒　';
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        if CountryCode = '' then begin
            GLSetup.Get();
            Clear(Country);
            Country."Address Format (Extended) TJP" := GLSetup."Address Format (Extended) TJP";
        end else
            Country.Get(CountryCode);

        if Country."Address Format (Extended) TJP" = Country."Address Format (Extended) TJP"::" " then
            exit;

        Clear(AddrArray);

        case Country."Address Format (Extended) TJP" of
            Country."Address Format (Extended) TJP"::"Japanese - Other":
                begin
                    Clear(AddrArray);
                    if PostCode <> '' then
                        AddrArray[1] := LTextPostSignTxt + PostCode;
                    if StrLen(County + City + Addr) <= MaxStrLen(AddrArray[2]) then begin
                        AddrArray[2] := copystr((County + City + Addr), 1, MaxStrLen(AddrArray[2]));
                        AddrArray[3] := Addr2;
                    end else begin
                        AddrArray[2] := copystr(DelStr(County + City, MaxStrLen(AddrArray[2]) + 1), 1, MaxStrLen(AddrArray[2]));
                        if StrLen(Addr + Addr2) > MaxStrLen(AddrArray[3]) then begin
                            AddrArray[3] := Addr;
                            AddrArray[4] := Addr2;
                        end else
                            AddrArray[3] := copystr((Addr + Addr2), 1, MaxStrLen(AddrArray[3]));
                    end;
                    AddrArray[5] := Name;
                    if Name2 <> '' then begin
                        if Contact <> '' then
                            AddrArray[6] := Name2
                        else
                            AddrArray[6] := copystr((Name2 + LTextOnChuTxt), 1, MaxStrLen(AddrArray[6]))
                    end else
                        if Contact = '' then
                            AddrArray[5] += LTextOnChuTxt;
                    if Contact <> '' then
                        AddrArray[7] := copystr((Contact + LTextSamaTxt), 1, MaxStrLen(AddrArray[7]));
                    CompressArray(AddrArray);
                end;

            Country."Address Format (Extended) TJP"::"Japanese - Own":
                begin
                    AddrArray[1] := Name;
                    AddrArray[2] := Name2;
                    //AddrArray[ContLineNo] := Contact;
                    if PostCode <> '' then
                        AddrArray[4] := LTextPostSignTxt + PostCode
                    else
                        AddrArray[4] := '';
                    if StrLen(County + City + Addr) <= MaxStrLen(AddrArray[5]) then begin
                        AddrArray[5] := copystr(County + City + Addr, 1, MaxStrLen(AddrArray[5]));
                        AddrArray[6] := Addr2;
                    end else begin
                        AddrArray[5] := copystr(DelStr(County + City, MaxStrLen(AddrArray[5]) + 1), 1, MaxStrLen(AddrArray[5]));
                        if StrLen(Addr + Addr2) > MaxStrLen(AddrArray[6]) then begin
                            AddrArray[6] := Addr;
                            AddrArray[7] := Addr2;
                        end else
                            AddrArray[6] := copystr((Addr + Addr2), 1, MaxStrLen(AddrArray[6]));
                    end;
                    CompressArray(AddrArray);
                end;

            Country."Address Format (Extended) TJP"::"Japanese - Individual":
                begin
                    Clear(AddrArray);
                    if PostCode <> '' then
                        AddrArray[1] := LTextPostSignTxt + PostCode;
                    if StrLen(County + City + Addr) <= MaxStrLen(AddrArray[2]) then begin
                        AddrArray[2] := copystr((County + City + Addr), 1, MaxStrLen(AddrArray[2]));
                        AddrArray[3] := Addr2;
                    end else begin
                        AddrArray[2] := copystr(DelStr(County + City, MaxStrLen(AddrArray[2]) + 1), 1, MaxStrLen(AddrArray[2]));
                        if StrLen(Addr + Addr2) > MaxStrLen(AddrArray[3]) then begin
                            AddrArray[3] := Addr;
                            AddrArray[4] := Addr2;
                        end else
                            AddrArray[3] := copystr((Addr + Addr2), 1, MaxStrLen(AddrArray[3]));
                    end;
                    AddrArray[5] := Name;
                    if Name2 <> '' then begin
                        if Contact <> '' then
                            AddrArray[6] := Name2
                        else
                            AddrArray[6] := copystr(Name2 + LTextSamaTxt, 1, MaxStrLen(AddrArray[6]))
                    end else
                        if Contact = '' then
                            AddrArray[5] += LTextSamaTxt;
                    if Contact <> '' then
                        AddrArray[7] := copystr((Contact + LTextSamaTxt), 1, MaxStrLen(AddrArray[7]));
                    CompressArray(AddrArray);
                end;
        end;
    end;

    //FA Functions [Start]
    [EventSubscriber(ObjectType::Table, 5612, 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterInsertFADepBook(var Rec: Record "FA Depreciation Book")
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        rec.CalcFields("Book Value");
        if rec."Book Value" = 0 then begin
            Rec."Adj. Depr. Amount TJP" := 0;
            Rec."Adj. Depr. Base Amount TJP" := 0;
            //Rec."Depr. Method (Extended) TJP" := Rec."Depr. Method (Extended) TJP"::"Straight-Line";
            Rec."Depr. Method (Extended) TJP" := Rec."Depr. Method (Extended) TJP"::" ";
            //Rec."JPDB Type TJP" := Rec."JPDB Type TJP"::JPDB;
            Rec."JPDB Type TJP" := Rec."JPDB Type TJP"::" ";
            Rec."Depreciation Years TJP" := 0;
            Rec."Guarantee % TJP" := 0;
            Rec."Adjustment Depreciation % TJP" := 0;
            Rec."Straight Line Depr. 5 % TJP" := false;
            Rec."Declining-Balance %" := 0;
            Rec."Depreciation Starting Date" := 0D;
            Rec."Depreciation Ending Date" := 0D;
            Rec."Ending Book Value" := 0;
            Rec.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Table, 5612, 'OnBeforeValidateEvent', 'Depreciation Method', false, false)]
    local procedure OnBeforeFADepMethodValidate(var Rec: Record "FA Depreciation Book"; var xRec: Record "FA Depreciation Book"; CurrFieldNo: Integer)
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF Rec."Depr. Method (Extended) TJP" = "Depreciation Method (Extended) TJP"::JPDB THEN
            Rec."Depreciation Method" := xRec."Depreciation Method"
        ELSE
            Rec."Depr. Method (Extended) TJP" := Rec."Depreciation Method";
    end;

    [EventSubscriber(ObjectType::Table, 5612, 'OnAfterValidateEvent', 'Depr. Method (Extended) TJP', false, false)]
    local procedure OnAfterFADepMethodJPValidate(var Rec: Record "FA Depreciation Book"; var xRec: Record "FA Depreciation Book"; CurrFieldNo: Integer)
    var
        CompanyInformationRec: Record "Company Information";
        DeprBook: Record "Depreciation Book";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        if Rec."Depr. Method (Extended) TJP" = Rec."Depr. Method (Extended) TJP"::" " then
            exit;
        IF Rec."Depr. Method (Extended) TJP" = "Depreciation Method (Extended) TJP"::JPDB THEN BEGIN
            //ModifyDeprFields Function
            IF (Rec."Last Depreciation Date" > 0D) OR
               (Rec."Last Write-Down Date" > 0D) OR
               (Rec."Last Appreciation Date" > 0D) OR
               (Rec."Last Custom 1 Date" > 0D) OR
               (Rec."Last Custom 2 Date" > 0D) OR
               (Rec."Disposal Date" > 0D)
            THEN BEGIN
                DeprBook.GET(Rec."Depreciation Book Code");
                DeprBook.TESTFIELD("Allow Changes in Depr. Fields", TRUE);
            END;

            Rec."Straight-Line %" := 0;
            Rec."No. of Depreciation Years" := 0;
            Rec."No. of Depreciation Months" := 0;
            Rec."Fixed Depr. Amount" := 0;
            Rec."Depreciation Ending Date" := 0D;
            Rec."Depreciation Table Code" := '';
            Rec."First User-Defined Depr. Date" := 0D;
            Rec."Use DB% First Fiscal Year" := FALSE;
            Rec."Depreciation Method" := Rec."Depreciation Method"::"Declining-Balance 1";
        END ELSE
            Rec.VALIDATE("Depreciation Method", Rec."Depr. Method (Extended) TJP");
    END;

    [EventSubscriber(ObjectType::Table, 5612, 'OnAfterValidateEvent', 'No. of Depreciation Years', false, false)]
    local procedure OnAfterFANoOfDeprYear(var Rec: Record "FA Depreciation Book"; var xRec: Record "FA Depreciation Book"; CurrFieldNo: Integer)
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        Rec."Depreciation Years TJP" := 0;
    end;

    [EventSubscriber(ObjectType::Table, 5612, 'OnAfterValidateEvent', 'Depreciation Years TJP', false, false)]
    local procedure OnAfterFAJPDeprYear(var Rec: Record "FA Depreciation Book"; var xRec: Record "FA Depreciation Book"; CurrFieldNo: Integer)
    var
        CompanyInformationRec: Record "Company Information";
        FARate: Record "Fixed Asset Rates TJP";
        Text70003Txt: Label 'Do you want to change to %1 (%2 year)?', Comment = 'JPDB Type=%1, Depreciation Year=%2';
        SelectJPDBTypeMsg: Label 'Please select JPDB Type.';
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF Rec."Depr. Method (Extended) TJP" = "Depreciation Method (Extended) TJP"::"Straight-Line" THEN BEGIN
            IF FARate.GET(Rec."JPDB Type TJP", Rec."Depreciation Years TJP") THEN
                Rec.VALIDATE("Straight-Line %", FARate."Straight-line rate" * 100)
            else
                if FARate.Get(Rec."JPDB Type TJP"::JPDB, Rec."Depreciation Years TJP") then
                    Rec.Validate("Straight-Line %", FARate."Straight-line rate" * 100)
                ELSE
                    Rec.VALIDATE("Straight-Line %", 0);
            EXIT;
        END;
        if Rec."Depr. Method (Extended) TJP" = "Depreciation Method (Extended) TJP"::JPDB then      // 2024-11-08 by Anada
            if FARate.GET(Rec."JPDB Type TJP", Rec."Depreciation Years TJP") then begin             // 2024-11-08 by Anada
                Rec."Adjustment Depreciation % TJP" := FARate."Adjust Depreciation" * 100;          // 2024-11-08 by Anada
                Rec."Guarantee % TJP" := FARate."Guarantee %" * 100;                                // 2024-11-08 by Anada
                Rec."Declining-Balance %" := FARate."DB Rate" * 100;                                // 2024-11-08 by Anada
            end;                                                                                    // 2024-11-08 by Anada

        if Rec."JPDB Type TJP" = Rec."JPDB Type TJP"::" " then begin
            Message(SelectJPDBTypeMsg);
            Rec."Depreciation Years TJP" := 0;
            exit;
        end;

        IF (Rec."Depreciation Years TJP" <> xRec."Depreciation Years TJP") OR
           (Rec."JPDB Type TJP" <> xRec."JPDB Type TJP") THEN BEGIN
            IF DecliningMethodExtended(Rec."Depr. Method (Extended) TJP".AsInteger()) THEN BEGIN
                IF (Rec."JPDB Type TJP" <> xRec."JPDB Type TJP") THEN
                    IF Rec."Depreciation Years TJP" <> 0 THEN
                        IF NOT CONFIRM(Text70003Txt, FALSE, Rec."JPDB Type TJP", Rec."Depreciation Years TJP") THEN
                            ERROR('');

                IF (Rec."Depreciation Years TJP" <> xRec."Depreciation Years TJP") THEN
                    IF NOT CONFIRM(Text70003Txt, FALSE, Rec."JPDB Type TJP", Rec."Depreciation Years TJP") THEN
                        ERROR('');
            END;

            IF Rec."Depreciation Years TJP" = 0 THEN BEGIN
                Rec."Guarantee % TJP" := 0;
                Rec."Adjustment Depreciation % TJP" := 0;
                Rec."Declining-Balance %" := 0;
            END ELSE
                IF DecliningMethodExtended(Rec."Depr. Method (Extended) TJP".AsInteger()) THEN BEGIN
                    FARate.GET(Rec."JPDB Type TJP", Rec."Depreciation Years TJP");
                    Rec."Adjustment Depreciation % TJP" := FARate."Adjust Depreciation" * 100;
                    Rec."Guarantee % TJP" := FARate."Guarantee %" * 100;
                    Rec."Declining-Balance %" := FARate."DB Rate" * 100;
                END;
        END;
    end;

    procedure DecliningMethodExtended(FADepMethodExtend: Option): Boolean;
    var
        CompanyInformationRec: Record "Company Information";
    //FADepBook: Record "FA Depreciation Book";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        //Copy base function from FA Depreciation Book - DecliningMethod
        EXIT(
          FADepMethodExtend IN
          ["Depreciation Method (Extended) TJP"::"Declining-Balance 1".AsInteger(),
           "Depreciation Method (Extended) TJP"::"Declining-Balance 2".AsInteger(),
           "Depreciation Method (Extended) TJP"::JPDB.AsInteger(),
           "Depreciation Method (Extended) TJP"::"DB1/SL".AsInteger(),
           "Depreciation Method (Extended) TJP"::"DB2/SL".AsInteger()]);
    end;

    [EventSubscriber(ObjectType::Table, 5612, 'OnAfterValidateEvent', 'Depr. Method (Extended) TJP', false, false)]
    local procedure OnAfterValidateEventDeprMethodExtendedTJP(var Rec: Record "FA Depreciation Book"; var xRec: Record "FA Depreciation Book"; CurrFieldNo: Integer)
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        Rec."JPDB Type TJP" := Rec."JPDB Type TJP"::" ";
        Rec."Depreciation Years TJP" := 0;
        Rec."Declining-Balance %" := 0;
        Rec."Adjustment Depreciation % TJP" := 0;
        Rec."Guarantee % TJP" := 0;
        Rec.Modify();
    end;

    [EventSubscriber(ObjectType::Table, 5612, 'OnAfterValidateEvent', 'JPDB Type TJP', false, false)]
    local procedure OnAfterFAJPDBType(var Rec: Record "FA Depreciation Book"; var xRec: Record "FA Depreciation Book"; CurrFieldNo: Integer)
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF Rec."JPDB Type TJP" <> xRec."JPDB Type TJP" THEN BEGIN
            Rec."Depreciation Years TJP" := 0;
            Rec."Guarantee % TJP" := 0;
            Rec."Adjustment Depreciation % TJP" := 0;
            Rec."Declining-Balance %" := 0;
            Rec.MODIFY();
        END;
    end;

    //[EventSubscriber(ObjectType::Report, Report::"Calculate Depreciation", 'OnAfterPostDataItem', '', false, false)]
    [EventSubscriber(ObjectType::Report, Report::"Calculate Depreciation TJP", 'OnAfterPostDataItem', '', false, false)]
    local procedure OnCalcDepreciationPostFAReport()
    var
        CompanyInformationRec: Record "Company Information";
        FADepBook: Record "FA Depreciation Book";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        FADepBook.RESET();
        FADepBook.SETCURRENTKEY("Straight Line Depr. 5 % TJP");
        FADepBook.SETRANGE("Straight Line Depr. 5 % TJP", TRUE);
        IF FADepBook.FINDSET() THEN;
        REPORT.RUN(REPORT::"Check FA Book Value 5% TJP", FALSE, FALSE, FADepBook);
    end;

    [EventSubscriber(ObjectType::Codeunit, 5604, 'OnAfterCopyFromFACard', '', false, false)]
    local procedure FillInFAEntriesTJPField(var FALedgerEntry: Record "FA Ledger Entry"; var FixedAsset: Record "Fixed Asset"; var FADepreciationBook: Record "FA Depreciation Book"; var xFALedgerEntry: Record "FA Ledger Entry")
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        FALedgerEntry."Depr. Method (Extended) TJP" := FADepreciationBook."Depr. Method (Extended) TJP";
    end;

    //[EventSubscriber(ObjectType::Codeunit, Codeunit::"Calculate Normal Depreciation", 'OnAfterTransferValues', '', false, false)]
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Calculate Normal Depr. TJP", 'OnAfterTransferValues', '', false, false)]
    local procedure GetExtendedDeprMethod(FixedAsset: Record "Fixed Asset"; FADepreciationBook: Record "FA Depreciation Book"; Year365Days: Boolean; var DeprYears: Decimal; var DeprMethod: Option)
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        DeprMethod := FADepreciationBook."Depr. Method (Extended) TJP".AsInteger();
    end;

    //[EventSubscriber(ObjectType::Codeunit, 5611, 'OnCalculateDeprAmountOnDeprMethodCaseLastEntry', '', false, false)]
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Calculate Normal Depr. TJP", 'OnCalculateDeprAmountOnDeprMethodCaseLastEntry', '', false, false)]
    local procedure CalcJPDBAmountCaseLastEntry(FADepreciationBook: Record "FA Depreciation Book"; CalcDB1Amount: Decimal; BookValue: Decimal; DeprBasis: Decimal; DeprYears: Decimal; DaysInFiscalYear: Integer; NumberOfDays: Integer; var Amount: Decimal)
    var
        CompanyInformationRec: Record "Company Information";
        StrAmount: Decimal;
        GrtAmount: Decimal;
        AdjStrLineAmount: Decimal;
        decDeprAmt: Decimal;
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        if FADepreciationBook."Declining-Balance %" = 0 then
            decDeprAmt := 0
        else begin
            StrAmount := CalcDB1Amount;
            GrtAmount := -FADepreciationBook."Guarantee % TJP" * DeprBasis * (NumberOfDays / DaysInFiscalYear) / 100;

            if StrAmount <= GrtAmount then
                decDeprAmt := StrAmount
            else begin
                if FADepreciationBook."Adj. Depr. Amount TJP" = 0 then begin
                    AdjStrLineAmount := -FADepreciationBook."Adjustment Depreciation % TJP" * BookValue / 100;
                    FADepreciationBook."Adj. Depr. Amount TJP" := -AdjStrLineAmount;
                    FADepreciationBook."Adj. Depr. Base Amount TJP" := BookValue;
                    FADepreciationBook.Modify();
                end;
                decDeprAmt := (-FADepreciationBook."Adj. Depr. Amount TJP" * (NumberOfDays / DaysInFiscalYear));
            end;
        end;

        Amount := decDeprAmt;
    end;

    //[EventSubscriber(ObjectType::Codeunit, 5611, 'OnCalculateDeprAmountOnDeprMethodCaseLastDeprEntry', '', false, false)]
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Calculate Normal Depr. TJP", 'OnCalculateDeprAmountOnDeprMethodCaseLastDeprEntry', '', false, false)]
    local procedure CalcJPDBAmountLastDeprEntry(FADepreciationBook: Record "FA Depreciation Book"; CalcDB1Amount: Decimal; BookValue: Decimal; DeprBasis: Decimal; DeprYears: Decimal; DaysInFiscalYear: Integer; NumberOfDays: Integer; var Amount: Decimal)
    var
        CompanyInformationRec: Record "Company Information";
        StrAmount: Decimal;
        GrtAmount: Decimal;
        AdjStrLineAmount: Decimal;
        decDeprAmt: Decimal;
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        if FADepreciationBook."Declining-Balance %" = 0 then
            decDeprAmt := 0
        else begin
            StrAmount := CalcDB1Amount;
            GrtAmount := -FADepreciationBook."Guarantee % TJP" * DeprBasis * (NumberOfDays / DaysInFiscalYear) / 100;

            if StrAmount <= GrtAmount then
                decDeprAmt := StrAmount
            else begin
                if FADepreciationBook."Adj. Depr. Amount TJP" = 0 then begin
                    AdjStrLineAmount := -FADepreciationBook."Adjustment Depreciation % TJP" * BookValue / 100;
                    FADepreciationBook."Adj. Depr. Amount TJP" := -AdjStrLineAmount;
                    FADepreciationBook."Adj. Depr. Base Amount TJP" := BookValue;
                    FADepreciationBook.Modify();
                end;
                decDeprAmt := (-FADepreciationBook."Adj. Depr. Amount TJP" * (NumberOfDays / DaysInFiscalYear));
            end;
        end;

        Amount += decDeprAmt
    end;

    [EventSubscriber(ObjectType::Codeunit, 5611, 'OnAfterCalculateDeprAmount', '', false, false)]
    //[Obsolete('Need to change this to Local', '24.0')]
    //procedure GetFARoundedAmount(var Amount: Decimal)
    local procedure CodeunitCalculateNormalDepreciationOnAfterCalculateDeprAmount(var Amount: Decimal)
    var
        CompanyInformationRec: Record "Company Information";
        FASetup: Record "FA Setup";
        TxtDirection: Text;
    //IsSkipStandard: Boolean;
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        IF Amount = 0 THEN
            EXIT;

        FASetup.GET();

        CASE FASetup."FA Rounding Type TJP" OF
            FASetup."FA Rounding Type TJP"::Nearest:
                TxtDirection := '=';
            FASetup."FA Rounding Type TJP"::Up:
                TxtDirection := '>';
            FASetup."FA Rounding Type TJP"::Down:
                TxtDirection := '<';
        END;
        Amount := ROUND(Amount, FASetup."FA Rounding Precision TJP", TxtDirection);
        //IsSkipStandard := TRUE;
    end;

    // 2023-03-15 Anada
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"FA Check Consistency", 'OnBeforeCheckForError', '', false, false)]
    local procedure CodeunitFACheckConsistencyOnBeforeCheckForError(FALedgEntry2: Record "FA Ledger Entry"; var FAJnlLine: Record "FA Journal Line";
                                                                    FAPostingTypeSetup: Record "FA Posting Type Setup"; NewAmount: Decimal; BookValue: Decimal;
                                                                    SalvageValue: Decimal; DeprBasis: Decimal; var IsHandled: Boolean)
    var
        CompanyInformationRec: Record "Company Information";
        FADepreciationBookRec: Record "FA Depreciation Book";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        FADepreciationBookRec.Get(FALedgEntry2."FA No.", FALedgEntry2."Depreciation Book Code");
        if (FADepreciationBookRec."JPDB Type TJP" = FADepreciationBookRec."JPDB Type TJP"::JPSLOld)
        or (FADepreciationBookRec."JPDB Type TJP" = FADepreciationBookRec."JPDB Type TJP"::JPDBOld) then
            IsHandled := true;
    end;
    //FA Functions [End]

    [EventSubscriber(ObjectType::Report, Report::"Suggest Vendor Payments", 'OnAfterPostDataItem', '', false, false)]
    local procedure CalcBankFee(var GenJournalBatch: Record "Gen. Journal Batch"; GenJournalLine: Record "Gen. Journal Line")
    var
        CompanyInformationRec: Record "Company Information";
        GenFunction: Codeunit "General Functions TJP";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        GenFunction.CalcBankFee(GenJournalBatch, GenJournalLine."Bal. Account Type".AsInteger(), GenJournalLine."Bal. Account No.");
    end;

    [EventSubscriber(ObjectType::Report, Report::"General Journal - Test", 'OnAfterCheckGenJnlLine', '', false, false)]
    local procedure SkipTestPostingTypeforCustomer(GenJournalLine: Record "Gen. Journal Line"; var ErrorText: array[50] of Text[250])
    var
        CompanyInformationRec: Record "Company Information";
    begin
        // Exit if the company's country/region is not Japan
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') <> 1 then
            exit;
        //
        if GenJournalLine."Source Code" = 'CASHRECJNL' then
            ErrorText[1] := '';
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', false, false)]
    local procedure CodeunitReportManagementOnAfterSubstituteReport(ReportId: Integer;
                                                                    RunMode: Option Normal,ParametersOnly,Execute,Print,SaveAs,RunModal;
                                                                    RequestPageXml: Text; RecordRef: RecordRef; var NewReportId: Integer)
    var
        CompanyInformationRec: Record "Company Information";
        CountryRegionCode: Text[2];
    begin
        CompanyInformationRec.Get();
        CountryRegionCode := CopyStr(CompanyInformationRec."Country/Region Code", 1, 2);
        case CountryRegionCode of
            'JP':
                case ReportId of
                    // Report ID 3 => 70658581
                    Report::"G/L Register":
                        NewReportId := Report::"G/L Register TJP";
                    // Report ID 4 => 70658582
                    Report::"Detail Trial Balance":
                        NewReportId := Report::"Detail Trial Balance TJP";
                    // Report ID 5 => 70658583
                    Report::"Receivables-Payables":
                        NewReportId := Report::"Receivables-Payables TJP";
                    // Report ID 6 => 70658584
                    Report::"Trial Balance":
                        NewReportId := Report::"Trial Balance TJP";
                    // Report ID 151 => 70658586
                    Report::"Balance Sheet":
                        NewReportId := Report::"Balance Sheet TJP";
                    // Report ID 154 => 70658585
                    Report::"Income Statement":
                        NewReportId := Report::"Income Statement TJP";
                // // Report ID 5692 => 70658588
                // Report::"Calculate Depreciation":
                //     NewReportId := Report::"Calculate Depreciation TJP";
                end;
        end;
    end;
}
