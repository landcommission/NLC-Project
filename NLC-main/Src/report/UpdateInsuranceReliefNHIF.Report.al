#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193735 "Update Insurance Relief NHIF"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Insurance Relief NHIF.rdlc';
    ApplicationArea = All;
    Caption = 'Update Insurance Relief NHIF';
    dataset
    {
        dataitem("PR Salary Card"; "PR Salary Card")
        {
            RequestFilterFields = "Pays NHIF", "Insurance Certificate?";
            column(ReportForNavId_1; 1) { }
            column(InsuranceCertificate_PRSalaryCard; "PR Salary Card"."Insurance Certificate?") { }
            column(PaysNHIF_PRSalaryCard; "PR Salary Card"."Pays NHIF") { }
            column(EmployeeCode_PRSalaryCard; "PR Salary Card"."Employee Code") { }
            column(Counter; Counter) { }
            column(No; No) { }
            column(Status; StatusRec) { }

            trigger OnAfterGetRecord()
            begin
                /*
                "PR Salary Card".RESET;
                "PR Salary Card".SETRANGE("PR Salary Card"."Pays NHIF",TRUE);
                 "PR Salary Card"."Insurance Certificate?":=TRUE;
                "PR Salary Card".MODIFY;
                */
                Counter := Counter + 1;

            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        Counter: Integer;
        Emp: Record "HR Employees";
        No: Code[20];
        StatusRec: Option Active,Inactive,New,"Pending Approval",Rejected;
}
