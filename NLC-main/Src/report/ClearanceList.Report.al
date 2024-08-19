#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193603 "Clearance List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Clearance List.rdlc';
    ApplicationArea = All;
    Caption = 'Clearance List';
    dataset
    {
        dataitem("Clearance Certificate"; "Clearance Certificate")
        {
            RequestFilterFields = "Clearance No.";
            column(ReportForNavId_1; 1) { }
            column(SeparationNo_ClearanceCertificate; "Clearance Certificate"."Separation No") { }
            column(Name_ClearanceCertificate; "Clearance Certificate".Name) { }
            column(PNo_ClearanceCertificate; "Clearance Certificate"."P/No") { }
            column(Date_ClearanceCertificate; "Clearance Certificate".Date) { }
            column(Designation_ClearanceCertificate; "Clearance Certificate".Designation) { }
            column(Directorate_ClearanceCertificate; "Clearance Certificate".Directorate) { }
            column(ClearanceNo_ClearanceCertificate; "Clearance Certificate"."Clearance No.") { }
            column(USERID_ClearanceCertificate; "Clearance Certificate"."USER ID") { }
            column(EmployeeNo_ClearanceCertificate; "Clearance Certificate"."Employee No") { }
            column(Status_ClearanceCertificate; "Clearance Certificate".Status) { }
            column(ResponsibilityCenter_ClearanceCertificate; "Clearance Certificate"."Responsibility Center") { }
            column(Picture; CompInfo.Picture) { }
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
        CompInfo.Get();
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    var
        CompInfo: Record "Company Information";
}
