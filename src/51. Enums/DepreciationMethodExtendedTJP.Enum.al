#if AppSource
enum 70658584 "Depreciation Method (Extended) TJP"
#endif
#if OnPremise
enum 99009 "Depreciation Method (Extended) TJP"
#endif
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; "Straight-Line") { Caption = 'Japan Straight-Line'; }
    value(1; "Declining-Balance 1") { Caption = 'Declining-Balance 1'; }
    value(2; "Declining-Balance 2") { Caption = 'Declining-Balance 2'; }
    value(3; "DB1/SL") { Caption = 'DB1/SL'; }
    value(4; "DB2/SL") { Caption = 'DB2/SL'; }
    value(5; "User-Defined") { Caption = 'User-Defined'; }
    value(6; Manual) { Caption = 'Manual'; }
    value(7; JPDB) { Caption = 'Japan DB'; }
    value(99; " ") { Caption = ' ', Locked = true; }
}