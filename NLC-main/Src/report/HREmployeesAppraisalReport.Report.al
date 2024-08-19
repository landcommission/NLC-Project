#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193544 "HR Employees Appraisal Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Employees Appraisal Report.rdlc';
    PreviewMode = Normal;
    ApplicationArea = All;
    Caption = 'HR Employees Appraisal Report';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        CI.Reset();
        CI.Get();
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        HrEmp: Record "prSalary Card Casual";
        HrGoalOb: Record "Applicant Education Background";
        COUNTED: Integer;
        TotalRatingAgreedPoint: Decimal;
        TotalRatingAgreedPercentage: Decimal;
        TotalRatingEmpPoint: Decimal;
        TotalRatingEmpPercentage: Decimal;
        TotalRatingValAssessAgreedPoint: Decimal;
        TotalRatingAgreedValAssessPercentage: Decimal;
        TotalRatingEmpValAssessPercentage: Decimal;
        HrAttitudeValue: Record "HR Knowledge and Skills";
        GrandTotalEmp: Decimal;
        GrandTotalAgreed: Decimal;
        Dates: Codeunit "Budget Allocation FP";
        Dservice: Text;
}
