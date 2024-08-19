#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193568 "Gender Report1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Gender Report1.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Gender Report1';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = Status, Gender, "Job ID";
            column(ReportForNavId_1; 1) { }
            column(CountN; CountN)
            { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(IDNumber_HREmployees; "HR Employees"."ID Number") { }
            column(Gender_HREmployees; "HR Employees".Gender) { }
            column(Title_HREmployees; "HR Employees".Title) { }
            column(Position_HREmployees; "HR Employees".Position) { }
            column(ContractType_HREmployees; "HR Employees"."Contract Type") { }
            column(ContractEndDate_HREmployees; "HR Employees"."Contract End Date") { }
            column(DateOfJoin_HREmployees; "HR Employees"."Date Of Join") { }
            column(Age_HREmployees; "HR Employees".Age) { }
            column(DateOfBirth_HREmployees; "HR Employees"."Date Of Birth") { }
            column(JobID_HREmployees; "HR Employees"."Job ID") { }
            column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
            column(Grade_HREmployees; "HR Employees".Grade) { }
            column(Ethnicity_HREmployees; "HR Employees".Ethnicity) { }
            column(EthnicOrigin_HREmployees; "HR Employees"."Ethnic Origin") { }
            column(CountyName_HREmployees; "HR Employees"."County Name") { }
            column(ResponsibilityCenter_HREmployees; "HR Employees"."Responsibility Center") { }
            column(Tribe_HREmployees; "HR Employees".Tribe) { }
            column(County_HREmployees; "HR Employees".County) { }
            column(Home; Home) { }
            column(E_Mail; "E-Mail")
            {

            }
            column(DOB; DOB)
            { }
            column(Highest_Leverl_Description; "Highest Leverl Description")
            { }
            column(Cell_Phone_Number; "Cell Phone Number")
            { }
            column(Name; CompanyInformation.Name) { }
            column(Address; CompanyInformation.Address) { }
            column(Picture; CompanyInformation.Picture) { }
            column(CompPhone; CompanyInformation."Phone No.")
            { }

            trigger OnAfterGetRecord()
            var
                HREmploRec: Record "HR Employees";
                GlobalFun: Codeunit "Global Functions";
            begin
                /*
                Dimn.RESET;
                Dimn.SETRANGE(Dimn."Dimension Code",'COUNTY');
                Dimn.SETRANGE(Dimn.Code,County);
               // HREmployees1.County:='';
                IF Dimn.FINDFIRST THEN BEGIN
                HREmployees1.RESET;
                HREmployees1.SETRANGE(HREmployees1."No.","No.");
                IF HREmployees1.FINDFIRST THEN BEGIN


                  Home:=Dimn.Name

              END;
            END;
            {
            IF HREmployees1.County='' THEN

            CurrReport.skip
                }
            */
                DOB := '';
                Home := '';
                if "HR Employees"."No." <> '' then
                    CountN := CountN + 1;
                HREmploRec.Reset();
                HREmploRec.SetRange("No.", "HR Employees"."No.");
                if HREmploRec.FindFirst() then
                    if HREmploRec."Date Of Birth" <> 0D then
                        DOB := GlobalFun.FormatDate(HREmploRec."Date Of Birth");

                HREmployees1.Reset();
                HREmployees1.SetRange(HREmployees1."No.", "HR Employees"."No.");
                if HREmployees1.FindFirst() then begin
                    Dimn.Reset();
                    Dimn.SetRange(Dimn."Dimension Code", 'COUNTY');
                    Dimn.SetRange(Dimn.Code, "HR Employees".County);
                    if Dimn.FindFirst() then
                        Home := Dimn.Name
                    else
                        Home := '';
                end;
                //END;

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
        CompanyInformation.get;
        CompanyInformation.CalcFields(Picture);

    end;

    var
        HREmployees1: Record "HR Employees";
        CompanyInformation: Record "Company Information";
        Dimn: Record "Dimension Value";
        Home: Text;
        DOB: Text;
        CountN: Integer;
        PrSalaryCard: Record "PR Salary Card";
}
