#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193437 "HR Employee List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Employee List.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'HR Employee List';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = "No.", "Global Dimension 1 Code", Status;
            column(ReportForNavId_6075; 6075) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(COMPANYNAME; CompanyName) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(USERID; "HR Employees"."Employee UserID") { }
            column(CI_Name; CI.Name)
            {
                IncludeCaption = true;
            }
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
            column(CI_EMail; CI."E-Mail")
            {
                IncludeCaption = true;
            }
            column(CI_HomePage; CI."Home Page")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
            }
            column(Disabled; Disabled)
            {

            }
            column(Gender; Gender)
            {

            }
            column(Ethnicity; Ethnicity)
            {

            }
            column(Highest_Leverl_Description; "Highest Leverl Description")
            { }
            column(E_Mail; "E-Mail")
            {

            }
            column(Grade; Grade)
            {

            }
            column(Cell_Phone_Number; "Cell Phone Number")
            {

            }
            column(HR_Employees__No__; "HR Employees"."No.") { }
            column(IDNumber_HREmployees; "HR Employees"."ID Number") { }
            column(HR_Employees__Job_Description_; "HR Employees"."Job Title") { }
            column(HR_Employees__Date_Of_Joining_the_Company_; "HR Employees"."Date Of Join") { }
            column(HR_Employees__FullName; "HR Employees"."First Name") { }
            column(HR_Employees__Cell_Phone_Number_; "HR Employees"."Cell Phone Number") { }
            column(EmployeeCaption; EmployeeCaptionLbl) { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(Employee_ListCaption; Employee_ListCaptionLbl) { }
            column(P_O__BoxCaption; P_O__BoxCaptionLbl) { }
            column(HR_Employees__No__Caption; "HR Employees".FieldCaption("HR Employees"."No.")) { }
            column(HR_Employees__ID_Number_Caption; "HR Employees".FieldCaption("HR Employees"."ID Number")) { }
            column(HR_Employees__Job_Description_Caption; "HR Employees".FieldCaption("HR Employees"."Job Title")) { }
            column(HR_Employees__Date_Of_Joining_the_Company_Caption; "HR Employees".FieldCaption("HR Employees"."Date Of Joining the Company")) { }
            column(Full_NamesCaption; Full_NamesCaptionLbl) { }
            column(HR_Employees__Cell_Phone_Number_Caption; "HR Employees".FieldCaption("HR Employees"."Cell Phone Number")) { }
            column(NoofEmployees; "No of Employees") { }
            column(Fullname; "HR Employees"."Full Name") { }
            column(DOB; "HR Employees"."Date Of Birth") { }
            column(AGE; "HR Employees".Age) { }
            column(los; "HR Employees"."Length Of Service") { }
            column(dim_one; "HR Employees"."Global Dimension 1 Code") { }
            column(dim_two; "HR Employees"."Global Dimension 2 Code") { }
            column(citizenship; "HR Employees".Citizenship) { }
            column(co_email; "HR Employees"."Company E-Mail") { }
            column(job_id; "HR Employees"."Job ID") { }
            column(contract; "HR Employees"."Contract Type") { }
            column(jobtitle; "HR Employees"."Job Title") { }
            column(status; "HR Employees".Status) { }
            column(cellphonenumber; "HR Employees"."Cell Phone Number") { }

            trigger OnAfterGetRecord()
            begin
                "No of Employees" := "No of Employees" + 1;
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
        CI.CalcFields(CI.Picture);
        "No of Employees" := 0;
    end;

    var
        CI: Record "Company Information";
        EmployeeCaptionLbl: Label 'Employee';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Employee_ListCaptionLbl: Label 'Employee List';
        P_O__BoxCaptionLbl: Label 'P.O. Box';
        Full_NamesCaptionLbl: Label 'Full Names';
        "No of Employees": Integer;
        GlobalFunc: Codeunit "Global Functions";
}
