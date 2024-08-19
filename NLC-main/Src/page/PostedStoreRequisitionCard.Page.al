#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 50008 "Posted Store Requisition Card"
{
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancellation,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Store Requistion Headers";
    SourceTableView = where("Document Type" = const(SR));
    ApplicationArea = All;
    Caption = 'Posted Store Requisition Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Request date"; Rec."Request date")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Request date field.';
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Function Name"; Rec."Function Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Budget Center Name"; Rec."Budget Center Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Request Description"; Rec."Request Description")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Request Description field.';
                }
                field("Required Date"; Rec."Required Date")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Required Date field.';
                }
                field("Issuing Store"; Rec."Issuing Store")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Issuing Store field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Received; Rec.Received)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received field.';
                }
                field("Received By"; Rec."Received By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received By field.';
                }
                field("Received Date"; Rec."Received Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received Date field.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control1102755015; "Store RequisitionLine")
            {
                Editable = true;
                SubPageLink = "Requistion No" = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                separator(Action1102755029) { }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    begin
                        DocumentType := DocumentType::Rn;
                        ApprovalEntries.Setfilters(Database::"Store Requistion Headers", DocumentType, Rec."No.");
                        ApprovalEntries.Run();
                    end;
                }
                separator(Action1102755035) { }
                action("Print/Preview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print/Preview';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Print/Preview action.';
                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetFilter(Rec."No.", Rec."No.");
                        Report.Run(Report::"Store Requisitions", true, true, Rec);
                        Rec.Reset();

                        /*
                        RESET;
                        SETFILTER("No.","No.");
                        REPORT.RUN(39003922,TRUE,TRUE,Rec);
                        RESET;
                         */

                    end;
                }
                separator(Action13) { }
                action(Receive)
                {
                    ApplicationArea = Basic;
                    Caption = 'Receive';
                    Image = Receipt;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Receive action.';
                    trigger OnAction()
                    begin

                        if Rec.Status <> Rec.Status::Posted then
                            Error('You can only receive after approval');

                        if Confirm('Receive this Items contained in this Requisition?', true) = false then
                            exit;

                        if Rec.Received = false then begin
                            Rec.Received := true;
                            Rec."Received By" := UserId;
                            Rec."Received Date" := WorkDate();
                            //MODIFY;
                            Message('Item(s) receipt Successful');
                        end


                        /*
                        CompanyInfo.GET();
                        SenderAddress := CompanyInfo."Administrator Email";

                        SenderName := COMPANYNAME;

                         Subject := STRSUBSTNO('Requisition %1 Receipt',"No.");
                         Body := STRSUBSTNO('This is to inform you that Store Requisition %1 has been Received and you are required to post it and hand over the Item(s) requested.',"No.");

                         CompanyInfo.GET();

                         Recipients := CompanyInfo."Procurement Support E-mail";

                         SMTPSetup.CreateMessage(SenderName,SenderAddress,Recipients,Subject,Body,TRUE);

                         SMTPSetup.Send;
                        END ELSE
                         ERROR('You have already Received this Store Requisition!!');
                        */

                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reject';
                    Image = Receipt;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Reject action.';
                    trigger OnAction()
                    begin

                        if Rec.Status <> Rec.Status::Posted then
                            Error('You can only reject after approval');

                        if Confirm('Reject this Items contained in this Requisition?', true) = false then
                            exit;

                        if Rec.Received = false then begin
                            Rec.Rejected := true;
                            Rec."Rejected By" := UserId;
                            Rec."Rejected Date" := WorkDate();
                            //MODIFY;
                            Message('Item(s) rejected Successful');
                        end


                        /*
                        CompanyInfo.GET();
                        SenderAddress := CompanyInfo."Administrator Email";

                        SenderName := COMPANYNAME;

                         Subject := STRSUBSTNO('Requisition %1 Receipt',"No.");
                         Body := STRSUBSTNO('This is to inform you that Store Requisition %1 has been Received and you are required to post it and hand over the Item(s) requested.',"No.");

                         CompanyInfo.GET();

                         Recipients := CompanyInfo."Procurement Support E-mail";

                         SMTPSetup.CreateMessage(SenderName,SenderAddress,Recipients,Subject,Body,TRUE);

                         SMTPSetup.Send;
                        END ELSE
                         ERROR('You have already Received this Store Requisition!!');
                        */

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        CurrPageUpdate();

        Rec."Document Type" := Rec."Document Type"::SR
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec."Document Type" := Rec."Document Type"::SR;


        RequisitionHeader.Reset();
        RequisitionHeader.SetRange("User ID", UserId);
        RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Open);
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."Document Type"::SR);
        if RequisitionHeader.FindFirst() then
            Error('you cannot open another document when %1 is still %2', RequisitionHeader."No.", Format(RequisitionHeader.Status));


        RequisitionHeader.Reset();
        RequisitionHeader.SetRange("User ID", UserId);
        RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Posted);
        RequisitionHeader.SetRange(RequisitionHeader.Received, false);
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."Document Type"::SR);
        if RequisitionHeader.FindFirst() then
            Error('you cannot create a new record when you have not Received Requisition No:%1', RequisitionHeader."No.");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        /*
      "Responsibility Center" := UserMgt.GetPurchasesFilter();
      //Add dimensions if set by default here
      "Global Dimension 1 Code":=UserMgt.GetSetDimensions(USERID,1);
      VALIDATE("Global Dimension 1 Code");
      "Shortcut Dimension 2 Code":=UserMgt.GetSetDimensions(USERID,2);
      VALIDATE("Shortcut Dimension 2 Code");
      "Shortcut Dimension 3 Code":=UserMgt.GetSetDimensions(USERID,3);
      VALIDATE("Shortcut Dimension 3 Code");
      "Shortcut Dimension 4 Code":=UserMgt.GetSetDimensions(USERID,4);
      VALIDATE("Shortcut Dimension 4 Code");
       */

        //UpdateControls;
        Rec."Document Type" := Rec."Document Type"::SR;


        RequisitionHeader.Reset();
        RequisitionHeader.SetRange("User ID", UserId);
        RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Open);
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."Document Type"::SR);
        if RequisitionHeader.FindFirst() then
            Error('you cannot open another document when %1 is still %2', RequisitionHeader."No.", Format(RequisitionHeader.Status));


        RequisitionHeader.Reset();
        RequisitionHeader.SetRange("User ID", UserId);
        RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Posted);
        RequisitionHeader.SetRange(RequisitionHeader.Received, false);
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."Document Type"::SR);
        if RequisitionHeader.FindFirst() then
            Error('you cannot create a new record when you have not Received Requisition No:%1', RequisitionHeader."No.");

    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin

        UpdateControls();
    end;

    trigger OnOpenPage()
    begin
        /*
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center" ,UserMgt.GetPurchasesFilter());
          FILTERGROUP(0);
        END;
        */

        Rec."Document Type" := Rec."Document Type"::SR

    end;

    var
        UserMgt: Codeunit "User Setup Management BR";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        ReqLine: Record "Store Requistion Line";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        JournlPosted: Codeunit "Journal Post Successful";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,None,PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Staff Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        ApprovalEntries: Page "Approval Entries";
        StatusEditable: Boolean;
        RequisitionHeader: Record "Store Requistion Headers";


    procedure LinesExists(): Boolean
    var
        PayLines: Record "Store Requistion Line";
    begin
        HasLines := false;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Requistion No", Rec."No.");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;


    procedure UpdateControls()
    begin
        if Rec.Status = Rec.Status::Open then
            StatusEditable := true
        else
            StatusEditable := false;
    end;


    procedure CurrPageUpdate()
    begin
        xRec := Rec;
        UpdateControls();
        CurrPage.Update();
    end;
}
