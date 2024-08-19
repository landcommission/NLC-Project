#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193680 "Staff Grant Requisition"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Staff Grant Requisition.rdlc';
    ApplicationArea = All;
    Caption = 'Staff Grant Requisition';
    dataset
    {
        dataitem("Store Requistion Header"; "Store Requistion Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            column(ReportForNavId_1826; 1826) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(USERID; UserId) { }
            column(Store_Requistion_Header__Required_Date_; "Store Requistion Header"."Required Date") { }
            column(Store_Requistion_Header__Shortcut_Dimension_4_Code_; "Store Requistion Header"."Shortcut Dimension 4 Code") { }
            column(Store_Requistion_Header_Dim4; "Store Requistion Header".Dim4) { }
            column(Store_Requistion_Header__Request_date_; "Store Requistion Header"."Request date") { }
            column(Store_Requistion_Header__Shortcut_Dimension_3_Code_; "Store Requistion Header"."Shortcut Dimension 3 Code") { }
            column(Store_Requistion_Header_Dim3; "Store Requistion Header".Dim3) { }
            column(Store_Requistion_Header__Request_Description_; "Store Requistion Header"."Request Description") { }
            column(Store_Requistion_Header__Shortcut_Dimension_2_Code_; "Store Requistion Header"."Shortcut Dimension 2 Code") { }
            column(Store_Requistion_Header__Budget_Center_Name_; "Store Requistion Header"."Budget Center Name") { }
            column(Store_Requistion_Header__No__; "Store Requistion Header"."No.") { }
            column(Store_Requistion_Header__Global_Dimension_1_Code_; "Store Requistion Header"."Global Dimension 1 Code") { }
            column(Store_Requistion_Header__Function_Name_; "Store Requistion Header"."Function Name") { }
            column(TIME_PRINTED_____FORMAT_TIME_; 'TIME PRINTED:' + Format(Time))
            {
                AutoFormatType = 1;
            }
            column(DATE_PRINTED_____FORMAT_TODAY_0_4_; 'DATE PRINTED:' + Format(Today, 0, 4))
            {
                AutoFormatType = 1;
            }
            column(USERID_Control1102755048; UserId) { }
            column(Store_RequistionCaption; Store_RequistionCaptionLbl) { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(Store_Requistion_Lines_DescriptionCaption; "Store Requistion Lines".FieldCaption(Description)) { }
            column(Store_Requistion_Lines_QuantityCaption; "Store Requistion Lines".FieldCaption(Quantity)) { }
            column(UoMCaption; UoMCaptionLbl) { }
            column(Store_Requistion_Lines__Line_Amount_Caption; "Store Requistion Lines".FieldCaption("Line Amount")) { }
            column(Store_Requistion_Lines__Unit_Cost_Caption; "Store Requistion Lines".FieldCaption("Unit Cost")) { }
            column(Store_Requistion_Header__Required_Date_Caption; "Store Requistion Header".FieldCaption("Store Requistion Header"."Required Date")) { }
            column(Store_Requistion_Header__Shortcut_Dimension_4_Code_Caption; "Store Requistion Header".FieldCaption("Store Requistion Header"."Shortcut Dimension 4 Code")) { }
            column(Store_Requistion_Lines__No__Caption; "Store Requistion Lines".FieldCaption("No.")) { }
            column(Store_Requistion_Header__Request_date_Caption; "Store Requistion Header".FieldCaption("Store Requistion Header"."Request date")) { }
            column(Store_Requistion_Header__Shortcut_Dimension_3_Code_Caption; "Store Requistion Header".FieldCaption("Store Requistion Header"."Shortcut Dimension 3 Code")) { }
            column(Store_Requistion_Header__Request_Description_Caption; "Store Requistion Header".FieldCaption("Store Requistion Header"."Request Description")) { }
            column(Store_Requistion_Header__Shortcut_Dimension_2_Code_Caption; "Store Requistion Header".FieldCaption("Store Requistion Header"."Shortcut Dimension 2 Code")) { }
            column(Store_Requistion_Header__No__Caption; "Store Requistion Header".FieldCaption("Store Requistion Header"."No.")) { }
            column(Store_Requistion_Header__Global_Dimension_1_Code_Caption; "Store Requistion Header".FieldCaption("Store Requistion Header"."Global Dimension 1 Code")) { }
            column(Date_Caption; Date_CaptionLbl) { }
            column(Name_Caption; Name_CaptionLbl) { }
            column(RecipientCaption; RecipientCaptionLbl) { }
            column(Printed_By_Caption; Printed_By_CaptionLbl) { }
            column(Name_Caption_Control1102755052; Name_Caption_Control1102755052Lbl) { }
            column(Date_Caption_Control1102755053; Date_Caption_Control1102755053Lbl) { }
            column(Signature_Caption; Signature_CaptionLbl) { }
            column(AuthorisationsCaption; AuthorisationsCaptionLbl) { }
            column(EmptyStringCaption; EmptyStringCaptionLbl) { }
            column(Signature_Caption_Control1102755000; Signature_Caption_Control1102755000Lbl) { }
            column(DocHeader; DocHeader) { }
            column(CompanyInfoName; CompanyInfo.Name) { }
            column(CompanyInfoAdd; CompanyInfo.Address) { }
            column(CompanyInfoAdd2; CompanyInfo."Address 2") { }
            column(CompanyInfoPicture; CompanyInfo.Picture) { }
            dataitem("Store Requistion Lines"; "Store Requistion Lines")
            {
                DataItemLink = "Requistion No" = field("No.");
                DataItemTableView = sorting("Requistion No", "Line No.") order(ascending);
                column(ReportForNavId_7187; 7187) { }
                column(Store_Requistion_Lines__No__; "Store Requistion Lines"."No.") { }
                column(Store_Requistion_Lines_Description; "Store Requistion Lines".Description) { }
                column(Store_Requistion_Lines_Quantity; "Store Requistion Lines".Quantity) { }
                column(Store_Requistion_Lines__Unit_of_Measure_; "Store Requistion Lines"."Unit of Measure") { }
                column(Store_Requistion_Lines__Line_Amount_; "Store Requistion Lines"."Line Amount") { }
                column(Store_Requistion_Lines__Unit_Cost_; "Store Requistion Lines"."Unit Cost") { }
                column(Store_Requistion_Lines_Requistion_No; "Store Requistion Lines"."Requistion No") { }
            }
            dataitem("Approval Entry"; "Approval Entry")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where(Status = const(Approved));
                column(ReportForNavId_1102755003; 1102755003) { }
                column(SequenceNo_ApprovalEntry; "Approval Entry"."Sequence No.") { }
                column(SenderID_ApprovalEntry; "Approval Entry"."Sender ID") { }
                column(ApproverID_ApprovalEntry; "Approval Entry"."Approver ID") { }
                column(DateTimeSentforApproval_ApprovalEntry; "Approval Entry"."Date-Time Sent for Approval") { }
                column(LastDateTimeModified_ApprovalEntry; "Approval Entry"."Last Date-Time Modified") { }
            }

            trigger OnAfterGetRecord()
            begin
                if "Store Requistion Header"."Document Type" = "Store Requistion Header"."Document Type"::SR then
                    DocHeader := 'Staff Grant Requisition'
                else
                    DocHeader := 'Store Requisition';

                if "Store Requistion Header".Status = "Store Requistion Header".Status::Posted then
                    if "Store Requistion Header"."Document Type" = "Store Requistion Header"."Document Type"::SR then
                        DocHeader := 'Staff Grant Issue'
                    else
                        DocHeader := 'Store Issue';

                if not CurrReport.Preview then begin
                    "Store Requistion Header"."No. Printed" += 1;
                    "Store Requistion Header".Modify();
                end
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
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture)
    end;

    var
        Store_RequistionCaptionLbl: Label 'Store Requistion';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        UoMCaptionLbl: Label 'UoM';
        Date_CaptionLbl: Label 'Date:';
        Name_CaptionLbl: Label 'Name:';
        RecipientCaptionLbl: Label 'Recipient';
        Printed_By_CaptionLbl: Label 'Printed By:';
        Name_Caption_Control1102755052Lbl: Label 'Name:';
        Date_Caption_Control1102755053Lbl: Label 'Date:';
        Signature_CaptionLbl: Label 'Signature:';
        AuthorisationsCaptionLbl: Label 'Authorisations';
        EmptyStringCaptionLbl: Label '================================================================================================================================================================================================';
        Signature_Caption_Control1102755000Lbl: Label 'Signature:';
        DocHeader: Text;
        CompanyInfo: Record "Company Information";
}
