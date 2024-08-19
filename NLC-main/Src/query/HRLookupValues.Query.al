#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
query 50001 "HR Lookup Values"
{
    Caption = 'HR Lookup Values';
    elements
    {
        dataitem(HR_Lookup_Values; "HR Lookup Values")
        {
            column(Type; Type) { }
            column("Code"; "Code") { }
            column(Description; Description) { }
            column(Previous_Job_Position; "Previous Job Position") { }
            column(Level; Level) { }
        }
    }
}
