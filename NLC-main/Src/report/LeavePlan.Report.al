report 50009 "Leave Plan"
{
    ApplicationArea = All;
    Caption = 'Leave Plan';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = Word;
    WordLayout = './Layouts/Leave Plan.docx';
    RDLCLayout = './Layouts/Leave Plan.rdlc';
    //ExcelLayout = './Layouts/Leave Plan.xlsx';
    dataset
    {
        dataitem(HRLeavePlannerHeader; "HR Leave Planner Header")
        {
            column(ApplicationCode; "Application Code")
            {
            }
            column(DocumentType; "Document Type")
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
            column(Supervisor; Supervisor)
            {
            }
            column(Type; "Type")
            {
            }
            column(CompanyInfoName; CompanyInfo.Name)
            {
            }
            column(CompanyInfoPic; CompanyInfo.Picture)
            {

            }

            column(CompanyInfoAddress; CompanyInfo.Address)
            {

            }

            column(User_ID; "User ID")
            {

            }

            dataitem("HR Leave Planner Lines"; "HR Leave Planner Lines")
            {
                column(Application_Code; "Application Code")
                {

                }

                column(Approved_days; "Approved days")
                {

                }

                column(Annual_Leave_Account; "Annual Leave Account")
                {

                }

                column(Employee_No; "Employee No")
                {

                }

                column(E_mail_Address; "E-mail Address")
                {

                }

                column(Start_Date; "Start Date")
                {

                }

                column(End_Date; "End Date")
                {

                }

                column(Return_Date; "Return Date")
                {

                }
                column(Description; Description)
                {

                }

                column(Leave_Type; "Leave Type")
                {

                }

                column(EmployeeNames; Names)
                {

                }

                column(Reliever_Name; "Reliever Name")
                {

                }
            }
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

    var
        CompanyInfo: Record "Company Information";

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;
}
