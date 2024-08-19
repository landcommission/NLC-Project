report 70001 "Discipline Application Report"
{
    ApplicationArea = All;
    Caption = 'Discipline Document Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/DisciplineDocumentReport.rdlc';
    dataset
    {
        dataitem(DisciplineGrievance; "Discipline Applications")
        {
            column(No; "No.") { }
            column(Description; Description) { }
            column(EmployeeNo; "Employee No.") { }
            column(EmployeeName; "Employee Name") { }
            column(AccusedEmployee; "Accused Employee") { }
            column(AccusedEmployeeName; "Accused Employee Name") { }
            column(AccusedEmployeeDesignation; "Accused Employee Designation") { }
            column(DateCreated; "Date Created") { }
            column(DateSubmitted; "Date Submitted") { }
            column(Designation; Designation) { }
            column(DocumentDate; "Document Date") { }
            column(Status; Status) { }
            column(SubmittedBy; "Submitted By") { }
            column(CompanyName; CompanyInfo.Name) { }
            column(CompanyPic; CompanyInfo.Picture) { }
            column(Filters; Filters) { }
            column(Type; Type) { }

            trigger OnPreDataItem()
            begin
                Filters := DisciplineGrievance.GetFilters;
            end;
        }

    }
    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;



    var

        CompanyInfo: Record "Company Information";
        Filters: Text;


}
