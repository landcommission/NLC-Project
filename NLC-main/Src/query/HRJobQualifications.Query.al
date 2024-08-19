#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
query 50002 "HR Job Qualifications"
{
    OrderBy = ascending(Order);
    Caption = 'HR Job Qualifications';
    elements
    {
        dataitem(HR_Job_Qualifications; "HR Job Qualifications")
        {
            column(Qualification_Type; "Qualification Type") { }
            column("Code"; "Code") { }
            column(Description; Description) { }
            column(Category; Category) { }
            column("Order"; "Order") { }
            column(Professional; Professional) { }
        }
    }
}
