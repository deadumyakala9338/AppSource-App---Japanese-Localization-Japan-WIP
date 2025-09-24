#if AppSource
pageextension 70658692 "Recurring General Journal TJP" extends "Recurring General Journal"
#endif
#if OnPremise
pageextension 99047 "Recurring General Journal TJP" extends "Recurring General Journal"
#endif
{
    actions
    {
        addlast(promoted)
        {
            group(ExcelUploadDownloadTJP_PromotedTJP)
            {
                Caption = 'Upload/Download';

                actionref(UploadFromExcelTJP_Promoted; UploadFromExcelTJP)
                {
                }
                actionref(DownloadToExcelTJP_Promoted; DownloadToExcelTJP)
                {
                }
            }
        }
        addlast("F&unctions")
        {
            group(ExcelUploadDownloadTJP)
            {
                Caption = 'Upload/Download';
                Image = Excel;
                Visible = TheCompanyIsInJapan;

                action(UploadFromExcelTJP)
                {
                    ApplicationArea = All;
                    Caption = 'Upload from Excel';
                    ToolTip = 'Upload journal lines from Excel.';
                    Image = Excel;

                    trigger OnAction()
                    var
                        GenJournalLineRec: Record "Gen. Journal Line";
                        RecurringGenJnlULDLTJP: Codeunit "Recurring Gen. Jnl.-UL/DL TJP";
                    begin
                        RecurringGenJnlULDLTJP.UploadRecurringGeneralJournalFromExcel(Rec."Journal Template Name", Rec."Journal Batch Name");
                        GenJournalLineRec.SetRange("Journal Template Name", Rec."Journal Template Name");
                        GenJournalLineRec.SetRange("Journal Batch Name", Rec."Journal Batch Name");
                        if GenJournalLineRec.IsEmpty = false then
                            Rec.FindFirst();
                    end;
                }
                action(DownloadToExcelTJP)
                {
                    ApplicationArea = All;
                    Caption = 'Download to Excel';
                    ToolTip = 'Download journal lines to Excel.';
                    Image = Excel;

                    trigger OnAction()
                    var
                        RecurringGenJnlULDLTJP: Codeunit "Recurring Gen. Jnl.-UL/DL TJP";
                    begin
                        RecurringGenJnlULDLTJP.DownloadRecurringGeneralJournalToExcel(Rec."Journal Template Name", Rec."Journal Batch Name");
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        CompanyInformationRec: Record "Company Information";
    begin
        CompanyInformationRec.Get();
        if StrPos(CompanyInformationRec."Country/Region Code", 'JP') = 1 then
            TheCompanyIsInJapan := true
        else
            TheCompanyIsInJapan := false;
    end;

    var
        TheCompanyIsInJapan: Boolean;
}