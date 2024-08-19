#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193428 "HR Jobs(Conclusive)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Jobs(Conclusive).rdlc';
    ApplicationArea = All;
    Caption = 'HR Jobs(Conclusive)';
    dataset
    {
        dataitem("HR Job Requirements"; "HR Job Requirements")
        {
            column(ReportForNavId_3; 3) { }
            column(QualificationType_HRJobRequirements; "HR Job Requirements"."Qualification Type") { }
            column(QualificationCode_HRJobRequirements; "HR Job Requirements"."Qualification Code") { }
            column(QualificationDescription_HRJobRequirements; "HR Job Requirements"."Qualification Description") { }
            column(MaximumScore_HRJobRequirements; "HR Job Requirements"."Maximum Score") { }
            column(MinimumScore_HRJobRequirements; "HR Job Requirements"."Minimum Score") { }
            column(Name; CI.Name) { }
            column(Picture; CI.Picture) { }
            dataitem("HR Jobs"; "HR Jobs")
            {
                DataItemLink = "Job ID" = field("Job ID");
                column(ReportForNavId_1; 1) { }
                column(JobID_HRJobs; "HR Jobs"."Job ID") { }
                column(JobDescription_HRJobs; "HR Jobs"."Job Description") { }
                column(NoofPosts_HRJobs; "HR Jobs"."No of Posts") { }
                column(PositionReportingto_HRJobs; "HR Jobs"."Position Reporting to") { }
                column(OccupiedPositions_HRJobs; "HR Jobs"."Occupied Positions") { }
                column(VacantPositions_HRJobs; "HR Jobs"."Vacant Positions") { }
                column(Grade_HRJobs; "HR Jobs".Grade) { }
                column(Status_HRJobs; "HR Jobs".Status) { }
                column(DateCreated_HRJobs; "HR Jobs"."Date Created") { }
                column(PositionReportingName_HRJobs; "HR Jobs"."Position Reporting Name") { }
                column(NoSeries_HRJobs; "HR Jobs"."No. Series") { }
                column(ResponsibilityCenter_HRJobs; "HR Jobs"."Responsibility Center") { }
            }

            trigger OnAfterGetRecord()
            begin
                "HR Job Requirements".Reset();
                //"HR Job Requirements".SETRANGE("Job ID",HRJobResponsiblities."Job ID"");
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin

        CI.Reset();
        CI.Get();
        CI.CalcFields(CI.Picture);
        //HRJobResponsiblities
    end;

    var
        CI: Record "Company Information";
        HR_JobsCaptionLbl: Label 'HR Jobs';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Job_StatisticsCaptionLbl: Label 'HR Job Statistics';
        P_O__BoxCaptionLbl: Label 'P.O. Box';
        MyUserID: Text;
        UserSetup: Record "User Setup";
        HRJobs: Record "HR Jobs";
        HRJobResponsiblities: Record "HR Job Responsiblities";
}
