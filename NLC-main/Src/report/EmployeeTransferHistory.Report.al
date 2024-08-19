report 69702 "Employee Transfer History"
{
    Caption = 'Employee Transfer History';
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/Employee Transfer History.rdlc';
    ApplicationArea = All;
    dataset
    {
        dataitem(EmployeeTransfers; "Employee Transfers")
        {
            DataItemTableView = where("Document Type" = const(Application));
            // PrintOnlyIfDetail = true;
            RequestFilterFields = "Employee No", "Date Created", "Transfer Date", "Reporting Date";

            column(CreatedBy; "Created By") { }
            column(CompanyLogo; CompanyInfo.Picture) { }
            column(CompanyName; CompanyInfo.Name) { }
            column(CompanyAddress; CompanyInfo.Address) { }
            column(CompanyAddress2; CompanyInfo."Address 2") { }
            column(CompanyPostCode; CompanyInfo."Post Code") { }
            column(CompanyCity; CompanyInfo.City) { }
            column(CompanyPhone; CompanyInfo."Phone No.") { }
            column(CompanyFax; CompanyInfo."Fax No.") { }
            column(CompanyEmail; CompanyInfo."E-Mail") { }
            column(CompanyWebsite; CompanyInfo."Home Page") { }
            column(DateCreated; "Date Created") { }
            column(Distance; Distance) { }
            column(DocumentNo; "Document No") { }
            column(EmployeeName; "Employee Name") { }
            column(EmployeeNo; "Employee No") { }
            column(EntryNo; "Entry No") { }
            column(NewSattionName; "New Sattion Name") { }
            column(NewStation; "New Station") { }
            column(NoSeries; "No. Series") { }
            column(OriginalStation; "Original Station") { }
            column(OriginalStationName; "Original Station Name") { }
            column(Posted; Posted) { }
            column(PostedOn; "Posted On") { }
            column(Status; Status) { }
            column(ReportingDate_EmployeeTransfers; "Reporting Date") { }
            column(RequestDate_EmployeeTransfers; "Request Date") { }
            column(ReasonsforAppeal_EmployeeTransfers; "Reason(s) for Appeal") { }
            column(DocumentType_EmployeeTransfers; "Document Type") { }
            column(TransferAppeal_EmployeeTransfers; "Transfer Appeal") { }
            column(TransferNo_EmployeeTransfers; "Transfer No") { }
            column(TransferReasonCode_EmployeeTransfers; "Transfer Reason Code") { }
            column(ProfessionalOpinion_EmployeeTransfers; "Professional Opinion") { }
            column(Remarks_EmployeeTransfers; Remarks) { }
            column(RequestingStationName_EmployeeTransfers; "Requesting Station  Name") { }
            column(SystemCreatedAt; SystemCreatedAt) { }
            column(SystemCreatedBy; SystemCreatedBy) { }
            column(SystemId; SystemId) { }
            column(SystemModifiedAt; SystemModifiedAt) { }
            column(SystemModifiedBy; SystemModifiedBy) { }
            column(TimeCreated; "Time Created") { }
            column(ToHardshipArea; Format("To Hardship Area?")) { }
            column(TransferDate; "Transfer Date") { }
            column(TransferedBy; "Transfered By") { }
            column(ActualReportingDate_EmployeeTransfers; "Actual Reporting Date") { }
            column(Age_EmployeeTransfers; Age) { }
            column(Designation_EmployeeTransfers; Designation) { }
            column(Email_EmployeeTransfers; Email) { }
            column(Gender_EmployeeTransfers; Gender) { }
            column(JobCadre_EmployeeTransfers; "Job Cadre") { }
            column(JobDescription_EmployeeTransfers; "Job Description") { }
            column(JobGrade_EmployeeTransfers; "Job Grade") { }
            column(JobTitle_EmployeeTransfers; "Job Title") { }
            column(NoofEmployeeRequested_EmployeeTransfers; "No of Employee Requested") { }
            column(OriginalTransferNo_EmployeeTransfers; "Original Transfer No") { }
            column(PLWD_EmployeeTransfers; PLWD) { }
            column(RequestingStation_EmployeeTransfers; "Requesting Station") { }
            column(Type_EmployeeTransfers; "Type") { }
            trigger OnAfterGetRecord()

            begin

                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName) { }
            }
        }
        actions
        {
            area(Processing) { }
        }
    }
    var
        CompanyInfo: Record "Company Information";
}

