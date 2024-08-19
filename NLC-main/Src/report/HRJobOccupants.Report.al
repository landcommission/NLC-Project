#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193424 "HR Job Occupants"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Job Occupants.rdlc';
    Caption = 'HR Job Occupants Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("HR Jobs"; "HR Jobs")
        {
            RequestFilterFields = "Job ID", Status;
            column(ReportForNavId_1000000000; 1000000000) { }
            column(CI_Name; CI.Name)
            {
                IncludeCaption = true;
            }
            column(CI_Address; CI.Address)
            {
                IncludeCaption = true;
            }
            column(CI_Address2; CI."Address 2")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CI."Phone No.") { }
            column(CI_Picture; CI.Picture) { }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
            }
            column(JobID_HRJobs; "HR Jobs"."Job ID")
            {
                IncludeCaption = true;
            }
            column(JobDescription_HRJobs; "HR Jobs"."Job Description")
            {
                IncludeCaption = true;
            }
            column(PositionReportingto_HRJobs; "HR Jobs"."Position Reporting to") { }
            column(PositionReportingName_HRJobs; "HR Jobs"."Position Reporting Name") { }
            dataitem("HR Employees"; "HR Employees")
            {
                DataItemLink = "Job ID" = field("Job ID");
                DataItemTableView = sorting("No.") order(ascending) where(Status = filter(Active));
                column(ReportForNavId_1000000001; 1000000001) { }
                column(No_HREmployees; "HR Employees"."No.")
                {
                    IncludeCaption = true;
                }
                column(FirstName_HREmployees; "HR Employees"."First Name")
                {
                    IncludeCaption = true;
                }
                column(MiddleName_HREmployees; "HR Employees"."Middle Name")
                {
                    IncludeCaption = true;
                }
                column(LastName_HREmployees; "HR Employees"."Last Name")
                {
                    IncludeCaption = true;
                }
                column(JobTitle_HREmployees; "HR Employees"."Job Title")
                {
                    IncludeCaption = true;
                }

                trigger OnAfterGetRecord()
                begin
                    HRJob.Reset();
                    HRJob.SetRange(HRJob."Job ID", "HR Employees"."Job Title");
                    //if HRJob.Find('-') then
                    //CurrReport.SHOWOUTPUT:=true;
                end;
            }
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
    end;

    var
        CI: Record "Company Information";
        HR_Job_OccupationsCaptionLbl: Label 'HR Job Occupations';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Job_OccupantsCaptionLbl: Label 'HR Job Occupants';
        P_O__BoxCaptionLbl: Label 'P.O. Box';
        NoCaptionLbl: Label 'No';
        NameCaptionLbl: Label 'Name';
        Company_E_MailCaptionLbl: Label 'Company E-Mail';
        Postal_AddressCaptionLbl: Label 'Postal Address';
        CityCaptionLbl: Label 'City';
        HRJob: Record "HR Jobs";
}
