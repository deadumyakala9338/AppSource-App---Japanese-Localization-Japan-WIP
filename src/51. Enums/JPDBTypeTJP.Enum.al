#if AppSource
enum 70658585 "JPDB Type TJP"
#endif
#if OnPremise
enum 99010 "JPDB Type TJP"
#endif
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; JPDB) { Caption = 'Japan DB (2007-2011) (250%)'; }
    value(1; JPDB2012) { Caption = 'Japan DB (2012-) (200%)'; }
    value(2; " ") { Caption = ' ', Locked = true; }
    value(3; JPSLOld) { Caption = 'Japan SL Old'; }
    value(4; JPSL2007) { Caption = 'Japan SL 2007'; }
    value(5; JPDBOld) { Caption = 'Japan DB Old'; }
}