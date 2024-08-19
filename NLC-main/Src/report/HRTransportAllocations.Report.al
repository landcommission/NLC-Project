#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193450 "HR Transport Allocations"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Transport Allocations.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'HR Transport Allocations';
    dataset
    {
        dataitem("HR Transport Allocations H"; "HR Transport Allocations H")
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Transport Allocation No", Status;
            column(ReportForNavId_6666; 6666) { }
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
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
            }
            column(TimeofTrip_HRTransportAllocationsH; "HR Transport Allocations H"."Time of Trip") { }
            column(TransportAllocationNo_HRTransportAllocationsH; "HR Transport Allocations H"."Transport Allocation No") { }
            column(AssignedDriver_HRTransportAllocationsH; "HR Transport Allocations H"."Assigned Driver")
            {
                IncludeCaption = true;
            }
            column(DriverName_HRTransportAllocationsH; "HR Transport Allocations H"."Driver Name")
            {
                IncludeCaption = true;
            }
            column(DateofTrip_HRTransportAllocationsH; "HR Transport Allocations H"."Date of Trip")
            {
                IncludeCaption = true;
            }
            column(VehicleRegNumber_HRTransportAllocationsH; "HR Transport Allocations H"."Vehicle Reg Number")
            {
                IncludeCaption = true;
            }
            column(Destinations_HRTransportAllocationsH; "HR Transport Allocations H"."Destination(s)")
            {
                IncludeCaption = true;
            }
            dataitem("HR Transport Allocations"; "HR Transport Allocations")
            {
                DataItemLink = "Allocation No" = field("Transport Allocation No");
                DataItemTableView = sorting("Allocation No", "Requisition No") order(ascending);
                column(ReportForNavId_2575; 2575) { }
                column(EmployeeNo_HRTransportAllocations; "HR Transport Allocations"."Employee No")
                {
                    IncludeCaption = true;
                }
                column(PassengersFullNames_HRTransportAllocations; "HR Transport Allocations"."Passenger/s Full Name/s")
                {
                    IncludeCaption = true;
                }
                column(From_HRTransportAllocations; "HR Transport Allocations".From)
                {
                    IncludeCaption = true;
                }
                column(Destination_HRTransportAllocations; "HR Transport Allocations"."To") { }

                trigger OnAfterGetRecord()
                begin
                    Int := Int + 1;
                end;

                trigger OnPreDataItem()
                begin
                    Int := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                No := No + 1;
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
    end;

    var
        CI: Record "Company Information";
        Int: Integer;
        HR_Transport_RequisitionsCaptionLbl: Label 'HR Transport Requisitions';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        P_O__BoxCaptionLbl: Label 'P.O. Box';
        TRANSPORT_REQUESTCaptionLbl: Label 'TRANSPORT REQUEST';
        Travelling_Staff_DetailsCaptionLbl: Label 'Travelling Staff Details';
        No: Integer;
}
