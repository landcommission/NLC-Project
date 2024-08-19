#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193545 "Recruitment Details"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Recruitment Details.rdlc';
    ApplicationArea = All;
    Caption = 'Recruitment Details';
    dataset
    {
        dataitem("HR Jobs"; "HR Jobs")
        {
            RequestFilterFields = "Job ID";
            column(ReportForNavId_19; 19) { }
            column(JobID_HRJobs; "HR Jobs"."Job ID") { }
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


        CompanyInformation.Get();
        CompanyInformation.CalcFields(CompanyInformation.Picture);
        SNO := SNO + 1;
    end;

    var
        SNO: Integer;
        HRJobApplications: Record "HR Job Applications";
        HRApplicantQualifications: Record "HR Applicant Qualifications";
        HREmploymentHistory: Record "HR Employment History";
        CompanyInformation: Record "Company Information";
}
