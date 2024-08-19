#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 50005 PortalWebServiceTemp
{


    var
        Employee: Record "HR Employees";
        LeaveApplication: Record "HR Leave Application";
        HRLeaveReimbursement: Record "HR Leave Reimbursement";
        HRLeavePage: Page "HR Leave Application Card";
        //VarVariant: Variant;
        //ApprovalsMgmt: Codeunit "Export F/O Consolidation";
        ApprovalEntry: Record "Approval Entry";
        ImprestHeader: Record "Imprest Header";
        ImprestLines: Record "Imprest Lines";
        HRTransportRequisition: Record "HR Transport Requisition";
        StaffClaim: Record "Staff Claims Header";
        PurchaseHeader: Record "Purchase Header";
        StoreRequistionHeader: Record "Store Requistion Header";
        SalaryAdvanceHeader: Record "Payments Header";
        SalaryAdvanceLine: Record "Payment Line";
        BudgetaryControlSetup: Record "Budgetary Control Setup";
        DeleteCommitment: Record Committment;
        Commitment: Codeunit "Budgetary Control";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        LeaveLedgerEntry: Record "HR Leave Ledger Entries";
        TrainingRequisitionHeader: Record "HR Training App Header";
        ApplicantReferees: Record "HR Applicant Referees";
        HRApplicantHobbies: Record "HR Applicant Hobbies";
        HREmployeeRequisitions: Record "HR Employee Requisitions";
        HRJobApplications: Record "HR Job Applications";
        HRApplicantQualifications: Record "HR Applicant Qualifications";
        ApplicantEducationBackground: Record "Applicant Education Background";
        ApplicantEmploymentProfile: Record "Applicant Employment Profile";
        HRApplicantReferees: Record "HR Applicant Referees";
        HREmplRequisitions: Record "HR Employee Requisitions";
        ApplicantEmploymentDetails: Record "Applicant Employment Details";
        HRJobRequirements: Record "HR Job Requirements";
        ApplicantRegister: Record "Applicant Register";
        ApplicantProfile: Record "Applicant Profiles";
        ApplicantDocs: Record "Applicant Documents";


    // procedure Employee_Photo(StaffNo: Code[20];var Picture: BigText)
    // var
    //     MemoryStream: dotnet MemoryStream;
    //     Bytes: dotnet Array;
    //     IStream: InStream;
    //     Convert: dotnet Convert;
    // begin
    //     Employee.Get(StaffNo);
    //     Employee.CalcFields(Picture);
    //     if not Employee.Picture.Hasvalue then
    //       exit;

    //     Employee.Picture.CreateInstream(IStream);
    //     MemoryStream := MemoryStream.MemoryStream();
    //     CopyStream(MemoryStream,IStream);
    //     Bytes:=MemoryStream.GetBuffer();
    //     Picture.AddText(Convert.ToBase64String(Bytes));
    // end;


    procedure Company_Photo(PIN: Code[20]; var Picture: BigText)
    var
    // MemoryStream: dotnet MemoryStream;
    // Bytes: dotnet Array;
    // IStream: InStream;
    // Convert: dotnet Convert;
    begin
        /*{
        Company.GET(PIN);
        Company.CALCFIELDS(ValidateShortcutDimCode);
        IF NOT Company.ValidateShortcutDimCode.HASVALUE THEN
          EXIT;

        Company.ValidateShortcutDimCode.CREATEINSTREAM(IStream);
        MemoryStream := MemoryStream.MemoryStream();
        COPYSTREAM(MemoryStream,IStream);
        Bytes:=MemoryStream.GetBuffer();
        Picture.ADDTEXT(Convert.ToBase64String(Bytes));
         }*/

    end;


    procedure Leave_DaysAvailable(LeaveType: Text[20]; EmpNo: Code[30]) DaysAvailable: Decimal
    begin
        Employee.Get(EmpNo);
        if (LeaveType = 'ALL') then
            DaysAvailable := Employee."Leave Balance"
        else
            if (LeaveType = 'ANNUAL') then
                DaysAvailable := Employee."Leave Balance"
            /*  BEGIN
              LeaveLedgerEntry .RESET;
              LeaveLedgerEntry.SETRANGE("Staff No.",EmpNo);
              LeaveLedgerEntry.SETRANGE(Closed,FALSE);

              IF(LeaveLedgerEntry.FIND('-'))THEN
                DaysAvailable :=LeaveLedgerEntry.CALCSUMS( "No. of days");
              end*/
            else begin
                LeaveLedgerEntry.Reset();
                LeaveLedgerEntry.SetRange("Staff No.", EmpNo);
                LeaveLedgerEntry.SetRange("Leave Type", LeaveType);
                LeaveLedgerEntry.SetRange(Closed, false);
                //LeaveLedgerEntry.SetRange("Leave Entry Type",LeaveLedgerEntry."leave entry type"::Positive,LeaveLedgerEntry."leave entry type"::"2");

                if (LeaveLedgerEntry.Find('-')) then
                    DaysAvailable := LeaveLedgerEntry."No. of days";
                //DaysAvailable :=LeaveLedgerEntry."No. of days";
            end;

        //get days gone
        LeaveLedgerEntry.Reset();
        LeaveLedgerEntry.SetRange("Staff No.", EmpNo);
        LeaveLedgerEntry.SetRange("Leave Type", LeaveType);
        LeaveLedgerEntry.SetRange(Closed, false);
        LeaveLedgerEntry.SetRange("Leave Entry Type", LeaveLedgerEntry."Leave Entry Type"::Negative);

        DaysAvailable := DaysAvailable - LeaveLedgerEntry."No. of days";

    end;


    procedure Leave_SendApprovalRequest(ApplicationCode: Code[50]; UserID: Code[50])
    begin
        /*{
         LeaveApplication.SETRANGE(LeaveApplication."Application Code",ApplicationCode);

         IF LeaveApplication.FIND('-') THEN
         BEGIN
           VarVariant := LeaveApplication;
           CheckApprovalsWorkflowEnabled(VarVariant) THEN
             ApprovalMGT.RunWorkflowOnSendApprovalRequest(VarVariant);

         SendApprovalRequestFromPortal(DATABASE::"HR Leave Application",ApplicationCode,UserID);
         END
         }*/

    end;


    procedure Salary_GenerateP9Report(EmployeeNo: Code[20]; SelectedYear: Integer; filenameFromApp: Text[150]) filename: Text[150]
    var
        "Employee Card": Record "HR Employees";
        PRSalaryCard: Record "PR Salary Card";
        P9: Record "PR Employee P9 Info";
    begin
        begin
            filename := filenameFromApp;
            if Exists(filename) then
                Erase(filename);
            P9.Reset();
            P9.SetRange(P9."Employee Code", EmployeeNo);
            P9.SetRange(P9."Period Year", SelectedYear);

            if P9.Find('-') then
                Report.SaveAsPdf(Report::prP9A, filename, P9);
            exit(filename);
        end;
    end;


    procedure Salary_GeneratePayslipReport(EmployeeNo: Code[20]; Period: Date; filenameFromApp: Text[150]; varPeriod: Text[50]) filename: Text[150]
    var
        EmployeeCard: Record "HR Employees";
        PRSalaryCard: Record "PR Salary Card";
        varPeriodDate: Date;
        Day: Integer;
        Month: Integer;
        Year: Integer;
    begin
        Evaluate(Day, CopyStr(varPeriod, 1, 2));
        Evaluate(Month, CopyStr(varPeriod, 4, 2));
        Evaluate(Year, CopyStr(varPeriod, 7, 4));

        varPeriodDate := DMY2Date(Day, Month, Year);
        filename := filenameFromApp;

        if Exists(filename) then
            Erase(filename);

        PRSalaryCard.SetRange(PRSalaryCard."Employee Code", EmployeeNo);
        PRSalaryCard.SetRange(PRSalaryCard."Period Filter", varPeriodDate);
        if PRSalaryCard.Find('-') then begin
            Message(EmployeeNo);
            Report.SaveAsPdf(Report::"PR Individual Payslip", filename, PRSalaryCard);
        end;
        exit(filename);
    end;


    procedure SendApprovalRequestFromPortal(TableID: Integer; DocumentNo: Code[50]; SenderID: Code[50])
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalEntry2: Record "Approval Entry";
    begin
        ApprovalEntry.SetCurrentKey("Table ID", "Document Type", "Document No.", "Sequence No.");
        ApprovalEntry.SetRange("Table ID", TableID);
        ApprovalEntry.SetRange("Document No.", DocumentNo);

        if ApprovalEntry.FindFirst() then begin
            ApprovalEntry2.CopyFilters(ApprovalEntry);
            if ApprovalEntry2.FindSet(true) then
                repeat
                    ApprovalEntry2."Sender ID" := SenderID;
                    ApprovalEntry2.Modify(true);
                until ApprovalEntry2.Next() = 0;
            exit;
        end;
    end;


    procedure ApproveDocument(DocumentNo: Text; ApproverID: Text; EntryNo: Integer) IsOkay: Boolean
    var
        RecIDVal: RecordId;
    begin
        /*{
       \IsOkay := FALSE;
       ApprovalEntry.SETRANGE(ApprovalEntry."Document No.",DocumentNo);
       ApprovalEntry.SETRANGE(ApprovalEntry."Approver ID",ApproverID);
       ApprovalEntry.SETRANGE(ApprovalEntry.Status, ApprovalEntry.Status :: Open);
       IF(ApprovalEntry.FIND('-')) THEN
         BEGIN
            REPEAT
               VarVariant:=ApprovalEntry;
               ApprovalsMgmt.ApproveApprovalRequests(VarVariant);//.ApproveApprovalRequests(ApprovalEntry);
            UNTIL ApprovalEntry.NEXT = 0;
            IsOkay := TRUE;
         END;
        }*/

    end;


    procedure RejectDocument(DocumentNo: Text; ApproverID: Text; RecIDText: Text; EntryNo: Integer) IsOkay: Boolean
    var
        RecIDVal: RecordId;
    begin
        /*{
        IsOkay := FALSE;
        ApprovalEntry.SETRANGE(ApprovalEntry."Document No.",DocumentNo);
        ApprovalEntry.SETRANGE(ApprovalEntry."Approver ID",ApproverID);
        ApprovalEntry.SETRANGE(ApprovalEntry.Status, ApprovalEntry.Status :: Open);
        IF(ApprovalEntry.FIND('-')) THEN
          BEGIN
             REPEAT
                VarVariant:=ApprovalEntry;
                ApprovalsMgmt.RejectApprovalRequests(VarVariant);//.RejectApprovalRequests(ApprovalEntry);
                MESSAGE(FORMAT(ApprovalEntry.Status));
             UNTIL ApprovalEntry.NEXT = 0;
             IsOkay := TRUE;
          END;
         }*/

    end;


    procedure Travel_SendApprovalRequest(ApplicationCode: Code[50]; UserID: Code[50])
    begin
        /*{
        ImprestHeader.SETRANGE(ImprestHeader."No.",ApplicationCode);
        IF ImprestHeader.FIND('-') THEN
        BEGIN
          VarVariant := ImprestHeader;
          CheckApprovalsWorkflowEnabled(VarVariant) THEN
            ApprovalMGT.RunWorkflowOnSendApprovalRequest(VarVariant);

          SendApprovalRequestFromPortal(DATABASE::"Imprest Header",ApplicationCode,UserID);
        END
         }*/

    end;


    procedure Travel_CancelApprovalRequest(ApplicationCode: Code[50]; UserID: Code[50])
    begin
        /*{
        ImprestHeader.SETRANGE(ImprestHeader."No.",ApplicationCode);
        IF ImprestHeader.FIND('-') THEN
        BEGIN
          VarVariant := ImprestHeader;
          ApprovalMGT.RunWorkflowOnCancelApprovalRequest(VarVariant);
          SendApprovalRequestFromPortal(DATABASE::"Imprest Header",ApplicationCode,UserID);
        END
          }*/

    end;


    procedure TransportRequest_SendApprovalRequest(ApplicationNo: Code[50]; UserID: Code[50])
    begin
        /*{
          HRTransportRequisition.SETRANGE(HRTransportRequisition."Transport Request No",ApplicationNo);
        IF HRTransportRequisition.FIND('-') THEN
          BEGIN
            VarVariant := HRTransportRequisition;
            CheckApprovalsWorkflowEnabled(VarVariant) THEN
              ApprovalMGT.RunWorkflowOnSendApprovalRequest(VarVariant);

            SendApprovalRequestFromPortal(DATABASE::"HR Transport Requisition",ApplicationNo,UserID);
          END
         }*/

    end;


    procedure StaffClaim_SendApprovalRequest(ApplicationCode: Code[50]; UserID: Code[50])
    begin
        /*{
        StaffClaim.SETRANGE(StaffClaim."No.",ApplicationCode);
        IF StaffClaim.FIND('-') THEN
        BEGIN
          VarVariant := StaffClaim;
          CheckApprovalsWorkflowEnabled(VarVariant) THEN
            ApprovalMGT.RunWorkflowOnSendApprovalRequest(VarVariant);


          SendApprovalRequestFromPortal(DATABASE::"Staff Claims Header",ApplicationCode,UserID);
        END
          }*/

    end;


    procedure StaffClaim_CancelApprovalRequest(ApplicationCode: Code[50]; UserID: Code[50])
    begin
        /*{
        StaffClaim.SETRANGE(StaffClaim."No.",ApplicationCode);
        IF StaffClaim.FIND('-') THEN
        BEGIN
          VarVariant := StaffClaim;
            ApprovalMGT.RunWorkflowOnCancelApprovalRequest(VarVariant);

          SendApprovalRequestFromPortal(DATABASE::"Staff Claims Header",ApplicationCode,UserID);
        END
          }*/

    end;


    procedure PurchReq_SendApprovalRequest(ApplicationCode: Code[50]; UserID: Code[50])
    begin
        /*{
        PurchaseHeader.SETRANGE(PurchaseHeader."No.",ApplicationCode);

        IF PurchaseHeader.FIND('-') THEN
        BEGIN
        {BudgetaryControlSetup.GET;
        IF NOT BudgetaryControlSetup.Mandatory THEN
           EXIT;}

        {IF PurchaseHeader.Status=PurchaseHeader.Status::Released THEN
          ERROR('This document has already been released. This functionality is available for open documents only');}
        {IF SomeLinesCommitted(PurchaseHeader) THEN
          BEGIN
            DeleteCommitment.RESET;
            DeleteCommitment.SETRANGE(DeleteCommitment."Document Type",DeleteCommitment."Document Type"::Requisition);
            DeleteCommitment.SETRANGE(DeleteCommitment."Document No.",PurchaseHeader."No.");
            DeleteCommitment.DELETEALL;
          END;
         Commitment.CheckPurchase(PurchaseHeader);
         MESSAGE('Budget Availability Checking Complete');
         }
        VarVariant := PurchaseHeader;
        CheckApprovalsWorkflowEnabled(VarVariant) THEN
          ApprovalMGT.RunWorkflowOnSendApprovalRequest(VarVariant);

        SendApprovalRequestFromPortal(DATABASE::"Purchase Header",ApplicationCode,UserID);
        END
         }*/

    end;


    procedure Store_SendApprovalRequest(ApplicationCode: Code[50]; UserID: Code[50])
    begin
        /*{
       StoreRequistionHeader.SETRANGE(StoreRequistionHeader."No.",ApplicationCode);

       IF StoreRequistionHeader.FIND('-') THEN
       BEGIN
         VarVariant := StoreRequistionHeader;

         CheckApprovalsWorkflowEnabled(VarVariant) THEN
           ApprovalMGT.RunWorkflowOnSendApprovalRequest(VarVariant);

       SendApprovalRequestFromPortal(DATABASE::"Store Requistion Header",ApplicationCode,UserID);
       END
          }*/

    end;


    procedure Training_SendApprovalRequest(ApplicationCode: Code[50]; UserID: Code[50])
    begin
        /*{
        TrainingRequisitionHeader.SETRANGE(TrainingRequisitionHeader."Application No",ApplicationCode);

        IF TrainingRequisitionHeader.FIND('-') THEN
        BEGIN
          VarVariant := TrainingRequisitionHeader;

          CheckApprovalsWorkflowEnabled(VarVariant) THEN
            ApprovalMGT.RunWorkflowOnSendApprovalRequest(VarVariant);

        SendApprovalRequestFromPortal(DATABASE::"HR Training App Header",ApplicationCode,UserID);
        END
          }*/

    end;


    procedure SalaryAdvance_SendApprovalRequest(ApplicationCode: Code[50]; UserID: Code[50])
    begin
        /*{
        SalaryAdvanceHeader.SETRANGE(SalaryAdvanceHeader."No.",ApplicationCode);

        IF SalaryAdvanceHeader.FIND('-') THEN
        BEGIN
          VarVariant := SalaryAdvanceHeader;
          CheckApprovalsWorkflowEnabled(VarVariant) THEN
            ApprovalMGT.RunWorkflowOnSendApprovalRequest(VarVariant);

        SendApprovalRequestFromPortal(DATABASE::"Payments Header",ApplicationCode,UserID);
        END
      }*/

    end;


    procedure SomeLinesCommitted(PurchaseHeaderParam: Record "Purchase Header") Exists: Boolean
    var
        PurchLines: Record "Purchase Line";
    begin
        if BudgetaryControlSetup.Get() then begin
            Exists := false;
            PurchLines.Reset();
            PurchLines.SetRange(PurchLines."Document Type", PurchaseHeaderParam."Document Type");
            PurchLines.SetRange(PurchLines."Document No.", PurchaseHeaderParam."No.");
            PurchLines.SetRange(PurchLines.Committed, true);
            if PurchLines.Find('-') then
                Exists := true;
        end else
            Exists := false;
    end;


    procedure HRJobAppInsert(ApplicantType: Option " ",External,Internal; RequisitionNo: Code[20]; FirstName: Text[30]; MiddleName: Text[30]; LastName: Text[30]; Initials: Text[15]; FirstLanguageRWS: Code[20]; FirstLanguageR: Boolean; FirstLanguageW: Boolean; FirstLanguageS: Boolean; SecondLanguageRWS: Code[20]; SecondLanguageR: Boolean; SecondLanguageW: Boolean; SecondLanguageS: Boolean; AdditionalLanguage: Code[20]; IDNumber: Text[30]; Gender: Option " ",Male,Female; HomePhoneNumber: Text[30]; PostCode: Code[20]; PostalAddress: Text[80]; ResidentialAddress: Text[80]; CellPhoneNumber: Text[30]; WorkPhoneNumber: Text[30]; "E-Mail": Text[80]; MaritalStatus: Option " ",Single,Married,Separated,Divorced,"Widow(er)",Other; Disabled: Option No,Yes," "; DateOfBirth: Date; Citizenship: Code[20])
    var
        HRJobApplications: Record "HR Job Applications";
    begin
        /*{
       HRJobApplications.RESET;
       HRJobApplications.INIT;

         HRJobApplications."Date Applied" := TODAY;
         HRJobApplications."Applicant Type" := ApplicantType;
         HRJobApplications."Employee Requisition No" := RequisitionNo;
         HRJobApplications.VALIDATE(HRJobApplications."Employee Requisition No");
         HRJobApplications."First Name" := FirstName;
         HRJobApplications."Middle Name" := MiddleName;
         HRJobApplications."Last Name" := LastName;
         HRJobApplications.Initials := Initials;
         HRJobApplications."First Language (R/W/S)" := FirstLanguageRWS;
         HRJobApplications."First Language Read" := FirstLanguageR;
         HRJobApplications."First Language Write" := FirstLanguageW;
         HRJobApplications."First Language Speak" := FirstLanguageS;
         HRJobApplications."Second Language (R/W/S)" := SecondLanguageRWS;
         HRJobApplications."Second Language Read" := SecondLanguageR;
         HRJobApplications."Second Language Write" := SecondLanguageW;
         HRJobApplications."Second Language Speak" := SecondLanguageS;
         HRJobApplications."Additional Language" := AdditionalLanguage;
         HRJobApplications."ID Number" := IDNumber;
         HRJobApplications.Gender := Gender;
         HRJobApplications."Home Phone Number" := HomePhoneNumber;
         HRJobApplications."Post Code" := PostCode;
         HRJobApplications."Postal Address" := PostalAddress;
         HRJobApplications."Residential Address" := ResidentialAddress;
         HRJobApplications."Cell Phone Number" := CellPhoneNumber;
         HRJobApplications."Work Phone Number" := WorkPhoneNumber;
         HRJobApplications."E-Mail" := "E-Mail";
         HRJobApplications."Marital Status" := MaritalStatus;
         HRJobApplications.Disabled := Disabled;
         HRJobApplications."Date Of Birth" := DateOfBirth;
           HRJobApplications.VALIDATE(HRJobApplications."Date Of Birth");
         HRJobApplications.Citizenship := Citizenship;
           HRJobApplications.VALIDATE(HRJobApplications.Citizenship);

       HRJobApplications.INSERT(TRUE);
       }*/

    end;


    procedure HRJobAppQualificationsInsert(ApplicationNo: Code[20]; QualificationType: Code[20]; QualificationCode: Text[30]; FromDate: Date; ToDate: Date; Type: Option " ",Internal,External,"Previous Position"; InstitutionCompany: Text[50])
    var
        HRApplicantQualifications: Record "HR Applicant Qualifications";
    begin
        /*{
       HRApplicantQualifications.RESET;
       HRApplicantQualifications.INIT;

         HRApplicantQualifications."Application No" := ApplicationNo;
         HRApplicantQualifications."Qualification Type" := QualificationType;
         HRApplicantQualifications."Qualification Code" := QualificationCode;
           HRApplicantQualifications.VALIDATE(HRApplicantQualifications."Qualification Code");
         HRApplicantQualifications."Start Date" := FromDate;
         HRApplicantQualifications."End Date" := ToDate;
         HRApplicantQualifications.Type := Type;
         HRApplicantQualifications."Institution/Company" := InstitutionCompany;

       HRApplicantQualifications.INSERT(TRUE);
          }*/

    end;


    procedure HRJobAppRefereesInsert(ApplicationNo: Code[20]; Names: Text[200]; Designation: Text[100]; Institution: Text[100]; Address: Text[200]; TelephoneNo: Text[100]; "E-Mail": Text[100])
    var
        HRApplicantReferees: Record "HR Applicant Referees";
    begin

        HRApplicantReferees.Reset();
        HRApplicantReferees.Init();

        HRApplicantReferees.Names := Names;
        HRApplicantReferees.Designation := Designation;
        HRApplicantReferees.Institution := Institution;
        HRApplicantReferees.Address := Address;
        HRApplicantReferees."Telephone No" := TelephoneNo;
        HRApplicantReferees."E-Mail" := "E-Mail";

        HRApplicantReferees.Insert(true);
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


    procedure ApplicantProfileInsert(IdNo: Text[50]; Email: Text[50]; FirstName: Text[50]; MiddleName: Text[50]; LastName: Text[50]) InsertSuccess: Boolean
    begin
        /*{
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
          }*/

    end;


    procedure ApplicantDocsInsert(ApplicantNo: Text; DocType: Text; FileName: Text; DocumentNo: Text; DocumentURL: Text; Posted: Boolean; Company: Text; Section: Option; DocumentNotes: Text; randomResultMapper: Text)
    begin

        ApplicantDocs.Init();

        begin
            ApplicantDocs.ApplicantNo := ApplicantNo;
            ApplicantDocs.DocType := DocType;
            ApplicantDocs.FileName := FileName;
            ApplicantDocs."Document No" := DocumentNo;
            ApplicantDocs.DocumentURL := DocumentURL;
            ApplicantDocs.Company := Company;
            ApplicantDocs.Section := Section;
            ApplicantDocs."Document Notes" := DocumentNotes;
            ApplicantDocs.RandomMapperEduBackGr := randomResultMapper;

            ApplicantDocs.Insert(true);

        end;
    end;


    procedure UploadDocumentAttachment(ApplicantNo: Code[20]; URL1: Text[250]; Descriprion: Text[250]; UserID: Code[20]; Company: Text[250]; ExternalDocReference: RecordId)
    var
        RecordLink: Record "Record Link";
    begin

        ApplicantRegister.Reset();
        ApplicantRegister.SetRange(ApplicantRegister.UserName, ApplicantNo);

        if (ApplicantRegister.Find('-')) then begin

            ApplicantDocs.Reset();
            ApplicantDocs.SetRange(ApplicantDocs.ApplicantNo, ApplicantNo);
            ApplicantDocs.SetRange(ApplicantDocs.Posted, false);

            if (ApplicantDocs.Find('-')) then begin
                RecordLink.Reset();

                RecordLink.Init();
                //Rec0ordLink."Record ID":=ApplicantDocs.MyRecId;
                RecordLink."Record ID" := ApplicantRegister.MyRecId;

                RecordLink.URL1 := URL1;
                RecordLink.Description := Descriprion;
                RecordLink."User ID" := UserID;
                RecordLink.Company := Company;
                RecordLink.Created := CurrentDateTime;

                RecordLink.Insert(true);

                ApplicantDocs.Reset();
                ApplicantDocs.SetRange(ApplicantDocs.ApplicantNo, ApplicantNo);
                ApplicantDocs.SetRange(ApplicantDocs.Posted, false);
                if (ApplicantDocs.Find('-')) then begin
                    ApplicantDocs.Posted := true;
                    ApplicantDocs.Modify();
                end

            end;
        end
    end;


    procedure HREmpRequisitionRegNo(RegNo: Code[20]) ReturnValue: Text[200]
    begin
        HREmplRequisitions.Reset();
        HREmplRequisitions.SetRange(HREmplRequisitions."Requisition No.", RegNo);
        if HREmplRequisitions.Find('-') then
            ReturnValue := HREmplRequisitions."Job Description";
    end;


    procedure HREmpRequisitionJobID(RegNo: Code[20]) ReturnValue: Text[200]
    begin
        HREmplRequisitions.Reset();
        HREmplRequisitions.SetRange(HREmplRequisitions."Requisition No.", RegNo);
        if HREmplRequisitions.Find('-') then
            ReturnValue := HREmplRequisitions."Job ID";
    end;


    procedure JobAppliedForAlready(IDNumber: Text[30]; JobAppliedFor: Text[30]) ReturnValue: Boolean
    begin
        /*{
        HRJobApplications.RESET;
        HRJobApplications.SETRANGE(HRJobApplications."ID Number",IDNumber);
        HRJobApplications.SETRANGE(HRJobApplications."Job Applied For",JobAppliedFor);
        IF HRJobApplications.FIND('-') THEN
         BEGIN
           EXIT(TRUE);
         END
        ELSE
         BEGIN
          EXIT(FALSE);
         END;
          }*/

    end;


    procedure QualificationTypeExits(ApplNo: Code[30]; QType: Text[50]; Course: Text[200]) ReturnValue: Boolean
    begin
        /*{
        ApplicantEducationBackground.RESET;
        ApplicantEducationBackground.SETRANGE(ApplicantEducationBackground.ApplicantNo,ApplNo);
        ApplicantEducationBackground.SETRANGE(ApplicantEducationBackground.QualificationType,QType);
        ApplicantEducationBackground.SETRANGE(ApplicantEducationBackground.Qualifications,Course);
        ApplicantEducationBackground.SETRANGE(ApplicantEducationBackground.QualificationTypeCode,'ACADEMIC');
        IF ApplicantEducationBackground.FIND('-') THEN
         BEGIN
           EXIT(TRUE);
         END
        ELSE
         BEGIN
           EXIT(FALSE);
         END;
          }*/

    end;


    procedure WorkExperienceExist(AppNo: Code[30]) ReturnValue: Boolean
    begin
        /*{
        ApplicantEducationBackground.RESET;
        ApplicantEducationBackground.SETRANGE(ApplicantEducationBackground.ApplicantNo,AppNo);
        ApplicantEducationBackground.SETRANGE(ApplicantEducationBackground.QualificationTypeCode,'WORK EXPERIENCE');
        IF ApplicantEducationBackground.FIND('-') THEN
         BEGIN
           EXIT(TRUE);
         END
        ELSE
         BEGIN
           EXIT(FALSE);
         END;
          }*/

    end;


    procedure ApplicantReferee(ID: Integer; ApplicantNo: Text[30]; FullName: Text[200]; Address: Text[200]; Email: Text[200]; MobileNo: Text[30]; Occupation: Text[200]; ReferenceType: Text[50]; Company: Text[150])
    begin
        /*{
     ApplicantReferees.RESET;
     ApplicantReferees.SETRANGE(ApplicantReferees."Entry No",ID);
     IF ApplicantReferees.FIND('-') THEN BEGIN
       ApplicantReferees."Job Application No" := ApplicantNo;
       ApplicantReferees.Names:= FullName;
       ApplicantReferees.Address := Address;
       ApplicantReferees."E-Mail" := Email;
       ApplicantReferees."Telephone No" := MobileNo;
       ApplicantReferees.Designation:= Occupation;
       ApplicantReferees.ReferenceType:= ReferenceType;
       ApplicantReferees.Institution := Company;
       ApplicantReferees.MODIFY;
       END
     ELSE
      BEGIN
      ApplicantReferees."Job Application No" := ApplicantNo;
       ApplicantReferees.Names:= FullName;
       ApplicantReferees.Address := Address;
       ApplicantReferees."E-Mail" := Email;
       ApplicantReferees."Telephone No" := MobileNo;
       ApplicantReferees.Designation:= Occupation;
       ApplicantReferees.ReferenceType:= ReferenceType;
       ApplicantReferees.Institution := Company;
       ApplicantReferees.INSERT(TRUE);
      END;
          }*/

    end;


    procedure HREmpRequisitionNumber(RegNo: Code[20]) ReturnValue: Text[200]
    begin
        HREmplRequisitions.Reset();
        HREmplRequisitions.SetRange(HREmplRequisitions."Requisition No.", RegNo);
        if HREmplRequisitions.Find('-') then
            ReturnValue := HREmployeeRequisitions."Requisition No.";
    end;


    procedure CreateCompany(PIN: Code[20]; Email: Text[60]; Name: Text[60]) _vendorNo: Code[20]
    var
        _vendor: Record Vendor;
    begin
        /*{
        _company.RESET;
        _company.SETRANGE(_company.Reconciled,PIN);

        IF _company.FIND('-') THEN
          ERROR('The PIN No. %1 has already been registered',PIN)
        ELSE BEGIN
          _vendor.RESET;
          _vendor.SETRANGE(_vendor."PIN No.",PIN);

          IF _vendor.FIND('-') THEN
            BEGIN
            _vendorNo:=_vendor."No.";
            _company.Reconciled:=PIN;
            _company."Open Type":=_company."Open Type"::Uncredited;
            _company.SetUpNewLine:=Email;
            _company."Statement No.":=_vendor.Name;
            _company.Imported:=_vendor."No.";
            END
          ELSE BEGIN
            _vendorNo:='';
            _company.Reconciled:=PIN;
            _company."Open Type":=_company."Open Type"::Unpresented;
            _company.SetUpNewLine:=Email;
            _company."Statement No.":=Name;
            END;
          _company.INSERT(TRUE);

        END;
          }*/

    end;


    procedure InsertBidderResponse(PIN: Code[20]; RFQ: Code[20]; ItemNo: Code[20]; Description: Text[100]; UOM: Text[100]; Quantity: Integer; UnitPrice: Decimal; TotalPrice: Decimal; DeliveryPeriod: Text[20]; Brand: Text[50]; CountryOrigin: Text[60]; Remarks: Text[100])
    var
        purchasePriceTemp: Record "Purchase Price Temp";
    begin
        purchasePriceTemp.Init();
        purchasePriceTemp.SetRange(purchasePriceTemp."PIN No.", PIN);
        purchasePriceTemp.SetRange(purchasePriceTemp."Tender No.", RFQ);
        purchasePriceTemp.SetRange(purchasePriceTemp."Item No.", ItemNo);

        if (purchasePriceTemp.Find('-')) then
            purchasePriceTemp.Delete(true);

        purchasePriceTemp."PIN No." := PIN;
        purchasePriceTemp."Tender No." := RFQ;
        purchasePriceTemp."Item No." := ItemNo;
        purchasePriceTemp.Description := Description;
        purchasePriceTemp."Unit of Measure Code" := UOM;
        purchasePriceTemp."Minimum Quantity" := Quantity;
        purchasePriceTemp."Direct Unit Cost" := UnitPrice;
        purchasePriceTemp."Final Tender" := TotalPrice;
        purchasePriceTemp."Pack Size" := DeliveryPeriod;
        purchasePriceTemp.Brand := Brand;
        purchasePriceTemp.Country := CountryOrigin;
        purchasePriceTemp.Remarks := Remarks;

        purchasePriceTemp.Insert(true);
    end;


    procedure GenerateRFQ(id: Integer; path: Text[500]) filename: Text[500]
    begin
        /*{
        filename := path;
        IF EXISTS(filename) THEN
          ERASE(filename);
        PurchaseQuoteHeaderTest.RESET;
        PurchaseQuoteHeaderTest.SETRANGE(PurchaseQuoteHeaderTest."Header Line No",id);
        IF PurchaseQuoteHeaderTest.FIND('-') THEN
          BEGIN
            REPORT.SAVEASPDF(REPORT::Report50003,filename,PurchaseQuoteHeaderTest);
          END;
        EXIT(filename);
          }*/

    end;


    procedure GenerateRFQAwarded(id: Integer; path: Text[500]) filename: Text[500]
    begin
        /*{
        filename := path;
        IF EXISTS(filename) THEN
          ERASE(filename);
        PurchaseQuoteHeaderTest.RESET;
        PurchaseQuoteHeaderTest.SETRANGE(PurchaseQuoteHeaderTest."Header Line No",id);
        IF PurchaseQuoteHeaderTest.FIND('-') THEN
          BEGIN
            REPORT.SAVEASPDF(REPORT::Report50003,filename,PurchaseQuoteHeaderTest);
          END;
        EXIT(filename);
          }*/

    end;


    procedure UploadTenderDocument(pinNo: Code[20]; path: Text[500]; id: Text[500])
    begin
        /*{
        supplier.RESET;
        supplier.SETRANGE(supplier.Reconciled,pinNo);
        IF(supplier.FIND('-'))THEN BEGIN
          supplier.ADDLINK(path,id);
          END;
           }*/

    end;
}
