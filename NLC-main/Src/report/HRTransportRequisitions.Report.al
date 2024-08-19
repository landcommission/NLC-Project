#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193451 "HR Transport Requisitions"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Transport Requisitions.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'HR Transport Requisitions';
    dataset
    {
        dataitem("HR Transport Requisition"; "HR Transport Requisition")
        {
            RequestFilterFields = "Transport Request No", "Employee No";
            column(ReportForNavId_9002; 9002) { }
            column(CompAdress; CompAdress)
            {

            }
            column(CompName; CompName)
            {

            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(COMPANYNAME; CompanyName) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(HR_Jobs_UserID; UserId) { }
            column(CI_Picture; CI.Picture) { }
            column(CI_Address; CI.Address) { }
            column(CI__Address_2______CI__Post_Code_; CI."Address 2" + ' ' + CI."Post Code") { }
            column(CI_City; CI.City) { }
            column(CI_PhoneNo; CI."Phone No.") { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(P_O__BoxCaption; P_O__BoxCaptionLbl) { }
            column(PurposeofTrip_HRTransportRequisition; "HR Transport Requisition"."Purpose of Trip") { }
            column(TimeofTrip_HRTransportRequisition; "HR Transport Requisition"."Time of Trip") { }
            column(PickupPoint_HRTransportRequisition; "HR Transport Requisition"."Time of Return") { }
            column(From_HRTransportRequisition; "HR Transport Requisition"."Trip From Destination") { }
            column(Destination_HRTransportRequisition; "HR Transport Requisition"."Trip To Destination") { }
            column(EmployeeName_HRTransportRequisition; "HR Transport Requisition".Names) { }
            column(EmployeeNo_HRTransportRequisition; "HR Transport Requisition"."Employee No") { }
            column(TransportRequestNo_HRTransportRequisition; "HR Transport Requisition"."Transport Request No") { }
            column(DaysApplied_HRTransportRequisition; "HR Transport Requisition"."Days Applied") { }
            column(DepartureDate_HRTransportRequisition; "HR Transport Requisition"."Start Date") { }
            column(ReturnDate_HRTransportRequisition; "HR Transport Requisition"."Return Date") { }
            column(TripFromDestination_HRTransportRequisition; "HR Transport Requisition"."Trip From Destination") { }
            column(TripToDestination_HRTransportRequisition; "HR Transport Requisition"."Trip To Destination") { }

            dataitem("HR Transport Allocations H"; "HR Transport Allocations H")
            {
                DataItemLink = "Transport Allocation No" = field("Transport Request No");
                column(Driver_Name; "Driver Name")
                {

                }
                column(Opening_Odometer_Reading; "Opening Odometer Reading")
                {

                }
                column(Closing_Odometer_Reading; "Closing Odometer Reading")
                {

                }
                column(Destination_s_; "Destination(s)")
                {

                }
            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
                HrTransReq: Record "HR Transport Requisition";
            begin

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
        CompAdress := CI.Address;
        CompName := CI.Name;


    end;

    trigger OnPostReport()
    var
        myInt: Integer;
        starDate: Date;
        Enddate: Date;
        globaFun: Codeunit "Global Functions";
        DaysC: Integer;
    begin
        // starDate := 20240101D;
        // Enddate := 20240131D;
        // DaysC := globaFun.GetNonWorkingDays(starDate, Enddate);
        // Message(Format(DaysC));

    end;

    var
        CI: Record "Company Information";
        HR_JobsCaptionLbl: Label 'HR Jobs';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Job_StatisticsCaptionLbl: Label 'HR Job Statistics';
        P_O__BoxCaptionLbl: Label 'P.O. Box';

        MyUserID: Text;
        UserSetup: Record "User Setup";
        CompName: Text;
        CompAdress: Text;
}
