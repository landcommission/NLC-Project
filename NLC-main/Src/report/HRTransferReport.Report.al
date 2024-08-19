#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50028 "HR Transfer Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Transfer Report.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'HR Transfer Report';
    dataset
    {
        dataitem("HR Employee Transfer Header"; "HR Employee Transfer Header")
        {
            column(ReportForNavId_1; 1) { }
            column(RequestNo_HREmployeeTransferHeader; "HR Employee Transfer Header"."Request No") { }
            column(DateRequested_HREmployeeTransferHeader; "HR Employee Transfer Header"."Date Requested") { }
            column(DateApproved_HREmployeeTransferHeader; "HR Employee Transfer Header"."Date Approved") { }
            column(Status_HREmployeeTransferHeader; "HR Employee Transfer Header".Status) { }
            column(NoSeries_HREmployeeTransferHeader; "HR Employee Transfer Header"."No. Series") { }
            column(ResponsibilityCenter_HREmployeeTransferHeader; "HR Employee Transfer Header"."Responsibility Center") { }
            column(TransferdetailsUpdated_HREmployeeTransferHeader; "HR Employee Transfer Header"."Transfer details Updated") { }
            column(Details_HREmployeeTransferHeader; "HR Employee Transfer Header".Details) { }
            column(Reason_HREmployeeTransferHeader; "HR Employee Transfer Header".Reason) { }
            dataitem("HR Employee Transfer Lines"; "HR Employee Transfer Lines")
            {
                DataItemLink = "Request No" = field("Request No");
                column(ReportForNavId_11; 11) { }
                column(EmployeeNo_HREmployeeTransferLines; "HR Employee Transfer Lines"."Employee No") { }
                column(EmployeeName_HREmployeeTransferLines; "HR Employee Transfer Lines"."Employee Name") { }
                column(GlobalDimension1Code_HREmployeeTransferLines; "HR Employee Transfer Lines"."Global Dimension 1 Code") { }
                column(NewGlobalDimension1Code_HREmployeeTransferLines; "HR Employee Transfer Lines"."New Global Dimension 1 Code") { }
                column(GlobalDimension2Code_HREmployeeTransferLines; "HR Employee Transfer Lines"."Global Dimension 2 Code") { }
                column(NewGlobalDimension2Code_HREmployeeTransferLines; "HR Employee Transfer Lines"."New Global Dimension 2 Code") { }
                column(ShortcutDimension3Code_HREmployeeTransferLines; "HR Employee Transfer Lines"."Shortcut Dimension 3 Code") { }
                column(NewShortcutDimension3Code_HREmployeeTransferLines; "HR Employee Transfer Lines"."New Shortcut Dimension 3 Code") { }
                column(CurrentDepartmentName_HREmployeeTransferLines; "HR Employee Transfer Lines"."Current Department Name") { }
                column(NewDepartmentName_HREmployeeTransferLines; "HR Employee Transfer Lines"."New Department Name") { }
                column(CurrentRegionName_HREmployeeTransferLines; "HR Employee Transfer Lines"."Current Region Name") { }
                column(CurrentDirectorateName_HREmployeeTransferLines; "HR Employee Transfer Lines"."Current Directorate Name") { }
                column(NewDirectorateName_HREmployeeTransferLines; "HR Employee Transfer Lines"."New Directorate Name") { }
                column(DateOfTransfer_HREmployeeTransferLines; "HR Employee Transfer Lines"."Date Of Transfer") { }
                column(NewRegionName_HREmployeeTransferLines; "HR Employee Transfer Lines"."New Region Name") { }
                column(Reason; Reason)
                {

                }
                column(Picture; CI.Picture) { }
                column(Name; CI.Name) { }
                column(Adress; ci.Address)
                { }
                column(CompanyPh; ci."Phone No.")
                { }
                column(NewGrade_HREmployeeTransferLines; "HR Employee Transfer Lines"."New Grade") { }
                column(NewDesignation_HREmployeeTransferLines; "HR Employee Transfer Lines"."New Designation") { }
                column(CurrentGrade_HREmployeeTransferLines; "HR Employee Transfer Lines"."Current Grade") { }
                column(CurrentDesignation_HREmployeeTransferLines; "HR Employee Transfer Lines"."Current Designation") { }
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
        HREmployeeRec: Record "HR Employees";
}
