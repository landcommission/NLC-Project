report 69556 "Employee Transfer Letter"
{
    Caption = 'Employee Transfer Letter';

    DefaultLayout = RDLC;
    RDLCLayout = './Employee Transfer Letter.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem(TRANS; "Employee Transfers")
        {
            column(CI_Picture; CI.Picture) { }
            column(NewSattion; UpperCase("New Sattion Name")) { }
            column(CI_Address; CI.Address) { }
            column(CI__Address_2______CI__Post_Code_; CI."Address 2" + ' ' + CI."Post Code") { }
            column(CI_City; CI.City) { }
            column(CI_PhoneNo; CI."Phone No.") { }
            column(COMPANYNAME; CompanyName) { }
            column(ActualReportingDate_TRANS; "Actual Reporting Date") { }
            column(Age_TRANS; Age) { }
            column(CreatedBy_TRANS; "Created By") { }
            column(DateCreated_TRANS; "Date Created") { }
            column(Distance_TRANS; Distance) { }
            column(DocumentNo_TRANS; "Document No") { }
            column(DocumentType_TRANS; "Document Type") { }
            column(Email_TRANS; Email) { }
            column(EmployeeName_TRANS; "Employee Name") { }
            column(EmployeeNo_TRANS; "Employee No") { }
            column(EntryNo_TRANS; "Entry No") { }
            column(JobTitle_TRANS; "Job Title") { }
            column(NewSattionName_TRANS; "New Sattion Name") { }
            column(NewStation_TRANS; "New Station") { }
            column(NoSeries_TRANS; "No. Series") { }
            column(OriginalStation_TRANS; "Original Station") { }
            column(OriginalStationName_TRANS; "Original Station Name") { }
            column(OriginalTransferNo_TRANS; "Original Transfer No") { }
            column(PLWD_TRANS; PLWD) { }
            column(Posted_TRANS; Posted) { }
            column(PostedOn_TRANS; "Posted On") { }
            column(ProfessionalOpinion_TRANS; "Professional Opinion") { }
            column(ReasonsforAppeal_TRANS; "Reason(s) for Appeal") { }
            column(Remarks_TRANS; Remarks) { }
            column(ReportingDate_TRANS; "Reporting Date") { }
            column(RequestDate_TRANS; "Request Date") { }
            column(RequestingStation_TRANS; "Requesting Station") { }
            column(RequestingStationName_TRANS; "Requesting Station  Name") { }
            column(Status_TRANS; Status) { }
            column(SystemCreatedAt_TRANS; SystemCreatedAt) { }
            column(SystemCreatedBy_TRANS; SystemCreatedBy) { }
            column(SystemId_TRANS; SystemId) { }
            column(SystemModifiedAt_TRANS; SystemModifiedAt) { }
            column(SystemModifiedBy_TRANS; SystemModifiedBy) { }
            column(TimeCreated_TRANS; "Time Created") { }
            column(ToHardshipArea_TRANS; "To Hardship Area?") { }
            column(TransferAppeal_TRANS; "Transfer Appeal") { }
            column(TransferDate_TRANS; "Transfer Date") { }
            column(TransferNo_TRANS; "Transfer No") { }
            column(TransferReasonCode_TRANS; "Transfer Reason Code") { }
            column(TransferedBy_TRANS; "Transfered By") { }
            column(Type_TRANS; "Type") { }
            dataitem(Emp; Employee)
            {
                DataItemLink = "No." = field("Employee No");

                column(FirstName_Emp; "First Name") { }
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
        CI.Get();
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

