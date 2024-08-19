#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193493 "Group Transport  Requests"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Group Transport  Requests.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Group Transport  Requests';
    dataset
    {
        dataitem("HR Transport Requisition"; "HR Transport Requisition")
        {
            PrintOnlyIfDetail = false;
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
            column(TransportRequestNo_HRTransportRequisition; "HR Transport Requisition"."Transport Request No") { }
            column(DaysApplied_HRTransportRequisition; "HR Transport Requisition"."Days Applied") { }
            column(StartDate_HRTransportRequisition; "HR Transport Requisition"."Start Date") { }
            column(ReturnDate_HRTransportRequisition; "HR Transport Requisition"."Return Date") { }
            column(ApplicationDate_HRTransportRequisition; "HR Transport Requisition"."Application Date") { }
            column(Status_HRTransportRequisition; "HR Transport Requisition".Status) { }
            column(EndDate_HRTransportRequisition; "HR Transport Requisition"."End Date") { }
            column(Names_HRTransportRequisition; "HR Transport Requisition".Names) { }
            column(TripFromDestination_HRTransportRequisition; "HR Transport Requisition"."Trip From Destination") { }
            column(TripToDestination_HRTransportRequisition; "HR Transport Requisition"."Trip To Destination") { }
            column(Transporttype_HRTransportRequisition; "HR Transport Requisition"."Transport type") { }
            column(EmployeeNo_HRTransportRequisition; "HR Transport Requisition"."Employee No") { }
            column(PurposeofTrip_HRTransportRequisition; "HR Transport Requisition"."Purpose of Trip") { }
            dataitem("HR Transport Requisition Line"; "HR Transport Requisition Line")
            {
                DataItemLink = "Requisition No" = field("Transport Request No");
                column(ReportForNavId_2575; 2575) { }
                column(LineNo_HRTransportRequisitionLine; "HR Transport Requisition Line"."Line No.") { }
                column(RequisitionNo_HRTransportRequisitionLine; "HR Transport Requisition Line"."Requisition No") { }
                column(EmployeeNo_HRTransportRequisitionLine; "HR Transport Requisition Line"."Employee No") { }
                column(Names_HRTransportRequisitionLine; "HR Transport Requisition Line".Names) { }
                column(Purpose_HRTransportRequisitionLine; "HR Transport Requisition Line".Purpose) { }

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
