#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193629 "Staff Age Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Staff Age Report.rdlc';
    ApplicationArea = All;
    Caption = 'Staff Age Report';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = Status;
            column(ReportForNavId_1; 1) { }
            column(CountN; CountN)
            { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(DateOfBirth_HREmployees; "HR Employees"."Date Of Birth") { }
            column(DAge_HREmployees; "HR Employees".DAge) { }
            column(IDNumber_HREmployees; "HR Employees"."ID Number") { }
            column(Title_HREmployees; "HR Employees".Title) { }
            column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
            column(Position_HREmployees; "HR Employees".Position) { }
            column(E_Mail; "E-Mail")
            {

            }
            column(Job_Title; "Job Title")
            {
            }
            column(Date_of_Current_Employment; "Date of Current Employment")
            {

            }
            column(Gender; Gender)
            { }
            column(Compicture; companyIn.Picture)
            {

            }
            column(PWD; Disabled)
            {

            }
            column(HighestEduLevel; "Highest Leverl Description")
            {

            }
            column(Ethnicity; Ethnicity)
            {
            }
            column(Phone_Number; "Cell Phone Number")
            {

            }
            column(CompanyName; CompanyName)
            {

            }
            column(CompanyPhone; CompanyPhone)
            {

            }
            column(CompanyAdress; CompanyAdress)
            { }
            column(DOB; DOB)
            { }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
                HREmploRec: Record "HR Employees";
                GlobalFun: Codeunit "Global Functions";
            begin
                if "HR Employees"."No." <> '' then
                    CountN := CountN + 1;
                DOB := '';
                HREmploRec.Reset();
                HREmploRec.SetRange("No.", "HR Employees"."No.");
                if HREmploRec.FindFirst() then
                    if HREmploRec."Date Of Birth" <> 0D then
                        DOB := GlobalFun.FormatDate(HREmploRec."Date Of Birth");



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
    var
        myInt: Integer;
    begin
        companyIn.get();
        companyIn.CalcFields(companyIn.Picture);
        CompanyName := companyIn.Name;
        CompanyPhone := companyIn."Phone No.";
        CompanyAdress := companyIn.Address;

    end;

    var
        no: Integer;
        DOB: Text;
        companyIn: Record "Company Information";
        CompanyAdress: Text;
        CompanyName: text;
        CompanyPhone: Text;
        CountN: Integer;
}
