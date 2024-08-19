#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 52193441 WebService
{


    var
        ApplicantDocs: Record "Applicant Sessions";
        MyRecRef: RecordRef;
        ApplicantRegister: Record "Applicant Register";
        HRLeave: Record "HR Leave Application";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        TrainingApplications: Record "HR Training App Header";
        ApprovalEntry: Record "Approval Entry";
        ApprovalSetup: Record "User Setup";
        Text001: Label 'You can only delegate open approval entries.';
        Text002: Label 'The selected approval(s) have been delegated. ';
        Text004: Label 'Approval Setup not found.';
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        StoresReqLine: Record "Store Requistion Lines";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        JournlPosted: Codeunit "WP Budget Allocation";
        ApprovalEntries: Page "Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition;
        PRFHeader: Record "Purchase Header";
        appMngt: Codeunit "Approvals Mgmt.";
        StoresReqHeader: Record "Store Requistion Header";
        HRAppraisalCard: Record "Master Record Creation Header";
        ApplicantProfile: Record "Attachment ID Buffer";
        prSalaryCard: Record "prSalary Card Casual";
        ApprovalCommentLine: Record "Approval Comment Line";
        tblOnlineSessions: Record "HR Employee Transfer Header";
        FILESPATH: Label 'E:\Production\NLC HRMS\Payslips\';
        HRTransportReq: Record "HR Transport Requisition";


    procedure UploadDocumentAttachment(ApplicantNo: Code[20]; URL1: Text[250]; Descriprion: Text[250]; UserID: Code[20]; Company: Text[250]; ExternalDocReference: RecordId)
    var
        RecordLink: Record "Record Link";
    begin
        /*
        ApplicantRegister.RESET;
        ApplicantRegister.SETRANGE(ApplicantRegister.UserName,ApplicantNo);

        IF (ApplicantRegister.FIND('-')) THEN
        BEGIN

        ApplicantDocs.RESET;
        ApplicantDocs.SETRANGE(ApplicantDocs.ApplicantNo,ApplicantNo);
        ApplicantDocs.SETRANGE(ApplicantDocs.Posted,FALSE);

        IF(ApplicantDocs.FIND('-'))THEN
          BEGIN
          RecordLink.RESET;

          RecordLink.INIT;
          //Rec0ordLink."Record ID":=ApplicantDocs.MyRecId;
          RecordLink."Record ID":=ApplicantRegister.MyRecId;

          RecordLink.URL1:=URL1;
          RecordLink.Description:=Descriprion;
          RecordLink."User ID":=UserID;
          RecordLink.Company:=Company;
          RecordLink.Created:=CURRENTDATETIME;

          RecordLink.INSERT(TRUE);

        ApplicantDocs.RESET;
        ApplicantDocs.SETRANGE(ApplicantDocs.ApplicantNo,ApplicantNo);
        ApplicantDocs.SETRANGE(ApplicantDocs.Posted,FALSE);
            IF(ApplicantDocs.FIND('-'))THEN

               BEGIN
                 ApplicantDocs.Posted:=TRUE;
                 ApplicantDocs.MODIFY;
               END

          END;
        END
        */

    end;


    procedure ApplicantDocsInsert(ApplicantNo: Text; DocType: Text; FileName: Text; DocumentNo: Text; DocumentURL: Text; Posted: Boolean; Company: Text; Section: Option; DocumentNotes: Text; randomResultMapper: Text)
    begin
        /*
        ApplicantDocs.INIT;

         BEGIN
              ApplicantDocs.ApplicantNo:=ApplicantNo;
              ApplicantDocs.DocType:=DocType;
              ApplicantDocs.FileName:=FileName;
              ApplicantDocs."Document No":=DocumentNo;
              ApplicantDocs.DocumentURL:=DocumentURL;
              ApplicantDocs.Company:=Company;
              ApplicantDocs.Section:=Section;
              ApplicantDocs."Document Notes":=DocumentNotes;
              ApplicantDocs.RandomMapperEduBackGr:=randomResultMapper;

              ApplicantDocs.INSERT(TRUE);

         END;
        */

    end;


    procedure ApplicantRegInsert(UserName: Text; Password: Text; EmailAddress: Text)
    begin

        ApplicantRegister.Init();

        begin
            ApplicantRegister.UserName := UserName;
            ApplicantRegister.Password := Password;
            ApplicantRegister.EmailAddress := EmailAddress;
            ApplicantRegister.Verified := true;

            ApplicantRegister.Insert(true);

        end
    end;


    procedure ApproveTrainingRequest(DocumentNo: Code[10])
    begin
    end;


    procedure HRLeaveAppInsert(EmployeeNo: Text; Names: Text; LeaveType: Text; DaysApplied: Decimal; StartDate: Date; ReturnDate: Date; ApplicationDate: Date; Status: Integer; EndDate: Date; UserID: Text; applicantComments: Text[250]; ResponsibilityCenter: Code[20]; "Request Leave Allowance": Boolean) HR_Doc_No: Code[20]
    begin
        begin

            HRLeave.Init();
            HRLeave."Employee No" := EmployeeNo;
            HRLeave.Names := Names;
            HRLeave."Leave Type" := LeaveType;
            HRLeave."Days Applied" := DaysApplied;
            HRLeave."Start Date" := StartDate;
            HRLeave."Return Date" := ReturnDate;
            HRLeave."Application Date" := ApplicationDate;
            HRLeave.Status := Status;
            HRLeave."End Date" := EndDate;
            HRLeave."User ID" := UserID;
            HRLeave."Applicant Comments" := applicantComments;
            HRLeave."Responsibility Center" := ResponsibilityCenter;
            HRLeave."Request Leave Allowance" := "Request Leave Allowance";

            HRLeave.Insert(true);
            HR_Doc_No := HRLeave."Application Code";

        end
    end;


    procedure SendLeaveForApproval(ApplicationCode: Code[10])
    var
        LeaveApplication: Record "HR Leave Application";
    begin

        LeaveApplication.SetRange(LeaveApplication."Application Code", ApplicationCode);

        if LeaveApplication.Find('-') then;
        //ApprovalMgt.SendLeaveAppApprovalReq(LeaveApplication);
    end;


    procedure SumbitTrainingForApproval(ApplicationNo: Code[10]; DocType: Integer; UserID: Text)
    begin

        TrainingApplications.SetRange(TrainingApplications."Application No", ApplicationNo);

        if TrainingApplications.Find('-') then;
        //TrainingApplications."User ID":=UserID;
        //"Document Type":="Document Type"::"Training Requisition";
        //ApprovalMgt.SendTrainingAppApprovalPortal(TrainingApplication,DocType);
        //TrainingApplications."Document Type":=TrainingApplications."Document Type"::"Training Requisition";
        //ApprovalMgt.SendTrainingAppApprovalRequest(TrainingApplications);
    end;


    procedure ApproveDocument(DocumentNo: Text; ApproverID: Text)
    begin

        ApprovalEntry.SetRange(ApprovalEntry."Document No.", DocumentNo);
        ApprovalEntry.SetRange(ApprovalEntry."Approver ID", ApproverID);

        if ApprovalEntry.Find('-') then
            repeat
                if not ApprovalSetup.Get() then
                    Error(Text004);

                ApprovalMgt.ApproveApprovalRequests(ApprovalEntry);

            until ApprovalEntry.Next() = 0;
    end;


    procedure RejectDocument(DocumentNo: Text; ApproverID: Text)
    begin

        ApprovalEntry.SetRange(ApprovalEntry."Document No.", DocumentNo);
        ApprovalEntry.SetRange(ApprovalEntry."Approver ID", ApproverID);

        if ApprovalEntry.Find('-') then
            repeat
                if not ApprovalSetup.Get() then
                    Error(Text004);
                ApprovalMgt.RejectApprovalRequests(ApprovalEntry);

            until ApprovalEntry.Next() = 0;
    end;


    procedure CancelDocument(DocumentNo: Text; SenderID: Text)
    begin

        ApprovalEntry.SetRange(ApprovalEntry."Document No.", DocumentNo);
        ApprovalEntry.SetRange(ApprovalEntry."Sender ID", SenderID);

        if ApprovalEntry.Find('-') then
            repeat

                VarVariant := ApprovalEntry."Table ID";
                CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
            //ApprovalMgt.CancelApprovalRequest(ApprovalEntry);

            until ApprovalEntry.Next() = 0;
    end;


    procedure HRTrainingAppInsert(ApplicationCode: Code[50]; CourseCode: Code[50]; Description: Text[100]; Location: Text[100]; EmployeeDepartment: Code[20]; NoOfParticipant: Integer; PurposeOfTraining: Text[100]; FromDate: Date; ToDate: Date; Duration: Integer; DurationUnits: Integer; EmployeeNo: Code[10]; Provider: Code[10]; ProviderName: Text[150]; ApplicationDate: Date; TableID: Integer; EmployeeName: Text[100]) TrainingNewDocNo: Code[20]
    begin

        begin

            TrainingApplications.Init();
            TrainingApplications."Application No" := ApplicationCode;
            TrainingApplications."Course Title" := CourseCode;
            //TrainingApplications.Description:=Description;
            //TrainingApplications.Location:=Location;
            //TrainingApplications."Employee Department":=EmployeeDepartment;
            //TrainingApplications."No. of Participant":=NoOfParticipant;
            //TrainingApplications."Purpose of Training":=PurposeOfTraining;
            TrainingApplications."Start Date" := FromDate;
            TrainingApplications."End Date" := ToDate;
            //TrainingApplications."Days Applied":=Duration;
            //TrainingApplications."Duration Units":=Duration;
            //TrainingApplications."Employee No.":=EmployeeNo;
            //TrainingApplications.Provider:=Provider;
            //TrainingApplications."Provider Name":=ProviderName;
            TrainingApplications."Application Date" := ApplicationDate;
            //TrainingApplications."Table ID":=TableID;
            //TrainingApplications."Employee Name":=EmployeeName;


            TrainingApplications.Insert(true);
            TrainingNewDocNo := TrainingApplications."Application No";
        end
    end;


    procedure StoreHeader(No: Code[20]; "Request Description": Text[50]; "Responsibility Center": Code[20]; "Shortcut Dimension 1 Code": Code[20]; "Shortcut Dimension 2 Code": Code[20]; "Request Date": Date; "Required Date": Date; "User ID": Code[20]; "Requestor User ID": Code[20]; TransactionType: Option New,Modify,Delete,Cancel; "Issuing Store": Text[50]) PRF_No: Code[20]
    var
        StoreHeader: Record "Store Requistion Header";
    begin
        /*
        StoreHeader.INIT;

        CASE TransactionType OF
          TransactionType::New: BEGIN
              StoreHeader."User ID":="User ID";
              StoreHeader."Request date":="Request Date";
              StoreHeader."Required Date":="Required Date";
              StoreHeader."Issuing Store":= "Issuing Store";

              StoreHeader.INSERT(TRUE);

              PRF_No:=StoreHeader."No.";
          END;

          TransactionType::Modify: BEGIN

                  StoreHeader.RESET;
                  StoreHeader.SETRANGE(StoreHeader."No.",No);
                //-------------------------------------------------



              IF StoreHeader.FIND('-') THEN  BEGIN

                  StoreHeader."Request date":="Request Date";
                  //StoreHeader.VALIDATE("Request date");
                  StoreHeader."Required Date":= "Required Date";
                  //StoreHeader.VALIDATE("Required Date");
                  StoreHeader."Requester ID":= "User ID";
                  // StoreHeader.VALIDATE("User ID");
                  StoreHeader."Request Description":="Request Description";
                  // StoreHeader.VALIDATE("Request Description");
                  StoreHeader."User ID":="User ID";
                  // StoreHeader.VALIDATE("User ID");
                  StoreHeader."Responsibility Center":="Responsibility Center";
                  StoreHeader.VALIDATE("Responsibility Center");
                  StoreHeader."Global Dimension 1 Code":="Shortcut Dimension 1 Code";
                  StoreHeader.VALIDATE( StoreHeader."Global Dimension 1 Code");
                  StoreHeader."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
                  StoreHeader.VALIDATE(StoreHeader."Shortcut Dimension 2 Code");
                  StoreHeader."Issuing Store":="Issuing Store";
                  StoreHeader.VALIDATE("Issuing Store");

                 StoreHeader.MODIFY;

              END;


        //----------------------------------------


          END;

          TransactionType::Cancel: BEGIN
              StoreHeader.RESET;

              StoreHeader.SETRANGE(StoreHeader."No.",No);

          END;
          END;
        */

    end;


    procedure StoreLines("Document Type": Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"; "Document No": Code[20]; "PRF No": Code[20]; "Line No": Integer; Type: Option " ","G/L Account",Item,,"Fixed Asset","Charge (Item)"; No: Code[20]; IssuingStore: Code[20]; Dim1: Text[250]; Dim2: Text[250]; Quantity: Decimal; "Direct Unit Cost": Decimal; TransactionType: Option New,Modify,Delete; Facility: Text[250])
    var
        StoreLine: Record "Store Requistion Lines";
        OrderLineDesc: Text[50];
        StrLength: Integer;
        Length: Integer;
        TestDesc: Text[250];
        DocDim: Record "IC Document Dimension";
    begin

        StoreLine.Init();

        case TransactionType of
            TransactionType::New:
                begin

                    StoreLine.Reset();


                    StoreLine.SetRange(StoreLine."Requistion No", "Document No");
                    StoreLine.SetRange(StoreLine."Line No.", "Line No");
                    if StoreLine.Find('-') then begin

                        StoreLine."No." := No;
                        StoreLine.Validate(StoreLine."No.");
                        StoreLine.Type := Type;
                        StoreLine.Validate(Type);
                        StoreLine."Issuing Store" := IssuingStore;
                        // StoreLine.VALIDATE( StoreLine."Issuing Store");
                        StoreLine."Shortcut Dimension 1 Code" := Dim1;
                        // StoreLine.VALIDATE( StoreLine."Shortcut Dimension 1 Code");
                        StoreLine."Shortcut Dimension 2 Code" := Dim1;
                        // StoreLine.VALIDATE( StoreLine."Shortcut Dimension 2 Code");
                        StoreLine."Quantity Requested" := Quantity;
                        StoreLine.Quantity := Quantity;
                        // StoreLine.VALIDATE(Quantity);
                        StoreLine."Unit Cost" := "Direct Unit Cost";
                        //StoreLine.Facility:= Facility;
                        StoreLine.Modify();

                    end
                    else begin

                        StoreLine."No." := No;
                        StoreLine.Validate(StoreLine."No.");
                        StoreLine.Type := Type;
                        StoreLine."Requistion No" := "Document No";
                        StoreLine."Shortcut Dimension 1 Code" := Dim1;
                        StoreLine."Shortcut Dimension 2 Code" := Dim2;
                        StoreLine."Issuing Store" := StoreLine."Issuing Store";
                        StoreLine.Quantity := Quantity;
                        StoreLine."Quantity Requested" := Quantity;
                        StoreLine."Unit Cost" := "Direct Unit Cost";
                        //StoreLine.Facility:= Facility;
                        StoreLine.Insert(true);

                    end;


                end;

            TransactionType::Modify:
                begin
                    StoreLine.Reset();
                    StoreLine.SetRange(StoreLine."Requistion No", "Document No");
                    StoreLine.SetRange(StoreLine."Line No.", "Line No");


                    if StoreLine.Find('-') then begin
                        StoreLine."No." := No;
                        StoreLine.Validate(StoreLine."No.");
                        StoreLine.Type := Type;
                        StoreLine.Validate(Type);
                        StoreLine."Issuing Store" := IssuingStore;
                        StoreLine.Validate(StoreLine."Issuing Store");
                        StoreLine."Shortcut Dimension 1 Code" := Dim1;
                        StoreLine.Validate(StoreLine."Shortcut Dimension 1 Code");
                        StoreLine."Shortcut Dimension 2 Code" := Dim1;
                        StoreLine.Validate(StoreLine."Shortcut Dimension 2 Code");
                        StoreLine.Quantity := Quantity;
                        StoreLine."Quantity Requested" := Quantity;
                        StoreLine.Validate(Quantity);
                        StoreLine."Unit Cost" := "Direct Unit Cost";
                        //StoreLine.Facility:= Facility;
                        StoreLine.Modify();


                    end;
                end;

            TransactionType::Delete:
                begin
                    StoreLine.Reset();
                    StoreLine.SetRange(StoreLine."Requistion No", "Document No");
                    StoreLine.SetRange(StoreLine."Line No.", "Line No");
                    StoreLine.SetRange(StoreLine."Requistion No", "Document No");
                    StoreLine.SetRange(StoreLine."Line No.", "Line No");
                    if StoreLine.Find('-') then begin
                        DocDim.Reset();
                        //DocDim.SETRANGE( DocDim."Document No.","Document No");
                        DocDim.SetRange(DocDim."Line No.", "Line No");

                        DocDim.DeleteAll();
                        StoreLine.Delete(true);
                    end;

                end;

        end;
    end;


    procedure LinesExists(No: Code[20]): Boolean
    var
        PayLines: Record "Purchase Line";
    begin
        HasLines := false;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Document No.", No);
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;


    procedure PostStoreRequisation(No: Code[20])
    var
        StoreHeader: Record "Store Requistion Header";
    begin
        /*
        IF NOT LinesExists(No) THEN
           ERROR('There are no Lines created for this Document');

        StoreHeader.RESET;
        StoreHeader.SETRANGE(StoreHeader."No.",No);
          IF StoreHeader.FIND('-') THEN BEGIN

           IF StoreHeader.Status=StoreHeader.Status::Posted THEN
              ERROR('The Document Has Already been Posted');

          // IF Status<>Status::Released    THEN
             // ERROR('The Document Has not yet been Approved');


            //TESTFIELD(StoreHeader."Issuing Store");
            StoresReqLine.RESET;
            StoresReqLine.SETRANGE(StoresReqLine."Requistion No",No);
            //TESTFIELD(StoreHeader."Issuing Store");
            IF StoresReqLine.FIND('-') THEN BEGIN
                     GenJnline.RESET;
                     GenJnline.SETRANGE(GenJnline."Journal Template Name",InventorySetup."Item Jnl Template");
                     GenJnline.SETRANGE(GenJnline."Journal Batch Name",InventorySetup."Item Jnl Batch");
                     IF GenJnline.FIND('-') THEN GenJnline.DELETEALL;
                     END;
            REPEAT
                    // InventorySetup.TESTFIELD(InventorySetup."Item Jnl Template");
                    // InventorySetup.TESTFIELD(InventorySetup."Item Jnl Batch");

            //Issue
              IF InventorySetup.GET THEN BEGIN
                     LineNo:=LineNo+1000;
                     GenJnline.INIT;
                     GenJnline."Journal Template Name":=InventorySetup."Item Jnl Template";
                     GenJnline."Journal Batch Name":=InventorySetup."Item Jnl Batch";
                     GenJnline."Line No.":=LineNo;
                     GenJnline."Entry Type":=GenJnline."Entry Type"::"Negative Adjmt.";
                     GenJnline."Document No.":=No;
                     GenJnline."Item No.":=StoresReqLine."No.";
                     GenJnline.VALIDATE("Item No.");
                     GenJnline."Location Code":=StoreHeader."Issuing Store";
                     GenJnline.VALIDATE("Location Code");
                     GenJnline."Posting Date":=StoreHeader."Request date";
                     GenJnline.Description:=StoresReqLine.Description;
                     GenJnline.Quantity:=StoresReqLine.Quantity;
                     GenJnline."Shortcut Dimension 1 Code":=StoreHeader."Global Dimension 1 Code";
                     GenJnline.VALIDATE("Shortcut Dimension 1 Code");
                     GenJnline."Shortcut Dimension 2 Code":=StoreHeader."Shortcut Dimension 2 Code";
                     GenJnline.VALIDATE("Shortcut Dimension 2 Code");
                     GenJnline.ValidateShortcutDimCode(3,StoreHeader."Shortcut Dimension 3 Code");
                     GenJnline.ValidateShortcutDimCode(4,StoreHeader."Shortcut Dimension 4 Code");
                     GenJnline.VALIDATE(Quantity);
                     GenJnline.VALIDATE("Unit Amount");
                     GenJnline."Reason Code":='221';
                     //GenJnline.VALIDATE("Reason Code");

                     GenJnline.INSERT(TRUE);

                     StoresReqLine."Request Status":=StoresReqLine."Request Status"::Closed;

                  END;
           UNTIL StoresReqLine. NEXT=0;
                    //Post Entries
                    GenJnline.RESET;
                    GenJnline.SETRANGE(GenJnline."Journal Template Name",InventorySetup."Item Jnl Template");
                    GenJnline.SETRANGE(GenJnline."Journal Batch Name",InventorySetup."Item Jnl Batch");
                    CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post",GenJnline);
                    //End Post entries

                  //Modify All
                  Post:=TRUE;
                 // Post:=JournlPosted.PostedSuccessfully();
                  IF Post THEN
                        StoresReqLine.MODIFYALL(StoresReqLine."Request Status",StoresReqLine."Request Status"::Closed);
           //END;
        Post:=TRUE;
        StoreHeader.Status:=StoreHeader.Status::Posted;
        StoreHeader.MODIFY;
        END;

        */

    end;


    procedure InsertDocumentDimensions("Table ID": Integer; "Document Type": Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"," ","Cash Sale"; "Document No.": Code[20]; "Line No.": Integer; "Dimension Code": Code[20]; "Dimension Value Code": Code[20])
    var
        DocumentDimension: Record "IC Document Dimension";
    begin
        DocumentDimension.Reset();

        DocumentDimension.SetRange(DocumentDimension."Table ID", "Table ID");
        //DocumentDimension.SETRANGE(DocumentDimension."Document Type","Document Type" );
        //DocumentDimension.SETRANGE(DocumentDimension."Document No.","Document No." );
        DocumentDimension.SetRange(DocumentDimension."Line No.", "Line No.");
        DocumentDimension.SetRange(DocumentDimension."Dimension Code", "Dimension Code");
        //DocumentDimension.SETRANGE(DocumentDimension."Dimension Value Code","Dimension Value Code" );

        if (DocumentDimension.Find('-')) then
            DocumentDimension.Delete();

        DocumentDimension.Reset();
        DocumentDimension.Init();
        DocumentDimension."Table ID" := "Table ID";
        //DocumentDimension."Document Type":="Document Type";
        //DocumentDimension."Document No.":="Document No.";
        DocumentDimension."Line No." := "Line No.";
        DocumentDimension."Dimension Code" := "Dimension Code";
        DocumentDimension."Dimension Value Code" := "Dimension Value Code";
        DocumentDimension.Insert(true);
    end;


    procedure SendForApproval(PRF_Number: Code[20])
    begin
        PRFHeader.Reset();
        PRFHeader.SetRange(PRFHeader."No.", PRF_Number);
        if (PRFHeader.Find('-')) then
            repeat

            //appMngt.SendPurchaseApprovalRequest(PRFHeader);
            /*ApprovalEntry.INIT;
            ApprovalEntry.RESET;

            ApprovalEntry.SETRANGE(ApprovalEntry."Document No.",PRF_Number);
            IF(PRFHeader.FIND('-'))THEN
            BEGIN
            ApprovalEntry."Sender ID":=PRFHeader."USER ID";
            ApprovalEntry.MODIFY(TRUE);
            END*/


            until PRFHeader.Next() = 0;

    end;


    procedure SendStoreReqForApproval(STR_Doc_No: Code[20])
    begin

        StoresReqHeader.Reset();
        StoresReqHeader.SetRange(StoresReqHeader."No.", STR_Doc_No);
        if (StoresReqHeader.Find('-')) then;

        ////appMngt.SendSRequestApprovalRequest(StoresReqHeader);
        //UNTIL StoresReqHeader.NEXT=0;
    end;


    procedure CancelStoresApprovalReq(STR_Doc_No: Code[20])
    begin

        StoresReqHeader.Reset();
        StoresReqHeader.SetRange(StoresReqHeader."No.", STR_Doc_No);
        if (StoresReqHeader.Find('-')) then
            repeat

            ////  appMngt.CancelSRRequestApprovalRequest(StoresReqHeader,TRUE,TRUE)

            until StoresReqHeader.Next() = 0;
    end;


    procedure DocumentHeader("Document Type": Enum "Purchase Document Type"; "Buy from Vendor No": Code[20]; "Pay to Vendor No": Code[20]; No: Code[20]; "Posting Description": Text[50]; "Responsibility Center": Code[20]; "Shortcut Dimension 1 Code": Code[20]; "Shortcut Dimension 2 Code": Code[20]; "Location code": Code[20]; "Order Date": Date; "Document Date": Date; "Requested Receipt Date": Date; "Expected Receipt Date": Date; "User ID": Code[20]; "Requestor User ID": Code[20]; DocApprovalType: Option Purchase,Requisition,Quote,Request; TransactionType: Option New,Modify,Delete,Cancel; "Requested By": Text[50]) PRF_No: Code[20]
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        PurchaseHeader.Init();
        case TransactionType of
            TransactionType::New:
                begin
                    PurchaseHeader."Document Type" := "Document Type";
                    PurchaseHeader.DocApprovalType := DocApprovalType;
                    PurchaseHeader."Assigned User ID" := "User ID";

                    PurchaseHeader."Order Date" := "Order Date";
                    PurchaseHeader."Posting Date" := "Document Date";
                    PurchaseHeader."Requested Receipt Date" := "Document Date";
                    PurchaseHeader."Assigned User ID" := "User ID";
                    //PurchaseHeader."Requested by":="Requested By";
                    PurchaseHeader.Insert(true);

                    PRF_No := PurchaseHeader."No.";
                end;

            TransactionType::Modify:
                begin
                    PurchaseHeader.Reset();

                    PurchaseHeader.SetRange(PurchaseHeader."No.", No);
                    PurchaseHeader.SetRange(PurchaseHeader."Document Type", "Document Type");
                    PurchaseHeader.SetRange(PurchaseHeader.DocApprovalType, DocApprovalType);

                    if PurchaseHeader.Find('-') then begin
                        if (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order) then begin
                            PurchaseHeader."Buy-from Vendor No." := "Buy from Vendor No";
                            PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");

                            PurchaseHeader."Pay-to Vendor No." := "Pay to Vendor No";
                            PurchaseHeader.Validate(PurchaseHeader."Pay-to Vendor No.");
                        end
                        else
                            if (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Quote) then begin
                                PurchaseHeader."Buy-from Vendor No." := "Buy from Vendor No";
                                PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");

                                PurchaseHeader."Pay-to Vendor No." := "Pay to Vendor No";
                                PurchaseHeader.Validate(PurchaseHeader."Pay-to Vendor No.");
                            end;

                        PurchaseHeader."Order Date" := "Order Date";

                        PurchaseHeader."Expected Receipt Date" := "Expected Receipt Date";
                        PurchaseHeader.Validate(PurchaseHeader."Expected Receipt Date");

                        PurchaseHeader."Requested Receipt Date" := "Requested Receipt Date";
                        PurchaseHeader.Validate(PurchaseHeader."Requested Receipt Date");

                        PurchaseHeader."Responsibility Center" := "Responsibility Center";
                        PurchaseHeader.Validate(PurchaseHeader."Responsibility Center");

                        PurchaseHeader."Location Code" := "Location code";
                        PurchaseHeader.Validate(PurchaseHeader."Location Code");

                        PurchaseHeader."Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
                        //PurchaseHeader.VALIDATE(PurchaseHeader."Shortcut Dimension 1 Code");

                        PurchaseHeader."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                        //PurchaseHeader.VALIDATE(PurchaseHeader."Shortcut Dimension 2 Code");

                        PurchaseHeader.Modify();

                    end;
                end;

            TransactionType::Cancel:
                begin
                    PurchaseHeader.Reset();

                    PurchaseHeader.SetRange(PurchaseHeader."No.", No);
                    PurchaseHeader.SetRange(PurchaseHeader."Document Type", "Document Type");
                    PurchaseHeader.SetRange(PurchaseHeader.DocApprovalType, DocApprovalType);

                    if PurchaseHeader.Find('-') then;
                    //appMngt.CancelPurchaseApprovalRequest(PurchaseHeader,true,true);


                end;

        end;
    end;


    procedure HRAppraisalHeaderInsert("Appraisal Type": Code[20]; "Appraisal Period": Code[20]; Status: Integer; AppraisalStage: Integer; UserID: Code[100]; EmployeeNo: Code[30]; EmployeeName: Text[60]; AppraisalMethod: Integer; SupervisorNo: Code[30]; SupervisorID: Code[20]) HRAppraisalDocNo: Code[20]
    begin
        /*

        BEGIN

          HRAppraisalCard.INIT;
          HRAppraisalCard."Appraisal Type":="Appraisal Type";
          HRAppraisalCard."Appraisal Period":="Appraisal Period";
          HRAppraisalCard.Status:=Status;
          HRAppraisalCard."Appraisal Stage":=AppraisalStage;
          HRAppraisalCard."User ID":=UserID;
          HRAppraisalCard."Employee No":=EmployeeNo;
          HRAppraisalCard."Employee Name":=EmployeeName;
          HRAppraisalCard."Appraisal Method":=AppraisalMethod;
          HRAppraisalCard.Supervisor:=SupervisorNo;
          HRAppraisalCard."Supervisor ID":=SupervisorID;

          HRAppraisalCard.INSERT(TRUE);
          HRAppraisalDocNo:=HRAppraisalCard."Appraisal No";

        END

        */

    end;


    procedure GeneratePayslipReport(EmployeeNo: Code[20]; Period: Date; filenameFromApp: Text[50]) filename: Text[150]
    var
        "Employee Card": Record "HR Employees";
        PRSalaryCard: Record "PR Salary Card";
    begin
        /*
       BEGIN
         "Employee Card".INIT;
         "Employee Card".SETRANGE(prSalaryCard."Employee Code",EmployeeNo);
         "Employee Card".SETRANGE(prSalaryCard."Period Filter",joinedDate);


           //Display payslip report
           //SalCard.SETRANGE("Employee Code","No.");
           //SalCard.SETRANGE(SalCard."Period Filter",SelectedPeriod);
           //REPORT.RUN(39005600,TRUE,FALSE,SalCard);

          filename := 'C:\inetpub\PdfDocs';
          filename += FORMAT(CREATEGUID);
          filename := DELCHR(filename, '=', '{-}');
          filename += '.pdf';

          REPORT.RUN(39005514,TRUE,FALSE,prSalaryCard);
          REPORT.SAVEASPDF(39005514,filename);

          EXIT(filename);

       END

        */

        begin
            filename := FILESPATH + filenameFromApp + '.pdf';
            if Exists(filename) then
                Erase(filename);

            "Employee Card".SetRange("Employee Card"."No.", EmployeeNo);
            "Employee Card".SetRange("Employee Card"."Current Month Filter", Period);
            if "Employee Card".Find('-') then
                Report.SaveAsPdf(Report::prPaySlip2, filename, "Employee Card");


            exit(filename);
        end;

    end;


    procedure ApplicantProfileInsert(IdNo: Text[50]; Email: Text[50]; FirstName: Text[50]; MiddleName: Text[50]; LastName: Text[50]) InsertSuccess: Boolean
    begin
        /*
        BEGIN

          InsertSuccess:=FALSE;

          ApplicantProfile.RESET;
          ApplicantProfile.SETRANGE(ApplicantProfile.IdNo, IdNo);
            IF ApplicantProfile.FIND('-')
              THEN

                  BEGIN
                  InsertSuccess:=TRUE;
                  EXIT(InsertSuccess);
                  END

              ELSE

            BEGIN

                ApplicantProfile.INIT;
                ApplicantProfile.IdNo:=IdNo;
                ApplicantProfile.Email:=Email;
                ApplicantProfile.FirstName:=FirstName;
                ApplicantProfile.MiddleName:=MiddleName;
                ApplicantProfile.LastName:=LastName;

                ApplicantProfile.INSERT(TRUE);

                InsertSuccess:=TRUE;

          END

         END
        */

    end;


    procedure HRTransportAppInsert(DaysApplied: Decimal; StartDate: Date; ReturnDate: Date; ApplicationDate: Date; Status: Integer; FromDestination: Text[150]; ToDestination: Text[150]; PurposeOfTrip: Text[150]; Names: Text[150]; ReturnFrom: Text[150]; ReturnTo: Text[150]; pickupTimeTrip: Time; pickupTimeReturn: Time; EmployeeNo: Code[20]) TransportReqNo: Code[50]
    begin

        begin
            HRTransportReq.Init();
            HRTransportReq."Days Applied" := DaysApplied;
            HRTransportReq."Start Date" := StartDate;
            HRTransportReq."Return Date" := ReturnDate;
            HRTransportReq."Application Date" := ApplicationDate;
            HRTransportReq.Status := Status;
            HRTransportReq."Trip From Destination" := FromDestination;
            HRTransportReq."Trip To Destination" := ToDestination;
            HRTransportReq."Purpose of Trip" := PurposeOfTrip;
            HRTransportReq.Names := Names;
            HRTransportReq."Trip Return Pickup From" := ReturnFrom;
            HRTransportReq."Trip Return Destination" := ReturnTo;
            HRTransportReq."Time of Trip" := pickupTimeTrip;
            HRTransportReq."Time of Return" := pickupTimeReturn;
            HRTransportReq."Employee No" := EmployeeNo;

            HRTransportReq.Insert(true);
            TransportReqNo := HRTransportReq."Transport Request No";

        end
    end;


    procedure SubmitTransportRequestForApproval(ApplicationNo: Code[10]; UserID: Text)
    begin

        HRTransportReq.SetRange(HRTransportReq."Transport Request No", ApplicationNo);
        if HRTransportReq.Find('-') then;

        //ApprovalMgt.SendTransportReqApprovalReq(HRTransportReq);
    end;


    procedure StaffClaimsHeaderInsert() StaffClaimNo: Code[20]
    begin
        ;

    end;


    procedure PurchaseComments(DocType: Option; DocNo: Code[20]; UserId: Code[10]; Comment: Text[80])
    var
        PurchComment: Record "Purch. Comment Line";
        LineNo: Integer;
    begin

        PurchComment.Reset();
        PurchComment.SetRange(PurchComment."Document Type", DocType);
        PurchComment.SetRange(PurchComment."No.", DocNo);
        if PurchComment.FindLast() then
            LineNo := PurchComment."Line No."
        else
            LineNo := 0;

        PurchComment.Init();
        PurchComment."Document Type" := DocType;
        PurchComment."No." := DocNo;
        PurchComment.Date := Today;
        PurchComment.Code := UserId;
        PurchComment.Comment := Comment;
        PurchComment."Line No." := LineNo + 10000;
        PurchComment.Insert(true);
    end;


    procedure UploadDocumentPRF(DocumentNo: Code[20]; URL1: Text[250]; Descriprion: Text[250]; UserID: Code[20]; Company: Text[250]) LinkID: Integer
    var
        RecordLink: Record "Record Link";
    begin

        PRFHeader.Reset();
        PRFHeader.SetRange(PRFHeader."No.", DocumentNo);

        if (PRFHeader.Find('-')) then begin
            RecordLink.Init();
            //RecordLink."Record ID":=PRFHeader.MyRecId; //include this field 'MyRecId' in Purchase Header first
            RecordLink.URL1 := URL1;
            RecordLink.Description := Descriprion;
            RecordLink."User ID" := UserID;
            RecordLink.Company := Company;
            RecordLink.Created := CurrentDateTime;

            RecordLink.Insert(true);

            LinkID := RecordLink."Link ID";

        end;
    end;


    procedure DelegateDocuments("Table ID": Integer; "Document Type": Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,JV; "Document No.": Code[10]; "Approval Code": Code[20]; "Approver ID": Code[20]; Comments: Text[250]) ans: Text[250]
    begin
        ApprovalEntry.Reset();
        //ApprovalEntry.SETRANGE(ApprovalEntry."Table ID","Table ID");
        //ApprovalEntry.SETRANGE(ApprovalEntry."Document Type","Document Type"  );
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", "Document No.");
        //ApprovalEntry.SETRANGE(ApprovalEntry."Approver ID","Approver ID" );

        if (ApprovalEntry.Find('-')) then
            repeat
                appMngt.DelegateApprovalRequests(ApprovalEntry);

            /*
            //insert comments
            IF(Comments<>'')THEN BEGIN
              ApprovalCommentLine."Table ID":="Table ID";
              ApprovalCommentLine."Document Type":="Document Type";
              ApprovalCommentLine."Document No.":="Document No.";
              ApprovalCommentLine."User ID":="Approver ID";
              ApprovalCommentLine."Date and Time":=CURRENTDATETIME;
              ApprovalCommentLine.Comment:=Comments;

              ApprovalCommentLine.INSERT(TRUE);

            END;
            */
            until ApprovalEntry.Next() = 0;

    end;


    procedure DocumentLines("Document Type": Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"; "Document No": Code[20]; "PRF No": Code[20]; "Line No": Integer; Type: Option " ","G/L Account",Item,,"Fixed Asset","Charge (Item)"; No: Code[20]; "Location Code": Code[20]; "Requested Receipt Date": Date; "Expected Receipt Date": Date; Description: Text[250]; Description2: Text[250]; Quantity: Decimal; "Direct Unit Cost": Decimal; TransactionType: Option New,Modify,Delete; "Expense Code": Code[20])
    var
        PurchaseLine: Record "Purchase Line";
        OrderLineDesc: Text[50];
        StrLength: Integer;
        Length: Integer;
        TestDesc: Text[250];
    begin
        PurchaseLine.Init();

        case TransactionType of
            TransactionType::New:
                begin

                    PurchaseLine.Reset();

                    PurchaseLine.SetRange(PurchaseLine."Document Type", "Document Type");
                    PurchaseLine.SetRange(PurchaseLine."Document No.", "Document No");
                    PurchaseLine.SetRange(PurchaseLine.Type, Type);
                    PurchaseLine.SetRange(PurchaseLine."Line No.", "Line No");

                    if PurchaseLine.Find('-') then begin

                        // PurchaseLine."Expense Code":="Expense Code";
                        // PurchaseLine.VALIDATE(PurchaseLine."Expense Code");

                        PurchaseLine."No." := No;
                        PurchaseLine.Validate(PurchaseLine."No.");

                        PurchaseLine."Location Code" := "Location Code";
                        // PurchaseLine.VALIDATE(PurchaseLine."Location Code");

                        PurchaseLine."Expected Receipt Date" := "Expected Receipt Date";
                        // PurchaseLine.VALIDATE(PurchaseLine."Expected Receipt Date");

                        PurchaseLine.Description := Description;
                        //PurchaseLine.Specifications:=Description2;
                        PurchaseLine."Shortcut Dimension 2 Code" := "Expense Code";
                        PurchaseLine.Quantity := Quantity;
                        //PurchaseLine.VALIDATE(PurchaseLine.Quantity);

                        PurchaseLine."Direct Unit Cost" := "Direct Unit Cost";
                        PurchaseLine.Validate(PurchaseLine."Direct Unit Cost");

                        PurchaseLine.Modify();
                    end
                    else begin


                        PurchaseLine."Document No." := "Document No";
                        //PurchaseLine.VALIDATE(PurchaseLine."Document No.");

                        PurchaseLine."Document Type" := "Document Type";
                        //PurchaseLine.VALIDATE(PurchaseLine."Document Type");

                        //      PurchaseLine."Expense Code":="Expense Code";
                        //PurchaseLine.VALIDATE(PurchaseLine."Expense Code");

                        PurchaseLine.Type := Type;
                        //PurchaseLine.VALIDATE(PurchaseLine.Type);

                        PurchaseLine."No." := No;
                        PurchaseLine.Validate(PurchaseLine."No.");


                        PurchaseLine."Line No." := "Line No";
                        //PurchaseLine.VALIDATE(PurchaseLine."Line No.");

                        PurchaseLine."Location Code" := "Location Code";
                        //PurchaseLine.VALIDATE(PurchaseLine."Location Code");
                        PurchaseLine."Shortcut Dimension 2 Code" := "Expense Code";

                        PurchaseLine."Expected Receipt Date" := "Expected Receipt Date";
                        //PurchaseLine.VALIDATE(PurchaseLine."Expected Receipt Date");

                        Length := (StrLen(Description2) - 50);
                        // PurchaseLine."Description 2":=DELSTR(Description2,51,250);
                        //PurchaseLine.Specifications:=Description2;

                        PurchaseLine.Quantity := Quantity;
                        PurchaseLine.Validate(PurchaseLine.Quantity);

                        PurchaseLine."Direct Unit Cost" := "Direct Unit Cost";
                        PurchaseLine.Validate(PurchaseLine."Direct Unit Cost");

                        //PurchaseLine."PRF No.":="PRF No";
                        //PurchaseLine.VALIDATE(PurchaseLine."PRF No.");

                        PurchaseLine.Insert(true);
                    end;

                    //changes to incorporate multiple lines for long descriptions
                    if StrLen(Description2) > 50 then begin
                        Length := (StrLen(Description2));
                        StrLength := 51;
                        "Line No" := "Line No" + 10000;
                        //MESSAGE('start');
                        repeat
                            PurchaseLine.Init();
                            PurchaseLine."Document No." := "Document No";
                            PurchaseLine."Document Type" := "Document Type";
                            PurchaseLine.Type := PurchaseLine.Type::" ";
                            PurchaseLine."Line No." := "Line No";
                            TestDesc := DelStr(Description2, 1, StrLength);
                            TestDesc := DelStr(TestDesc, 51);
                            //    MESSAGE(TestDesc);
                            //PurchaseLine.Specifications:=TestDesc;
                            PurchaseLine.Insert(true);
                            StrLength := StrLength + 50;
                            "Line No" := "Line No" + 10000
                        until StrLength >= Length;

                    end
                    //end of changes

                end;

            TransactionType::Modify:
                begin
                    PurchaseLine.Reset();

                    PurchaseLine.SetRange(PurchaseLine."Document Type", "Document Type");
                    PurchaseLine.SetRange(PurchaseLine."Document No.", "Document No");
                    PurchaseLine.SetRange(PurchaseLine.Type, Type);
                    PurchaseLine.SetRange(PurchaseLine."Line No.", "Line No");

                    if PurchaseLine.Find('-') then begin

                        // PurchaseLine."Expense Code":="Expense Code";
                        // PurchaseLine.VALIDATE(PurchaseLine."Expense Code");

                        PurchaseLine."No." := No;
                        PurchaseLine.Validate(PurchaseLine."No.");

                        PurchaseLine."Location Code" := "Location Code";
                        // PurchaseLine.VALIDATE(PurchaseLine."Location Code");

                        PurchaseLine."Expected Receipt Date" := "Expected Receipt Date";
                        // PurchaseLine.VALIDATE(PurchaseLine."Expected Receipt Date");

                        PurchaseLine.Description := Description;
                        //PurchaseLine.Specifications:=Description2;
                        PurchaseLine."Shortcut Dimension 2 Code" := "Expense Code";
                        PurchaseLine.Quantity := Quantity;
                        //PurchaseLine.VALIDATE(PurchaseLine.Quantity);

                        PurchaseLine."Direct Unit Cost" := "Direct Unit Cost";
                        PurchaseLine.Validate(PurchaseLine."Direct Unit Cost");

                        PurchaseLine.Modify();
                    end;
                end;

            TransactionType::Delete:
                begin
                    PurchaseLine.Reset();

                    PurchaseLine.SetRange(PurchaseLine."Document Type", "Document Type");
                    PurchaseLine.SetRange(PurchaseLine."Document No.", "Document No");
                    //PurchaseLine.SETRANGE(PurchaseLine.Type,Type);
                    PurchaseLine.SetRange(PurchaseLine."Line No.", "Line No");

                    if PurchaseLine.Find('-') then
                        //not working with Document Dimensions at the moment
                        /*
                        DocDim.RESET;
                        DocDim.SETRANGE(DocDim."Table ID",39);
                        DocDim.SETRANGE(DocDim."Document Type","Document Type");
                        DocDim.SETRANGE(DocDim."Document No.","Document No");
                        DocDim.SETRANGE(DocDim."Line No.","Line No");
                        DocDim.DELETEALL;
                        */
                        PurchaseLine.Delete(true);

                end;

        end;

    end;


    procedure Staff_Advance_Header(Cashier: Code[50]; OnBehalfOf: Text[100]; ResponsibilityCenter: Code[20]; GlobalDimension1Code: Code[20]; AccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner"; AccountNo: Code[20]; Payee: Text[100]; Purpose: Text[250]; TransactionType: Option New,Modify,Delete,Cancel; DocumentNo: Code[20]) StaffAdvDocNo: Code[20]
    begin
        /*
        Staff_Advance.INIT;
        CASE TransactionType OF
          TransactionType::New: BEGIN


              Staff_Advance.Cashier:=Cashier;
              Staff_Advance."On Behalf Of":=OnBehalfOf;
              Staff_Advance."Responsibility Center":=ResponsibilityCenter;
              Staff_Advance."Global Dimension 1 Code":=GlobalDimension1Code;
              Staff_Advance."Account Type":=AccountType;
              Staff_Advance."Account No.":=AccountNo;
              Staff_Advance.Payee:=Payee;
              Staff_Advance.Purpose:=Purpose;

              Staff_Advance.INSERT(TRUE);
              StaffAdvDocNo:=Staff_Advance."No.";

            END;

          TransactionType::Modify: BEGIN

              Staff_Advance.RESET;
              Staff_Advance.SETRANGE(Staff_Advance."No.",DocumentNo);

              IF Staff_Advance.FIND('-') THEN BEGIN

                  Staff_Advance.Cashier:=Cashier;
                  Staff_Advance."On Behalf Of":=OnBehalfOf;
                  Staff_Advance."Responsibility Center":=ResponsibilityCenter;
                  Staff_Advance."Global Dimension 1 Code":=GlobalDimension1Code;
                  Staff_Advance."Account Type":=AccountType;
                  Staff_Advance."Account No.":=AccountNo;
                  Staff_Advance.Payee:=Payee;
                  Staff_Advance.Purpose:=Purpose;

                  Staff_Advance.MODIFY;

                END;
          END;
        END;

        */

    end;


    procedure Staff_Advance_Lines(DocNo: Code[20]; AccountNo: Code[10]; AccountName: Text[50]; Amount: Decimal; AdvanceHolder: Code[20]; ProgramCode: Code[20]; AdvanceType: Code[20]; TransactionType: Option New,Modify,Delete,Cancel; LineNo: Integer)
    begin
        /*

        Staff_Advance_Line.INIT;

        CASE TransactionType OF
          TransactionType::New: BEGIN

            Staff_Advance_Line.RESET;

             Staff_Advance_Line.No := DocNo;
             Staff_Advance_Line."Account No:" := AccountNo;
             Staff_Advance_Line."Account Name" := AccountName;
             Staff_Advance_Line.Amount := Amount;
             Staff_Advance_Line."Advance Holder" := AdvanceHolder;
             Staff_Advance_Line."Global Dimension 1 Code" := ProgramCode;
             Staff_Advance_Line."Advance Type" := AdvanceType;

            Staff_Advance_Line.INSERT(TRUE);

          END;

          TransactionType::Modify: BEGIN

            Staff_Advance_Line.RESET;
            Staff_Advance_Line.SETRANGE(Staff_Advance_Line.No,DocNo);
            Staff_Advance_Line.SETRANGE(Staff_Advance_Line."Line No.",LineNo);

            //check if Line already exists, thus modification required and not insert
            IF Staff_Advance_Line.FIND('-') THEN BEGIN

                Staff_Advance_Line.No := DocNo;
                Staff_Advance_Line."Account No:" := AccountNo;
                Staff_Advance_Line."Account Name" := AccountName;
                Staff_Advance_Line.Amount := Amount;
                Staff_Advance_Line."Advance Holder" := AdvanceHolder;
                Staff_Advance_Line."Global Dimension 1 Code" := ProgramCode;
                Staff_Advance_Line."Advance Type" := AdvanceType;

                Staff_Advance_Line.MODIFY;

            END

            ELSE
            //Line does not exist, thus insert required and not modification

            BEGIN

             Staff_Advance_Line.RESET;

             Staff_Advance_Line.No := DocNo;
             Staff_Advance_Line."Account No:" := AccountNo;
             Staff_Advance_Line."Account Name" := AccountName;
             Staff_Advance_Line.Amount := Amount;
             Staff_Advance_Line."Advance Holder" := AdvanceHolder;
             Staff_Advance_Line."Global Dimension 1 Code" := ProgramCode;
             Staff_Advance_Line."Advance Type" := AdvanceType;

            Staff_Advance_Line.INSERT(TRUE);

            END

          END;

          TransactionType::Cancel: BEGIN

            Staff_Advance_Line.RESET;

            Staff_Advance_Line.SETRANGE(Staff_Advance_Line.No,DocNo);
            Staff_Advance_Line.SETRANGE(Staff_Advance_Line."Line No.",LineNo);

            IF Staff_Advance_Line.FIND('-') THEN BEGIN

                Staff_Advance_Line.DELETE(TRUE);

             END

          END;
        END;

        */

    end;


    procedure Approval_Staff_Advance(Staff_Advance_No: Code[10])
    begin

        /*
        Staff_Advance.RESET;
        Staff_Advance.SETRANGE(Staff_Advance."No.",Staff_Advance_No);
        IF(Staff_Advance.FIND('-')) THEN
          BEGIN

          appMngt.SendAdvanceApprovalRequest(Staff_Advance);

          END;

        */

    end;


    procedure Imprest_Header(Cashier: Code[50]; OnBehalfOf: Text[100]; ResponsibilityCenter: Code[20]; GlobalDimension1Code: Code[20]; AccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner"; AccountNo: Code[20]; Payee: Text[100]; Purpose: Text[250]; TransactionType: Option New,Modify,Delete,Cancel; DocumentNo: Code[20]) ImprestNo: Code[20]
    begin
        /*
        Imprest_Doc_Header.INIT;
        CASE TransactionType OF
          TransactionType::New: BEGIN

               Imprest_Doc_Header.Cashier:=Cashier;
               Imprest_Doc_Header."On Behalf Of":=OnBehalfOf;
               Imprest_Doc_Header."Responsibility Center":=ResponsibilityCenter;
               Imprest_Doc_Header."Global Dimension 1 Code":=GlobalDimension1Code;
               Imprest_Doc_Header."Account Type":=AccountType;
               Imprest_Doc_Header."Account No.":=AccountNo;
               Imprest_Doc_Header.Payee:=Payee;
               Imprest_Doc_Header.Purpose:=Purpose;

               Imprest_Doc_Header.INSERT(TRUE);
               ImprestNo:=Imprest_Doc_Header."No.";

          END;


          TransactionType::Modify: BEGIN

              Imprest_Doc_Header.RESET;
              Imprest_Doc_Header.SETRANGE(Imprest_Doc_Header."No.",DocumentNo);

              IF Imprest_Doc_Header.FIND('-') THEN BEGIN

               Imprest_Doc_Header.Cashier:=Cashier;
               Imprest_Doc_Header."On Behalf Of":=OnBehalfOf;
               Imprest_Doc_Header."Responsibility Center":=ResponsibilityCenter;
               Imprest_Doc_Header."Global Dimension 1 Code":=GlobalDimension1Code;
               Imprest_Doc_Header."Account Type":=AccountType;
               Imprest_Doc_Header."Account No.":=AccountNo;
               Imprest_Doc_Header.Payee:=Payee;
               Imprest_Doc_Header.Purpose:=Purpose;

               Imprest_Doc_Header.MODIFY;

               END;

          END;

        END;

        */

    end;


    procedure Imprest_Lines(DocNo: Code[20]; AccountNo: Code[10]; AccountName: Text[50]; Amount: Decimal; AdvanceHolder: Code[20]; ProgramCode: Code[20]; AdvanceType: Code[20]; TransactionType: Option New,Modify,Delete,Cancel; LineNo: Integer; NoOfDays: Decimal; DestinatiomCode: Code[20])
    begin
        /*
        Imprest_Doc_Line.INIT;

        CASE TransactionType OF
          TransactionType::New: BEGIN

            Imprest_Doc_Line.RESET;

             Imprest_Doc_Line.No := DocNo;
             Imprest_Doc_Line."Account No:" := AccountNo;
             Imprest_Doc_Line."Account Name" := AccountName;
             Imprest_Doc_Line.Amount := Amount;
             Imprest_Doc_Line."Global Dimension 1 Code" := ProgramCode;
             Imprest_Doc_Line."Advance Type" := AdvanceType;
             Imprest_Doc_Line."No of Days":=NoOfDays;
             Imprest_Doc_Line."Destination Code":=DestinatiomCode;

             Imprest_Doc_Line.INSERT(TRUE);

          END;

          TransactionType::Modify: BEGIN

            Imprest_Doc_Line.RESET;
            Imprest_Doc_Line.SETRANGE(Imprest_Doc_Line.No,DocNo);
            Imprest_Doc_Line.SETRANGE(Imprest_Doc_Line."Line No.",LineNo);

            //check if Line already exists, thus modification required and not insert
            IF Imprest_Doc_Line.FIND('-') THEN BEGIN

                Imprest_Doc_Line.No := DocNo;
                Imprest_Doc_Line."Account No:" := AccountNo;
                Imprest_Doc_Line."Account Name" := AccountName;
                Imprest_Doc_Line.Amount := Amount;
                Imprest_Doc_Line."Global Dimension 1 Code" := ProgramCode;
                Imprest_Doc_Line."Advance Type" := AdvanceType;
                Imprest_Doc_Line."No of Days":=NoOfDays;
                Imprest_Doc_Line."Destination Code":=DestinatiomCode;


                Imprest_Doc_Line.MODIFY;

            END

            ELSE
            //Line does not exist, thus insert required and not modification

            BEGIN

             Imprest_Doc_Line.RESET;

             Imprest_Doc_Line.No := DocNo;
             Imprest_Doc_Line."Account No:" := AccountNo;
             Imprest_Doc_Line."Account Name" := AccountName;
             Imprest_Doc_Line.Amount := Amount;
             Imprest_Doc_Line."Global Dimension 1 Code" := ProgramCode;
             Imprest_Doc_Line."Advance Type" := AdvanceType;
             Imprest_Doc_Line."No of Days":=NoOfDays;
             Imprest_Doc_Line."Destination Code":=DestinatiomCode;


             Imprest_Doc_Line.INSERT(TRUE);

            END

          END;

          TransactionType::Cancel: BEGIN

            Imprest_Doc_Line.RESET;

            Imprest_Doc_Line.SETRANGE(Imprest_Doc_Line.No,DocNo);
            Imprest_Doc_Line.SETRANGE(Imprest_Doc_Line."Line No.",LineNo);

            IF Imprest_Doc_Line.FIND('-') THEN BEGIN

                Imprest_Doc_Line.DELETE(TRUE);

             END

          END;
        END;

        */

    end;


    procedure Approval_Staff_Imprest(ImprestNo: Code[20])
    begin
        /*

        Imprest_Doc_Header.RESET;
        Imprest_Doc_Header.SETRANGE(Imprest_Doc_Header."No.",ImprestNo);
        IF(Imprest_Doc_Header.FIND('-')) THEN
          BEGIN

          appMngt.SendImprestApprovalRequest(Imprest_Doc_Header);

          END;
        */

    end;


    procedure CancelImprestApprovalReq(ImprestNo: Code[20])
    begin
        /*
        Imprest_Doc_Header.RESET;
        Imprest_Doc_Header.SETRANGE(Imprest_Doc_Header."No.",ImprestNo);
        IF(Imprest_Doc_Header.FIND('-')) THEN
          BEGIN

            appMngt.CancelImprestApprovalRequest(Imprest_Doc_Header,FALSE,FALSE);

          END;
        */

    end;


    procedure Imprest_Surrender_Header(Cashier: Code[50]; OnBehalfOf: Text[100]; ResponsibilityCenter: Code[20]; GlobalDimension1Code: Code[20]; AccountType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner"; AccountNo: Code[20]; Payee: Text[100]; Purpose: Text[250]; TransactionType: Option New,Modify,Delete,Cancel; DocumentNo: Code[20]) ImprestNo: Code[20]
    begin
        /*
        Imprest_Surrender_Doc_Header.INIT;
        CASE TransactionType OF
          TransactionType::New: BEGIN

               Imprest_Surrender_Doc_Header.Cashier:=Cashier;
               Imprest_Surrender_Doc_Header."On Behalf Of":=OnBehalfOf;
               Imprest_Surrender_Doc_Header."Responsibility Center":=ResponsibilityCenter;
               Imprest_Surrender_Doc_Header."Global Dimension 1 Code":=GlobalDimension1Code;
               Imprest_Surrender_Doc_Header."Account Type":=AccountType;
               Imprest_Surrender_Doc_Header."Account No.":=AccountNo;
               Imprest_Surrender_Doc_Header.Payee:=Payee;

               Imprest_Surrender_Doc_Header.INSERT(TRUE);
               ImprestNo:=Imprest_Surrender_Doc_Header.No;

          END;


          TransactionType::Modify: BEGIN

              Imprest_Surrender_Doc_Header.RESET;
              Imprest_Surrender_Doc_Header.SETRANGE(Imprest_Surrender_Doc_Header.No,DocumentNo);

              IF Imprest_Surrender_Doc_Header.FIND('-') THEN BEGIN

               Imprest_Surrender_Doc_Header.Cashier:=Cashier;
               Imprest_Surrender_Doc_Header."On Behalf Of":=OnBehalfOf;
               Imprest_Surrender_Doc_Header."Responsibility Center":=ResponsibilityCenter;
               Imprest_Surrender_Doc_Header."Global Dimension 1 Code":=GlobalDimension1Code;
               Imprest_Surrender_Doc_Header."Account Type":=AccountType;
               Imprest_Surrender_Doc_Header."Account No.":=AccountNo;
               Imprest_Surrender_Doc_Header.Payee:=Payee;

               Imprest_Surrender_Doc_Header.MODIFY;

               END;

          END;

        END;

        */

    end;


    procedure Imprest_Surrender_Lines(DocNo: Code[20]; AccountNo: Code[10]; AccountName: Text[50]; Amount: Decimal; AdvanceHolder: Code[20]; ProgramCode: Code[20]; AdvanceType: Code[20]; TransactionType: Option New,Modify,Delete,Cancel; LineNo: Integer; actualSpent: Decimal; cashRecptNo: Code[50]; cashRecptAmount: Decimal)
    begin
        /*

        Imprest_Surrender_Doc_Line.INIT;

        CASE TransactionType OF
          TransactionType::New: BEGIN

            Imprest_Surrender_Doc_Line.RESET;

             Imprest_Surrender_Doc_Line."Surrender Doc No." := DocNo;
             Imprest_Surrender_Doc_Line."Account No:" := AccountNo;
             Imprest_Surrender_Doc_Line."Account Name" := AccountName;
             Imprest_Surrender_Doc_Line.Amount := Amount;
             Imprest_Surrender_Doc_Line."Shortcut Dimension 1 Code" := ProgramCode;
             Imprest_Surrender_Doc_Line."Actual Spent" := actualSpent;
             Imprest_Surrender_Doc_Line."Cash Receipt No":=cashRecptNo;
             Imprest_Surrender_Doc_Line."Cash Surrender Amt":=cashRecptAmount;

             Imprest_Surrender_Doc_Line.INSERT(TRUE);

          END;

          TransactionType::Modify: BEGIN

            Imprest_Surrender_Doc_Line.RESET;
            Imprest_Surrender_Doc_Line.SETRANGE(Imprest_Surrender_Doc_Line."Surrender Doc No.",DocNo);
            Imprest_Surrender_Doc_Line.SETRANGE(Imprest_Surrender_Doc_Line."Line No.",LineNo);

            //check if Line already exists, thus modification required and not insert
            IF Imprest_Surrender_Doc_Line.FIND('-') THEN BEGIN

                Imprest_Surrender_Doc_Line."Surrender Doc No." := DocNo;
                Imprest_Surrender_Doc_Line."Account No:" := AccountNo;
                Imprest_Surrender_Doc_Line."Account Name" := AccountName;
                Imprest_Surrender_Doc_Line.Amount := Amount;
                Imprest_Surrender_Doc_Line."Shortcut Dimension 1 Code" := ProgramCode;
                Imprest_Surrender_Doc_Line."Actual Spent" := actualSpent;
                Imprest_Surrender_Doc_Line."Cash Receipt No":=cashRecptNo;
                Imprest_Surrender_Doc_Line."Cash Surrender Amt":=cashRecptAmount;



                Imprest_Surrender_Doc_Line.MODIFY;

            END

            ELSE
            //Line does not exist, thus insert required and not modification

            BEGIN

             Imprest_Surrender_Doc_Line.RESET;

             Imprest_Surrender_Doc_Line."Surrender Doc No." := DocNo;
             Imprest_Surrender_Doc_Line."Account No:" := AccountNo;
             Imprest_Surrender_Doc_Line."Account Name" := AccountName;
             Imprest_Surrender_Doc_Line.Amount := Amount;
             Imprest_Surrender_Doc_Line."Shortcut Dimension 1 Code" := ProgramCode;
             Imprest_Surrender_Doc_Line."Actual Spent" := actualSpent;
             Imprest_Surrender_Doc_Line."Cash Receipt No":=cashRecptNo;
             Imprest_Surrender_Doc_Line."Cash Surrender Amt":=cashRecptAmount;


             Imprest_Surrender_Doc_Line.INSERT(TRUE);

            END

          END;

          TransactionType::Cancel: BEGIN

            Imprest_Surrender_Doc_Line.RESET;

            Imprest_Surrender_Doc_Line.SETRANGE(Imprest_Surrender_Doc_Line."Surrender Doc No.",DocNo);
            Imprest_Surrender_Doc_Line.SETRANGE(Imprest_Surrender_Doc_Line."Line No.",LineNo);

            IF Imprest_Surrender_Doc_Line.FIND('-') THEN BEGIN

                Imprest_Surrender_Doc_Line.DELETE(TRUE);

             END

          END;
        END;

        */

    end;


    procedure Approval_Staff_Imprest_Surrender(ImprestSurrenderNo: Code[20])
    begin

        /*

        Imprest_Surrender_Doc_Header.RESET;
        Imprest_Surrender_Doc_Header.SETRANGE(Imprest_Surrender_Doc_Header.No,ImprestSurrenderNo);
        IF(Imprest_Surrender_Doc_Header.FIND('-')) THEN
          BEGIN

          appMngt.SendImprestSURRApprovalRequest(Imprest_Surrender_Doc_Header);

          END;

        */

    end;


    procedure CancelImprest_Surrender_ApprovalReq(ImprestSurrendorNo: Code[20])
    begin
        /*
        Imprest_Surrender_Doc_Header.RESET;
        Imprest_Surrender_Doc_Header.SETRANGE(Imprest_Surrender_Doc_Header.No,ImprestSurrendorNo);
        IF(Imprest_Surrender_Doc_Header.FIND('-')) THEN
          BEGIN

            appMngt.CancelImprestSUApprovalRequest(Imprest_Surrender_Doc_Header,FALSE,FALSE);

          END;
        */

    end;


    procedure HR_Comments_Lines(DocumentNo: Code[50]; Comments: Text[250]; UserID: Text[50]; EmployeeNo: Text[20])
    begin
        /*
        HRCommentLine.RESET;

        BEGIN

          HRCommentLine."Document No":=DocumentNo;
          HRCommentLine."User ID":=UserID;
          HRCommentLine.Comment:=Comments;
          HRCommentLine."Employee No":=EmployeeNo;

          HRCommentLine.INSERT(TRUE);

        END;
        */

    end;


    procedure HR_Leave_Relievers("Document No": Code[20]; "Pending Assignment": Text[250]; "Reliever No": Text[30]; "Reliever Name": Text[150]; "Applicant No": Text[30])
    begin
        /*

        HRLeaveRelieversRecord.RESET;

        BEGIN

           HRLeaveRelieversRecord."Document No":="Document No";
           HRLeaveRelieversRecord."Pending Assignment":="Pending Assignment";
           HRLeaveRelieversRecord."Reliever No":="Reliever No";
           HRLeaveRelieversRecord."Reliever Name":="Reliever Name";
           HRLeaveRelieversRecord."Applicant No":="Applicant No";

           HRLeaveRelieversRecord.INSERT(TRUE);

        END

        */

    end;


    procedure ApproveDocuments("Table ID": Integer; "Document Type": Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,JV; "Document No.": Code[10]; "Approval Code": Code[20]; "Approver ID": Code[20]; Comments: Text[250])
    begin
        ApprovalEntry.Reset();
        ApprovalEntry.SetRange(ApprovalEntry."Table ID", "Table ID");
        //ApprovalEntry.SETRANGE(ApprovalEntry."Document Type","Document Type"  );
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", "Document No.");
        //ApprovalEntry.SETRANGE(ApprovalEntry."Approver ID","Approver ID" );

        if (ApprovalEntry.Find('-')) then
            repeat
                appMngt.ApproveApprovalRequests(ApprovalEntry);

                //insert comments
                if (Comments <> '') then begin
                    ApprovalCommentLine."Table ID" := "Table ID";
                    ApprovalCommentLine."Document Type" := "Document Type";
                    ApprovalCommentLine."Document No." := "Document No.";
                    ApprovalCommentLine."User ID" := "Approver ID";
                    ApprovalCommentLine."Date and Time" := CurrentDateTime;
                    ApprovalCommentLine.Comment := Comments;

                    ApprovalCommentLine.Insert(true);

                end;
            until ApprovalEntry.Next() = 0;
    end;


    procedure RejectDocuments("Table ID": Integer; "Document Type": Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,JV; "Document No.": Code[10]; "Approval Code": Code[20]; "Approver ID": Code[20]; Commments: Text[250]) ans: Text[250]
    begin
        ApprovalEntry.Reset();
        ApprovalEntry.SetRange(ApprovalEntry."Table ID", "Table ID");
        ApprovalEntry.SetRange(ApprovalEntry."Document Type", "Document Type");
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", "Document No.");
        ApprovalEntry.SetRange(ApprovalEntry."Approver ID", "Approver ID");

        if (ApprovalEntry.Find('-')) then
            repeat
                appMngt.RejectApprovalRequests(ApprovalEntry);
            until ApprovalEntry.Next() = 0;
    end;


    procedure SaveBackToOfficeReport(DocumentNo: Code[20]; CourseCode: Code[20]; CourseDescription: Text[100]; FurtherDescription: Text[150]; StartDate: Date; EndDate: Date; OriginalTrainingNeed: Text[250]; SuccessRating: Decimal; Comments: Text[250])
    begin
        /*

        HRTrainingBackToOffice.RESET;


        BEGIN

            HRTrainingBackToOffice."Document No":=DocumentNo;
            HRTrainingBackToOffice."Course Code":=CourseCode;
            HRTrainingBackToOffice."Course Description":=CourseCode;
            HRTrainingBackToOffice."Further Description":=FurtherDescription;
            HRTrainingBackToOffice."Start Date":=StartDate;
            HRTrainingBackToOffice."End Date":=EndDate;
            HRTrainingBackToOffice."Original Training Need":=OriginalTrainingNeed;
            HRTrainingBackToOffice."Success Rating":=SuccessRating;
            HRTrainingBackToOffice.Comments:=Comments;

            HRTrainingBackToOffice.INSERT(TRUE);

        END                                   ApplicantRegister
        */

    end;


    procedure ValidateNetworkServiceCredentials(UserID: Code[20])
    begin

        tblOnlineSessions.Reset();
        tblOnlineSessions.Init();
    end;


    procedure StaffLoanAppInsert(LoanType: Integer; AdvanceAmountRequested: Decimal; ReasonsforAdvanceAmount: Text[250])
    begin
    end;


    procedure UpdatePasswordApplicant(UserName: Code[50]; Password: Text[150])
    begin

        ApplicantRegister.Reset();

        ApplicantRegister.SetRange(ApplicantRegister.UserName, UserName);
        if ApplicantRegister.Find('-') then begin
            ApplicantRegister.Password := Password;
            ApplicantRegister."Changed Password" := true;
            ApplicantRegister."Last Date Modified" := Today;
            ApplicantRegister.Modify();

        end
    end;


    procedure SaveNOK(EmpCode: Code[20]; Type: Option "PropertyValue                                                                       OptionStringNext of Kin",Beneficiary,Dependant,Spouse,Siblings,"In-Laws",Parent; Relationship: Code[20]; Name: Text[100]; IDPassportNo: Text[20]; Occupation: Text[100]; Address: Text[100]; Email: Text[60]; OfficeTelephone: Text[30]; HomeTelephone: Text[30]; PercentageShares: Decimal)
    var
        NOK: Record "HR Employee Kin";
    begin
    end;


    procedure DeleteNOK(EmpCode: Code[20]; Relationship: Code[20]; IDPassportNo: Text[20])
    var
        NOK: Record "HR Employee Kin";
    begin
        NOK.Reset();
        NOK.SetRange(NOK."Employee Code", EmpCode);
        NOK.SetRange(NOK.Relationship, Relationship);
        NOK.SetRange(NOK."ID No/Passport No", IDPassportNo);

        if (NOK.Find('-')) then
            NOK.DeleteAll(true);
    end;

    //Update Employee Qualifications
    procedure FnUpdateEmployeeQualifications(eMpNo: Code[20]; qualificationType: Code[40]; qualificationCode: Code[40]; description: Text[250]; specialization: Text[250]; fromDate: Date; toDate: Date; type: Enum "Summary Type"; institution: Code[40]; grade: Code[20]; score: Decimal)
    var
        HREmpQualification: Record "HR Employee Qualifications";//HR Employee Qualifications
    begin
        HREmpQualification.Init();//We assume the employee exists
        HREmpQualification."Employee No." := eMpNo;
        HREmpQualification."Qualification Type" := qualificationType;
        HREmpQualification."Qualification Code" := qualificationCode;
        HREmpQualification.Validate("Qualification Code");
        HREmpQualification."Line No." := 0;
        HREmpQualification."Institution/Company" := institution;
        HREmpQualification.Description := description;
        HREmpQualification."From Date" := fromDate;
        HREmpQualification."To Date" := toDate;
        HREmpQualification."Course Grade" := grade;
        HREmpQualification.Score := score;
        if not HREmpQualification.Insert() then
            HREmpQualification.Modify();
    end;

    procedure fnInsertPromotionHeader(responsilityCenter: Code[20]; dateOfTransfer: Date): Code[50]
    var
        PromoHeader: Record "HR Promo. Recommend Header";
    begin
        PromoHeader.Init();
        PromoHeader.No := '';
        PromoHeader."Responsibility Center" := responsilityCenter;
        PromoHeader.Validate("Responsibility Center");
        PromoHeader."Effective Date Of Transfer" := dateOfTransfer;
        if PromoHeader.Insert(true) then
            exit(PromoHeader.No);
    end;

    procedure fnInsertPromotionLines(employeeNo: code[20]; documentNo: Code[20]; newCounty: code[20]; newDirectorate: code[20]; newRespCenter: Code[20]; newJobID: code[20]; newSalaryGrade: code[20])
    var
        PromoLines: Record "HR Promo. Recommend Lines";
    begin
        PromoLines.Init();
        PromoLines."Employee No." := employeeNo;
        PromoLines."Document No" := DocumentNo;
        PromoLines."New Global Dimension 1 Code" := newCounty;
        PromoLines.Validate("New Global Dimension 1 Code");
        PromoLines."New Global Dimension 2 Code" := newDirectorate;
        PromoLines.Validate("New Global Dimension 2 Code");
        PromoLines."New Responsibility Center" := newRespCenter;
        PromoLines.Validate("New Responsibility Center");
        PromoLines."New Job ID" := newJobID;
        PromoLines.Validate("New Job ID");
        PromoLines."New Salary Grade" := newSalaryGrade;
        PromoLines.Validate("New Salary Grade");
        if PromoLines.Insert(true) then
            PromoLines.Insert(true)
        else
            PromoLines.Modify(true);
    end;
}
