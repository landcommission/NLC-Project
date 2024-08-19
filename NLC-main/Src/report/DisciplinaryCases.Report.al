#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193477 "Disciplinary Cases"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Disciplinary Cases.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Disciplinary Cases';
    dataset
    {
        dataitem("HR Disciplinary Cases NCA"; "HR Disciplinary Cases NCA")
        {
            RequestFilterFields = "Type Complaint", "Recommended Action";
            column(ReportForNavId_1; 1) { }
            column(CaseNumber_HRDisciplinaryCasesNCA; "HR Disciplinary Cases NCA"."Document No.") { }
            column(Dateofcmplaint; "HR Disciplinary Cases NCA"."Date of Complaint") { }
            column(Typecomplaint; "HR Disciplinary Cases NCA"."Type Complaint") { }
            column(ActionRecomendend; "HR Disciplinary Cases NCA"."Recommended Action") { }
            column(Picture; CI.Picture) { }
            column(Name; CI.Name) { }
            column(CompPhone; ci."Phone No.")
            {
            }
            column(AccuseResponse; Response)
            {

            }
            column(COmpAdreess; ci.Address)
            { }
            column(year; "HR Disciplinary Cases NCA".Year) { }
            column(EmployeeDefe; "HR Disciplinary Cases NCA"."Employee Defence") { }
            column(PrelimanryActionDate; "HR Disciplinary Cases NCA"."Preliminary Action Date") { }
            column(PreliminaryAction; "HR Disciplinary Cases NCA"."Preliminary Action") { }
            column(DescriptionofComplaint; "HR Disciplinary Cases NCA"."Description of Complaint") { }
            column(Accuser; "HR Disciplinary Cases NCA".Accuser) { }
            column(ActionTaken; "HR Disciplinary Cases NCA"."Action Taken") { }
            column(DateToDiscussCase; "HR Disciplinary Cases NCA"."Date To Discuss Case") { }
            column(AccusedEmployee; "HR Disciplinary Cases NCA"."Accused Employee") { }
            column(DocumentLink; "HR Disciplinary Cases NCA"."Document Link") { }
            column(DisciplinaryRemarks; "HR Disciplinary Cases NCA"."Disciplinary Remarks") { }
            column(Comments; "HR Disciplinary Cases NCA".Comments) { }
            column(CaseDiscussion; "HR Disciplinary Cases NCA"."Case Discussion") { }
            column(BodyHandlingTheComplaint; "HR Disciplinary Cases NCA"."Body Handling The Complaint") { }
            column(Recomendations; "HR Disciplinary Cases NCA".Recomendations) { }
            column(HRPayrollImplications; "HR Disciplinary Cases NCA"."HR/Payroll Implications") { }
            column(SupportDocuments; "HR Disciplinary Cases NCA"."Support Documents") { }
            column(PolicyGuidlinesInEffect; "HR Disciplinary Cases NCA"."Policy Guidlines In Effect") { }
            column(ModeofLodgingtheComplaint; "HR Disciplinary Cases NCA"."Mode of Lodging the Complaint") { }
            column(AccusedEmployeeName; "HR Disciplinary Cases NCA"."Accused Employee Name") { }
            column(Selected; "HR Disciplinary Cases NCA".Selected) { }
            column(ClosedBy_; "HR Disciplinary Cases NCA"."Closed By") { }
            column(ResponsibilityCenter; "HR Disciplinary Cases NCA"."Responsibility Center") { }
            column(AccuserName; "HR Disciplinary Cases NCA"."Accuser Name") { }
            column(DisciplinaryStageStatus; "HR Disciplinary Cases NCA"."Disciplinary Stage Status") { }
            column(UserID; "HR Disciplinary Cases NCA"."User ID") { }
            column(AccussedBy; "HR Disciplinary Cases NCA"."Accussed By") { }
            column(Appealed; "HR Disciplinary Cases NCA".Appealed) { }
            column(DateofComplaintwasReported; "HR Disciplinary Cases NCA"."Date of Complaint was Reported") { }
            column(ReviewFindings; "HR Disciplinary Cases NCA"."Review Findings") { }
            column(JobTitle; JobTitle)
            { }
            column(DOB; DOB)
            { }
            column(IDNum; IDNum)
            {

            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                DOB := '';
                IDNum := '';
                JobTitle := '';
                HREmployee.Reset();
                HREmployee.SetRange(HREmployee."No.", "HR Disciplinary Cases NCA".Accuser);
                if HREmployee.FindFirst() then begin
                    JobTitle := HREmployee."Job Title";
                    IDNum := HREmployee."ID Number";
                    if HREmployee."Date Of Birth" <> 0D then begin
                        DOB := GlobalsFunc.FormatDate(HREmployee."Date Of Birth");

                    end;

                end;
            end;
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
        HREmployee: Record "HR Employees";
        GlobalsFunc: Codeunit "Global Functions";
        DOB: Text;
        JobTitle: Text;
        AccusedMail: Text;
        IDNum: Code[30];

}
