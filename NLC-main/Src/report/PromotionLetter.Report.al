report 50044 "Promotion Letter "
{
    ApplicationArea = All;
    Caption = 'Employee Promotion Letter';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/Employee Promotion Letter.rdlc';
    dataset
    {
        dataitem("HR Promo. Recommend Lines"; "HR Promo. Recommend Lines")
        {
            RequestFilterFields = "Document No", "Employee No.";
            column(Employee_No_; "Employee No.")
            {

            }
            column(Document_No; "Document No")
            { }
            column(Employee_Name; "Employee Name")
            {

            }
            column(New_Job_Title; "New Job Title")
            {

            }
            column(New_Job_ID; "New Job ID")
            {

            }
            column(Job_Title; "Job Title")
            { }
            column(Salary_Grade; "Salary Grade")
            {

            }
            column(New_Salary_Grade; "New Salary Grade")
            {

            }
            column(DateCreated; DateCreated)
            { }
            column(Department; Department)
            {

            }
            column(TransferDate; TransferDate)
            {

            }
            column(companyAddress; CompanyInf.Address)
            {

            }
            column(KenyaShield; CompanyInf."Kenyan Shield")
            { }
            column(Picture; CompanyInf.Picture)
            { }
            column(CompanyName; CompanyInf.Name)
            { }
            column(CompanyPhone; CompanyInf."Phone No.")
            { }
            column(NLCWebsite; NLCWebsite)
            {

            }


            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                DateCreated := '';
                TransferDate := '';
                if "HR Promo. Recommend Lines"."Document No" <> '' then
                    DateCreated := GlobalFunc.FormatDate(Today);
                if "HR Promo. Recommend Lines"."Effective Date Of Transfer" <> 0D then
                    TransferDate := GlobalFunc.FormatDate("HR Promo. Recommend Lines"."Effective Date Of Transfer");
                EmployeeRec.Reset();
                EmployeeRec.SetRange("No.", "HR Promo. Recommend Lines"."Employee No.");
                if EmployeeRec.FindFirst() then
                    Department := EmployeeRec."Department Name";
            end;
        }
        dataitem("NLC Grade Multiplier"; "NLC Grade Multiplier")
        {
            column(Multpl; Multpl)
            { }

            trigger OnAfterGetRecord()
            var
                Nlcgrade: Record "NLC Grade Multiplier";
            begin
                i := i + 1;
                Nlcgrade.Reset();
                Nlcgrade.SetRange("Entry No", "NLC Grade Multiplier"."Entry No");
                if Nlcgrade.Find('-') then
                    if "HR Promo. Recommend Lines"."Document No" <> '' then begin

                        if "HR Promo. Recommend Lines"."Employee No." <> '' then begin
                            i2 := i2 + 1;
                            //Multpl := '';
                            if i2 = 1 then
                                Multpl := FORMAT(Nlcgrade.Amount) + ' X ' + FORMAT(Nlcgrade.Multiplier)
                            else
                                Multpl := FORMAT(Nlcgrade.Amount) + ' X ' + FORMAT(Nlcgrade.Multiplier)

                        end else begin
                            i2 := 1;
                            Multpl := FORMAT(Nlcgrade.Amount) + ' X ' + FORMAT(Nlcgrade.Multiplier)
                        end;
                    end else
                        if i = 1 then
                            Multpl := FORMAT(Nlcgrade.Amount) + ' X ' + FORMAT(Nlcgrade.Multiplier)
                        else
                            Multpl := FORMAT(Nlcgrade.Amount) + ' X ' + FORMAT(Nlcgrade.Multiplier);
                if Multpl = '' then
                    CurrReport.Skip();
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

    }
    trigger OnPreReport()
    var
    begin
        CompanyInf.get();
        CompanyInf.CalcFields(CompanyInf.Picture, CompanyInf."Kenyan Shield");
        companyAddress := CompanyInf.Address;
        CompanyName := CompanyInf.Name;
        CompanyPhone := CompanyInf."Phone No.";
        NLCWebsite := CompanyInf."NLC Website";

    end;

    var
        i: Integer;
        i2: Integer;
        TransferDate: Text;
        Multpl: Text;
        DateCreated: Text;
        Department: Text;
        Multpl1: Text;
        NLCWebsite: Text;
        AmountText: Text;
        CompanyName: Text;
        GlobalFunc: Codeunit "Global Functions";
        companyAddress: Text;
        CompanyPhone: Text;
        EmployeeRec: Record "HR Employees";
        CompanyInf: Record "Company Information";
}

