#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193567 "Seconded/Contract Report1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/SecondedContract Report1.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Seconded/Contract Report1';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = Status;
            column(ReportForNavId_1; 1) { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(IDNumber_HREmployees; "HR Employees"."ID Number") { }
            column(Gender_HREmployees; "HR Employees".Gender) { }
            column(sec_HREmployees; "HR Employees".sec) { }
            column(secdur_HREmployees; "HR Employees".secdur) { }
            column(sec2_HREmployees; "HR Employees".sec2) { }
            column(Job_ID; "Job ID")
            {

            }
            column(E_Mail; "E-Mail")
            { }
            column(Job_Title; "Job Title")
            {
            }
            column(Date_of_Current_Employment; "Date of Current Employment")
            {

            }
            column(Gender; Gender)
            { }
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
            column(DOB; DOB)
            { }
            column(CompanyAdress; CompanyAdress)
            {

            }
            column(CompanyName; CompanyName)
            {

            }
            column(CompanyPhone; CompanyPhone)
            {

            }
            column(Compicture; companyIn.Picture)
            {

            }
            column(CountN; CountN)
            {

            }
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
        SecondedTable: Record "Seconded Table";
        DOB: Text;
        CountN: Integer;
        HREmployees: Record "HR Employees";
        companyIn: Record "Company Information";
        CompanyAdress: Text;
        CompanyName: text;
        CompanyPhone: Text;
}
