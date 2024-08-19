report 70002 "Discipline Register"
{
    ApplicationArea = All;
    Caption = 'Discipline Register';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/DisciplineRegister.rdl';
    dataset
    {
        dataitem(HRDisciplinaryCases; "HR Disciplinary Cases")
        {
            column(CompanyName; CompInfo.Name) { }
            column(CompanyPicture; CompInfo.Picture) { }
            column(CaseNumber; "Case Number") { }
            column(EmployeeNo; "Employee No") { }
            column(EmployeeName; "Employee Name") { }
            column(Designation; Designation) { }
            column(CaseDescription; "Case Description") { }
            column(DateofComplaint; "Date of Complaint") { }
            // column(EmpStation; Emp."Current Duty Station")
            // {

            // }
            dataitem("Discipline Details"; "Discipline Details")
            {
                DataItemLink = "Discipline Case No." = field("Case Number");

                column(DocumentStage_DisciplineDetails; "Document Stage") { }
                column(DocumentStageDescription_DisciplineDetails; "Document Stage Description") { }
                column(Recommendations_DisciplineDetails; Recommendations) { }
                column(ChiefJusticeRemarks_DisciplineDetails; "Chief Justice Remarks") { }
            }

            trigger OnAfterGetRecord()
            begin
                if Emp.Get("Employee No") then;
            end;


        }

    }

    trigger OnPreReport()
    begin
        CompInfo.Get();
        CompInfo.CalcFields(Picture);

    end;

    var
        CompInfo: Record "Company Information";
        Emp: Record "HR Employees";

}
