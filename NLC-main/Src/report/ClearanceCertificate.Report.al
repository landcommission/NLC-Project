#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50033 "Clearance Certificate"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Clearance Certificate.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Clearance Certificate';
    dataset
    {
        dataitem("Clearance Certificate"; "Clearance Certificate")
        {
            RequestFilterFields = "Clearance No.", "Employee No";
            column(ReportForNavId_1; 1) { }
            column(Name_ClearanceCertificate; "Clearance Certificate".Name) { }
            column(PNo_ClearanceCertificate; "Clearance Certificate"."P/No") { }
            column(Date_ClearanceCertificate; "Clearance Certificate".Date) { }
            column(Designation_ClearanceCertificate; "Clearance Certificate".Designation) { }
            column(Directorate_ClearanceCertificate; "Clearance Certificate".Directorate) { }
            column(SalaryAdvance_ClearanceCertificate; "Clearance Certificate"."Salary Advance") { }
            column(Imprest_ClearanceCertificate; "Clearance Certificate".Imprest) { }
            column(PettyCash_ClearanceCertificate; "Clearance Certificate"."Petty Cash") { }
            column(CarLoan_ClearanceCertificate; "Clearance Certificate"."Car Loan") { }
            column(Mortgage_ClearanceCertificate; "Clearance Certificate".Mortgage) { }
            column(WorkingTools_ClearanceCertificate; "Clearance Certificate"."Working Tools") { }
            column(OfficeDeskKeys_ClearanceCertificate; "Clearance Certificate"."Office & Desk Keys") { }
            column(CarKeys_ClearanceCertificate; "Clearance Certificate"."Car Keys") { }
            column(OtherFin_ClearanceCertificate; "Clearance Certificate"."Other Fin") { }
            column(NLCIDCard_ClearanceCertificate; "Clearance Certificate"."NLC ID Card") { }
            column(MedicalCard_ClearanceCertificate; "Clearance Certificate"."Medical Card") { }
            column(LeaveBalance_ClearanceCertificate; "Clearance Certificate"."Leave Balance") { }
            column(OtherHR_ClearanceCertificate; "Clearance Certificate"."Other HR") { }
            column(SpecifyHR_ClearanceCertificate; "Clearance Certificate"."Specify HR") { }
            column(Laptop_ClearanceCertificate; "Clearance Certificate".Laptop) { }
            column(IpadTablet_ClearanceCertificate; "Clearance Certificate"."Ipad/Tablet") { }
            column(MobilePhone_ClearanceCertificate; "Clearance Certificate"."Mobile Phone") { }
            column(ICTSecurityClearance_ClearanceCertificate; "Clearance Certificate"."ICT & Security Clearance") { }
            column(OthersICT_ClearanceCertificate; "Clearance Certificate"."Others ICT") { }
            column(Store_ClearanceCertificate; "Clearance Certificate".Store) { }
            column(OtherSCM_ClearanceCertificate; "Clearance Certificate"."Other SCM") { }
            column(Library_ClearanceCertificate; "Clearance Certificate".Library) { }
            column(OtherComm_ClearanceCertificate; "Clearance Certificate"."Other Comm") { }
            column(LAdm_ClearanceCertificate; "Clearance Certificate".LAdm) { }
            column(NLIMS_ClearanceCertificate; "Clearance Certificate".NLIMS) { }
            column(Legal_ClearanceCertificate; "Clearance Certificate".Legal) { }
            column(ResearchAdvocacy_ClearanceCertificate; "Clearance Certificate"."Research & Advocacy") { }
            column(NaturalResource_ClearanceCertificate; "Clearance Certificate"."Natural Resource") { }
            column(ValuationTaxation_ClearanceCertificate; "Clearance Certificate"."Valuation & Taxation") { }
            column(Survey_ClearanceCertificate; "Clearance Certificate".Survey) { }
            column(CLMB_ClearanceCertificate; "Clearance Certificate".CLMB) { }
            column(Audit_ClearanceCertificate; "Clearance Certificate".Audit) { }
            column(CommentsFinance_ClearanceCertificate; "Clearance Certificate"."Comments Finance") { }
            column(CommentsHR_ClearanceCertificate; "Clearance Certificate"."Comments HR") { }
            column(CommentsICT_ClearanceCertificate; "Clearance Certificate"."Comments ICT") { }
            column(CommentsComm_ClearanceCertificate; "Clearance Certificate"."Comments Comm") { }
            column(CommentsLA_ClearanceCertificate; "Clearance Certificate"."Comments LA") { }
            column(CommentsNLIMS_ClearanceCertificate; "Clearance Certificate"."Comments NLIMS") { }
            column(Status_ClearanceCertificate; "Clearance Certificate".Status) { }
            column(ResponsibilityCenter_ClearanceCertificate; "Clearance Certificate"."Responsibility Center") { }
            column(ClearanceNo_ClearanceCertificate; "Clearance Certificate"."Clearance No.") { }
            column(USERID_ClearanceCertificate; "Clearance Certificate"."USER ID") { }
            column(NoSeries_ClearanceCertificate; "Clearance Certificate"."No. Series") { }
            column(EmployeeNo_ClearanceCertificate; "Clearance Certificate"."Employee No") { }
            column(EntryNo_ClearanceCertificate; "Clearance Certificate"."Entry No") { }
            column(ICTComputer_ClearanceCertificate; "Clearance Certificate"."ICT Computer") { }
            column(CheckCLMB_ClearanceCertificate; "Clearance Certificate"."Check CLMB") { }
            column(CheckSCM_ClearanceCertificate; "Clearance Certificate"."Check SCM") { }
            column(CheckResearchAdvocacy_ClearanceCertificate; "Clearance Certificate"."Check Research & Advocacy") { }
            column(CheckNaturalResource_ClearanceCertificate; "Clearance Certificate"."Check Natural Resource") { }
            column(CheckSurvey_ClearanceCertificate; "Clearance Certificate"."Check Survey") { }
            column(CheckValuationTaxation_ClearanceCertificate; "Clearance Certificate"."Check Valuation & Taxation") { }
            column(Details_ClearanceCertificate; "Clearance Certificate".Details) { }
            column(SeparationNo_ClearanceCertificate; "Clearance Certificate"."Separation No") { }
            column(OthersCLMB_ClearanceCertificate; "Clearance Certificate".OthersCLMB) { }
            column(name; CI.Name) { }
            column(Picture; CI.Picture) { }
            dataitem("HR Employees"; "HR Employees")
            {
                DataItemLink = "No." = field("Employee No");
                column(ReportForNavId_7; 7) { }
                column(FullName_HREmployees; "HR Employees"."Full Name") { }
                column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
                column(ResponsibilityCenter_HREmployees; "HR Employees"."Responsibility Center") { }
                column(Grade_HREmployees; "HR Employees".Grade) { }
                column(IDNumber_HREmployees; "HR Employees"."ID Number") { }
                column(Gender_HREmployees; "HR Employees".Gender) { }
                column(Ethnicity_HREmployees; "HR Employees".Ethnicity) { }
                dataitem("Approval Entry"; "Approval Entry")
                {
                    column(ReportForNavId_72; 72) { }
                    column(ApproverID_ApprovalEntry; "Approval Entry"."Approver ID") { }
                    column(Status_ApprovalEntry; "Approval Entry".Status) { }
                }
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
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}
