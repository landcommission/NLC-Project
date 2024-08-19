report 50039 Interdiction
{
    ApplicationArea = All;
    Caption = 'Interdiction';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = Word;
    WordLayout = '.\Layouts\Interdiction.docx';

    dataset
    {
        dataitem(DisciplineDetails; "Discipline Details")
        {
            column(DisciplineCaseNo; "Discipline Case No.") { }
            column(DisciplineDetailNo; "Discipline Detail No.") { }
            column(DocumentStage; "Document Stage") { }
            column(DocumentStageDescription; "Document Stage Description") { }
            column(Recommendations; Recommendations) { }
            column(EmployeeName; GetAccusedEmployeeRecord().FullName()) { }
            // column(Designation; GetAccusedEmployeeRecord."Job Title2")
            // {
            // }
            column(ChiefJusticename; Emp.FullName()) { }
            column(ChiefJusticeDesignation; Emp."Job Title2") { }
            column(DateToday; Today) { }

            trigger OnAfterGetRecord()
            begin
                Emp.Reset();
                //Emp.SetRange("Is Chief Justice", True);
                Emp.FindFirst();
            end;
        }
    }

    var
        Emp: Record "HR Employees";

}
