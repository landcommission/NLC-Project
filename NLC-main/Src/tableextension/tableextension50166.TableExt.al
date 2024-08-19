#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50166 tableextension50166 extends "Purchase Cue"
{
    fields
    {
        field(50000; Workplan; Integer)
        {
            CalcFormula = count(Workplan);
            FieldClass = FlowField;
            Caption = 'Workplan';
            Editable = false;
        }
        field(50001; Tender; Integer)
        {
            CalcFormula = count("W/P Budget Buffer");
            FieldClass = FlowField;
            Caption = 'Tender';
            Editable = false;
        }
    }
}
