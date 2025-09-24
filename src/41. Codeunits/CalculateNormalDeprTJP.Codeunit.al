#if AppSource
codeunit 70658577 "Calculate Normal Depr. TJP"
#endif
#if OnPremise
codeunit 99002 "Calculate Normal Depr. TJP"
#endif
{
    //TJP1.00 OnCalculateDeprAmountOnDeprMethodCaseLastEntry added paramer CalcDB1Amount
    //TJP1.00 OnCalculateDeprAmountOnDeprMethodCaseLastDeprEntry added paramer CalcDB1Amount
    //TJP #01 20201019 Removed With Statement

    Permissions = TableData "FA Ledger Entry" = r,
                  TableData "FA Posting Type Setup" = r;

    trigger OnRun()
    begin
    end;

    var
        FA: Record "Fixed Asset";
        FALedgEntry: Record "FA Ledger Entry";
        DeprBook: Record "Depreciation Book";
        FADeprBook: Record "FA Depreciation Book";
        DepreciationCalc: Codeunit "Depreciation Calculation";
        Text000Err: Label 'Force No. of Days must only be specified if %1 %2 = %3.', Comment = '%1=?,%2=?,%3=?';
        //Text001: Label '%2 must not be 100 for %1.';
        Text001Err: Label '%2 must not be more than 100 for %1.', Comment = '%1=?,%2=?';
        Text002Err: Label '%2 must be %3 if %4 %5 = %6 for %1.', Comment = '%1=?,%2=?,%3=?,%4=?,%5=?,%6=?';
        Text003Err: Label '%2 must not be later than %3 for %1.', Comment = '%1=?,%2=?,%3=?';
        Text004Err: Label '%1 %2 must not be used together with the Half-Year Convention for %3.', Comment = '%1=?,%2=?,%3=?';
        DeprBookCode: Code[10];
        DaysInFiscalYear: Integer;
        EntryAmounts: array[4] of Decimal;
        MinusBookValue: Decimal;
        DateFromProjection: Date;
        SkipOnZero: Boolean;
        UntilDate: Date;
        Sign: Integer;
        FirstDeprDate: Date;
        NumberOfDays: Integer;
        NumberOfDays2: Integer;
        DaysInPeriod: Integer;
        UseDeprStartingDate: Boolean;
        BookValue: Decimal;
        BookValue2: Decimal;
        DeprBasis: Decimal;
        SalvageValue: Decimal;
        SalvageValue2: Decimal;
        AcquisitionDate: Date;
        DisposalDate: Date;
        DeprMethod: Option StraightLine,DB1,DB2,DB1SL,DB2SL,"User-Defined",Manual,JPDB,BelowZero; //TJP1.00 Add JPDB
        DeprStartingDate: Date;
        FirstUserDefinedDeprDate: Date;
        SLPercent: Decimal;
        DBPercent: Decimal;
        FixedAmount: Decimal;
        DeprYears: Decimal;
        DeprTableCode: Code[10];
        FinalRoundingAmount: Decimal;
        EndingBookValue: Decimal;
        AmountBelowZero: Decimal;
        PercentBelowZero: Decimal;
        StartingDate: Date;
        EndingDate: Date;
        Factor: Decimal;
        UseHalfYearConvention: Boolean;
        NewYearDate: Date;
        DeprInTwoFiscalYears: Boolean;
        TempDeprAmount: Decimal;
        Text005Err: Label '%1 must not be used together with the Half-Year Convention for %2.', Comment = '%1=?,%2=?';
        Text006Err: Label '%1 must be %2 or later for %3.', Comment = '%1=?,%2=?,%3=?';
        Text007Err: Label '%1 must not be used together with %2 for %3.', Comment = '%1=?,%2=?,%3=?';
        Text008Err: Label '%1 must not be used together with %2 = %3 for %4.', Comment = '%1=?,%2=?,%3=?,%4=?';
        Year365Days: Boolean;

    procedure Calculate(var DeprAmount: Decimal; var NumberOfDays4: Integer; FANo: Code[20]; DeprBookCode2: Code[10]; UntilDate2: Date; EntryAmounts2: array[4] of Decimal; DateFromProjection2: Date; DaysInPeriod2: Integer)
    var
        i: Integer;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCalculate(DeprAmount, NumberOfDays4, FANo, DeprBookCode2, UntilDate2, EntryAmounts2, DateFromProjection2, DaysInPeriod2, IsHandled);
        if IsHandled then
            exit;

        ClearAll();
        DeprAmount := 0;
        NumberOfDays4 := 0;
        DeprBookCode := DeprBookCode2;
        FA.Get(FANo);
        DeprBook.Get(DeprBookCode);
        if not FADeprBook.Get(FANo, DeprBookCode) then
            exit;
        UntilDate := UntilDate2;
        for i := 1 to 4 do
            EntryAmounts[i] := EntryAmounts2[i];
        DateFromProjection := DateFromProjection2;
        DaysInPeriod := DaysInPeriod2;

        FALedgEntry.LockTable();
        //with DeprBook do  //TJP
        if DaysInPeriod > 0 then
            if DeprBook."Periodic Depr. Date Calc." <> DeprBook."Periodic Depr. Date Calc."::"Last Entry" then begin
                DeprBook."Periodic Depr. Date Calc." := DeprBook."Periodic Depr. Date Calc."::"Last Entry";
                Error(
                  Text000Err,
                  DeprBook.TableCaption, DeprBook.FieldCaption("Periodic Depr. Date Calc."), DeprBook."Periodic Depr. Date Calc.");
            end;
        TransferValues();
        if not SkipRecord() then begin
            Sign := 1;
            if not FADeprBook."Use FA Ledger Check" then begin
                if DeprBook."Use FA Ledger Check" then
                    FADeprBook.TestField("Use FA Ledger Check", true);
                FADeprBook.TestField("Fixed Depr. Amount below Zero", 0);
                FADeprBook.TestField("Depr. below Zero %", 0);
                Sign := DepreciationCalc.GetSign(BookValue, DeprBasis, SalvageValue, MinusBookValue);
                if Sign = 0 then
                    exit;
                if Sign = -1 then
                    DepreciationCalc.GetNewSigns(BookValue, DeprBasis, SalvageValue, MinusBookValue);
            end;
            if (FADeprBook."Fixed Depr. Amount below Zero" > 0) or
               (FADeprBook."Depr. below Zero %" > 0)
            then
                FADeprBook.TestField("Use FA Ledger Check", true);

            if BookValue + SalvageValue <= 0 then
                SkipOnZero := true;
            if (SalvageValue >= 0) and (BookValue <= EndingBookValue) then
                SkipOnZero := true;

            if not
               (SkipOnZero and
                not DeprBook."Allow Depr. below Zero" and
                not DeprBook."Use FA Ledger Check")
            then begin
                if SkipOnZero then
                    DeprMethod := DeprMethod::BelowZero;
                if (DeprMethod = DeprMethod::BelowZero) then            // 2023-03-15 Anada
                    case FADeprBook."JPDB Type TJP" of                  // 2023-03-15 Anada
                        FADeprBook."JPDB Type TJP"::JPSLOld:            // 2023-03-15 Anada
                            DeprMethod := DeprMethod::StraightLine;     // 2023-03-15 Anada
                        FADeprBook."JPDB Type TJP"::JPDBOld:            // 2023-03-15 Anada
                            DeprMethod := DeprMethod::DB1               // 2023-03-15 Anada
                    end;                                                // 2023-03-15 Anada
                DeprAmount := Sign * CalculateDeprAmount();
                if Sign * DeprAmount > 0 then
                    DeprAmount := 0;
                NumberOfDays4 := NumberOfDays2;
            end;
        end;
    end;

    local procedure SkipRecord(): Boolean
    begin
        exit(
          (DisposalDate > 0D) or
          (AcquisitionDate = 0D) or
          (DeprMethod = DeprMethod::Manual) or
          (AcquisitionDate > UntilDate) or
          FA.Inactive or
          FA.Blocked);
    end;

    local procedure CalculateDeprAmount(): Decimal
    var
        Amount: Decimal;
    begin
        //with FA do begin
        if DateFromProjection > 0D then
            FirstDeprDate := DateFromProjection
        else begin
            FirstDeprDate := DepreciationCalc.GetFirstDeprDate(FA."No.", DeprBookCode, Year365Days);  //TJP
            if FirstDeprDate > UntilDate then
                exit(0);
            UseDeprStartingDate := DepreciationCalc.UseDeprStartingDate(FA."No.", DeprBookCode);  //TJP
            if UseDeprStartingDate then
                FirstDeprDate := DeprStartingDate;
        end;
        if FirstDeprDate < DeprStartingDate then
            FirstDeprDate := DeprStartingDate;
        NumberOfDays := DepreciationCalc.DeprDays(FirstDeprDate, UntilDate, Year365Days);
        Factor := 1;
        if NumberOfDays <= 0 then
            exit(0);
        if DaysInPeriod > 0 then begin
            Factor := DaysInPeriod / NumberOfDays;
            NumberOfDays := DaysInPeriod;
        end;
        UseHalfYearConvention := SetHalfYearConventionMethod();
        // Method Last Entry
        if UseDeprStartingDate or
           (DateFromProjection > 0D) or
           (DeprMethod = DeprMethod::BelowZero) or
           (DeprBook."Periodic Depr. Date Calc." = DeprBook."Periodic Depr. Date Calc."::"Last Entry")
        then begin
            NumberOfDays2 := NumberOfDays;
            if UseHalfYearConvention then
                Amount := CalcHalfYearConventionDepr()
            else
                case DeprMethod of
                    DeprMethod::StraightLine:
                        Amount := CalcSLAmount();
                    DeprMethod::DB1:
                        Amount := CalcDB1Amount();
                    DeprMethod::DB2:
                        Amount := CalcDB2Amount();
                    DeprMethod::DB1SL,
                    DeprMethod::DB2SL:
                        Amount := CalcDBSLAmount();
                    DeprMethod::Manual:
                        Amount := 0;
                    DeprMethod::"User-Defined":
                        Amount := CalcUserDefinedAmount(UntilDate);
                    DeprMethod::BelowZero:
                        Amount := DepreciationCalc.CalcRounding(DeprBookCode, CalcBelowZeroAmount());
                    else
                        OnCalculateDeprAmountOnDeprMethodCaseLastEntry(
                            FADeprBook, CalcDB1Amount(), BookValue, DeprBasis, DeprYears, DaysInFiscalYear, NumberOfDays, Amount);
                end;
        end
        // Method Last Depreciation Entry
        else begin
            if UseHalfYearConvention then
                DeprBook.TestField(
                  "Periodic Depr. Date Calc.", DeprBook."Periodic Depr. Date Calc."::"Last Entry");
            Amount := 0;
            StartingDate := 0D;
            EndingDate := 0D;
            DepreciationCalc.GetDeprPeriod(
              FA."No.", DeprBookCode, UntilDate, StartingDate, EndingDate, NumberOfDays, Year365Days);  //TJP
            FirstDeprDate := StartingDate;
            NumberOfDays2 := DepreciationCalc.DeprDays(FirstDeprDate, UntilDate, Year365Days);
            while NumberOfDays > 0 do begin
                DepreciationCalc.CalculateDeprInPeriod(
                  FA."No.", DeprBookCode, EndingDate, Amount, Sign,                                    //TJP
                  BookValue, DeprBasis, SalvageValue, MinusBookValue);
                if DepreciationCalc.GetSign(
                     BookValue, DeprBasis, SalvageValue, MinusBookValue) <> 1
                then
                    exit(0);
                case DeprMethod of
                    DeprMethod::StraightLine:
                        Amount := Amount + CalcSLAmount();
                    DeprMethod::DB1:
                        Amount := Amount + CalcDB1Amount();
                    DeprMethod::DB2:
                        Amount := Amount + CalcDB2Amount();
                    DeprMethod::Manual:
                        Amount := 0;
                    DeprMethod::"User-Defined":
                        Amount := Amount + CalcUserDefinedAmount(EndingDate);
                    else
                        OnCalculateDeprAmountOnDeprMethodCaseLastDeprEntry(
                            FADeprBook, CalcDB1Amount(), BookValue, DeprBasis, DeprYears, DaysInFiscalYear, NumberOfDays, Amount);

                end;
                DepreciationCalc.GetDeprPeriod(
                  FA."No.", DeprBookCode, UntilDate, StartingDate, EndingDate, NumberOfDays, Year365Days);  //TJP
                FirstDeprDate := StartingDate;
            end;
        end;
        //end;
        if Amount >= 0 then
            exit(0);
        if not SkipOnZero then
            // DepreciationCalc.AdjustDepr(
            //   DeprBookCode, Amount, Abs(BookValue2), -Abs(SalvageValue2),
            //   EndingBookValue, FinalRoundingAmount);
            if FADeprBook."JPDB Type TJP" <> FADeprBook."JPDB Type TJP"::JPDBOld then
                DepreciationCalc.AdjustDepr(
                DeprBookCode, Amount, Abs(BookValue2), -Abs(SalvageValue2),
                EndingBookValue, FinalRoundingAmount);

        OnAfterCalculateDeprAmount(
          FA, SkipOnZero, DeprBookCode, Amount, Abs(BookValue2), -Abs(SalvageValue2), EndingBookValue, FinalRoundingAmount);

        exit(Round(Amount));
    end;

    local procedure CalcTempDeprAmount(var DeprAmount: Decimal): Boolean
    begin
        DeprAmount := 0;
        if FADeprBook."Temp. Ending Date" = 0D then
            exit(false);
        if (FirstDeprDate <= FADeprBook."Temp. Ending Date") and (UntilDate > FADeprBook."Temp. Ending Date") then
            Error(
              Text006Err,
              FADeprBook.FieldCaption("Temp. Ending Date"),
              UntilDate,
              FAName());
        if FADeprBook."Temp. Ending Date" >= UntilDate then begin
            if FADeprBook."Use Half-Year Convention" then
                Error(
                  Text005Err,
                  FADeprBook.FieldCaption("Temp. Ending Date"),
                  FAName());
            if FADeprBook."Use DB% First Fiscal Year" then
                Error(
                  Text007Err,
                  FADeprBook.FieldCaption("Temp. Ending Date"),
                  FADeprBook.FieldCaption("Use DB% First Fiscal Year"),
                  FAName());
            if FADeprBook."Depreciation Method" = FADeprBook."Depreciation Method"::"User-Defined" then
                Error(
                  Text008Err,
                  FADeprBook.FieldCaption("Temp. Ending Date"),
                  FADeprBook.FieldCaption("Depreciation Method"),
                  FADeprBook."Depreciation Method",
                  FAName());
            if DeprMethod = DeprMethod::BelowZero then
                Error(
                  Text007Err,
                  FADeprBook.FieldCaption("Temp. Ending Date"),
                  DeprBook.FieldCaption("Allow Depr. below Zero"),
                  FAName());
            DeprBook.TestField(
              "Periodic Depr. Date Calc.", DeprBook."Periodic Depr. Date Calc."::"Last Entry");
            DeprAmount := -(NumberOfDays / DaysInFiscalYear) * FADeprBook."Temp. Fixed Depr. Amount";
            exit(true)
        end;
        exit(false);
    end;

    local procedure CalcSLAmount(): Decimal
    var
        RemainingLife: Decimal;
        IsHandled: Boolean;
        Result: Decimal;
        DepreciationAmountTJP: Decimal;             // 2023-03-15 Anada
        FivePercentAmountTJP: Decimal;              // 2023-03-15 Anada
        FivePercentAmountDividedByFive: Decimal;    // 2023-03-15 Anada
    begin
        if CalcTempDeprAmount(TempDeprAmount) then
            exit(TempDeprAmount);

        //if SLPercent > 0 then                                                                                 // 2023-03-15 Anada
        //    exit((-SLPercent / 100) * (NumberOfDays / DaysInFiscalYear) * DeprBasis);                         // 2023-03-15 Anada
        if SLPercent > 0 then begin                                                                             // 2023-03-15 Anada
            DepreciationAmountTJP := (SLPercent / 100) * (NumberOfDays / DaysInFiscalYear) * DeprBasis;         // 2023-03-15 Anada
            case FADeprBook."JPDB Type TJP" of                                                                  // 2023-03-15 Anada
                FADeprBook."JPDB Type TJP"::JPSLOld:                                                            // 2023-03-15 Anada
                    if BookValue > 1 then begin                                                                 // 2023-03-15 Anada
                        FivePercentAmountTJP := Round(((DeprBasis + (SalvageValue * -1)) * 0.05), 1, '<');      // 2023-03-15 Anada
                        if (BookValue - DepreciationAmountTJP) < FivePercentAmountTJP then                      // 2023-03-15 Anada
                            if (BookValue - FivePercentAmountTJP) > 0 then                                      // 2023-03-15 Anada
                                exit((BookValue - FivePercentAmountTJP) * -1)                                   // 2023-03-15 Anada
                            else begin                                                                          // 2023-03-15 Anada
                                FivePercentAmountDividedByFive := Round((FivePercentAmountTJP / 5), 1, '>');    // 2023-03-15 Anada
                                case (BookValue - (FivePercentAmountDividedByFive)) of                          // 2023-03-15 Anada
                                    1 .. 999999999:                                                             // 2023-03-15 Anada
                                        exit((FivePercentAmountDividedByFive * -1));                            // 2023-03-15 Anada
                                    0:                                                                          // 2023-03-15 Anada
                                        exit((FivePercentAmountDividedByFive - 1) * -1);                        // 2023-03-15 Anada
                                    -999999999 .. 0:                                                            // 2023-03-15 Anada
                                        exit((BookValue - 1) * -1);                                             // 2023-03-15 Anada
                                end;                                                                            // 2023-03-15 Anada
                            end                                                                                 // 2023-03-15 Anada
                        else                                                                                    // 2023-03-15 Anada
                            exit(DepreciationAmountTJP * -1)                                                    // 2023-03-15 Anada
                    end                                                                                         // 2023-03-15 Anada
                    else                                                                                        // 2023-03-15 Anada
                        exit(0);                                                                                // 2023-03-15 Anada
                else                                                                                            // 2023-03-15 Anada
                    exit(DepreciationAmountTJP * -1);                                                           // 2023-03-15 Anada
            end;                                                                                                // 2023-03-15 Anada
        end;                                                                                                    // 2023-03-15 Anada

        if FixedAmount > 0 then
            exit(-FixedAmount * NumberOfDays / DaysInFiscalYear);

        if DeprYears > 0 then begin
            RemainingLife :=
              (DeprYears * DaysInFiscalYear) -
              DepreciationCalc.DeprDays(
                DeprStartingDate, DepreciationCalc.Yesterday(FirstDeprDate, Year365Days), Year365Days);
            if RemainingLife < 1 then
                exit(-BookValue);

            IsHandled := false;
            OnAfterCalcSL(FA, FADeprBook, UntilDate, BookValue, DeprBasis, DeprYears, NumberOfDays, DaysInFiscalYear, Result, IsHandled);
            if IsHandled then
                exit(Result);

            exit(-(BookValue + SalvageValue - MinusBookValue) * NumberOfDays / RemainingLife);
        end;
        exit(0);
    end;

    local procedure CalcDB1Amount(): Decimal
    var
        DeprInFiscalYear: Decimal;
        DepreciationAmountTJP: Decimal;             // 2023-03-15 Anada
        FivePercentAmountTJP: Decimal;              // 2023-03-15 Anada
        FivePercentAmountDividedByFive: Decimal;    // 2023-03-15 Anada
    begin
        if CalcTempDeprAmount(TempDeprAmount) then
            exit(TempDeprAmount);

        if DateFromProjection = 0D then
            DeprInFiscalYear := DepreciationCalc.DeprInFiscalYear(FA."No.", DeprBookCode, UntilDate)
        else
            DeprInFiscalYear := EntryAmounts[3];
        if DeprInTwoFiscalYears then
            DeprInFiscalYear := 0;
        // exit(                                                                                            // 2023-03-15 Anada
        //   -(DBPercent / 100) * (NumberOfDays / DaysInFiscalYear) *                                       // 2023-03-15 Anada
        //   (BookValue + SalvageValue - MinusBookValue - Sign * DeprInFiscalYear));                        // 2023-03-15 Anada
        DepreciationAmountTJP := (DBPercent / 100) * (NumberOfDays / DaysInFiscalYear)                      // 2023-03-15 Anada
                               * (BookValue - MinusBookValue - Sign * DeprInFiscalYear);                    // 2023-03-15 Anada
        case FADeprBook."JPDB Type TJP" of                                                                  // 2023-03-15 Anada
            FADeprBook."JPDB Type TJP"::JPDBOld:                                                            // 2023-03-15 Anada
                if BookValue > 1 then begin                                                                 // 2023-03-15 Anada
                    FivePercentAmountTJP := Round(((DeprBasis + (SalvageValue * -1)) * 0.05), 1, '<');      // 2023-03-15 Anada
                    if (BookValue - DepreciationAmountTJP) < FivePercentAmountTJP then                      // 2023-03-15 Anada
                        if (BookValue - FivePercentAmountTJP) > 0 then                                      // 2023-03-15 Anada
                            exit((BookValue - FivePercentAmountTJP) * -1)                                   // 2023-03-15 Anada
                        else begin                                                                          // 2023-03-15 Anada
                            FivePercentAmountDividedByFive := Round((FivePercentAmountTJP / 5), 1, '>');    // 2023-03-15 Anada
                            case (BookValue - (FivePercentAmountDividedByFive)) of                          // 2023-03-15 Anada
                                1 .. 999999999:                                                             // 2023-03-15 Anada
                                    exit((FivePercentAmountDividedByFive * -1));                            // 2023-03-15 Anada
                                0:                                                                          // 2023-03-15 Anada
                                    exit((FivePercentAmountDividedByFive - 1) * -1);                        // 2023-03-15 Anada
                                -999999999 .. 0:                                                            // 2023-03-15 Anada
                                    exit((BookValue - 1) * -1);                                             // 2023-03-15 Anada
                            end;                                                                            // 2023-03-15 Anada
                        end                                                                                 // 2023-03-15 Anada
                    else                                                                                    // 2023-03-15 Anada
                        exit(DepreciationAmountTJP * -1);                                                   // 2023-03-15 Anada
                end                                                                                         // 2023-03-15 Anada
                else                                                                                        // 2023-03-15 Anada
                    exit(0);                                                                                // 2023-03-15 Anada
            else                                                                                            // 2023-03-15 Anada
                exit(DepreciationAmountTJP * -1);                                                           // 2023-03-15 Anada
        end;                                                                                                // 2023-03-15 Anada

    end;

    local procedure CalcDB2Amount(): Decimal
    begin
        if CalcTempDeprAmount(TempDeprAmount) then
            exit(TempDeprAmount);

        exit(
          -(1 - Power(1 - DBPercent / 100, NumberOfDays / DaysInFiscalYear)) *
          (BookValue - MinusBookValue));
    end;

    local procedure CalcDBSLAmount(): Decimal
    var
        FADateCalc: Codeunit "FA Date Calculation";
        SLAmount: Decimal;
        DBAmount: Decimal;
    begin
        if DeprMethod = DeprMethod::DB1SL then
            DBAmount := CalcDB1Amount()
        else
            DBAmount := CalcDB2Amount();
        if FADeprBook."Use DB% First Fiscal Year" then
            if FADateCalc.GetFiscalYear(DeprBookCode, UntilDate) =
               FADateCalc.GetFiscalYear(DeprBookCode, DeprStartingDate)
            then
                exit(DBAmount);
        SLAmount := CalcSLAmount();
        if SLAmount < DBAmount then
            exit(SLAmount);

        exit(DBAmount)
    end;

    local procedure CalcUserDefinedAmount(pEndingDate: Date): Decimal
    var
        TableDeprCalc: Codeunit "Table Depr. Calculation";
    begin
        if CalcTempDeprAmount(TempDeprAmount) then
            Error('');

        exit(
          -TableDeprCalc.GetTablePercent(DeprBook.Code, DeprTableCode,
            FirstUserDefinedDeprDate, FirstDeprDate, pEndingDate) *
          DeprBasis * Factor);
    end;

    local procedure CalcBelowZeroAmount(): Decimal
    begin
        if CalcTempDeprAmount(TempDeprAmount) then
            Error('');

        if PercentBelowZero > 0 then
            exit((-PercentBelowZero / 100) * (NumberOfDays / DaysInFiscalYear) * DeprBasis);
        if AmountBelowZero > 0 then
            exit(-AmountBelowZero * NumberOfDays / DaysInFiscalYear);
        exit(0);
    end;

    local procedure TransferValues()
    begin
        //with FADeprBook do begin  //TJP
        FADeprBook.TestField("Depreciation Starting Date");
        if FADeprBook."Depreciation Method" = FADeprBook."Depreciation Method"::"User-Defined" then begin
            FADeprBook.TestField("Depreciation Table Code");
            FADeprBook.TestField("First User-Defined Depr. Date");
        end;
        case FADeprBook."Depreciation Method" of
            FADeprBook."Depreciation Method"::"Declining-Balance 1",
          FADeprBook."Depreciation Method"::"Declining-Balance 2",
          FADeprBook."Depreciation Method"::"DB1/SL",
          FADeprBook."Depreciation Method"::"DB2/SL":
                //if FADeprBook."Declining-Balance %" >= 100 then       // 2023-03-07 Anada
                if FADeprBook."Declining-Balance %" > 100 then          // 2023-03-07 Anada
                    Error(Text001Err, FAName(), FADeprBook.FieldCaption("Declining-Balance %"));
        end;
        if (DeprBook."Periodic Depr. Date Calc." = DeprBook."Periodic Depr. Date Calc."::"Last Depr. Entry") and
           (FADeprBook."Depreciation Method" <> FADeprBook."Depreciation Method"::"Straight-Line")
        then begin
            FADeprBook."Depreciation Method" := FADeprBook."Depreciation Method"::"Straight-Line";
            Error(
              Text002Err,
              FAName(),
              FADeprBook.FieldCaption("Depreciation Method"),
              FADeprBook."Depreciation Method",
              DeprBook.TableCaption,
              DeprBook.FieldCaption("Periodic Depr. Date Calc."),
              DeprBook."Periodic Depr. Date Calc.");
        end;

        if DateFromProjection = 0D then begin
            FADeprBook.CalcFields("Book Value");
            BookValue := FADeprBook."Book Value";
        end else
            BookValue := EntryAmounts[1];
        MinusBookValue := DepreciationCalc.GetMinusBookValue(FA."No.", DeprBookCode, 0D, 0D);
        FADeprBook.CalcFields("Depreciable Basis", "Salvage Value");
        DeprBasis := FADeprBook."Depreciable Basis";
        SalvageValue := FADeprBook."Salvage Value";
        BookValue2 := BookValue;
        SalvageValue2 := SalvageValue;
        DeprMethod := FADeprBook."Depreciation Method".AsInteger();
        DeprStartingDate := FADeprBook."Depreciation Starting Date";
        DeprTableCode := FADeprBook."Depreciation Table Code";
        FirstUserDefinedDeprDate := FADeprBook."First User-Defined Depr. Date";
        if (FADeprBook."Depreciation Method" = FADeprBook."Depreciation Method"::"User-Defined") and
           (FirstUserDefinedDeprDate > DeprStartingDate)
        then
            Error(
              Text003Err,
              FAName(), FADeprBook.FieldCaption("First User-Defined Depr. Date"), FADeprBook.FieldCaption("Depreciation Starting Date"));
        SLPercent := FADeprBook."Straight-Line %";
        DBPercent := FADeprBook."Declining-Balance %";
        DeprYears := FADeprBook."No. of Depreciation Years";
        if FADeprBook."Depreciation Ending Date" > 0D then begin
            if FADeprBook."Depreciation Starting Date" > FADeprBook."Depreciation Ending Date" then
                Error(
                  Text003Err,
                  FAName(), FADeprBook.FieldCaption("Depreciation Starting Date"), FADeprBook.FieldCaption("Depreciation Ending Date"));
            DeprYears :=
              DepreciationCalc.DeprDays(
                FADeprBook."Depreciation Starting Date", FADeprBook."Depreciation Ending Date", false) / 360;
        end;
        FixedAmount := FADeprBook."Fixed Depr. Amount";
        FinalRoundingAmount := FADeprBook."Final Rounding Amount";
        if FinalRoundingAmount = 0 then
            FinalRoundingAmount := DeprBook."Default Final Rounding Amount";
        EndingBookValue := FADeprBook."Ending Book Value";
        if not FADeprBook."Ignore Def. Ending Book Value" and (EndingBookValue = 0) then
            EndingBookValue := DeprBook."Default Ending Book Value";
        AcquisitionDate := FADeprBook."Acquisition Date";
        DisposalDate := FADeprBook."Disposal Date";
        PercentBelowZero := FADeprBook."Depr. below Zero %";
        AmountBelowZero := FADeprBook."Fixed Depr. Amount below Zero";
        DaysInFiscalYear := DeprBook."No. of Days in Fiscal Year";
        if DaysInFiscalYear = 0 then
            DaysInFiscalYear := 360;
        Year365Days := DeprBook."Fiscal Year 365 Days";
        if Year365Days then begin
            DaysInFiscalYear := 365;
            DeprYears :=
              DepreciationCalc.DeprDays(
                FADeprBook."Depreciation Starting Date", FADeprBook."Depreciation Ending Date", true) / DaysInFiscalYear;
        end;
        //end;

        OnAfterTransferValues(FA, FADeprBook, Year365Days, DeprYears, DeprMethod);
    end;

    local procedure FAName(): Text[200]
    var
    //DepreciationCalc: Codeunit "Depreciation Calculation";
    begin
        exit(DepreciationCalc.FAName(FA, DeprBookCode));
    end;

    local procedure SetHalfYearConventionMethod(): Boolean
    var
        AccountingPeriod: Record "Accounting Period";
    begin
        if not FADeprBook."Use Half-Year Convention" then
            exit(false);
        if FADeprBook."Depreciation Method" = FADeprBook."Depreciation Method"::Manual then
            exit(false);
        if DeprMethod = DeprMethod::BelowZero then
            exit(false);
        if AccountingPeriod.IsEmpty then
            exit(false);

        AccountingPeriod.SetRange("New Fiscal Year", true);
        AccountingPeriod.SetFilter(
          "Starting Date", '>=%1',
          DepreciationCalc.ToMorrow(FADeprBook."Depreciation Starting Date", Year365Days));
        AccountingPeriod.FindFirst();
        NewYearDate := AccountingPeriod."Starting Date";
        if FirstDeprDate >= NewYearDate then
            exit(false);

        if DeprBook."No. of Days in Fiscal Year" <> 0 then
            DeprBook.TestField("No. of Days in Fiscal Year", 360);
        if DeprMethod in
           [DeprMethod::DB2,
            DeprMethod::DB2SL,
            DeprMethod::"User-Defined"]
        then
            Error(
              Text004Err,
              FADeprBook.FieldCaption("Depreciation Method"),
              FADeprBook."Depreciation Method",
              FAName());
        exit(true);
    end;

    local procedure CalcHalfYearConventionDepr(): Decimal
    var
        DeprAmount: Decimal;
        HalfYearPercent: Decimal;
        HalfYearFactor: Decimal;
        OriginalNumberOfDays: Integer;
        OriginalBookValue: Decimal;
        OriginalFirstDeprDate: Date;
    begin
        if CalcTempDeprAmount(TempDeprAmount) then
            Error('');

        if (DeprMethod = DeprMethod::DB1) or (DeprMethod = DeprMethod::DB1SL) then
            HalfYearPercent := DBPercent
        else
            if SLPercent > 0 then
                HalfYearPercent := SLPercent
            else
                if DeprYears > 0 then
                    HalfYearPercent :=
                      100 /
                      (DepreciationCalc.DeprDays(NewYearDate, FADeprBook."Depreciation Ending Date", Year365Days) +
                       DaysInFiscalYear / 2) * DaysInFiscalYear
                else
                    HalfYearPercent := 0;

        HalfYearFactor :=
          DaysInFiscalYear / 2 /
          DepreciationCalc.DeprDays(
            FADeprBook."Depreciation Starting Date",
            DepreciationCalc.Yesterday(NewYearDate, Year365Days),
            Year365Days);
        DeprInTwoFiscalYears := UntilDate >= NewYearDate;

        OriginalNumberOfDays := NumberOfDays;
        OriginalBookValue := BookValue;
        OriginalFirstDeprDate := FirstDeprDate;

        if DeprInTwoFiscalYears then
            NumberOfDays :=
              DepreciationCalc.DeprDays(
                FirstDeprDate, DepreciationCalc.Yesterday(NewYearDate, Year365Days), Year365Days);
        if FixedAmount > 0 then
            DeprAmount := -FixedAmount * NumberOfDays / DaysInFiscalYear * HalfYearFactor
        else
            DeprAmount :=
              (-HalfYearPercent / 100) * (NumberOfDays / DaysInFiscalYear) * DeprBasis * HalfYearFactor;
        if DeprInTwoFiscalYears then begin
            NumberOfDays := DepreciationCalc.DeprDays(NewYearDate, UntilDate, Year365Days);
            FirstDeprDate := NewYearDate;
            BookValue := BookValue + DeprAmount;
            case DeprMethod of
                DeprMethod::StraightLine:
                    DeprAmount := DeprAmount + CalcSLAmount();
                DeprMethod::DB1:
                    DeprAmount := DeprAmount + CalcDB1Amount();
                DeprMethod::DB1SL:
                    DeprAmount := DeprAmount + CalcDBSLAmount();
            end;
        end;
        NumberOfDays := OriginalNumberOfDays;
        BookValue := OriginalBookValue;
        FirstDeprDate := OriginalFirstDeprDate;
        DeprInTwoFiscalYears := false;
        exit(DeprAmount);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCalculate(var DeprAmount: Decimal; var NumberOfDays4: Integer; FANo: Code[20]; DeprBookCode2: Code[10]; UntilDate2: Date; EntryAmounts2: array[4] of Decimal; DateFromProjection2: Date; DaysInPeriod2: Integer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCalculateDeprAmount(FixedAsset: Record "Fixed Asset"; SkipOnZero: Boolean; DeprBookCode: Code[20]; var Amount: Decimal; BookValue: Decimal; SalvageValue: Decimal; EndingBookValue: Decimal; FinalRoundingAmount: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCalcSL(FixedAsset: Record "Fixed Asset"; FADepreciationBook: Record "FA Depreciation Book"; UntilDate: Date; BookValue: Decimal; DeprBasis: Decimal; DeprYears: Decimal; NumberOfDays: Integer; DaysInFiscalYear: Integer; var ExitValue: Decimal; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterTransferValues(FixedAsset: Record "Fixed Asset"; FADepreciationBook: Record "FA Depreciation Book"; Year365Days: Boolean; var DeprYears: Decimal; var DeprMethod: Option)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCalculateDeprAmountOnDeprMethodCaseLastEntry(FADepreciationBook: Record "FA Depreciation Book"; CalcDB1Amount: Decimal; BookValue: Decimal; DeprBasis: Decimal; DeprYears: Decimal; DaysInFiscalYear: Integer; NumberOfDays: Integer; var Amount: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCalculateDeprAmountOnDeprMethodCaseLastDeprEntry(FADepreciationBook: Record "FA Depreciation Book"; CalcDB1Amount: Decimal; BookValue: Decimal; DeprBasis: Decimal; DeprYears: Decimal; DaysInFiscalYear: Integer; NumberOfDays: Integer; var Amount: Decimal)
    begin
    end;
}

