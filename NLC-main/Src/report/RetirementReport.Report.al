#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50078 "Retirement Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Retirement Report.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Retirement Report';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1000000000; 1000000000) { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(FirstName_HREmployees; "HR Employees"."First Name") { }
            column(MiddleName_HREmployees; "HR Employees"."Middle Name") { }
            column(LastName_HREmployees; "HR Employees"."Last Name") { }
            column(HealthAssesment_HREmployees; "HR Employees"."Health Assesment?") { }
            column(HealthAssesmentDate_HREmployees; "HR Employees"."Health Assesment Date") { }
            column(DateOfBirth_HREmployees; "HR Employees"."Date Of Birth") { }
            column(Age_HREmployees; "HR Employees".Age) { }
            column(DateOfJoiningtheCompany_HREmployees; "HR Employees"."Date Of Joining the Company") { }
            column(LengthOfService_HREmployees; "HR Employees"."Length Of Service") { }
            column(EndofProbationDate_HREmployees; "HR Employees"."End Of Probation Date") { }
            column(PensionSchemeJoinDate_HREmployees; "HR Employees"."Pension Scheme Join Date") { }
            column(MedicalSchemeJoinDate_HREmployees; "HR Employees"."Medical Scheme Join Date") { }
            column(DateOfLeavingtheCompany_HREmployees; "HR Employees"."Date Of Leaving") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(EmployeeType_HREmployees; "HR Employees"."Employee Type") { }
            column(RetirementDate_HREmployees; "HR Employees"."Retirement date") { }
            column(DPension_HREmployees; "HR Employees".DPension) { }
            column(IncrementalMonth_HREmployees; "HR Employees"."Incremental Month") { }
            column(DAge; "HR Employees".DAge) { }
            column(RetirementPeriod; RetirementPeriod) { }
            column(PeriodText; PeriodText) { }
            column(PeriodText_Text; PeriodText_Text) { }
            column(myAgeText; myAgeText) { }
            column(CI_Name; CI.Name) { }
            column(CI_Picture; CI.Picture) { }
            column(CI_Address; CI.Address)
            {
                IncludeCaption = true;
            }
            column(CI_Address2; CI."Address 2")
            {
                IncludeCaption = true;
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
            }

            trigger OnAfterGetRecord()
            var
                DateCal: Decimal;
                RetireAg: Decimal;
            begin

                //With Days
                /*
                IF "HR Employees"."Date Of Birth" = 0D THEN
                BEGIN
                   CurrReport.SKIP;
                END ELSE
                BEGIN
                   IF HRSetup.GET() THEN
                   HRSetup.TESTFIELD(HRSetup."Retirement Age");
                   DAge:= HRDates.DetermineAge("HR Employees"."Date Of Birth",TODAY);
                   Pos:=STRPOS(FORMAT(RetirementPeriod),'.');
                   IF Pos=0 THEN Pos:=1;
                   RetirementPeriod:=HRSetup."Retirement Age"-(TODAY-"HR Employees"."Date Of Birth")/365;
                   PeriodText:=COPYSTR(FORMAT(RetirementPeriod),1,Pos)+' Years '+COPYSTR(FORMAT(RetirementPeriod),Pos+1,1)+' Months';
                  IF RetirementPeriod>=FilterAge THEN
                  CurrReport.SKIP;
                END;
                */


                //YEARS ONLY

                if "HR Employees"."Date Of Birth" = 0D then
                    CurrReport.Skip()
                else begin
                    if HRSetup.Get() then
                        HRSetup.TestField(HRSetup."Retirement Age");
                    //DAge:= HRDates.DetermineAge("HR Employees"."Date Of Birth",TODAY);
                    //Pos:=STRPOS(FORMAT(RetirementPeriod),'.');
                    //IF Pos=0 THEN Pos:=1;
                    CYR := Date2DMY(Today, 3);
                    DOB := Date2DMY("HR Employees"."Date Of Birth", 3);
                    myAge := CYR - DOB;
                    RetireAg := 0;
                    DateCal := 0;

                    myAgeText := Format(myAge) + ' ' + 'Years';
                    "HR Employees".DAge := Format(myAge);
                    Evaluate(DateCal, Format(HRSetup."Retirement Age"));
                    RetireAg := DateCal;
                    RetirementPeriod := RetireAg - myAge;


                    //PeriodText:=COPYSTR(FORMAT(RetirementPeriod),1,Pos)+' Years ';
                    PeriodText := RetirementPeriod;
                    PeriodText_Text := Format(PeriodText) + ' ' + 'Years';

                    if RetirementPeriod <= FilterAge then
                        CurrReport.Skip();
                    //REPORT.SAVEASPDF(50078,'C:\HR Report\HRReport.pdf',);
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
                field(FilterAge; FilterAge)
                {
                    ApplicationArea = Basic;
                    Caption = 'Period to Retirement Filter';
                    DecimalPlaces = 1 : 1;
                    MaxValue = 100;
                    MinValue = 1;
                    ToolTip = 'Specifies the value of the Period to Retirement Filter field.';
                    //Numeric = true;
                }
            }
        }

        actions { }
    }

    labels { }


    trigger OnPreReport()
    begin
        CI.Get();
        CI.CalcFields(CI.Picture)
    end;

    var
        HRDates: Codeunit "HR Dates";
        HRSetup: Record "HR Setup";
        DAge: Text[100];
        FilterAge: Decimal;
        RetirementPeriod: Decimal;
        PeriodText: Integer;
        Pos: Integer;
        DOB: Integer;
        CYR: Integer;
        myAge: Integer;
        myAgeText: Text;
        PeriodText_Text: Text;
        CI: Record "Company Information";
}
