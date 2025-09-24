#if AppSource
enum 70658577 "Promissory Note Status TJP"
#endif
#if OnPremise
enum 99002 "Promissory Note Status TJP"
#endif
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; Open) { Caption = 'Open'; }
    value(1; "Note Received") { Caption = 'Note Received'; }
    value(2; "Note Issued") { Caption = 'Note Issued'; }
    value(3; "Cash Received") { Caption = 'Cash Received'; }
    value(4; "Cash Paid") { Caption = 'Cash Paid'; }
    value(5; Discounted) { Caption = 'Discounted'; }
    value(6; "Due Date Discounted") { Caption = 'Due Date Discounted'; }
    value(7; "Dishonored") { Caption = 'Dishonored'; }
    value(8; "All Notes") { Caption = 'All Notes'; }
}