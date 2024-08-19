#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193722 "Store Transfer Order"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Store Transfer Order.rdlc';
    Caption = 'Store Transfer Order';
    ApplicationArea = All;

    dataset
    {
        dataitem("Transfer Header"; "Transfer Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Transfer-from Code", "Transfer-to Code";
            RequestFilterHeading = 'Transfer Order';
            column(ReportForNavId_2957; 2957) { }
            column(No_TransferHdr; "Transfer Header"."No.") { }
            column(CompanyInfoName; CompanyInfo.Name) { }
            column(CompanyInfoPicture; CompanyInfo.Picture) { }
            column(TransferHeaderTitle; TransferHeaderTitle) { }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = sorting(Number);
                column(ReportForNavId_5701; 5701) { }
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    column(ReportForNavId_6455; 6455) { }
                    column(CopyCaption; StrSubstNo(Text001, CopyText)) { }
                    column(TransferToAddr1; TransferToAddr[1]) { }
                    column(TransferFromAddr1; TransferFromAddr[1]) { }
                    column(TransferToAddr2; TransferToAddr[2]) { }
                    column(TransferFromAddr2; TransferFromAddr[2]) { }
                    column(TransferToAddr3; TransferToAddr[3]) { }
                    column(TransferFromAddr3; TransferFromAddr[3]) { }
                    column(TransferToAddr4; TransferToAddr[4]) { }
                    column(TransferFromAddr4; TransferFromAddr[4]) { }
                    column(TransferToAddr5; TransferToAddr[5]) { }
                    column(TransferToAddr6; TransferToAddr[6]) { }
                    column(InTransitCode_TransHdr; "Transfer Header"."In-Transit Code")
                    {
                        IncludeCaption = true;
                    }
                    column(PostingDate_TransHdr; Format("Transfer Header"."Posting Date", 0, 4)) { }
                    column(TransferToAddr7; TransferToAddr[7]) { }
                    column(TransferToAddr8; TransferToAddr[8]) { }
                    column(TransferFromAddr5; TransferFromAddr[5]) { }
                    column(TransferFromAddr6; TransferFromAddr[6]) { }
                    column(PageCaption; StrSubstNo(Text002, '')) { }
                    column(OutputNo; OutputNo) { }
                    column(ShptMethodDesc; ShipmentMethod.Description) { }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Transfer Header";
                        DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                        column(ReportForNavId_7574; 7574) { }
                        column(DimText; DimText) { }
                        column(Number_DimensionLoop1; DimensionLoop1.Number) { }
                        column(HdrDimensionsCaption; HdrDimensionsCaptionLbl) { }

                        trigger OnAfterGetRecord()
                        begin
                            if DimensionLoop1.Number = 1 then begin
                                if not DimSetEntry1.FindSet() then
                                    CurrReport.Break();
                            end else
                                if not Continue then
                                    CurrReport.Break();

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 - %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1; %2 - %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until DimSetEntry1.Next() = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfo then
                                CurrReport.Break();
                        end;
                    }
                    dataitem("Transfer Line"; "Transfer Line")
                    {
                        DataItemLink = "Document No." = field("No.");
                        DataItemLinkReference = "Transfer Header";
                        DataItemTableView = sorting("Document No.", "Line No.") where("Derived From Line No." = const(0));
                        column(ReportForNavId_9370; 9370) { }
                        column(ItemNo_TransLine; "Transfer Line"."Item No.")
                        {
                            IncludeCaption = true;
                        }
                        column(Desc_TransLine; "Transfer Line".Description)
                        {
                            IncludeCaption = true;
                        }
                        column(Qty_TransLine; "Transfer Line".Quantity)
                        {
                            IncludeCaption = true;
                        }
                        column(UOM_TransLine; "Transfer Line"."Unit of Measure")
                        {
                            IncludeCaption = true;
                        }
                        column(Qty_TransLineShipped; "Transfer Line"."Quantity Shipped")
                        {
                            IncludeCaption = true;
                        }
                        column(QtyReceived_TransLine; "Transfer Line"."Quantity Received")
                        {
                            IncludeCaption = true;
                        }
                        column(TransFromBinCode_TransLine; "Transfer Line"."Transfer-from Bin Code")
                        {
                            IncludeCaption = true;
                        }
                        column(TransToBinCode_TransLine; "Transfer Line"."Transfer-To Bin Code")
                        {
                            IncludeCaption = true;
                        }
                        column(LineNo_TransLine; "Transfer Line"."Line No.") { }
                        column(OutstandingQuantity_TransferLine; "Transfer Line"."Outstanding Quantity") { }
                        column(QtytoShip_TransferLine; "Transfer Line"."Qty. to Ship") { }
                        column(QtyinTransit_TransferLine; "Transfer Line"."Qty. in Transit") { }
                        column(QtytoReceive_TransferLine; "Transfer Line"."Qty. to Receive") { }
                        column(sno; SNo) { }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                            column(ReportForNavId_3591; 3591) { }
                            column(DimText2; DimText) { }
                            column(Number_DimensionLoop2; DimensionLoop2.Number) { }
                            column(LineDimensionsCaption; LineDimensionsCaptionLbl) { }

                            trigger OnAfterGetRecord()
                            begin
                                if DimensionLoop2.Number = 1 then begin
                                    if not DimSetEntry2.FindSet() then
                                        CurrReport.Break();
                                end else
                                    if not Continue then
                                        CurrReport.Break();

                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText := StrSubstNo('%1 - %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    else
                                        DimText :=
                                          StrSubstNo(
                                            '%1; %2 - %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until DimSetEntry2.Next() = 0;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not ShowInternalInfo then
                                    CurrReport.Break();
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            DimSetEntry2.SetRange("Dimension Set ID", "Transfer Line"."Dimension Set ID");
                            SNo += 1;
                        end;
                    }
                    dataitem("Approval Entry"; "Approval Entry")
                    {
                        DataItemLink = "Document No." = field("No.");
                        DataItemLinkReference = "Transfer Header";
                        DataItemTableView = where(Status = const(Approved));
                        column(ReportForNavId_1000000001; 1000000001) { }
                        column(DocumentNo_ApprovalEntry; "Approval Entry"."Document No.") { }
                        column(SequenceNo_ApprovalEntry; "Approval Entry"."Sequence No.") { }
                        column(ApprovalCode_ApprovalEntry; "Approval Entry"."Approval Code") { }
                        column(SenderID_ApprovalEntry; "Approval Entry"."Sender ID") { }
                        column(ApproverID_ApprovalEntry; "Approval Entry"."Approver ID") { }
                        column(DateTimeSentforApproval_ApprovalEntry; "Approval Entry"."Date-Time Sent for Approval") { }
                        column(LastDateTimeModified_ApprovalEntry; "Approval Entry"."Last Date-Time Modified") { }
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    if CopyLoop.Number > 1 then begin
                        CopyText := Text000;
                        OutputNo += 1;
                    end;
                    CurrReport.PageNo := 1;
                    SNo := 0;
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := Abs(NoOfCopies) + 1;
                    CopyText := '';
                    CopyLoop.SetRange(CopyLoop.Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                DimSetEntry1.SetRange("Dimension Set ID", "Transfer Header"."Dimension Set ID");
                FormatAddr.TransferHeaderTransferFrom(TransferFromAddr, "Transfer Header");
                FormatAddr.TransferHeaderTransferTo(TransferToAddr, "Transfer Header");

                if not ShipmentMethod.Get("Transfer Header"."Shipment Method Code") then
                    ShipmentMethod.Init();

                TransferHeaderTitle := 'Stores Transfer Voucher';
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = Basic;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies the value of the No. of Copies field.';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies the value of the Show Internal Information field.';
                    }
                }
            }
        }

        actions { }
    }

    labels
    {
        PostingDateCaption = 'Posting Date';
        ShptMethodDescCaption = 'Shipment Method';
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        Text000: Label 'COPY';
        Text001: Label 'Transfer Order %1';
        Text002: Label 'Page %1';
        ShipmentMethod: Record "Shipment Method";
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        FormatAddr: Codeunit "Format Address";
        TransferFromAddr: array[8] of Text[50];
        TransferToAddr: array[8] of Text[50];
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        OutputNo: Integer;
        HdrDimensionsCaptionLbl: Label 'Header Dimensions';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        CompanyInfo: Record "Company Information";
        SNo: Integer;
        TransferHeaderTitle: Text;
}
