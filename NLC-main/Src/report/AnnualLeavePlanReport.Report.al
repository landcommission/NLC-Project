report 50003 "Annual Leave Plan Report"
{
    ApplicationArea = All;
    Caption = 'Annual Leave Plan Report';
    UsageCategory = ReportsAndAnalysis;
    UseRequestPage = true;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/AnnualLeavePlan.Rdlc';

    dataset
    {
        dataitem(HRLeavePlannerHeader; "HR Leave Planner Header")
        {
            RequestFilterFields = Status;
            column(ApplicationCode; "Application Code")
            {

            }
            column(DocumentType; "Document Type")
            {
            }
            column(Pwd; Pwd)
            {

            }
            column(PhoneNum; PhoneNum)
            {

            }
            column(EmailAdress; EmailAdress)
            {

            }
            column(ETnicity; ETnicity)
            {

            }
            column(TermsService; TermsService)
            {

            }
            column(HighestCourse; HighestCourse)
            {

            }
            column(EmployeeNo; "Employee No")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(JobDescription; "Job Description")
            {
            }
            column(JobTittle; "Job Tittle")
            {
            }
            column(Names; Names)
            {
            }
            column(ResponsibilityCenter; "Responsibility Center")
            {
            }
            column(ShortcutDimension2Code; "Shortcut Dimension 2 Code")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(ShortcutDimension4Code; "Shortcut Dimension 4 Code")
            {
            }
            column(Status; Status)
            {
            }
            column(Type; "Type")
            {
            }
            column(StaffNo; StaffNo)
            {

            }
            column(DoB; DoB)
            {

            }
            column(Job_Tittle; "Job Tittle")
            {

            }
            column(EmpGender; EmpGender)
            {

            }
            column(Picture; CompaanyInf.Picture)
            {

            }
            column(CompName; CompName)
            {

            }
            column(CompAdress; CompAdress)
            {

            }
            dataitem("HR Leave Planner Lines"; "HR Leave Planner Lines")
            {
                DataItemLink = "Application Code" = field("Application Code");
                column(Employee_No; "Employee No")
                {

                }
                column(Days_Applied; "Days Applied")
                {

                }
                column(Start_Date; StartDate)
                {

                }
                column(Return_Date; ReturnDate)
                {

                }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    StartDate := '';
                    ReturnDate := '';
                    if "HR Leave Planner Lines"."Start Date" <> 0D then
                        StartDate := GlobalFunct.FormatDate("HR Leave Planner Lines"."Start Date");
                    if "HR Leave Planner Lines"."Return Date" <> 0D then
                        ReturnDate := GlobalFunct.FormatDate("HR Leave Planner Lines"."Return Date");
                    if StartDate = '' then
                        CurrReport.Skip();

                end;
            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                StaffNo := '';
                JobTitle := '';
                DoB := '';
                PhoneNum := '';
                Pwd := '';
                TermsService := '';
                ETnicity := '';
                EmailAdress := '';
                HighestCourse := '';
                EmpGender := '';
                EmployeeRecc.Reset();
                EmployeeRecc.SetRange("No.", HRLeavePlannerHeader."Employee No");
                if EmployeeRecc.FindFirst() then begin
                    if EmployeeRecc."Date Of Birth" <> 0D then
                        DoB := GlobalFunct.FormatDate(EmployeeRecc."Date Of Birth");
                    JobTitle := EmployeeRecc."Job Title";
                    StaffNo := EmployeeRecc."Payroll Code";
                    EmpGender := Format(EmployeeRecc.Gender);
                    Pwd := Format(EmployeeRecc.Disabled);
                    EmailAdress := EmployeeRecc."E-Mail";
                    PhoneNum := Format(EmployeeRecc."Cell Phone Number");
                    TermsService := EmployeeRecc."Length Of Service";
                    ETnicity := EmployeeRecc.Ethnicity;
                    HighestCourse := EmployeeRecc."Highest Leverl Description";
                    // EmplQualifications.Reset();
                    // EmplQualifications.SetRange("Employee No.", EmployeeRecc."No.");
                    // EmplQualifications.SetRange("Line No.", EmployeeRecc."Highest level");



                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }

    }
    trigger OnPreReport()
    begin
        CompaanyInf.Get();
        CompaanyInf.CalcFields(CompaanyInf.Picture);
        CompAdress := CompaanyInf.Address;
        CompName := CompaanyInf.Name;
    end;

    var
        EmployeeRecc: Record "HR Employees";
        CompaanyInf: Record "Company Information";
        GlobalFunct: Codeunit "Global Functions";
        DoB: Text;
        JobTitle: Text;
        PhoneNum: Code[40];
        EmailAdress: Text;
        Pwd: Text;
        StaffNo: Code[30];
        TermsService: Text;
        StartDate: Text;
        ReturnDate: Text;
        ETnicity: Text;

        CompName: Text;
        EmplQualifications: Record "HR Employee Qualifications";

        CompAdress: Text;

        EmpGender: Text;
        HighestCourse: Text;
        ProfesQual: Text;

}
