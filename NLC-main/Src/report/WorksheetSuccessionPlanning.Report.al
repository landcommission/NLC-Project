#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193460 "Worksheet Succession Planning"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Worksheet Succession Planning.rdlc';
    ApplicationArea = All;
    Caption = 'Worksheet Succession Planning';
    dataset
    {
        dataitem("HR Jobs to Succeed"; "HR Jobs to Succeed")
        {
            column(ReportForNavId_1; 1) { }
            column(JobID_HRJobstoSucceed; "HR Jobs to Succeed"."Job ID") { }
            column(Description_HRJobstoSucceed; "HR Jobs to Succeed".Description) { }
            column(IncumbentNo_HRJobstoSucceed; "HR Jobs to Succeed"."Incumbent No") { }
            column(IncumbentName_HRJobstoSucceed; "HR Jobs to Succeed"."Incumbent Name") { }
            column(RetirementDate_HRJobstoSucceed; "HR Jobs to Succeed"."Retirement Date") { }
            column(RetirementStatus_HRJobstoSucceed; "HR Jobs to Succeed"."Retirement Status") { }
            column(Criticality_HRJobstoSucceed; "HR Jobs to Succeed".Criticality) { }
            column(NumberofStaffready_HRJobstoSucceed; "HR Jobs to Succeed"."Number of Staff ready") { }
            column(NumberofStaffReadyin12_HRJobstoSucceed; "HR Jobs to Succeed"."Number of Staff Ready in 1-2") { }
            column(SuccessionPlanningprorities_HRJobstoSucceed; "HR Jobs to Succeed"."Succession Planning prorities") { }
            column("Count"; "HR Jobs to Succeed".Count) { }

            trigger OnAfterGetRecord()
            begin
                CountR := CountR + 1;
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        CountR: Integer;
}
