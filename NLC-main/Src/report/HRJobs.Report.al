#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193423 "HR Jobs"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Jobs.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'HR Jobs';
    dataset
    {
        dataitem("HR Jobs"; "HR Jobs")
        {
            RequestFilterFields = "Job ID";
            column(ReportForNavId_9002; 9002) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(COMPANYNAME; CompanyName) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(HR_Jobs_UserID; "HR Jobs"."User ID") { }
            column(CI_Picture; CI.Picture) { }
            column(CI_Address; CI.Address) { }
            column(CI__Address_2______CI__Post_Code_; CI."Address 2" + ' ' + CI."Post Code") { }
            column(CI_City; CI.City) { }
            column(CI_PhoneNo; CI."Phone No.") { }
            column(HR_Jobs__Job_ID_; "HR Jobs"."Job ID") { }
            column(HR_Jobs__Job_Description_; "HR Jobs"."Job Description") { }
            column(HR_Jobs__No_of_Posts_; "HR Jobs"."No of Posts") { }
            column(PositionReportingName_HRJobs; "HR Jobs"."Position Reporting Name") { }
            column(HR_Jobs__Position_Reporting_to_; "HR Jobs"."Position Reporting to") { }
            column(DateCreated_HRJobs; "HR Jobs"."Date Created") { }
            column(HR_Jobs__Occupied_Positions_; "HR Jobs"."Occupied Positions") { }
            column(HR_Jobs__Vacant_Positions_; "HR Jobs"."Vacant Positions") { }
            column(HR_JobsCaption; HR_JobsCaptionLbl) { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(Job_StatisticsCaption; Job_StatisticsCaptionLbl) { }
            column(P_O__BoxCaption; P_O__BoxCaptionLbl) { }
            column(HR_Jobs__Job_ID_Caption; "HR Jobs".FieldCaption("HR Jobs"."Job ID")) { }
            column(HR_Jobs__Job_Description_Caption; "HR Jobs".FieldCaption("HR Jobs"."Job Description")) { }
            column(HR_Jobs__No_of_Posts_Caption; "HR Jobs".FieldCaption("HR Jobs"."No of Posts")) { }
            column(HR_Jobs__Position_Reporting_to_Caption; "HR Jobs".FieldCaption("HR Jobs"."Position Reporting to")) { }
            column(HR_Jobs__Occupied_Positions_Caption; "HR Jobs".FieldCaption("HR Jobs"."Occupied Positions")) { }
            column(HR_Jobs__Vacant_Positions_Caption; "HR Jobs".FieldCaption("HR Jobs"."Vacant Positions")) { }
            dataitem("Approval Entry"; "Approval Entry")
            {
                DataItemLink = "Document No." = field("Job ID");
                DataItemTableView = where("Sequence No." = const(3));
                column(ReportForNavId_3; 3) { }
                column(DocumentNo_ApprovalEntry; "Approval Entry"."Document No.") { }
                column(ApproverID_ApprovalEntry; "Approval Entry"."Approver ID") { }
                column(DateTimeSentforApproval_ApprovalEntry; "Approval Entry"."Date-Time Sent for Approval") { }
                column(LastDateTimeModified_ApprovalEntry; "Approval Entry"."Last Date-Time Modified") { }
                column(DueDate_ApprovalEntry; "Approval Entry"."Due Date") { }
            }

            trigger OnAfterGetRecord()
            begin
                "HR Jobs".Validate("HR Jobs"."Vacant Positions");
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
    end;

    var
        CI: Record "Company Information";
        HR_JobsCaptionLbl: Label 'HR Jobs';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Job_StatisticsCaptionLbl: Label 'HR Job Statistics';
        P_O__BoxCaptionLbl: Label 'P.O. Box';
        MyUserID: Text;
        UserSetup: Record "User Setup";
}
