report 69700 "Employee Transfer Report"
{

    Caption = 'Employee Transfer Report';
    DefaultLayout = RDLC;
    RDLCLayout = '.Layouts/Employee Transfer Report.rdlc';
    ApplicationArea = All;
    dataset
    {
        dataitem(EmployeeTransfers; "Employee Transfers")
        {
            // DataItemTableView = WHERE(Posted = CONST(true));
            // PrintOnlyIfDetail = true;
            RequestFilterFields = "Employee No";
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
            column(SystemCreatedAt; SystemCreatedAt) { }
            column(SystemCreatedBy; SystemCreatedBy) { }
            column(SystemId; SystemId) { }
            column(SystemModifiedAt; SystemModifiedAt) { }
            column(SystemModifiedBy; SystemModifiedBy) { }
            column(TimeCreated; "Time Created") { }
            column(ToHardshipArea; "To Hardship Area?") { }
            column(TransferDate; "Transfer Date") { }
            column(TransferedBy; "Transfered By") { }
            column(Type; "Type") { }
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
