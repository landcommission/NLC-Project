#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193592 "HR Leave Applications List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Leave Applications List.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'HR Leave Applications List';
    dataset
    {
        dataitem("HR Leave Application"; "HR Leave Application")
        {
            CalcFields = Gender;
            RequestFilterFields = "Application Code", "Start Date", "End Date", Status, "Employee No", "Responsibility Center", "Days Applied", "Leave Type", Gender;
            column(ReportForNavId_3725; 3725) { }
            column(Picture; CompInfo.Picture)
            {

            }
            column(CompanyName; CompanyName)
            {

            }
            column(CompnayAdrss; CompnayAdrss)
            {

            }
            column(EmpMail; EmpMail)
            {

            }
            column(Empphone; Empphone)
            {

            }
            column(PWD; PWD)
            {

            }
            column(StffID; StffID)
            {

            }
            column(ApplicationCode_HRLeaveApplication;
            "HR Leave Application"."Application Code")
            { }
            column(LeaveType_HRLeaveApplication; "HR Leave Application"."Leave Type") { }
            column(DaysApplied_HRLeaveApplication; "HR Leave Application"."Days Applied") { }
            column(StartDate_HRLeaveApplication; "HR Leave Application"."Start Date") { }
            column(ReturnDate_HRLeaveApplication; "HR Leave Application"."Return Date") { }
            column(ApplicationDate_HRLeaveApplication; "HR Leave Application"."Application Date") { }
            column(Status_HRLeaveApplication; "HR Leave Application".Status) { }
            column(CurrentBalance_HRLeaveApplication; "HR Leave Application"."Current Balance") { }
            column(LeaveAllowanceAmount_HRLeaveApplication; "HR Leave Application"."Leave Allowance Amount") { }
            column(EmployeeNo_HRLeaveApplication; "HR Leave Application"."Employee No") { }
            column(ResponsibilityCenter_HRLeaveApplication; "HR Leave Application"."Responsibility Center") { }
            column(CompInfoName; CompInfo.Name) { }
            column(CompInfoAddress; CompInfo.Address) { }
            column(CompInfoCity; CompInfo.City) { }
            column(CompInfoPicture; CompInfo.Picture) { }
            column(CompInfoEMail; CompInfo."E-Mail") { }
            column(CompInfoHomePage; CompInfo."Home Page") { }
            column(EmpName; EmpName) { }

            trigger OnAfterGetRecord()
            begin
                EmpMail := '';
                Empphone := '';
                EmpName := '';
                StffID := '';
                PWD := PWD::No;
                if HREmp.Get("HR Leave Application"."Employee No") then begin
                    EmpName := HREmp."Full Name";
                    EmpMail := HREmp."E-Mail";
                    Empphone := HREmp."Cell Phone Number";
                    PWD := HREmp.Disabled;
                    StffID := HREmp."ID Number";
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

        Report.Run(Report::"Change Approved Leave Apps", false, false);


        fnCompanyInfo();
    end;

    var
        HR_Leave_ApplicationCaptionLbl: Label 'HR Leave Application';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        CompInfo: Record "Company Information";
        EmpName: Text[250];
        HREmp: Record "HR Employees";
        CompnayAdrss: Text;
        CompanyName: Text;
        PWD: Option Yes,No;
        EmpMail: Text;
        StffID: Text;
        Empphone: Text;


    procedure fnCompanyInfo()
    begin
        if CompInfo.Get() then begin
            CompInfo.CalcFields(CompInfo.Picture);
            CompnayAdrss := CompInfo.Address;
            CompanyName := CompInfo.Name;
        end;

    end;
}

