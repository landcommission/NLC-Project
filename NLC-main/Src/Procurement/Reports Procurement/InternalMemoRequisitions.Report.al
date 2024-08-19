#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 50089 "Internal Memo Requisitions"
{
    WordLayout = './Layouts/InternalMemoRequisitions.docx';
    DefaultLayout = Word;

    dataset
    {
        dataitem("Store Requistion Headers"; "Store Requistion Headers")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            column(ReportForNavId_1826; 1826) { } // Autogenerated by ForNav - Do not delete
            column(ReportForNav_Table52193901; ReportForNavWriteDataItem('Table52193901', "Store Requistion Headers")) { }
            column(EmployeeName; "Store Requistion Headers"."Employee Name")
            {
            }
            column(Responsibilitycentre; "Store Requistion Headers"."Responsibility Center")
            {
            }
            column(Store_Requistion_Header__Request_date_; "Request date")
            {
            }
            column(CompanyInfoPicture; CompanyInfo.Picture)
            {
            }
            column(V1stapprover_; "1stapprover")
            {
            }
            column(V2ndapprover_; "2ndapprover")
            {
            }
            column(V2ndapproverdate_; "2ndapproverdate")
            {
            }
            column(UserRecApp1_Picture; UserRecApp1."User Signature")
            {
            }
            column(UserRecApp2_Picture; UserRecApp2."User Signature")
            {
            }
            column(UserRecApp3_Picture; UserRecApp3."User Signature")
            {
            }
            column(V1stapproverdate_; "1stapproverdate")
            {
            }
            column(V4thapproverdate; "4thapproverdate")
            {
            }
            column(V4thapprover; "4thapprover")
            {
            }
            column(UserRecApp4_Picture; UserRecApp4."User Signature")
            {
            }
            column(PREPARED_BYCaption; PREPARED_BYCaptionLbl)
            {
            }
            column(CHECKED_BY_Caption; CHECKED_BY_CaptionLbl)
            {
            }
            dataitem("Store Requistion Line"; "Store Requistion Line")
            {
                DataItemLink = "Requistion No" = field("No.");
                DataItemTableView = sorting("Requistion No", "Line No.") order(ascending);
                column(ReportForNavId_7187; 7187) { } // Autogenerated by ForNav - Do not delete
                column(ReportForNav_Table52193902; ReportForNavWriteDataItem('Table52193902', "Store Requistion Line")) { }
                column(DestinationFrom_StoreRequistionLine; "Store Requistion Line"."Destination From")
                {
                }
                column(DestinationTo_StoreRequistionLine; "Store Requistion Line"."Destination To")
                {
                }
                column(PurposeofTravel_StoreRequistionLine; "Store Requistion Line"."Purpose of Travel")
                {
                }
                column(DepartureDate_StoreRequistionLine; "Store Requistion Line"."Departure Date")
                {
                }
                column(DepartureTime_StoreRequistionLine; "Store Requistion Line"."Departure Time")
                {
                }
                column(ReturnDate_StoreRequistionLine; "Store Requistion Line"."Return Date")
                {
                }
                column(ReturnTime_StoreRequistionLine; "Store Requistion Line"."Return Time")
                {
                }
            }
            dataitem("Approval Entry"; "Approval Entry")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where("Document Type" = const(Rn), Status = const(Approved));
                column(ReportForNavId_1102755003; 1102755003) { } // Autogenerated by ForNav - Do not delete
                column(ReportForNav_Table454; ReportForNavWriteDataItem('Table454', "Approval Entry")) { }
            }


            trigger OnAfterGetRecord();
            begin
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange(ApprovalEntries."Table ID", 52193901);
                ApprovalEntries.SetRange(ApprovalEntries."Document No.", "Store Requistion Headers"."No.");
                ApprovalEntries.SetRange(ApprovalEntries.Status, ApprovalEntries.Status::Approved);
                TotalApprovals := ApprovalEntries.Count;
                if ApprovalEntries.Find('-') then begin
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            "1stapprover" := ApprovalEntries."Sender ID";
                            "1stapproverdate" := ApprovalEntries."Last Date-Time Modified";
                            if UserRecApp1.Get("1stapprover") then
                                UserRecApp1.CalcFields(UserRecApp1."User Signature");
                            //
                            if TotalApprovals < 4 then begin
                                "2ndapprover" := ApprovalEntries."Approver ID";
                                "2ndapproverdate" := ApprovalEntries."Last Date-Time Modified";
                                if UserRecApp2.Get("2ndapprover") then
                                    UserRecApp2.CalcFields(UserRecApp2."User Signature");
                            end;
                        end;
                        if i = 2 then begin
                            if TotalApprovals >= 4 then begin
                                "2ndapprover" := ApprovalEntries."Approver ID";
                                "2ndapproverdate" := ApprovalEntries."Last Date-Time Modified";
                                if UserRecApp2.Get("2ndapprover") then
                                    UserRecApp2.CalcFields(UserRecApp2."User Signature");
                            end else begin
                                "3rdapprover" := ApprovalEntries."Approver ID";
                                "3rdapproverdate" := ApprovalEntries."Last Date-Time Modified";
                                if UserRecApp3.Get("3rdapprover") then
                                    UserRecApp3.CalcFields(UserRecApp3."User Signature");
                            end;
                            if TotalApprovals < 3 then begin
                                "4thapprover" := ApprovalEntries."Approver ID";
                                "4thapproverdate" := ApprovalEntries."Last Date-Time Modified";
                                if UserRecApp4.Get("4thapprover") then
                                    UserRecApp4.CalcFields(UserRecApp4."User Signature");
                            end;
                        end;
                        if i = 3 then begin
                            if TotalApprovals >= 4 then begin
                                "3rdapprover" := ApprovalEntries."Approver ID";
                                "3rdapproverdate" := ApprovalEntries."Last Date-Time Modified";
                                if UserRecApp3.Get("3rdapprover") then
                                    UserRecApp3.CalcFields(UserRecApp3."User Signature");
                            end else begin
                                "4thapprover" := ApprovalEntries."Approver ID";
                                "4thapproverdate" := ApprovalEntries."Last Date-Time Modified";
                                if UserRecApp4.Get("4thapprover") then
                                    UserRecApp4.CalcFields(UserRecApp4."User Signature");
                            end;
                        end;
                        if i = 4 then begin
                            if TotalApprovals >= 5 then begin
                                "4thapprover" := ApprovalEntries."Approver ID";
                                "4thapproverdate" := ApprovalEntries."Last Date-Time Modified";
                                if UserRecApp4.Get("4thapprover") then
                                    UserRecApp4.CalcFields(UserRecApp4."User Signature");
                            end else begin
                                "5thapprover" := ApprovalEntries."Approver ID";
                                "5thapproverdate" := ApprovalEntries."Last Date-Time Modified";
                                if UserRecApp5.Get("5thapprover") then
                                    UserRecApp5.CalcFields(UserRecApp5."User Signature");
                            end;
                        end;
                        if i = 5 then begin
                            "5thapprover" := ApprovalEntries."Approver ID";
                            "5thapproverdate" := ApprovalEntries."Last Date-Time Modified";
                            if UserRecApp5.Get("4thapprover") then
                                UserRecApp5.CalcFields(UserRecApp5."User Signature");
                        end;
                    until ApprovalEntries.Next = 0;
                end;
            end;

        }
    }
    requestpage
    {
        SaveValues = false;
        layout
        {
        }

    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture)
        ;
        ReportsForNavPre;

    end;

    var
        Store_RequistionCaptionLbl: label 'Store Requistion';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        UoMCaptionLbl: label 'UoM';
        Date_CaptionLbl: label 'Date:';
        Name_CaptionLbl: label 'Name:';
        RecipientCaptionLbl: label 'Requested By:';
        Printed_By_CaptionLbl: label 'Printed By:';
        Name_Caption_Control1102755052Lbl: label 'Name:';
        Date_Caption_Control1102755053Lbl: label 'Date:';
        AuthorisationsCaptionLbl: label 'Authorisations';
        EmptyStringCaptionLbl: label '================================================================================================================================================================================================';
        DocHeader: Text;
        CompanyInfo: Record "Company Information";
        ApprovalEntries: Record "Approval Entry";
        TotalApprovals: Integer;
        i: Integer;
        "1stapproverdate": DateTime;
        "1stapprover": Text[100];
        "2ndapprover": Text[100];
        UserRecApp1: Record "User Setup";
        UserRecApp2: Record "User Setup";
        UserRecApp3: Record "User Setup";
        "3rdapprover": Text[100];
        "3rdapproverdate": DateTime;
        UserRecApp4: Record "User Setup";
        "4thapprover": Text[100];
        "4thapproverdate": DateTime;
        UserRecApp5: Record "User Setup";
        "5thapprover": Text[100];
        "5thapproverdate": DateTime;
        "2ndapproverdate": DateTime;
        PREPARED_BYCaptionLbl: label 'Prepared by:';
        CHECKED_BY_CaptionLbl: label 'Checked by:';
        SIGNATURECaptionLbl: label 'Signature';
        DATE__________________________________________________CaptionLbl: label 'Date';
        PAYMENT_RECEIVED_BYCaptionLbl: label 'PAYMENT RECEIVED BY';
        SIGNATURE__________________________________________________CaptionLbl: label 'Signature';
        DATE__________________________________________________Caption_Control1000000073Lbl: label 'Date';
        APPROVALCaptionLbl: label 'APPROVAL';
        SIGNATURECaption_Control1000000001Lbl: label 'Signature';
        DATE__________________________________________________Caption_Control1000000003Lbl: label 'Date';
        APPROVED_BY_CaptionLbl: label 'Approved by';
        SIGNATURE_CaptionLbl: label 'Signature';
        DATE__________________________________________________Caption_Control1000000021Lbl: label 'Date';

    trigger OnInitReport();
    begin
        ;
        ReportsForNavInit;
    end;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var
        ReportForNavTotalsCausedBy: Integer;
        ReportForNavInitialized: Boolean;
        ReportForNavShowOutput: Boolean;

    local procedure ReportsForNavInit()
    var
        id: Integer;
        FormatRegion: Text;
    begin
        Evaluate(id, CopyStr(CurrReport.ObjectId(false), StrPos(CurrReport.ObjectId(false), ' ') + 1));
    end;

    local procedure ReportsForNavPre()
    begin
    end;

    local procedure ReportForNavSetTotalsCausedBy(value: Integer)
    begin
        ReportForNavTotalsCausedBy := value;
    end;

    local procedure ReportForNavSetShowOutput(value: Boolean)
    begin
        ReportForNavShowOutput := value;
    end;

    local procedure ReportForNavWriteDataItem(dataItemId: Text; rec: Variant): Text
    var
        values: Text;
        jsonObject: JsonObject;
        currLanguage: Integer;
    begin
        if not ReportForNavInitialized then begin
            ReportForNavInitialized := true;
        end;

        case (dataItemId) of
            'Table454':
                begin
                    currLanguage := GlobalLanguage;
                    GlobalLanguage := 1033;
                    jsonObject.Add('DataItem$Table454$CurrentKey$Text', "Approval Entry".CurrentKey);
                    GlobalLanguage := currLanguage;
                end;
        end;
        jsonObject.WriteTo(values);
        exit(values);
    end;
    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
