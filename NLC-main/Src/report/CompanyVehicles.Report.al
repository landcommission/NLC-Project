#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193569 "Company Vehicles"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Company Vehicles.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Company Vehicles';
    dataset
    {
        dataitem("Company Vehicles"; "Company Vehicles")
        {
            column(ReportForNavId_1; 1) { }
            column(RegistrationNo_CompanyVehicles; "Company Vehicles"."Registration No.") { }
            column(Description_CompanyVehicles; "Company Vehicles".Description) { }
            column(Capacity_CompanyVehicles; "Company Vehicles".Capacity) { }
            column(EngineCapacity_CompanyVehicles; "Company Vehicles"."Engine Capacity") { }
            column(YearofManufacture_CompanyVehicles; "Company Vehicles"."Year of Manufacture") { }
            column(Model_CompanyVehicles; "Company Vehicles".Model) { }
            column(Colour_CompanyVehicles; "Company Vehicles".Colour) { }
            column(Name; CI.Name) { }
            column(Picture; CI.Picture) { }
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
        CI.CalcFields(Picture);
    end;

    var
        CompanyVehicles: Record "Company Vehicles";
        CI: Record "Company Information";
}
