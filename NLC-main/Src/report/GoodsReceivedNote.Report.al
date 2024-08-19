#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50083 "Goods Received Note"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Goods Received Note.rdlc';
    ApplicationArea = All;
    Caption = 'Goods Received Note';
    dataset
    {
        dataitem("Store Requistion Headers"; "Store Requistion Headers")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            column(ReportForNavId_1826; 1826) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(USERID; UserId) { }
            column(Store_Requistion_Header__Required_Date_; "Store Requistion Headers"."Required Date") { }
            column(Store_Requistion_Header__Shortcut_Dimension_4_Code_; "Store Requistion Headers"."Shortcut Dimension 4 Code") { }
            column(Store_Requistion_Header_Dim4; "Store Requistion Headers".Dim4) { }
            column(Store_Requistion_Header__Request_date_; "Store Requistion Headers"."Request date") { }
            column(Store_Requistion_Header__Shortcut_Dimension_3_Code_; "Store Requistion Headers"."Shortcut Dimension 3 Code") { }
            column(Store_Requistion_Header_Dim3; "Store Requistion Headers".Dim3) { }
            column(Store_Requistion_Header__Request_Description_; "Store Requistion Headers"."Request Description") { }
            column(Store_Requistion_Header__Shortcut_Dimension_2_Code_; "Store Requistion Headers"."Shortcut Dimension 2 Code") { }
            column(Store_Requistion_Header__Budget_Center_Name_; "Store Requistion Headers"."Budget Center Name") { }
            column(Store_Requistion_Header__No__; "Store Requistion Headers"."No.") { }
            column(Store_Requistion_Header__Global_Dimension_1_Code_; "Store Requistion Headers"."Global Dimension 1 Code") { }
            column(Store_Requistion_Header__Function_Name_; "Store Requistion Headers"."Function Name") { }
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
            column(Store_Requistion_Lines_DescriptionCaption; "Store Requistion Line".FieldCaption(Description)) { }
            column(Store_Requistion_Lines_QuantityCaption; "Store Requistion Line".FieldCaption(Quantity)) { }
            column(UoMCaption; UoMCaptionLbl) { }
            column(Store_Requistion_Lines__Line_Amount_Caption; "Store Requistion Line".FieldCaption("Line Amount")) { }
            column(Store_Requistion_Lines__Unit_Cost_Caption; "Store Requistion Line".FieldCaption("Unit Cost")) { }
            column(Store_Requistion_Header__Required_Date_Caption; "Store Requistion Headers".FieldCaption("Store Requistion Headers"."Required Date")) { }
            column(Store_Requistion_Header__Shortcut_Dimension_4_Code_Caption; "Store Requistion Headers".FieldCaption("Store Requistion Headers"."Shortcut Dimension 4 Code")) { }
            column(Store_Requistion_Lines__No__Caption; "Store Requistion Line".FieldCaption("No.")) { }
            column(Store_Requistion_Header__Request_date_Caption; "Store Requistion Headers".FieldCaption("Store Requistion Headers"."Request date")) { }
            column(Store_Requistion_Header__Shortcut_Dimension_3_Code_Caption; "Store Requistion Headers".FieldCaption("Store Requistion Headers"."Shortcut Dimension 3 Code")) { }
            column(Store_Requistion_Header__Request_Description_Caption; "Store Requistion Headers".FieldCaption("Store Requistion Headers"."Request Description")) { }
            column(Store_Requistion_Header__Shortcut_Dimension_2_Code_Caption; "Store Requistion Headers".FieldCaption("Store Requistion Headers"."Shortcut Dimension 2 Code")) { }
            column(Store_Requistion_Header__No__Caption; "Store Requistion Headers".FieldCaption("Store Requistion Headers"."No.")) { }
            column(Store_Requistion_Header__Global_Dimension_1_Code_Caption; "Store Requistion Headers".FieldCaption("Store Requistion Headers"."Global Dimension 1 Code")) { }
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
            column(OrderNo_StoreRequistionHeaders; "Store Requistion Headers"."Order No") { }
            column(VendorName_StoreRequistionHeaders; "Store Requistion Headers"."Vendor Name") { }
            column(RequesterID_StoreRequistionHeaders; "Store Requistion Headers"."Requester ID") { }
            column(DateReceived_StoreRequistionHeaders; "Store Requistion Headers"."Date Received") { }
            dataitem("Store Requistion Line"; "Store Requistion Line")
            {
                DataItemLink = "Requistion No" = field("No.");
                DataItemTableView = sorting("Requistion No", "Line No.") order(ascending);
                column(ReportForNavId_7187; 7187) { }
                column(Store_Requistion_Lines__No__; "Store Requistion Line"."No.") { }
                column(Store_Requistion_Lines_Description; "Store Requistion Line".Description) { }
                column(Store_Requistion_Lines_Quantity; "Store Requistion Line".Quantity) { }
                column(Store_Requistion_Lines__Unit_of_Measure_; "Store Requistion Line"."Unit of Measure") { }
                column(Store_Requistion_Lines__Line_Amount_; "Store Requistion Line"."Line Amount") { }
                column(Store_Requistion_Lines__Unit_Cost_; "Store Requistion Line"."Unit Cost") { }
                column(QuantityDelivered_StoreRequistionLine; "Store Requistion Line"."Quantity Delivered") { }
                column(Store_Requistion_Lines_Requistion_No; "Store Requistion Line"."Requistion No") { }
            }
            dataitem("Approval Entry"; "Approval Entry")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where("Document Type" = const(Rn), Status = const(Approved));
                column(ReportForNavId_1102755003; 1102755003) { }
                column(SequenceNo_ApprovalEntry; "Approval Entry"."Sequence No.") { }
                column(SenderID_ApprovalEntry; "Approval Entry"."Sender ID") { }
                column(ApproverID_ApprovalEntry; "Approval Entry"."Approver ID") { }
                column(DateTimeSentforApproval_ApprovalEntry; "Approval Entry"."Date-Time Sent for Approval") { }
                column(LastDateTimeModified_ApprovalEntry; "Approval Entry"."Last Date-Time Modified") { }
            }
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
        RecipientCaptionLbl: Label 'Received By:';
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
