report 50043 "Transfer Letter Report"
{
    ApplicationArea = All;
    Caption = 'Transfer Letter Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/Tansfer Letter.rdlc';
    dataset
    {
        dataitem(HREmployeeTransferLines; "HR Employee Transfer Lines")
        {
            RequestFilterFields = "Employee No", "Request No";
            column(Request_No; "Request No")
            {

            }
            column(kenyanShield; CompanyInfor."Kenyan Shield")
            { }
            column(Employee_No; "Employee No")
            {

            }
            column(Employee_Name; "Employee Name")
            {

            }
            column(Current_Designation_Name; "Current Designation Name")
            {

            }
            column(New_Region_Name; "New Region Name")
            {

            }
            column(Department; Department)
            {
            }
            column(Date_Of_Transfer; "Date Of Transfer")
            {

            }
            column(CompanyAddress; CompanyAddress)
            {

            }
            column(CompanyName; CompanyName)
            {

            }
            column(Pcture; CompanyInfor.Picture)
            {

            }
            column(TransDate; TransDate)
            {

            }
            column(CompPhone; CompPhone)
            {

            }
            column(Website; CompanyInfor."NLC Website")
            {

            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Department := '';
                TransDate := '';
                if "Date Of Transfer" <> 0D then
                    TransDate := GlobalFunct.FormatDate(HREmployeeTransferLines."Date Of Transfer");
                HREmmploREc.Reset();
                HREmmploREc.SetRange("No.", HREmployeeTransferLines."Employee No");
                if HREmmploREc.FindFirst() then begin
                    Department := HREmmploREc."Department Name";
                end;
            end;

        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        CompanyInfor.get;
        CompanyInfor.CalcFields(CompanyInfor.Picture, CompanyInfor."Kenyan Shield");
        CompanyAddress := CompanyInfor.Address;
        CompanyName := CompanyInfor.Name;
        CompPhone := CompanyInfor."Phone No.";

    end;

    var
        HREmmploREc: Record "HR Employees";
        GlobalFunct: Codeunit "Global Functions";
        Department: Text;
        CompanyInfor: Record "Company Information";
        CompanyName: Text;
        CompanyAddress: Text;
        CompPhone: Text;
        TransDate: Text;
}
