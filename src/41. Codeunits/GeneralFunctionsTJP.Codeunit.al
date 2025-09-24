#if AppSource
codeunit 70658575 "General Functions TJP"
#endif
#if OnPremise
codeunit 99000 "General Functions TJP"
#endif
{
    //TJP #01 20201019 Removed With Statement
    var
        Text001Txt: Label 'Amounts are in whole 10s';
        Text002Txt: Label 'Amounts are in whole 100s';
        Text003Txt: Label 'Amounts are in whole 1,000s';
        Text004Txt: Label 'Amounts are in whole 100,000s';
        Text005Txt: Label 'Amounts are in whole 1,000,000s';
        Text006Txt: Label 'Amounts are not rounded';

    procedure RoundAmount(Amount: Decimal; Rounding: Option " ",Tens,Hundreds,Thousands,"Hundred Thousands",Millions): Decimal
    begin
        case Rounding of
            Rounding::" ":
                exit(Amount);
            Rounding::Tens:
                exit(Round(Amount / 10, 0.1));
            Rounding::Hundreds:
                exit(Round(Amount / 100, 0.1));
            Rounding::Thousands:
                exit(Round(Amount / 1000, 0.1));
            Rounding::"Hundred Thousands":
                exit(Round(Amount / 100000, 0.1));
            Rounding::Millions:
                exit(Round(Amount / 1000000, 0.1));
        end
    end;

    procedure RoundDescription(Rounding: Option " ",Tens,Hundreds,Thousands,"Hundred Thousands",Millions): Text[50]
    begin
        case Rounding of
            Rounding::" ":
                exit(Text006Txt);
            Rounding::Tens:
                exit(Text001Txt);
            Rounding::Hundreds:
                exit(Text002Txt);
            Rounding::Thousands:
                exit(Text003Txt);
            Rounding::"Hundred Thousands":
                exit(Text004Txt);
            Rounding::Millions:
                exit(Text005Txt);
        end
    end;

    procedure GetCompanyAdd(RespCenterCode: Code[10]; VAR ResponsibilityCenter: Record "Responsibility Center"; VAR CompanyInfo: Record "Company Information";
                                                        VAR CompanyAddr: ARRAY[8] OF Text[100]; var LangSel: Code[10])
    begin
        IF ResponsibilityCenter.GET(RespCenterCode) THEN BEGIN
            RespCenterJPN(CompanyAddr, ResponsibilityCenter);
            CompanyInfo."Phone No." := ResponsibilityCenter."Phone No.";
            CompanyInfo."Fax No." := ResponsibilityCenter."Fax No.";
        END ELSE
            if LangSel = CompanyInfo."Reporting Language TJP" then
                CompanyENU(CompanyAddr, CompanyInfo)
            else
                CompanyJPN(CompanyAddr, CompanyInfo);

        LangSel := LangSel;             // 2024-05-08 by Anada - Meaningless but just to avoid warning
    end;

    procedure RespCenterJPN(VAR AddrArray: ARRAY[8] OF Text[100]; VAR RespCenter: Record "Responsibility Center")
    var
        FormatAddr: Codeunit "Format Address";
    begin
        //WITH RespCenter DO
        FormatAddr.FormatAddr(
          AddrArray, RespCenter.Name, RespCenter."Name 2", '', RespCenter.Address, RespCenter."Address 2",
          RespCenter.City, RespCenter."Post Code", RespCenter.County, RespCenter."Country/Region Code");
    end;

    procedure CompanyJPN(var AddrArray: array[8] of Text[100]; var CompanyInfo: Record "Company Information")
    var
        FormatAddr: Codeunit "Format Address";
    begin
        //WITH CompanyInfo DO
        FormatAddr.FormatAddr(AddrArray, CompanyInfo.Name, CompanyInfo."Name 2", '', CompanyInfo.Address, CompanyInfo."Address 2",
                                             CompanyInfo.City, CompanyInfo."Post Code", CompanyInfo.County, CompanyInfo."Country/Region Code");
    end;

    procedure CompanyENU(var AddrArray: array[8] of Text[100]; var CompanyInfo: Record "Company Information")
    var
        FormatAddr: Codeunit "Format Address";
    begin
        //WITH CompanyInfo DO
        FormatAddr.FormatAddr(AddrArray, CompanyInfo."English Name TJP", CompanyInfo."English Name 2 TJP", '', CompanyInfo."English Address TJP", CompanyInfo."English Address 2 TJP",
                                             CompanyInfo."English City TJP", CompanyInfo."English Post Code TJP", CompanyInfo."English County TJP", CompanyInfo."Eng. Country/Region Code TJP");
    end;

    procedure TranslateCompBankAccFields(CompanyInformation: Record "Company Information";
                                         var CompanyBankAccHolderText: Text;
                                         var CompanyBankAccNameText: Text;
                                         var CompanyBankAccNoTxt: Text;
                                         var CompanyBankAccTypeTxt: Text;
                                         LangSel: Code[10])
    begin
        if LangSel = CompanyInformation."Reporting Language TJP" then begin
            CompanyBankAccHolderText := CompanyInformation."Eng. Bank Acc. Holder Name TJP";
            CompanyBankAccNameText := CompanyInformation."Eng. Bank Acc. Name TJP";
            CompanyBankAccNoTxt := CompanyInformation."Eng. Bank Acc. No. TJP";
            CompanyBankAccTypeTxt := Format(CompanyInformation."Eng. Account Type TJP");
        end else begin
            CompanyBankAccHolderText := CompanyInformation."Bank Account Holder Name TJP";
            CompanyBankAccNameText := CompanyInformation."Bank Name";
            CompanyBankAccNoTxt := CompanyInformation."Bank Account No.";
            CompanyBankAccTypeTxt := Format(CompanyInformation."Account Type TJP");
        end;
    end;

    procedure LocationENU(var AddrArray: array[8] of Text[100]; var pLocation: Record Location)
    var
        FormatAddress: codeunit "Format Address";
    begin
        FormatAddress.FormatAddr(AddrArray, pLocation."English Name TJP", '', '', pLocation."English Address TJP", pLocation."English Address 2 TJP",
                                 pLocation."English City TJP", pLocation."English Post Code TJP", pLocation."English County TJP",
                                 pLocation."English Country/Region TJP");
    end;

    procedure GetUoMDescriptionInCurrentLanguage(UoMCode: Code[50]; LanguageCode: Code[10]): Text[50]
    var
        UnitofMeasure: Record "Unit of Measure";
        UnitOfMeasureTranslation: Record "Unit of Measure Translation";
        Language: Codeunit Language;
    begin
        if UoMCode = '' then
            exit;
        UnitofMeasure.Get(UoMCode);
        if Language.GetLanguageIdOrDefault(LanguageCode) = 1041 then
            exit(UnitofMeasure.Description)
        else begin
            if UnitOfMeasureTranslation.Get(UnitofMeasure.Code, LanguageCode) then
                exit(UnitOfMeasureTranslation.Description);
            exit(UoMCode);
        end;
    end;

    procedure SetTotalLabelsTJP(CurrencyCode: Code[10]; var TotalText: Text[50]; var TotalInclVATText: Text[50]; var TotalExclVATText: Text[50])
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        TotalTxt: Label 'Total (%1)', Comment = '%1 = Currency Code';
        TotalInclVATTxt: Label 'Total Incl. VAT (%1)', Comment = '%1 = Currency Code';
        TotalExclVATTxt: Label 'Total Excl. VAT (%1)', Comment = '%1 = Currency Code';
    begin
        if CurrencyCode = '' then begin
            GeneralLedgerSetup.Get();
            GeneralLedgerSetup.TestField("Local Currency Symbol");
            TotalText := StrSubstNo(TotalTxt, GeneralLedgerSetup."LCY Code");
            TotalInclVATText := StrSubstNo(TotalInclVATTxt, GeneralLedgerSetup."Local Currency Symbol");
            TotalExclVATText := StrSubstNo(TotalExclVATTxt, GeneralLedgerSetup."Local Currency Symbol");
        end else begin
            TotalText := StrSubstNo(TotalTxt, CurrencyCode);
            TotalInclVATText := StrSubstNo(TotalInclVATTxt, CurrencyCode);
            TotalExclVATText := StrSubstNo(TotalExclVATTxt, CurrencyCode);
        end;
    end;

    procedure SetVATBreakupLabelsTJP(CurrencyCode: Code[10]; VATAmountLine: Record "VAT Amount Line";
                                     var TotAmtExclVATTxt: Text[100]; var VATPerTxt: Text[100])
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        TotAmtExclVATLbl: Label '%1 Amount Excl. VAT (%2)', Comment = '%1 = VAT Code %2 = Currency Code';
        VatPerLbl: Label '%1 VAT (%2)', Comment = '%1 = VAT Code %2 = Currency Code';
        PerLbl: Label '%', Locked = true;
    begin
        if CurrencyCode = '' then begin
            GeneralLedgerSetup.Get();
            GeneralLedgerSetup.TestField("Local Currency Symbol");
            TotAmtExclVATTxt := StrSubstNo(TotAmtExclVATLbl, (format(VATAmountLine."VAT %") + PerLbl), GeneralLedgerSetup."Local Currency Symbol");
            VATPerTxt := StrSubstNo(VatPerLbl, (format(VATAmountLine."VAT %") + PerLbl), GeneralLedgerSetup."Local Currency Symbol");
            if (StrLen(format(VATAmountLine."VAT %")) = 1) then begin
                TotAmtExclVATTxt := CopyStr(('  ' + TotAmtExclVATTxt), 1, MaxStrLen(TotAmtExclVATTxt));
                VATPerTxt := CopyStr(('  ' + VATPerTxt), 1, MaxStrLen(VATPerTxt));
            end
        end else begin
            //GeneralLedgerSetup.TestField("Local Currency Symbol");    // 2023-06-19 Anada
            TotAmtExclVATTxt := StrSubstNo(TotAmtExclVATLbl, (format(VATAmountLine."VAT %") + PerLbl), CurrencyCode);
            VATPerTxt := StrSubstNo(VatPerLbl, (format(VATAmountLine."VAT %") + PerLbl), CurrencyCode);
            if (StrLen(format(VATAmountLine."VAT %")) = 1) then begin
                TotAmtExclVATTxt := CopyStr(('  ' + TotAmtExclVATTxt), 1, MaxStrLen(TotAmtExclVATTxt));
                VATPerTxt := CopyStr(('  ' + VATPerTxt), 1, MaxStrLen(VATPerTxt));
            end
        end;
    end;

    procedure GetSalesPurchaserNameTJP(var SalespersonPurchaser: Record "Salesperson/Purchaser"; "Code": Code[20]; var SalesPersonName: Text[50]; LanguageCode: Code[10])
    var
        Language: Codeunit Language;
    begin
        if Code = '' then begin
            SalespersonPurchaser.Init();
            SalesPersonName := '';
        end else begin
            SalespersonPurchaser.Get(Code);
            if Language.GetLanguageIdOrDefault(LanguageCode) = 1041 then
                SalesPersonName := SalespersonPurchaser.Name
            else
                SalesPersonName := SalespersonPurchaser."Name (English) TJP";
        end;
    end;

    procedure CalcBankFee(VAR GenJnlBatch: Record "Gen. Journal Batch"; BalAccType: Integer; BalAccNo: Code[20])
    var
        PurchSetup: Record "Purchases & Payables Setup";
        BankAcc: Record "Bank Account";
        Vend: Record Vendor;
        VendBank: Record "Vendor Bank Account";
        GenJnlLine: Record "Gen. Journal Line";
        VendGenJnlLine: Record "Gen. Journal Line";
        SetGenJnlLine: Record "Gen. Journal Line";
        BankFeeSetup: Record "Bank Fee Setup TJP";
        PrevAccNo: Code[30];
        BankType: Enum "Payee Bank Type TJP";
        TotBankFee: Decimal;
        IsVendPay: Boolean;
    begin
        IF BalAccType <> GenJnlLine."Bal. Account Type"::"Bank Account".AsInteger() then
            exit;

        Clear(PrevAccNo);

        PurchSetup.Get();
        BankAcc.Get(BalAccNo);
        TotBankFee := 0;
        IsVendPay := false;

        PreValidations(GenJnlBatch, BankAcc);

        GenJnlLine.Reset();
        GenJnlLine.SetCurrentKey("Account Type", "Line No.");
        GenJnlLine.SetRange("Journal Template Name", GenJnlBatch."Journal Template Name");
        GenJnlLine.SetRange("Journal Batch Name", GenJnlBatch.Name);
        GenJnlLine.SetRange("Account Type", GenJnlLine."Account Type"::Vendor);
        if GenJnlLine.FindSet() then
            repeat
                if GenJnlLine."Account No." <> PrevAccNo then begin
                    PrevAccNo := GenJnlLine."Account No.";

                    SetGenJnlLine.Reset();
                    SetGenJnlLine.SetCurrentKey(Amount);
                    SetGenJnlLine.SetAscending(Amount, false);
                    SetGenJnlLine.SetRange("Journal Template Name", GenJnlBatch."Journal Template Name");
                    SetGenJnlLine.SetRange("Journal Batch Name", GenJnlBatch.Name);
                    SetGenJnlLine.SetRange("Account Type", SetGenJnlLine."Account Type"::Vendor);
                    SetGenJnlLine.SetRange("Account No.", PrevAccNo);
                    if SetGenJnlLine.FindSet() then;

                    VendGenJnlLine.Reset();
                    VendGenJnlLine.SetCurrentKey(Amount);
                    VendGenJnlLine.SetAscending(Amount, false);
                    VendGenJnlLine.SetRange("Journal Template Name", GenJnlBatch."Journal Template Name");
                    VendGenJnlLine.SetRange("Journal Batch Name", GenJnlBatch.Name);
                    VendGenJnlLine.SetRange("Account Type", VendGenJnlLine."Account Type"::Vendor);
                    VendGenJnlLine.SetRange("Account No.", PrevAccNo);
                    if VendGenJnlLine.FindSet() then;

                    if Vend.Get(VendGenJnlLine."Account No.") then;

                    VendGenJnlLine.SetRange("Account Type", VendGenJnlLine."Account Type"::Vendor);
                    VendGenJnlLine.SetRange("Account No.", PrevAccNo);
                    VendGenJnlLine.CalcSums(Amount);

                    if (Vend."Bank Fee Addition TJP") and (Vend."Bank Fee Vendor Pay TJP") then begin
                        if VendGenJnlLine.Amount <= Vend."BankFee Threshold Ven. Pay TJP" then
                            IsVendPay := false
                        else
                            IsVendPay := true;

                        if VendBank.Get(Vend."No.", VendGenJnlLine."Vendor Bank Account TJP") then;

                        IF CopyStr(VendBank."Zengin Bank Branch No. TJP", 1, 4) = CopyStr(BankAcc."Zengin Bank Branch No. TJP", 1, 4) THEN begin
                            IF CopyStr(VendBank."Zengin Bank Branch No. TJP", 5, 3) = CopyStr(BankAcc."Zengin Bank Branch No. TJP", 5, 3) THEN
                                BankType := BankType::"Same Bank Same Branch"
                            ELSE
                                BankType := BankType::"Same Bank Different Branch";
                        end ELSE
                            BankType := BankType::"Different Bank";

                        BankFeeSetup.Reset();
                        BankFeeSetup.SetRange("Bank Account No.", BankAcc."No.");
                        BankFeeSetup.SetRange("Payee Bank Type", BankType);
                        BankFeeSetup.SetFilter("Payment Amount From", '<=%1', VendGenJnlLine.Amount);
                        IF BankFeeSetup.FindLast() then
                            TotBankFee += BankFeeSetup."Bank Fee";

                        SplitUpdBankFeeLine(SetGenJnlLine, BankFeeSetup."Bank Fee", IsVendPay);
                    end;

                    if (Vend."Bank Fee Addition TJP") and (not (Vend."Bank Fee Vendor Pay TJP")) then begin
                        IsVendPay := false;

                        if VendBank.Get(Vend."No.", VendGenJnlLine."Vendor Bank Account TJP") then;

                        IF CopyStr(VendBank."Zengin Bank Branch No. TJP", 1, 4) = CopyStr(BankAcc."Zengin Bank Branch No. TJP", 1, 4) THEN begin
                            IF CopyStr(VendBank."Zengin Bank Branch No. TJP", 5, 3) = CopyStr(BankAcc."Zengin Bank Branch No. TJP", 5, 3) THEN
                                BankType := BankType::"Same Bank Same Branch"
                            ELSE
                                BankType := BankType::"Same Bank Different Branch";
                        end ELSE
                            BankType := BankType::"Different Bank";

                        BankFeeSetup.Reset();
                        BankFeeSetup.SetRange("Bank Account No.", BankAcc."No.");
                        BankFeeSetup.SetRange("Payee Bank Type", BankType);
                        BankFeeSetup.SetFilter("Payment Amount From", '<=%1', VendGenJnlLine.Amount);
                        IF BankFeeSetup.FindLast() then
                            TotBankFee += BankFeeSetup."Bank Fee";

                        SplitUpdBankFeeLine(SetGenJnlLine, BankFeeSetup."Bank Fee", IsVendPay);
                    end;
                end;
            until GenJnlLine.Next() = 0;

        if (TotBankFee <> 0) then
            InsertTotBankFee(GenJnlBatch, GenJnlLine, TotBankFee);
    end;

    local procedure PreValidations(var GenJnlBatch: Record "Gen. Journal Batch"; var PreBankAcc: Record "Bank Account")
    var
        PreGenJnlLine: Record "Gen. Journal Line";
        PreVendJnlLine: Record "Gen. Journal Line";
        PreBankFeeSetup: Record "Bank Fee Setup TJP";
        PreVendAcc: Record Vendor;
        PreVendBank: Record "Vendor Bank Account";
        AccNo: Code[30];
        BankType: Enum "Payee Bank Type TJP";
        PreTotBankFee: Decimal;
        BankFeeErr: Label 'Bank Fee Setup not found for selected combination:\ Bank Account No.: %1, Payee Bank Type:%2', Comment = 'Bank Account No.=%1,Payee Bank Type=%2';
        CancelBatchErr: Label 'Suggest vendor payment batch cancelled..';
        ConfirmTxtLbl: Label 'Total Payment Amount: %1 is less than the suggested Bank Fee Amount: %2 for Vendor: %3, Vendor Name: %4.\', Comment = 'Payment Amount=%1,Bank Fee=%2,Vendor No.=%3,Vendor Name=%4';
        ConfirmTxt2Lbl: Label 'Do you still continue to suggest in the journal lines?  If you choose Yes, you need to adjust the journal lines manually.';
    begin
        Clear(AccNo);
        PreGenJnlLine.Reset();
        PreGenJnlLine.SetCurrentKey("Account Type", "Line No.");
        PreGenJnlLine.SetRange("Journal Template Name", GenJnlBatch."Journal Template Name");
        PreGenJnlLine.SetRange("Journal Batch Name", GenJnlBatch.Name);
        PreGenJnlLine.SetRange("Account Type", PreGenJnlLine."Account Type"::Vendor);
        if PreGenJnlLine.FindSet() then
            repeat
                if (PreGenJnlLine."Account No." <> AccNo) then begin
                    PreTotBankFee := 0;
                    AccNo := PreGenJnlLine."Account No.";
                    PreVendAcc.Get(AccNo);
                    if PreVendBank.Get(PreVendAcc."No.", PreGenJnlLine."Vendor Bank Account TJP") then;
                    if PreVendAcc."Bank Fee Addition TJP" then begin
                        PreVendJnlLine.Reset();
                        PreVendJnlLine.SetCurrentKey(Amount);
                        PreVendJnlLine.SetAscending(Amount, false);
                        PreVendJnlLine.SetRange("Journal Template Name", GenJnlBatch."Journal Template Name");
                        PreVendJnlLine.SetRange("Journal Batch Name", GenJnlBatch.Name);
                        PreVendJnlLine.SetRange("Account Type", PreVendJnlLine."Account Type"::Vendor);
                        PreVendJnlLine.SetRange("Account No.", AccNo);
                        if PreVendJnlLine.FindFirst() then
                            PreVendJnlLine.CalcSums(Amount);

                        IF CopyStr(PreVendBank."Zengin Bank Branch No. TJP", 1, 4) = CopyStr(PreBankAcc."Zengin Bank Branch No. TJP", 1, 4) THEN begin
                            IF CopyStr(PreVendBank."Zengin Bank Branch No. TJP", 5, 3) = CopyStr(PreBankAcc."Zengin Bank Branch No. TJP", 5, 3) THEN
                                BankType := BankType::"Same Bank Same Branch"
                            ELSE
                                BankType := BankType::"Same Bank Different Branch";
                        end ELSE
                            BankType := BankType::"Different Bank";

                        PreBankFeeSetup.Reset();
                        PreBankFeeSetup.SetRange("Bank Account No.", PreBankAcc."No.");
                        PreBankFeeSetup.SetRange("Payee Bank Type", BankType);
                        PreBankFeeSetup.SetFilter("Payment Amount From", '<=%1', PreVendJnlLine.Amount);
                        IF not PreBankFeeSetup.FindLast() then
                            Error(BankFeeErr, PreBankAcc."No.", BankType);

                        PreBankFeeSetup.Reset();
                        PreBankFeeSetup.SetRange("Bank Account No.", PreBankAcc."No.");
                        PreBankFeeSetup.SetRange("Payee Bank Type", BankType);
                        PreBankFeeSetup.SetFilter("Payment Amount From", '<=%1', PreVendJnlLine.Amount);
                        IF PreBankFeeSetup.FindLast() then
                            PreTotBankFee := PreBankFeeSetup."Bank Fee";

                        if (PreTotBankFee >= PreVendJnlLine.Amount) then
                            if not Confirm(ConfirmTxtLbl + ConfirmTxt2Lbl, false, PreVendJnlLine.Amount, PreTotBankFee, PreVendJnlLine."Account No.", PreVendAcc.Name) then
                                Error(CancelBatchErr);
                    end;
                end;
            until PreGenJnlLine.Next() = 0;
    end;

    procedure SplitUpdBankFeeLine(GenJnlLine: Record "Gen. Journal Line"; BankFeeAmt: Decimal; IsVendPay: Boolean)
    var
        PurchSetup: Record "Purchases & Payables Setup";
        SkipGenJnlLine: Record "Gen. Journal Line";
        SplitGenJnlLine: Record "Gen. Journal Line";
    begin
        PurchSetup.Get();
        PurchSetup.TestField("Bank Fee G/L Account No. TJP");

        SkipGenJnlLine.SetRange("Journal Template Name", SkipGenJnlLine."Journal Template Name");
        SkipGenJnlLine.SetRange("Journal Batch Name", SkipGenJnlLine."Journal Batch Name");
        SkipGenJnlLine.SetRange("Account Type", SkipGenJnlLine."Account Type"::Vendor);
        SkipGenJnlLine.SetRange("Account No.", SkipGenJnlLine."Account No.");
        SkipGenJnlLine.SetRange("Bal. Account Type", SkipGenJnlLine."Bal. Account Type"::"G/L Account");
        SkipGenJnlLine.SetRange("Bal. Account No.", PurchSetup."Bank Fee G/L Account No. TJP");
        //if SkipGenJnlLine.FindFirst() then
        if SkipGenJnlLine.IsEmpty = false then
            exit;

        GenJnlLine.Validate("Bank Fee Calculated TJP", BankFeeAmt);
        GenJnlLine.Modify();
        if IsVendPay then begin
            GenJnlLine.validate(Amount, (GenJnlLine.Amount - BankFeeAmt));
            GenJnlLine.Modify();
            SplitGenJnlLine := GenJnlLine;
            SplitGenJnlLine."Line No." += 500;
            SplitGenJnlLine."Bal. Account Type" := SplitGenJnlLine."Bal. Account Type"::"G/L Account";
            SplitGenJnlLine.Validate("Bal. Account No.", PurchSetup."Bank Fee G/L Account No. TJP");
            SplitGenJnlLine.Validate("Bank Fee Calculated TJP", 0);
            SplitGenJnlLine.Validate(Amount, BankFeeAmt);
            SplitGenJnlLine.Insert();
        end;
    end;

    local procedure InsertTotBankFee(var GenJnlBatch: Record "Gen. Journal Batch"; var GenJnlLine: Record "Gen. Journal Line"; TotalBankFee: Decimal)
    var
        PurchSetup: Record "Purchases & Payables Setup";
        LastGenJnlLine: Record "Gen. Journal Line";
        FirstGenJnlLine: Record "Gen. Journal Line";
        InsertBankFee: Record "Gen. Journal Line";
    begin
        LastGenJnlLine.Reset();
        LastGenJnlLine.SetRange("Journal Template Name", GenJnlBatch."Journal Template Name");
        LastGenJnlLine.SetRange("Journal Batch Name", GenJnlBatch.Name);
        if LastGenJnlLine.FindLast() then;

        FirstGenJnlLine.Reset();
        FirstGenJnlLine.SetRange("Journal Template Name", GenJnlBatch."Journal Template Name");
        FirstGenJnlLine.SetRange("Journal Batch Name", GenJnlBatch.Name);
        if FirstGenJnlLine.FindFirst() then;

        PurchSetup.Get();
        PurchSetup.TestField("Bank Fee G/L Account No. TJP");

        Clear(InsertBankFee);
        InsertBankFee.Init();
        InsertBankFee.Validate("Journal Template Name", GenJnlLine."Journal Template Name");
        InsertBankFee.Validate("Journal Batch Name", GenJnlLine."Journal Batch Name");
        InsertBankFee.Validate("Line No.", LastGenJnlLine."Line No." + 10000);
        InsertBankFee.Validate("Account Type", InsertBankFee."Account Type"::"G/L Account");
        InsertBankFee.Validate("Account No.", PurchSetup."Bank Fee G/L Account No. TJP");
        InsertBankFee.Validate("Posting Date", GenJnlLine."Posting Date");
        InsertBankFee.Validate("Document Type", GenJnlLine."Document Type");
        InsertBankFee.Validate("Document No.", INCSTR(GenJnlLine."Document No."));
        InsertBankFee.Validate("Amount", TotalBankFee);
        InsertBankFee.Validate("Bal. Account Type", InsertBankFee."Bal. Account Type"::"Bank Account");
        InsertBankFee.Validate("Bal. Account No.", FirstGenJnlLine."Bal. Account No.");
        InsertBankFee.Insert();
    end;

    procedure FillInVendorBankField(VAR GenJnlLine: Record "Gen. Journal Line"; VendorNo: Code[20])
    var
        VendBank: Record "Vendor Bank Account";
        Vendor: Record Vendor;
    begin
        //with GenJnlLine do begin
        VendBank.RESET();
        VendBank.SetRange("Vendor No.", VendorNo);
        VendBank.SetRange("Default Bank TJP", true);
        if not VendBank.FindFirst() then begin
            VendBank.SetRange("Default Bank TJP");
            if Vendor.Get(VendorNo) then
                if Vendor."Preferred Bank Account Code" <> '' then
                    VendBank.SetRange(Code, Vendor."Preferred Bank Account Code");
            if not VendBank.FindFirst() then
                VendBank.Init();
        end;
        GenJnlLine."Vendor Bank Account TJP" := VendBank.Code;
        //end;
    end;

    //DBCS Functions
    procedure ConvKanaToSingle(text01: Text[200]) text02: Text[200]
    var
        AsciiNumber: Integer;
        Looper: Integer;
        CurrChar: Text[10];
        text03: Text[2];
    begin
        Clear(text02);
        Clear(text03);
        for Looper := 1 to StrLen(text01) do begin
            CurrChar := CopyStr(text01, Looper, 1);
            AsciiNumber := CurrChar[1];
            if ByteOfFullWidthCharacter(AsciiNumber) then begin
                text03 := CopyStr(text01, Looper, 2);
                text02 := copystr((text02 + ConvSingleKana(text03)), 1, MaxStrLen(text02));
                Looper += 1;
            end
            else begin
                text03 := CopyStr(text01, Looper, 1);
                text02 := copystr((text02 + ConvSingleKana(text03)), 1, MaxStrLen(text02));
            end;
        end;
    end;

    procedure ByteOfFullWidthCharacter(ChrByte: Integer): Boolean
    begin
        //This function is applicable only for SHIFT-JIS (Codepage 932) used in Windows OS
        //Part of double-byte kanji/kana is in range of 81-9F and E0-FC (hexadecimals)

        //For Unicode Navision always FALSE
        exit(false);

        //Below code can only be applied to non Unicode Navision
        //exit(ChrByte in [129 .. 159, 224 .. 252]);
    end;

    local procedure ConvSingleKana(dblLetter: Text[2]): Text[2]
    begin
        if dblLetter <> '' then
            case dblLetter of
                'ア':
                    exit('ｱ');
                'イ':
                    exit('ｲ');
                'ウ':
                    exit('ｳ');
                'エ':
                    exit('ｴ');
                'オ':
                    exit('ｵ');
                'カ':
                    exit('ｶ');
                'キ':
                    exit('ｷ');
                'ク':
                    exit('ｸ');
                'ケ':
                    exit('ｹ');
                'コ':
                    exit('ｺ');
                'サ':
                    exit('ｻ');
                'シ':
                    exit('ｼ');
                'ス':
                    exit('ｽ');
                'セ':
                    exit('ｾ');
                'ソ':
                    exit('ｿ');
                'タ':
                    exit('ﾀ');
                'チ':
                    exit('ﾁ');
                'ツ':
                    exit('ﾂ');
                'テ':
                    exit('ﾃ');
                'ト':
                    exit('ﾄ');
                'ナ':
                    exit('ﾅ');
                'ニ':
                    exit('ﾆ');
                'ヌ':
                    exit('ﾇ');
                'ネ':
                    exit('ﾈ');
                'ノ':
                    exit('ﾉ');
                'ハ':
                    exit('ﾊ');
                'ヒ':
                    exit('ﾋ');
                'フ':
                    exit('ﾌ');
                'ヘ':
                    exit('ﾍ');
                'ホ':
                    exit('ﾎ');
                'マ':
                    exit('ﾏ');
                'ミ':
                    exit('ﾐ');
                'ム':
                    exit('ﾑ');
                'メ':
                    exit('ﾒ');
                'モ':
                    exit('ﾓ');
                'ラ':
                    exit('ﾗ');
                'リ':
                    exit('ﾘ');
                'ル':
                    exit('ﾙ');
                'レ':
                    exit('ﾚ');
                'ロ':
                    exit('ﾛ');
                'ヤ':
                    exit('ﾔ');
                'ユ':
                    exit('ﾕ');
                'ヨ':
                    exit('ﾖ');
                'ワ':
                    exit('ﾜ');
                'ヲ':
                    exit('ｦ');
                'ン':
                    exit('ﾝ');
                'ァ':
                    exit('ｱ');
                'ィ':
                    exit('ｲ');
                'ゥ':
                    exit('ｳ');
                'ェ':
                    exit('ｴ');
                'ォ':
                    exit('ｵ');
                'ガ':
                    exit('ｶﾞ');
                'ギ':
                    exit('ｷﾞ');
                'グ':
                    exit('ｸﾞ');
                'ゲ':
                    exit('ｹﾞ');
                'ゴ':
                    exit('ｺﾞ');
                'ザ':
                    exit('ｻﾞ');
                'ジ':
                    exit('ｼﾞ');
                'ズ':
                    exit('ｽﾞ');
                'ゼ':
                    exit('ｾﾞ');
                'ゾ':
                    exit('ｿﾞ');
                'ダ':
                    exit('ﾀﾞ');
                'ヅ':
                    exit('ﾂﾞ');
                'デ':
                    exit('ﾃﾞ');
                'ド':
                    exit('ﾄﾞ');
                'バ':
                    exit('ﾊﾞ');
                'ビ':
                    exit('ﾋﾞ');
                'ブ':
                    exit('ﾌﾞ');
                'ベ':
                    exit('ﾍﾞ');
                'ボ':
                    exit('ﾎﾞ');
                'パ':
                    exit('ﾊﾟ');
                'ピ':
                    exit('ﾋﾟ');
                'プ':
                    exit('ﾌﾟ');
                'ペ':
                    exit('ﾍﾟ');
                'ポ':
                    exit('ﾎﾟ');
                'ャ':
                    exit('ﾔ');
                'ュ':
                    exit('ﾕ');
                'ョ':
                    exit('ﾖ');
                'ッ':
                    exit('ｯ');
                'ヶ':
                    exit('ｹ');
                '１':
                    exit('1');
                '２':
                    exit('2');
                '３':
                    exit('3');
                '４':
                    exit('4');
                '５':
                    exit('5');
                '６':
                    exit('6');
                '７':
                    exit('7');
                '８':
                    exit('8');
                '９':
                    exit('9');
                '０':
                    exit('0');
                'Ａ':
                    exit('A');
                'Ｂ':
                    exit('B');
                'Ｃ':
                    exit('C');
                'Ｄ':
                    exit('D');
                'Ｅ':
                    exit('E');
                'Ｆ':
                    exit('F');
                'Ｇ':
                    exit('G');
                'Ｈ':
                    exit('H');
                'Ｉ':
                    exit('I');
                'Ｊ':
                    exit('J');
                'Ｋ':
                    exit('K');
                'Ｌ':
                    exit('L');
                'Ｍ':
                    exit('M');
                'Ｎ':
                    exit('N');
                'Ｏ':
                    exit('O');
                'Ｐ':
                    exit('P');
                'Ｑ':
                    exit('Q');
                'Ｒ':
                    exit('R');
                'Ｓ':
                    exit('S');
                'Ｔ':
                    exit('T');
                'Ｕ':
                    exit('U');
                'Ｖ':
                    exit('V');
                'Ｗ':
                    exit('W');
                'Ｘ':
                    exit('X');
                'Ｙ':
                    exit('Y');
                'Ｚ':
                    exit('Z');
                'ａ':
                    exit('a');
                'ｂ':
                    exit('b');
                'ｃ':
                    exit('c');
                'ｄ':
                    exit('d');
                'ｅ':
                    exit('e');
                'ｆ':
                    exit('f');
                'ｇ':
                    exit('g');
                'ｈ':
                    exit('h');
                'ｉ':
                    exit('i');
                'ｊ':
                    exit('j');
                'ｋ':
                    exit('k');
                'ｌ':
                    exit('l');
                'ｍ':
                    exit('m');
                'ｎ':
                    exit('n');
                'ｏ':
                    exit('o');
                'ｐ':
                    exit('p');
                'ｑ':
                    exit('q');
                'ｒ':
                    exit('r');
                'ｓ':
                    exit('s');
                'ｔ':
                    exit('t');
                'ｕ':
                    exit('u');
                'ｖ':
                    exit('v');
                'ｗ':
                    exit('w');
                'ｘ':
                    exit('x');
                'ｙ':
                    exit('v');
                'ｚ':
                    exit('z');
                '￥':
                    exit('\');
                '，':
                    exit(',');
                '．':
                    exit('.');
                '（':
                    exit('(');
                '）':
                    exit(')');
                'ｰ':
                    exit('-');
                '－':
                    exit('-');
                'ー':
                    exit('-');
                '／':
                    exit('/');
                '＄':
                    exit('$');
                '％':
                    exit('%');
                '＾':
                    exit('^');
                '＆':
                    exit('&');
                '＊':
                    exit('*');
                '＋':
                    exit('+');
                '＝':
                    exit('=');
                '｛':
                    exit('{');
                '｝':
                    exit('}');
                '「':
                    exit('[');
                '」':
                    exit(']');
                '～':
                    exit('~');
                '‘':
                    exit('`');
                '＃':
                    exit('#');
                '＠':
                    exit('@');
                '！':
                    exit('!');
                '？':
                    exit('?');
                '；':
                    exit(';');
                '　':
                    exit(' ');
            end;
        exit(dblLetter);
    end;
}

