#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 50002 PortalWebService

{
    var
        Employee: Record "HR Employees";
        ApplicantDocs: Record "Applicant Documents";
        LeaveLedgerEntry: Record "HR Leave Ledger Entries";
        MyRecRef: RecordRef;
        ApplicantRegister: Record "Applicant Register";

        Dsplinary: record "HR Disciplinary Cases NCA";
        HRLeave: Record "HR Leave Application";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgmt.";
        ApprovalMgt: Codeunit "Approvals Mgt";
        TrainingApplications: Record "HR Training App Header";
        TrainingNeeds: Record "HR Training Needs";

        AssetRepairHeader: Record "Asset Repair Header";
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
        StoresReqHeader: Record "Store Requistion Headers";
        HRAppraisalCard: Record "HR Appraisal Header";
        ApplicantProfile: Record "Applicant Profiles";
        prSalaryCard: Record "prSalary Card Casual";
        ApprovalCommentLine: Record "Approval Comment Line";
        tblOnlineSessions: Record "Online Sessions";
        FILESPATH: Label 'C:\inetpub\wwwroot\HRMIS\Payslips\';
        HRCommentLines: Record "HR Comment Lines";
        HREmployees: Record "HR Employees";
        EmployeeName: Text[250];
        HRTrainingApplicationLineParticipants: Record "HR Training App Lines";
        HRTraninigBackToOffice: Record "HRBack To Office Forms";
        OnlineUserResetActivity: Record "Online User Reset Activity";
        HRLeaveRelieversRecord: Record "HR Leave Relievers";
        ApplicantRelevantDocuments: Record "Applicant relevant Documents1";
        Text005: Label 'You have a Leave Application of type %1 - %2 that is still Pending. Kindly Cancel it or wait for Approval.';
        HRTransportReq: Record "HR Transport Requisition";
        FILESPATH_TEST: Label 'E:\Coretec\Online\Production\HRMS NEW\NEW NLC HRMS\Payslips\';
        UserSetup: Record "User Setup";
        //ApprovalTemplates: Record "Approval Templates";
        //AdditionalApprovers: Record "Additional Approvers";
        HREmp: Record "HR Employees";
        HRCalendar: Record "HR Calendar List";
        DimensionValue: Record "Dimension Value";
        ApplicantEducationBackground: Record "Applicant Education Background";
        RecordLink: Record "Record Link";
        ApplicantSessions: Record "Applicant Sessions";
        AttachmentIDBuffer: Record "Attachment ID Buffer";
        TextResetPassWordError: Label 'Invalid email: Sorry email not registered.';
        ApplicantEmploymentProfile: Record "Applicant Employment Profile";
        txt20: Label 'Details Updated Successfully';
        txt21: Label 'Details Saved Successfully';
        HRJobApplications: Record "HR Job Applications";
        HRApplicantReferees: Record "HR Applicant Referees";
        ApplicantReferees: Record "Applicant Referees";
        HRApplicantQualifications: Record "HR Applicant Qualifications";
        HREmploymentHistory: Record "HR Appl Employment History";
        JobApplications: Record "Job Applications";
        HRCurrentEmployment: Record "HR Current Employment";
        HREmployemntDetails: Record "Applicant Employment Details";
        NAVApplicantRelevantDocs: Record "NAV Applicant Relevant Docs1";
        HREmployeeRequisitions: Record "HR Employee Requisitions";
        ExitInterviewQuestionnaire: Record "Exit Interview Questionnaire";
        HRJobs: Record "HR Jobs";
        TextEmployeeReqExists: Label 'You have an Employee Requisition of type %1 - %2 that is still Pending. Kindly Cancel it or wait for Approval.';
        EmployeeSeparation: Record "Employee Separation Header";
        TextSeparationReqExists: Label 'You have an Employee Separation request of type that is still Pending. Kindly Cancel it or wait for Approval.';
        ClearanceCertificate: Record "Clearance Certificate";
        HRCalendar_Period: Record "HR Calendar";
        datet: DateFormula;
        Dates: Codeunit "HR Dates";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CustomApprovalMgt: Codeunit "Approvals Mgt";
        HRSetup: Record "HR Setup";
        MaturityDate: Date;
        FiscalStart: Date;
        DaysAllocated: Decimal;
        DaysTaken: Decimal;
        StaffAdvance: Record "Staff Advance Headers";
        FILESPATH_P9_P10: Label '\\Dblive2\Payslips\';
        FilePath: Label 'C:\inetpub\wwwroot\HRMIS\Payslips\';
        FullPath: Text;
        P9Report: Report "PR P9";
        HRJobRequirements: Record "HR Job Requirements";
        HRApplicantRequirements: Record "HR Appplicants Requirements";
        AppraisalReport: Report "Appraisal Report NEW";
        APath: Label 'C:\inetpub\wwwroot\HRMIS\App_Temp_Reports\';
        AppraisalHeader: Record "HR Appraisal Header";
        Mobility: Record "Employee Transfers";




    procedure UploadDocumentAttachment(ApplicantNo: Code[20]; URL1: Text[250]; Descriprion: Text[250]; UserID: Code[20]; Company: Text[250]; ExternalDocReference: RecordId)
    var
        RecordLink: Record "Record Link";
        HRJobs: Record "HR Jobs";
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


    procedure ApplicantRegInsert(UserName: Code[20]; Password: Text[250]; EmailAddress: Text[150]; Name1: Text[50]; Name2: Text[50]; Name3: Text[50]; Phone: Text[30]; Created: DateTime)
    begin

        ApplicantRegister.Init();

        begin
            ApplicantRegister.UserName := UserName;

            ApplicantRegister."First Name" := Name2;
            ApplicantRegister."Middle Name" := Name1;
            ApplicantRegister."Last Name" := Name3;
            ApplicantRegister.Password := Password;
            ApplicantRegister.EmailAddress := EmailAddress;
            ApplicantRegister.Verified := false;
            ApplicantRegister.Phone := Phone;
            ApplicantRegister.DateCreated := Created;
            ApplicantRegister.Insert(true);

        end
    end;

    procedure fnModifyDisplinaryRemarks(CaseNo: Code[20]; Responses: Text[100])
    begin


        begin
            Dsplinary.RESET;
            Dsplinary.SetRange(Dsplinary."Case Number", CaseNo);
            if Dsplinary.Find('-') then Begin
                Dsplinary."Disciplinary Stage Status" := Dsplinary."Disciplinary Stage Status"::"Under Review";
                Dsplinary.Response := Responses;
                Dsplinary.modify();
            end;

        end
    end;


    procedure ApplicantRegInsertVerifiedEmail(No: Code[20]) verified: Boolean
    begin
        ApplicantRegister.Init();
        ApplicantRegister.Reset();
        ApplicantRegister.SetRange(UserName, No);
        if ApplicantRegister.Find('-') then
            if ApplicantRegister.Verified = true then
                verified := true
            else
                verified := false;
    end;


    procedure ApproveTrainingRequest(DocumentNo: Code[10])
    begin
    end;


    procedure HRLeaveAppInsert(EmployeeNo: Text; Names: Text; LeaveType: Text; DaysApplied: Decimal; StartDate: Date; ReturnDate: Date; ApplicationDate: Date; Status: Integer; EndDate: Date; UserID: Text; applicantComments: Text[250]; ResponsibilityCenter: Code[20]; "Request Leave Allowance": Boolean) HR_Doc_No: Code[20]
    begin

        begin

            HRLeave.Reset();

            HRLeave.SetRange(HRLeave."Employee No", EmployeeNo);
            //  HRLeave.SETRANGE(HRLeave."Leave Type", LeaveType);
            HRLeave.SetFilter(HRLeave.Status, '%1|%2', HRLeave.Status::New, HRLeave.Status::"Pending Approval");

            if HRLeave.Find('-') then
                Error(Text005, LeaveType);
            HREmp.Get(EmployeeNo);
            HRLeave.Reset();

            HRLeave."Employee No" := EmployeeNo;
            HRLeave.Names := Names;
            HRLeave."Leave Type" := LeaveType;
            HRLeave."Days Applied" := DaysApplied;
            HRLeave."Start Date" := StartDate;
            HRLeave."End Date" := EndDate;
            HRLeave."Return Date" := ReturnDate;
            HRLeave."Application Date" := ApplicationDate;
            HRLeave.Status := Status;
            HRLeave."User ID" := UserID;
            //HRLeave."User ID" := HREmp."User ID";
            HRLeave."Applicant Comments" := applicantComments;
            HRLeave."Responsibility Center" := ResponsibilityCenter;
            HRLeave."Job Tittle" := HREmp."Job Title";
            HRLeave."Request Leave Allowance" := "Request Leave Allowance";
            HRLeave.Insert(true);
            HRLeave.Validate("Days Applied");
            HR_Doc_No := HRLeave."Application Code";

            //SendLeaveForApproval(HR_Doc_No);

        end
    end;


    procedure HRLeaveAppModify(ApplicationCode: Code[50]; EmployeeNo: Text; Names: Text; LeaveType: Text; DaysApplied: Decimal; StartDate: Date; ReturnDate: Date; ApplicationDate: Date; Status: Integer; EndDate: Date; UserID: Text; applicantComments: Text[250]; ResponsibilityCenter: Code[20]; "Request Leave Allowance": Boolean; LineNum: Integer; PlannerNum: Code[40]) HR_Doc_No: Code[20]
    begin

        begin

            HRLeave.Reset();
            HRLeave.SetRange(HRLeave."Employee No", EmployeeNo);
            HRLeave.SetRange(HRLeave."Leave Type", LeaveType);
            HRLeave.SetRange(HRLeave.Status, HRLeave.Status::"Pending Approval");
            if HRLeave.Find('-') then
                Error(Text005, LeaveType);


            HRLeave.Reset();
            HRLeave.SetRange(HRLeave."Application Code", ApplicationCode);
            if HRLeave.Find('-') then begin
                HRLeave."Employee No" := EmployeeNo;
                HRLeave.PlannerHeaderNum := PlannerNum;
                HRLeave.Names := Names;
                HRLeave."Leave Type" := LeaveType;
                HRLeave.LeaveLineNum := LineNum;
                HRLeave."Days Applied" := DaysApplied;
                HRLeave."Start Date" := StartDate;
                HRLeave."End Date" := EndDate;
                HRLeave."Return Date" := ReturnDate;
                HRLeave."Application Date" := ApplicationDate;
                HRLeave.Status := Status;
                HRLeave."User ID" := UserID;
                HRLeave."Applicant Comments" := applicantComments;
                HRLeave."Responsibility Center" := ResponsibilityCenter;
                HRLeave."Request Leave Allowance" := "Request Leave Allowance";
                HR_Doc_No := HRLeave."Application Code";
                HRLeave.Modify();
                HRLeave.Validate("Days Applied");
                SendLeaveForApproval(ApplicationCode);
            end
        end
    end;


    procedure HRLeaveAppInsertNewDoc(EmployeeNo: Text; Names: Text; LeaveType: Text; DaysApplied: Decimal; StartDate: Date; ReturnDate: Date; ApplicationDate: Date; Status: Integer; EndDate: Date; UserID: Text; applicantComments: Text[250]; ResponsibilityCenter: Code[20]; "Request Leave Allowance": Boolean) HR_Doc_No: Code[20]
    begin

        begin

            HRLeave.Reset();

            /*
            HRLeave.SETRANGE(HRLeave."Employee No", EmployeeNo);
            HRLeave.SETRANGE(HRLeave."Leave Type", LeaveType);
            HRLeave.SETRANGE(HRLeave.Status, HRLeave.Status :: "Pending Approval");

            IF HRLeave.FIND('-') THEN BEGIN
              ERROR(STRSUBSTNO(Text005,LeaveType));
            END;
            */


            HRLeave.Reset();
            HRLeave."Employee No" := EmployeeNo;
            HRLeave.Names := Names;
            HRLeave."Leave Type" := LeaveType;
            HRLeave."Days Applied" := DaysApplied;
            HRLeave."Start Date" := StartDate;
            HRLeave."End Date" := EndDate;
            HRLeave."Return Date" := ReturnDate;
            HRLeave."Application Date" := ApplicationDate;
            HRLeave.Status := Status;
            HRLeave."User ID" := UserID;
            HRLeave."Applicant Comments" := applicantComments;
            HRLeave."Responsibility Center" := ResponsibilityCenter;
            HRLeave."Request Leave Allowance" := "Request Leave Allowance";
            HRLeave.Insert(true);

            //HRLeave.VALIDATE("Days Applied");

            HR_Doc_No := HRLeave."Application Code";

            SendLeaveForApproval(HR_Doc_No);

        end

    end;


    procedure SendLeaveForApproval(ApplicationCode: Code[10])
    var
        LeaveApplication: Record "HR Leave Application";
        HRLeaveLedger: Record "HR Leave Ledger Entries";
        HRLvType: Record "HR Leave Types";
        HRCalendar_L: Record "HR Calendar";
    begin
        LeaveApplication.Reset();
        LeaveApplication.SetRange(LeaveApplication."Application Code", ApplicationCode);
        if LeaveApplication.Find('-') then begin
            //Added Dan
            HRLeave.Reset();
            HRLeave.SetRange(HRLeave."Employee No", LeaveApplication."Employee No");
            HRLeave.SetRange(HRLeave.Status, HRLeave.Status::"Pending Approval");
            if HRLeave.Find('-') then
                Error(Text005, HRLeave."Application Code", HRLeave."Leave Type");

            HRLeave.Reset();
            HRLeave.SetRange(HRLeave."Employee No", LeaveApplication."Employee No");
            HRLeave.SetRange(HRLeave.Status, HRLeave.Status::Approved);
            if HRLeave.Find('-') then
                repeat

                    if (LeaveApplication."Start Date" < HRLeave."Return Date") or (LeaveApplication."Return Date" < HRLeave."Return Date")
                    then
                        Error('Your Leave Application Overlaps with leave application [ %1 - %2 ] which is Approved and has a Return Date exceeding the Start Date specified for your current application.', HRLeave."Application Code", HRLeave."Leave Type");
                until HRLeave.Next() = 0;



            HRCalendar_L.Reset();
            HRCalendar_L.SetRange(HRCalendar_L.Current, true);
            if HRCalendar_L.Find('-') then begin
                HRLeave.Reset();
                HRLeave.SetRange(HRLeave."Return Date", HRCalendar_L."Start Date", HRCalendar_L."End Date");
                HRLeave.SetRange(HRLeave."Employee No", LeaveApplication."Employee No");
                HRLeave.SetFilter(HRLeave.Status, '%1|%2|%3', 1, 2, 4);
                HRLeave.SetRange(HRLeave."Leave Type", LeaveApplication."Leave Type");
                if HRLeave.Find('-') then begin
                    HRLvType.Reset();
                    HRLvType.SetRange(HRLvType.Code, LeaveApplication."Leave Type");
                    if HRLvType.Find('-') then
                        if HRLvType."Apply Once Per FY?" then
                            if HRLeave.Status <> HRLeave.Status::New then
                                Error('You cannot apply for this leave type [ %1 ] more than once.' +
                                         ' It was applied on Leave Application No [ %2 ] & Status [ %3] & Leave Type [ %4 ] ',
                                   HRLvType.Description, HRLeave."Application Code", HRLeave.Status, HRLeave."Leave Type");
                end;
            end;

            //error('simama hapa');
            //Added Dan - Not allow someone to apply leave more than once in a FY Year
            VarVariant := LeaveApplication;
            ApprovalMgt.OnSendDocForApproval(VarVariant);
            //ApprovalMgt.SendLeaveAppApprovalReq(LeaveApplication);
        end
    end;

    procedure SumbitEmployeeChangesForApproval(DocumNum: Code[20]; UserID: Text): Text
    var
        StaffChanges: Record "HR Employee Staff Changes";
        CustomAppr: Codeunit "Custom Approvals Codeunit";

    begin

        StaffChanges.Reset();
        StaffChanges.SetRange(StaffChanges."No.", DocumNum);
        if StaffChanges.FindFirst() then begin
            Varvariant := StaffChanges;
            if CustomAppr.CheckApprovalsWorkflowEnabled(Varvariant) then
                CustomAppr.OnSendDocForApproval(Varvariant);
            //Message(TrainingNeeds.Code);
            exit('Submitted Successfully for approval');
        end
        else
            Error('Cannot Send the document for Approval');
    end;


    procedure SumbitEmployeeQualForApproval(DocumNum: Code[20]; UserID: Text): Text
    var
        HRQual: Record "HR Emp Qualification Changes";
        CustomAppr: Codeunit "Custom Approvals Codeunit";

    begin

        HRQual.Reset();
        HRQual.SetRange(HRQual."Qualfi Code", DocumNum);
        if HRQual.FindFirst() then begin
            Varvariant := HRQual;
            if CustomAppr.CheckApprovalsWorkflowEnabled(Varvariant) then
                CustomAppr.OnSendDocForApproval(Varvariant);
            //Message(TrainingNeeds.Code);
            exit('Submitted Successfully for approval');
        end
        else
            Error('Cannot Send the document for Approval');
    end;

    //denno
    procedure SumbitTrainingNeedForApproval(ApplicationNo: Code[50]; UserID: Text)
    begin

        TrainingNeeds.Reset();
        TrainingNeeds.SetRange(TrainingNeeds.Code, ApplicationNo);
        if TrainingNeeds.Find('-') then begin
            VarVariant := TrainingNeeds;
            if ApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
                ApprovalMgt.OnSendDocForApproval(VarVariant);

            Message(TrainingNeeds.Code);
        end;
        //else
        //Error(Format(ApplicationNo) + '---' + Format(TrainingNeeds.Code));
    end;

    procedure SubmitAssetRepairForApproval(ApplicationNo: Code[50]; UserID: Text)
    begin
        AssetRepairHeader.reset;
        AssetRepairHeader.SetRange(AssetRepairHeader."Request No.", ApplicationNo);
        if AssetRepairHeader.Find('-') then begin
            VarVariant := AssetRepairHeader;
            if ApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
                ApprovalMgt.OnSendDocForApproval(VarVariant);
        end
    end;


    procedure SumbitTrainingForApproval(ApplicationNo: Code[50]; UserID: Text)
    begin
        TrainingApplications.Reset();
        TrainingApplications.SetRange(TrainingApplications."Application No", ApplicationNo);

        if TrainingApplications.Find('-') then begin
            VarVariant := TrainingApplications;
            ApprovalMgt.OnSendDocForApproval(VarVariant);
            Message('XYZ');
        end
    end;


    procedure ApproveDocument(DocumentNo: Text; ApproverID: Text)
    var
        HrLeave: Record "HR Leave Application";
        plannerLines: Record "HR Leave Planner Lines";
        UserSetup: Record "User Setup";
        ApproMGt: Codeunit "Approvals Mgmt.";
        VarVaraint: Variant;
        AppEntr: Record "Approval Entry";
    begin
        //exit(ApproverID);
        ApprovalEntry.Reset();
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", DocumentNo);
        ApprovalEntry.SetRange(ApprovalEntry."Approver ID", ApproverID);
        ApprovalEntry.SetRange(ApprovalEntry.Status, ApprovalEntry.Status::Open); //added to prevent double approval of a document
        if ApprovalEntry.Find('-') then begin
            repeat
                if not ApprovalSetup.Get(ApproverID) then
                    Error(Text004);
                if ApprovalEntry."Approver ID" <> '' then
                    CustomApprovals.ApproveApprovalRequests(ApprovalEntry);
            // else begin
            //     UserSetup.Reset();
            //     UserSetup.SetRange("Approval Administrator", true);
            //     if UserSetup.FindFirst() then begin
            //         //ApprovalEntry.Status := ApprovalEntry.Status::Approved;
            //         ApprovalEntry."Approver ID" := UserSetup."User ID";
            //         ApprovalEntry.Modify();
            //         AppEntr.Reset();
            //         AppEntr.SetRange(AppEntr."Entry No.", ApprovalEntry."Entry No.");
            //         if AppEntr.FindFirst() then
            //             //commit;
            //             CustomApprovals.ApproveApprovalRequests(AppEntr)
            //     end;
            //     Message('Approved');
            //CustomApprovals.OnApproveApprovalRequest(ApprovalEntry);
            //end;
            until ApprovalEntry.Next() = 0;
        end;
        HrLeave.Reset();
        HrLeave.SetRange("Application Code", DocumentNo);
        if HrLeave.FindFirst() then begin
            plannerLines.Reset();
            plannerLines.SetRange("Application Code", HrLeave.PlannerHeaderNum);
            plannerLines.SetRange("Line No.", HrLeave.LeaveLineNum);
            plannerLines.SetRange(Selected, false);
            if plannerLines.FindFirst() then begin
                plannerLines.Selected := true;
                plannerLines.Modify();
            end;
        end;
    end;


    procedure RejectDocument(DocumentNo: Text; ApproverID: Text)
    begin

        ApprovalEntry.SetRange(ApprovalEntry."Document No.", DocumentNo);
        ApprovalEntry.SetRange(ApprovalEntry."Approver ID", ApproverID);

        if ApprovalEntry.Find('-') then
            repeat
                if not ApprovalSetup.Get(UserId) then
                    Error(Text004);
                CustomApprovals.RejectApprovalRequests(ApprovalEntry);

            until ApprovalEntry.Next() = 0;
    end;


    procedure CancelDocument(DocumentNo: Text; SenderID: Text)
    var
        RecRef: RecordRef;
    begin

        ApprovalEntry.SetRange(ApprovalEntry."Document No.", DocumentNo);
        ApprovalEntry.SetRange(ApprovalEntry."Sender ID", SenderID);
        if ApprovalEntry.FindSet() then begin
            repeat
                if ApprovalEntry.Status = ApprovalEntry.Status::Approved then
                    Error('You cannot cancel the approval request. The approval proccess has already began.');
            //CustomApprovals.CancelApprovalRequest(ApprovalEntry);
            until ApprovalEntry.Next() = 0;
            if RecRef.Get(ApprovalEntry."Record ID to Approve") then
                VarVariant := RecRef;
            ApprovalMgt.OnCancelDocApprovalRequest(VarVariant);
        end;
    end;


    procedure HRTrainingAppInsert(ApplicationCode: Code[50]; CourseCode: Code[50]; Description: Text[100]; Location: Text[100]; ResponsibilityCenter: Code[20]; NoOfParticipant: Integer; PurposeOfTraining: Text[100]; FromDate: Date; ToDate: Date; Duration: Decimal; DurationUnits: Decimal; EmployeeNo: Code[20]; Provider: Code[10]; ProviderName: Text[150]; ApplicationDate: DateTime; TableID: Integer; EmployeeName: Text[100]; DurationFormula: DateFormula; CostOfTraining: Decimal; "User ID": Code[50]; EmpGrade: Code[20]; Sponsor: Text[20]; "Training Type": Option; "Training Category": Option Individual,"Group Training"; CourseRecommendations: Text[5]; LastTrainingAttended: Text[250]; TimeLastTrainingAttended: Text[30]; Comments: Text[250]; LastAttendFrom: Date; LastAttendTo: Date) TrainingNewDocNo: Code[20]
    begin

        begin

            TrainingApplications.Reset();

            TrainingApplications."Course Title" := CourseCode;
            //TrainingApplications.VALIDATE("Course Title");

            TrainingApplications."Course Description" := Description;

            TrainingApplications."Responsibility Center" := ResponsibilityCenter;
            TrainingApplications.Validate("Responsibility Center");

            TrainingApplications."Start Date" := FromDate;
            TrainingApplications.Validate("Start Date");

            TrainingApplications."End Date" := ToDate;
            TrainingApplications.Validate("End Date");

            TrainingApplications."Training Institution" := ProviderName;
            TrainingApplications."Training Venue" := Location;

            TrainingApplications."Employee Grade" := EmpGrade;

            TrainingApplications.Duration := DurationFormula;
            TrainingApplications.Validate(Duration);

            TrainingApplications."Employee No_" := EmployeeNo;
            TrainingApplications."Employee Name" := EmployeeName;

            TrainingApplications."Application Date" := Today;
            TrainingApplications."Training Cost Cstimated" := CostOfTraining;
            TrainingApplications.UserId := "User ID";
            TrainingApplications."Training Type" := "Training Type";
            TrainingApplications.Training_Category := "Training Category";
            TrainingApplications.Sponsor := Sponsor;
            TrainingApplications."Last training" := LastTrainingAttended;
            TrainingApplications."Time Last Training Attended" := TimeLastTrainingAttended;
            TrainingApplications."Part of Recommended Trainning" := CourseRecommendations;
            TrainingApplications.Comments := Comments;
            TrainingApplications."Last Attend From" := LastAttendFrom;
            TrainingApplications."Last Attend To" := LastAttendTo;


            TrainingApplications.Insert(true);
            TrainingNewDocNo := TrainingApplications."Application No";


            HRTrainingLinesParticipantsInsert(TrainingNewDocNo, EmployeeNo, true);
            SumbitTrainingForApproval(TrainingNewDocNo, "User ID");

        end
    end;

    procedure InsertEmployeedependants(EmploNo: code[40]; fullKName: Text; DOB: Date; Type: Option "Next of Kin",Beneficiary,Dependant,Spouse,Siblings,"In-Laws",Parent; IDN0: Code[30]; Relationship: Text; PhoneNum: Code[30]; Email: Text; Shares: Decimal; DocNo: code[30]): Code[30]
    var
        myInt: Integer;
        HREmpQualChanges: Record "HR Employee Staff Changes";
        SeriesSetup: Record "HR Setup";
        NextOfKinApp: Record "Next Of KIn Application";
        Inserted: Boolean;
        NewNom: Code[20];
        NewNoSeriesCode: Code[20];
        NextNUm: Integer;

    begin
        HREmpQualChanges.Reset();
        HREmpQualChanges.SetRange("No.", DocNo);
        if HREmpQualChanges.FindFirst() then begin
            NextOfKinApp.Reset();
            if NextOfKinApp.FindLast() then begin
                NextNUm := NextOfKinApp."Entry No" + 1;
                NextOfKinApp.Init;
                NextOfKinApp."Entry No" := NextOfKinApp."Entry No" + 1;
                NextOfKinApp."Employee Code" := EmploNo;
                NextOfKinApp."Full Name" := fullKName;
                NextOfKinApp."Entry No" := NextNUm;
                NextOfKinApp.Relationship := Relationship;
                NextOfKinApp.Type := Type;
                NextOfKinApp."Date of Birth" := DOB;
                NextOfKinApp."E-mail" := Email;
                NextOfKinApp."Home Tel No" := PhoneNum;
                NextOfKinApp."Percentage Shares" := Shares;
                NextOfKinApp."ID No/Passport No" := IDN0;
                NextOfKinApp.Insert;
                exit(DocNo)
            end Else
                Error('UPLOAD FAIL');
        end;
        HREmpQualChanges.Reset();
        if HREmpQualChanges.FindLast() then begin
            HREmpQualChanges.Init();
            SeriesSetup.Get;
            SeriesSetup.TestField(SeriesSetup."Staff Emp Changes");
            NoSeriesMgt.InitSeries(SeriesSetup."Staff Emp Changes", SeriesSetup."Staff Emp Changes", 0D, NewNom, NewNoSeriesCode);
            HREmpQualChanges."Employee No" := EmploNo;
            HREmpQualChanges."No." := NewNom;
            HREmpQualChanges.Validate(HREmpQualChanges."Employee No");
            Inserted := true;
            HREmpQualChanges.Insert(true);
            if Inserted = true then begin
                NextOfKinApp.Reset();
                if NextOfKinApp.FindLast() then
                    NextNUm := NextOfKinApp."Entry No" + 1;
                NextOfKinApp.Init;
                NextOfKinApp."Entry No" := NextOfKinApp."Entry No" + 1;
                NextOfKinApp."Employee Code" := EmploNo;
                NextOfKinApp."Full Name" := fullKName;
                NextOfKinApp."Entry No" := NextNUm;
                NextOfKinApp.Relationship := Relationship;
                NextOfKinApp.Type := Type;
                NextOfKinApp."Date of Birth" := DOB;
                NextOfKinApp."E-mail" := Email;
                NextOfKinApp."Home Tel No" := PhoneNum;
                NextOfKinApp."Percentage Shares" := Shares;
                NextOfKinApp."ID No/Passport No" := IDN0;
                NextOfKinApp.Insert;
                exit(NewNom)
            end
            else
                Error('UPLOAD FAIL');
        end else begin
            HREmpQualChanges.Init();
            SeriesSetup.Get;
            SeriesSetup.TestField(SeriesSetup."Staff Emp Changes");
            NoSeriesMgt.InitSeries(SeriesSetup."Staff Emp Changes", SeriesSetup."Staff Emp Changes", 0D, NewNom, NewNoSeriesCode);
            HREmpQualChanges."No." := NewNom;
            HREmpQualChanges."Employee No" := EmploNo;
            HREmpQualChanges.Validate(HREmpQualChanges."Employee No");
            Inserted := true;
            HREmpQualChanges.Insert(true);
            if Inserted = true then begin
                NextOfKinApp.Reset();
                if NextOfKinApp.FindLast() then
                    NextNUm := NextOfKinApp."Entry No" + 1;
                NextOfKinApp.Init;
                NextOfKinApp."Entry No" := NextOfKinApp."Entry No" + 1;
                NextOfKinApp."Employee Code" := EmploNo;
                NextOfKinApp."Full Name" := fullKName;
                NextOfKinApp."Entry No" := NextNUm;
                NextOfKinApp.Relationship := Relationship;
                NextOfKinApp.Type := Type;
                NextOfKinApp."Date of Birth" := DOB;
                NextOfKinApp."E-mail" := Email;
                NextOfKinApp."Home Tel No" := PhoneNum;
                NextOfKinApp."Percentage Shares" := Shares;
                NextOfKinApp."ID No/Passport No" := IDN0;
                NextOfKinApp.Insert;
                exit(NewNom);
            end else
                Error('UPLOAD FAIL');
        end;

    end;

    procedure InsertEmployeePromotions(EmploNo: code[40]; EffectDate: Date; StaffID: Text; NewDesig: Code[30]; Paypereiod: Date; Reason: Text): Text
    var
        myInt: Integer;
        Promotioheader: Record "HR Promo. Recommend Header";
        Promolines: Record "HR Promo. Recommend Lines";
        Inserted: Boolean;
        NewNom: Code[20];
        NewNoSeriesCode: Code[20];
        NextNUm: Integer;
        SeriesSetup: Record "HR Setup";
        LineNo: Integer;

    begin
        Promotioheader.Reset();
        Promotioheader.Init();
        SeriesSetup.Get;
        Inserted := false;
        SeriesSetup.TestField(SeriesSetup."Employee Promotion No.");
        NoSeriesMgt.InitSeries(SeriesSetup."Employee Promotion No.", SeriesSetup."Employee Promotion No.", 0D, NewNom, NewNoSeriesCode);
        Promotioheader.No := NewNom;
        Promotioheader."Created By" := StaffID;
        Promotioheader."Date of Recommendation" := Today;
        Inserted := true;
        Promotioheader.Insert();
        if Inserted = true then begin
            Promolines.Reset();
            if Promolines.FindLast() then begin
                LineNo := Promolines."Line No." + 1;
                Promolines.Init();
                Promolines."Line No." := LineNo;
                Promolines."Employee No." := EmploNo;
                Promolines.Validate("Employee No.");
                Promolines."Document No" := Promotioheader.No;
                Promolines."Effective Date Of Transfer" := EffectDate;
                Promolines."From payroll Period" := Paypereiod;
                Promolines."New Job ID" := NewDesig;
                Promolines.Validate("New Job ID");
                Promolines.Reason := Reason;
                Promolines.Insert();
            end;
        end;
        if Inserted = true then
            exit(NewNom);



    end;


    procedure HRTrainingAppModify(ApplicationCode: Code[50]; CourseCode: Code[50]; Description: Text[100]; Location: Text[100]; ResponsibilityCenter: Code[20]; NoOfParticipant: Integer; PurposeOfTraining: Text[100]; FromDate: Date; ToDate: Date; Duration: Decimal; DurationUnits: Decimal; EmployeeNo: Code[20]; Provider: Code[10]; ProviderName: Text[150]; ApplicationDate: DateTime; TableID: Integer; EmployeeName: Text[100]; DurationFormula: DateFormula; CostOfTraining: Decimal; "User ID": Code[50]; EmpGrade: Code[20]; Sponsor: Text[20]; "Training Type": Option; "Training Category": Option Individual,"Group Training"; CourseRecommendations: Text[5]; LastTrainingAttended: Text[250]; TimeLastTrainingAttended: Text[30]; Comments: Text[250]; LastAttendFrom: Date; LastAttendTo: Date) TrainingNewDocNo: Code[20]
    begin

        TrainingApplications.Reset();

        TrainingApplications.SetRange(TrainingApplications."Application No", ApplicationCode);

        TrainingApplications."Course Title" := CourseCode;
        TrainingApplications.Validate("Course Title");

        TrainingApplications."Course Description" := Description;

        TrainingApplications."Responsibility Center" := ResponsibilityCenter;
        TrainingApplications.Validate("Responsibility Center");

        TrainingApplications."Start Date" := FromDate;
        TrainingApplications.Validate("Start Date");

        TrainingApplications."End Date" := ToDate;
        TrainingApplications.Validate("End Date");

        TrainingApplications."Training Institution" := ProviderName;
        TrainingApplications."Training Venue" := Location;

        TrainingApplications."Employee Grade" := EmpGrade;

        TrainingApplications.Duration := DurationFormula;
        TrainingApplications.Validate(Duration);

        TrainingApplications."Employee No_" := EmployeeNo;
        TrainingApplications."Employee Name" := EmployeeName;

        TrainingApplications."Application Date" := Today;
        TrainingApplications."Training Cost Cstimated" := CostOfTraining;
        TrainingApplications.UserId := "User ID";
        TrainingApplications."Training Type" := "Training Type";
        TrainingApplications.Training_Category := "Training Category";
        TrainingApplications.Sponsor := Sponsor;
        TrainingApplications."Last training" := LastTrainingAttended;
        TrainingApplications."Time Last Training Attended" := TimeLastTrainingAttended;
        TrainingApplications."Part of Recommended Trainning" := CourseRecommendations;
        TrainingApplications.Comments := Comments;
        TrainingApplications."Last Attend From" := LastAttendFrom;
        TrainingApplications."Last Attend To" := LastAttendTo;

        if TrainingApplications.Find('-') then
            TrainingApplications.Modify()
        else
            TrainingApplications.Insert();

        TrainingNewDocNo := TrainingApplications."Application No";


        HRTrainingLinesParticipantsInsert(TrainingNewDocNo, EmployeeNo, true);
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

    procedure ConvertBase64topdf(DocNo: Code[30]; Base64String: Text)
    var
        BinaryData: Codeunit "Base64 Convert";
        PDFStream: File;
        PDFFileName: Text;
        Tempblob: Codeunit "Temp Blob";
        HrEmployee: Record "HR Employees";
    begin

        MESSAGE('PDF file successfully created: %1', PDFFileName);
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
        /*{
        StoresReqHeader.RESET;
        StoresReqHeader.SETRANGE(StoresReqHeader."No.",STR_Doc_No);
        IF(StoresReqHeader.FIND('-')) THEN
        BEGIN

          appMngt.SendSRequestApprovalRequest(StoresReqHeader);

          //UNTIL StoresReqHeader.NEXT=0;
        END
          }*/

    end;


    procedure CancelStoresApprovalReq(STR_Doc_No: Code[20])
    begin
        /*{
        StoresReqHeader.RESET;
        StoresReqHeader.SETRANGE(StoresReqHeader."No.",STR_Doc_No);
        IF(StoresReqHeader.FIND('-')) THEN REPEAT

                appMngt.CancelSRRequestApprovalRequest(StoresReqHeader,TRUE,TRUE)

        UNTIL StoresReqHeader.NEXT=0;
        }*/

    end;


    procedure DocumentHeader("Document Type": Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"; "Buy from Vendor No": Code[20]; "Pay to Vendor No": Code[20]; No: Code[20]; "Posting Description": Text[50]; "Responsibility Center": Code[20]; "Shortcut Dimension 1 Code": Code[20]; "Shortcut Dimension 2 Code": Code[20]; "Location code": Code[20]; "Order Date": Date; "Document Date": Date; "Requested Receipt Date": Date; "Expected Receipt Date": Date; "User ID": Code[20]; "Requestor User ID": Code[20]; DocApprovalType: Option Purchase,Requisition,Quote,Request; TransactionType: Option New,Modify,Delete,Cancel; "Requested By": Text[50]) PRF_No: Code[20]
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
                    //appMngt.CancelPurchaseApprovalRequest(PurchaseHeader, true, true);


                end;

        end;
    end;


    procedure HRAppraisalHeaderInsert("Appraisal Type": Code[50]; "Appraisal Period": Code[100]; Status: Integer; EmployeeNo: Code[50]; SupervisorNo: Code[150]; PeerNo: Code[150]; UserId: Code[250]; EmplName: Text[100]; JobTitle: Text[50]; SupervisorName: Text[150]; PeerName: Text[150]) HRAppraisalDocNo: Code[20]
    begin

        begin

            HRAppraisalCard.Init();
            HRAppraisalCard."Appraisal Type" := "Appraisal Type";
            HRAppraisalCard."Appraisal Period" := "Appraisal Period";
            HRAppraisalCard.Status := Status;
            HRAppraisalCard."Employee No" := EmployeeNo;
            HRAppraisalCard.Supervisor := SupervisorNo;
            HRAppraisalCard."Second Supervisor" := PeerNo;
            HRAppraisalCard."User ID" := UserId;
            HRAppraisalCard."Employee Name" := EmplName;
            HRAppraisalCard."Job Title" := JobTitle;
            HRAppraisalCard."Supervisor Name" := SupervisorName;
            HRAppraisalCard.Insert(true);
            HRAppraisalDocNo := HRAppraisalCard."Appraisal No"
        end
    end;


    procedure GeneratePayslipReport(EmployeeNo: Code[20]; PeriodMonth: Text; PeriodYear: Text; filenameFromApp: Text[50]): Text
    var
        "Employee Card": Record "HR Employees";
        PRSalaryCard: Record "PR Salary Card";
        SelectedPeriod: Date;
        PeriodDay: Text;
        MyDate: Date;
        PRPeriod: Record "PR Payroll Periods";
        BlobInStream: InStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        FileContentsB64: Text;
        BlobOutStream: OutStream;
        RecRef: RecordRef;
        filename: text;

    begin
        //Convert to date
        PeriodDay := '01';
        Evaluate(SelectedPeriod, PeriodMonth + '/' + PeriodDay + '/' + PeriodYear);
        HRSetup.Get();
        HRSetup.TestField("Portal Files Path");
        filename := HRSetup."Portal Files Path" + filenameFromApp + '.pdf';
        //filename := FilePath + filenameFromApp + '.pdf';

        //filename := FILESPATH_TEST + filenameFromApp+'.pdf';
        if Exists(filename) then
            Erase(filename);
        TempBlob.CreateInStream(BlobInStream);
        TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
        PRSalaryCard.Reset();
        PRSalaryCard.SetRange(PRSalaryCard."Employee Code", EmployeeNo);
        PRSalaryCard.SetRange(PRSalaryCard."Period Filter", SelectedPeriod);
        if PRSalaryCard.Find('-') then begin
            RecRef.GetTable(PRSalaryCard);
            // Report.SaveAsPdf(Report::"PR Individual Payslip Portal", filename, PRSalaryCard);
            Report.SaveAs(Report::"PR Individual Payslip Portal", '', ReportFormat::Pdf, BlobOutStream, RecRef);
            FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
            exit(FileContentsB64);
        end;
    end;

    procedure GeneratePayslipReport_TEST(EmployeeNo: Code[20]; Period: Date; filenameFromApp: Text[50]) filename: Text[150]
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
            filename := FILESPATH_TEST + filenameFromApp + '.pdf';
            if Exists(filename) then
                Erase(filename);

            /*
            "Employee Card".SETRANGE("Employee Card"."No.",EmployeeNo);
            "Employee Card".SETRANGE("Employee Card"."Period Filter",Period);
            //"Employee Card".SETRANGE("Employee Card"."Period Filter",'010116');
             IF "Employee Card".FIND('-') THEN
             */

            PRSalaryCard.SetRange(PRSalaryCard."Employee Code", EmployeeNo);
            PRSalaryCard.SetRange(PRSalaryCard."Period Filter", Period);
            if PRSalaryCard.Find('-') then;
            //   Report.SaveAsPdf(Report::"PR Individual Payslip", filename, PRSalaryCard);

            exit(filename);
        end;

    end;


    procedure ApplicantProfileInsert(IdNo: Integer; Email: Text[50]; FirstName: Text[50]; MiddleName: Text[50]; LastName: Text[50]) InsertSuccess: Boolean
    begin

        begin

            InsertSuccess := false;

            ApplicantProfile.Reset();
            ApplicantProfile.SetRange(ApplicantProfile.IdNo, IdNo);
            if ApplicantProfile.Find('-')
              then begin
                InsertSuccess := true;
                exit(InsertSuccess);
            end

            else begin

                ApplicantProfile.Init();
                ApplicantProfile.IdNo := IdNo;
                ApplicantProfile.Email := Email;
                ApplicantProfile.FirstName := FirstName;
                ApplicantProfile.MiddleName := MiddleName;
                ApplicantProfile.LastName := LastName;

                ApplicantProfile.Insert(true);

                InsertSuccess := true;

            end

        end
    end;


    procedure HRTransportAppInsert(DaysApplied: Decimal; StartDate: Date; ReturnDate: Date; ApplicationDate: Date; Status: Integer; FromDestination: Text[150]; ToDestination: Text[150]; PurposeOfTrip: Text[150]; Names: Text[150]; ReturnFrom: Text[150]; ReturnTo: Text[150]; pickupTimeTrip: Time; pickupTimeReturn: Time; EmployeeNo: Code[20]; RespCenter: Code[30]; UserId: Code[50]; Hotel: Text[50]; comments: Text[250]; refNo: Code[30]; "No Of Empl": Integer) TransportReqNo: Code[50]
    begin
        HRTransportReq.Reset();

        HRTransportReq.SetRange(HRTransportReq."Employee No", EmployeeNo);
        HRTransportReq.SetRange(HRTransportReq.Status, HRTransportReq.Status::New);

        if HRTransportReq.Find('+') then
            TransportReqNo := HRTransportReq."Transport Request No"

        else begin
            HRTransportReq.Reset();

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
            HRTransportReq."Responsibility Center" := RespCenter;
            HRTransportReq."User ID" := UserId;
            HRTransportReq.Hotel := Hotel;
            HRTransportReq."Applicant Comments" := comments;
            HRTransportReq."Reference No." := refNo;
            HRTransportReq."Number of Employees" := "No Of Empl";

            HRTransportReq.Insert(true);
            TransportReqNo := HRTransportReq."Transport Request No";

        end
    end;


    procedure HRTransportAppModify("Transport Request No": Code[50]; DaysApplied: Decimal; StartDate: Date; Status: Integer; FromDestination: Text[150]; ToDestination: Text[150]; PurposeOfTrip: Text[150]; Names: Text[150]; ReturnFrom: Text[150]; ReturnTo: Text[150]; pickupTimeTrip: Time; EmployeeNo: Code[20]; RespCenter: Code[30]; UserId: Code[50]; County: Text[50]; comments: Text[250]; refNo: Code[30]): Text
    begin
        HRTransportReq.Reset();
        HRTransportReq.SetRange(HRTransportReq."Transport Request No", "Transport Request No");
        if HRTransportReq.Find('-') then begin
            HRTransportReq."Start Date" := StartDate;
            HRTransportReq."Days Applied" := DaysApplied;
            HRTransportReq.Validate("Days Applied");
            HRTransportReq."Application Date" := today;
            //HRTransportReq.Status := Status;
            HRTransportReq."Trip From Destination" := FromDestination;
            HRTransportReq."Trip To Destination" := ToDestination;
            HRTransportReq."Purpose of Trip" := PurposeOfTrip;
            HRTransportReq.Names := Names;
            HRTransportReq."Trip Return Pickup From" := ReturnFrom;
            HRTransportReq."Trip Return Destination" := ReturnTo;
            HRTransportReq."Time of Trip" := pickupTimeTrip;
            HRTransportReq."Employee No" := EmployeeNo;
            HRTransportReq."Responsibility Center" := RespCenter;
            HRTransportReq."User ID" := UserId;
            HRTransportReq."Captured by" := UserId;
            HRTransportReq.County := County;
            HRTransportReq.Validate(HRTransportReq.County);
            HRTransportReq."Applicant Comments" := comments;
            HRTransportReq."Reference No." := refNo;
            HRTransportReq.Modify();
            SubmitTransportRequestForApproval(HRTransportReq."Transport Request No", UserId);
            Message('Submitted successfully');
        end
        else
            Error('Document No must have a value');
    end;

    procedure SubmitTransportRequestForApproval(ApplicationNo: Code[10]; UserID: Text): Text
    var
        Passngerline: Record "HR Transport Requisition Line";
        TransportAloo: Record "HR Transport Allocations H";
        Passngerrs: Integer;
        Capacity: Integer;
    begin
        HRTransportReq.Reset();
        HRTransportReq.SetRange(HRTransportReq."Transport Request No", ApplicationNo);
        if HRTransportReq.FindFirst() then begin
            Passngerline.Reset();
            Passngerline.SetRange(Passngerline."Requisition No", HRTransportReq."Transport Request No");
            if Passngerline.FindFirst() then begin
                Passngerrs := Passngerline.Count;
                TransportAloo.Reset();
                TransportAloo.SetRange(TransportAloo."Transport Allocation No", HRTransportReq."Transport Request No");
                if TransportAloo.FindFirst() then begin
                    TransportAloo.CalcSums(TransportAloo."Passenger Capacity");
                    Capacity := TransportAloo."Passenger Capacity";
                end Else
                    Error('kindly allocate the transport allocations');
                if Passngerrs > Capacity then
                    Error('Add another vehicle to be allocated');
                VarVariant := HRTransportReq;
                if ApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
                    ApprovalMgt.OnSendDocForApproval(VarVariant);
                exit('Approval Sent successfully')
            end else
                Error('Requests must have atleast one line');
        end;

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
            //appMngt.DelegateApprovalRequest(ApprovalEntry);

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

        StaffAdvance.Reset();
        StaffAdvance.SetRange(StaffAdvance."No.", Staff_Advance_No);
        if StaffAdvance.Find('-') then begin
            VarVariant := StaffAdvance;
            ApprovalMgt.OnSendDocForApproval(VarVariant);
            //appMngt.SendSalAdvanceAppApprovalReq(StaffAdvance);
        end;
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

        HRCommentLines.Reset();
        HREmployees.Reset();

        HREmployees.SetRange(HREmployees."No.", EmployeeNo);

        if HREmployees.Find('-') then
            EmployeeName := HREmployees."Full Name";
        begin

            HRCommentLines."Application Code" := DocumentNo;
            HRCommentLines."User ID" := UserID;
            HRCommentLines."Approver Comments" := Comments;
            HRCommentLines."Employee No" := EmployeeNo;
            HRCommentLines."Date Modified" := CurrentDateTime;
            HRCommentLines."Approver Name" := EmployeeName;

            HRCommentLines.Insert(false);

        end;
    end;


    procedure HR_Leave_Relievers("Document No": Code[20]; "Pending Assignment": Text[250]; "Reliever No": Text[30]; "Reliever Name": Text[150]; "Applicant No": Text[30])
    begin


        HRLeaveRelieversRecord.Reset();

        begin

            HRLeaveRelieversRecord."Document No" := "Document No";
            HRLeaveRelieversRecord."Pending Assignment" := "Pending Assignment";
            HRLeaveRelieversRecord."Reliever No" := "Reliever No";
            HRLeaveRelieversRecord."Reliever Name" := "Reliever Name";
            HRLeaveRelieversRecord."Applicant No" := "Applicant No";

            HRLeaveRelieversRecord.Insert(true);

        end
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
                //  appMngt.ApproveApprovalRequest(ApprovalEntry);

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
            //  appMngt.RejectApprovalRequest(ApprovalEntry);
            until ApprovalEntry.Next() = 0;
    end;


    procedure ValidateNetworkServiceCredentials(UserID: Code[20])
    begin

        tblOnlineSessions.Reset();
        tblOnlineSessions.Init();
    end;


    procedure OnlineSessionInsert(UserName: Code[20]; SessionID: Text[100])
    begin

        tblOnlineSessions.Reset();

        tblOnlineSessions."User Name" := UserName;
        tblOnlineSessions."Session ID" := SessionID;
        tblOnlineSessions."Login Time" := CurrentDateTime;
        tblOnlineSessions."Logout Time" := CurrentDateTime;
        tblOnlineSessions."Login Duration" := 0;
        tblOnlineSessions.IsActive := true;
        tblOnlineSessions.Insert(true);
    end;


    procedure HRTrainingLinesParticipantsInsert(TrainingDocApplicationNo: Code[20]; EmployeeNo: Code[20]; Suggested: Boolean)
    begin

        HRTrainingApplicationLineParticipants.Reset();

        HRTrainingApplicationLineParticipants."Application No." := TrainingDocApplicationNo;
        HRTrainingApplicationLineParticipants."Employee No." := EmployeeNo;
        HRTrainingApplicationLineParticipants.Validate("Employee No.");

        HRTrainingApplicationLineParticipants.Suggested := Suggested;

        HRTrainingApplicationLineParticipants.Insert(true);
    end;


    procedure SaveBackToOfficeReport(DocumentNo: Code[20]; StartDate: Date; EndDate: Date; Comments: Text[250]; EmployeeNo: Text[50]; txt1: Text[250]; txt2: Text[250]; txt3: Text[250]; txt4: Text[250]; txt5: Text[250]; txt6: Text[250]; TrainingApplicationCode: Code[20])
    begin

        TrainingApplications.Reset();
        HRTraninigBackToOffice.Reset();

        //fetch original training and insert the data. Add field specific details in portal

        TrainingApplications.SetRange(TrainingApplications."Application No", DocumentNo);
        if TrainingApplications.Find('-') then begin

            //HRTraninigBackToOffice."Document No" := DocumentNo;
            HRTraninigBackToOffice."Course Title" := TrainingApplications."Course Title";
            HRTraninigBackToOffice.Validate(HRTraninigBackToOffice."Course Title");

            HRTraninigBackToOffice."Employee No." := TrainingApplications."Employee No_";
            HRTraninigBackToOffice."From Date" := StartDate;
            HRTraninigBackToOffice."To Date" := EndDate;
            HRTraninigBackToOffice.Status := HRTraninigBackToOffice.Status::"Pending Approval";

            HRTraninigBackToOffice."Text 1" := txt1;
            HRTraninigBackToOffice."Text 2" := txt2;
            HRTraninigBackToOffice."Text 3" := txt3;
            HRTraninigBackToOffice."Text 4" := txt4;
            HRTraninigBackToOffice."Text 5" := txt5;
            HRTraninigBackToOffice."Text 6" := txt6;

            HRTraninigBackToOffice."Training Application No" := TrainingApplicationCode;

            HRTraninigBackToOffice.Insert(true);

        end
    end;


    procedure OnlineUserResetActivityInsert(OnlineUserName: Code[20])
    var
        EmpFullName: Text[150];
    begin
        begin
            OnlineUserResetActivity.Reset();
            HREmployees.Reset();

            HREmployees.SetRange(HREmployees."No.", OnlineUserName);
            if HREmployees.Find('-') then
                EmpFullName := HREmployees."Full Name";

            OnlineUserResetActivity."User Name" := OnlineUserName;
            OnlineUserResetActivity."Last Modified" := CurrentDateTime;
            OnlineUserResetActivity.Name := EmpFullName;

            OnlineUserResetActivity.Insert(true);

        end;
    end;

    procedure FnCaseAppeal(CaseNumber: Code[40])
    var
        myInt: Integer;
        HrCaseWitness: Record "Hr Case Witness";
        Cases: Record "HR Disciplinary Cases";
        HrDiscipl: Record "HR Disciplinary Cases NCA";
    begin
        if HrDiscipl.Get(CaseNumber) then begin
            Cases.Reset();
            Cases.SetRange(Cases."Case Number", HrDiscipl."Case Number");
            //  Cases.SetRange("Employee No", Rec."Employee No");
            if Cases.FindSet() then
                Cases.Init();
            Cases."Case Number" := '';
            //   Cases."Accuser Is Staff" := Rec."Accuser Is Staff";
            Cases.Accuser := HrDiscipl.Accuser;
            Cases.Type := Cases.Type::Disciplinary;
            Cases."Created By" := UserId;

            Cases."Mode of Lodging the Complaint" := HrDiscipl."Mode of Lodging the Complaint";
            // Cases."Type of Disciplinary Case" := Rec."Type of Disciplinary Case";
            Cases."Responsibility Center" := HrDiscipl."Responsibility Center";
            // Cases."Case Description" := 'Appeal for case for ' + Rec."Case Description";
            Cases."Disciplinary Case Type" := Cases."Disciplinary Case Type"::Appeal;
            Cases.Insert(true);
            HrCaseWitness.Reset();
            HrCaseWitness.SetRange("Case Number", HrDiscipl."Case Number");
            if HrCaseWitness.Find('-') then
                repeat
                    HrCaseWitness.Init();
                    HrCaseWitness."Line No" := HrCaseWitness."Line No" + 100;
                    HrCaseWitness."Case Number" := Cases."Case Number";
                    HrCaseWitness."Witness is Staff" := HrCaseWitness."Witness is Staff";
                    HrCaseWitness."Employee No" := HrCaseWitness."Employee No";
                    HrCaseWitness."Witness Number" := HrCaseWitness."Witness Number";
                    HrCaseWitness."Witness Name" := HrCaseWitness."Witness Name";
                    HrCaseWitness."Witness Statement" := HrCaseWitness."Witness Statement";
                    HrCaseWitness.Insert();
                until HrCaseWitness.Next() = 0;
            // Rec.Status := Rec.Status::Appealed;
            HrDiscipl.Appealed := true;
            HrDiscipl."Disciplinary Stage Status" := HrDiscipl."Disciplinary Stage Status"::"Under review";
            //Rec."Appealed case No" := Cases."Case Number";
            HrDiscipl.Modify(true);
        end;
        Message('Appeal Case Created');
    end;

    procedure CalcReturnDate(LVStartDate: Date; LVDaysApplied: Decimal; LeaveType: Code[30]) LVReturnDate: Date
    begin

        LVReturnDate := HRLeave.DetermineLeaveReturnDate_Portal(LVStartDate, LVDaysApplied, LeaveType);
        //LVReturnDate := HRLeave.DetermineLeaveReturnDate(LVStartDate,LVDaysApplied,LeaveType);
    end;


    procedure GetAllocatedLeaveDays(EmployeeNo: Code[20])
    begin
    end;


    procedure SaveRelevantApplicantDocuments(RDApplicantNo: Integer; RDHelbCertificate: Integer; RDGoodConductCertificate: Integer; RDCRBCertificate: Integer; RDEACCCertificate: Integer; RDKRAPinCertificate: Integer)
    begin
        ApplicantRelevantDocuments.Reset();

        ApplicantRelevantDocuments.SetRange(ApplicantRelevantDocuments."Applicant No", RDApplicantNo);
        if ApplicantRelevantDocuments.Find('-') then begin

            ApplicantRelevantDocuments."Helb Certificate" := VerifyIntegerAsBoolean(RDHelbCertificate);
            ApplicantRelevantDocuments."Good Conduct Certificate" := VerifyIntegerAsBoolean(RDGoodConductCertificate);
            ApplicantRelevantDocuments."CRB Certificate" := VerifyIntegerAsBoolean(RDCRBCertificate);
            ApplicantRelevantDocuments."EACC Certificate" := VerifyIntegerAsBoolean(RDEACCCertificate);
            ApplicantRelevantDocuments."KRA Pin Certificate" := VerifyIntegerAsBoolean(RDKRAPinCertificate);

            ApplicantRelevantDocuments."Date Modified" := Today;

            ApplicantRelevantDocuments.Modify();

        end
        else begin

            ApplicantRelevantDocuments."Applicant No" := RDApplicantNo;

            ApplicantRelevantDocuments."Helb Certificate" := VerifyIntegerAsBoolean(RDHelbCertificate);
            ApplicantRelevantDocuments."Good Conduct Certificate" := VerifyIntegerAsBoolean(RDGoodConductCertificate);
            ApplicantRelevantDocuments."CRB Certificate" := VerifyIntegerAsBoolean(RDCRBCertificate);
            ApplicantRelevantDocuments."EACC Certificate" := VerifyIntegerAsBoolean(RDEACCCertificate);
            ApplicantRelevantDocuments."KRA Pin Certificate" := VerifyIntegerAsBoolean(RDKRAPinCertificate);

            ApplicantRelevantDocuments."Date Modified" := Today;

            ApplicantRelevantDocuments.Insert(true);

        end;
    end;


    procedure VerifyIntegerAsBoolean(intElement: Integer) VarAsBool: Boolean
    begin

        if (intElement = 1) then
            VarAsBool := true
        else
            if (intElement = 0) then begin
                VarAsBool := false;

                exit(VarAsBool);

            end;
    end;


    procedure fn_CheckReliever(Apl_No: Code[30]; Apl_StartDate: Date; Apl_EndDate: Date; Rel_No: Code[100])
    var
        Rel_StartDate: Date;
        Rel_EndDate: Date;
        Rel_ReturnDate: Date;
        HRLeaveApp: Record "HR Leave Application";
        HRLeaveRelievers: Record "HR Leave Relievers";
        ERROR_RELIVER: Label 'You cannot select this reliever [ %1 ] because he will be relieving Employee No [ %2 ] during the following date [ %3 to %4 ]';
    begin
        //Check if reliever is relieving staff whose Leave Application is PENDING APPROVAL
        HRLeaveApp.Reset();
        HRLeaveApp.SetRange(HRLeaveApp.Status, HRLeaveApp.Status::"Pending Approval");
        if HRLeaveApp.Find('-') then
            repeat
                HRLeaveRelievers.Reset();
                HRLeaveRelievers.SetRange(HRLeaveRelievers."Document No", HRLeaveApp."Application Code");
                HRLeaveRelievers.SetRange(HRLeaveRelievers."Reliever No", Rel_No);
                if HRLeaveRelievers.Find('-') then
                    Error(ERROR_RELIVER, HRLeaveRelievers."Reliever No", Apl_No, HRLeaveApp."Start Date", HRLeaveApp."End Date");
            until HRLeaveApp.Next() = 0;

        //Check if the reliever is relieving staff whose leave Application is APPROVED
    end;


    procedure HRReturnFromLeave(ApplicationCode: Code[20]; EmployeeNo: Code[20])
    begin

        HRLeave.Reset();
        HREmployees.Reset();

        HREmployees.SetRange(HREmployees."No.", EmployeeNo);
        if HREmployees.Find('-') then begin

            HRLeave.SetRange(HRLeave."Application Code", ApplicationCode);

            if HRLeave.Find('-') then begin
                HREmployees."On Leave" := false;
                HREmployees.Modify();

                HRLeave."On Leave" := false;
                HRLeave.Modify();
            end;

        end;
    end;

    local procedure SubmitTrainingForApproval("Training Code": Code[50])
    begin
    end;


    procedure IsStartDateValid(StartDate: Date) RetValue: Boolean
    begin

        HRCalendar.Reset();
        HRCalendar.SetRange(HRCalendar.Date, StartDate);
        if HRCalendar.Find('-') then
            if HRCalendar."Non Working" = true then
                exit(true)
            else
                exit(false);
    end;


    procedure ReturnCountyName(DimensionCode: Code[20]; CountyCode: Code[20]) CountyName: Text[50]
    begin
        DimensionValue.Reset();
        DimensionValue.SetRange(DimensionValue."Dimension Code", DimensionCode);
        DimensionValue.SetRange(DimensionValue.Code, CountyCode);
        if DimensionValue.Find('-') then
            CountyName := DimensionValue.Name;
    end;


    procedure RetunResponsibilityCenter(UserName: Code[50]) ResCenter: Text[100]
    begin
        HREmployees.Reset();
        HREmployees.SetRange(HREmployees."No.", UserName);
        if HREmployees.Find('-') then
            ResCenter := HREmp."Responsibility Center";
    end;


    procedure ApplicantEducationBackgroungInsertModify(ApplicantNo: Integer; InstitutionName: Text[200]; Qualifications: Text[100]; StartDate: Date; EndDate: Date; QualificationType: Text[150]; Description: Text[250]; QualificationsCode: Code[150]; QualificationTypeCode: Code[150]; "Grade Attained": Code[50]; RandomMapperEduBackGr: Text[200]; SeriesNo: Integer; QDescription: Text[250]; Category: Option; RenewalDate: Date; CountryRec: Text[250]; OtherGrade: Boolean; Status: Text; FileUrl: Text)
    begin
        //hapa
        ApplicantEducationBackground.Reset();
        ApplicantEducationBackground.SetRange(ApplicantEducationBackground.ID, SeriesNo);
        if ApplicantEducationBackground.Find('-') then begin
            ApplicantEducationBackground.InstitutionName := InstitutionName;
            ApplicantEducationBackground.StartDate := StartDate;
            ApplicantEducationBackground.EndDate := EndDate;
            ApplicantEducationBackground.RenewalDate := RenewalDate;
            ApplicantEducationBackground.Qualifications := Qualifications;
            //ApplicantEducationBackground.QualificationType := Qualifications;
            ApplicantEducationBackground.QualificationType := QualificationType;
            ApplicantEducationBackground.QualificationDescr := QDescription;
            ApplicantEducationBackground.Description := Description;
            ApplicantEducationBackground.QualificationsCode := QualificationsCode;
            ApplicantEducationBackground.QualificationTypeCode := QualificationTypeCode;
            ApplicantEducationBackground.Category := Category;
            ApplicantEducationBackground.QualificationGrade := "Grade Attained";
            ApplicantEducationBackground.RandomMapperEduBackGr := RandomMapperEduBackGr;

            ApplicantEducationBackground."Country Code" := CountryRec;
            ApplicantEducationBackground."Other Grade" := OtherGrade;
            ApplicantEducationBackground.Status := Status;
            ApplicantEducationBackground.Modify();
        end
        else begin
            ApplicantEducationBackground.ID := SeriesNo;
            ApplicantEducationBackground.ApplicantNo := (ApplicantNo);
            ApplicantEducationBackground.InstitutionName := InstitutionName;
            ApplicantEducationBackground.StartDate := StartDate;
            ApplicantEducationBackground.EndDate := EndDate;
            ApplicantEducationBackground.RenewalDate := RenewalDate;
            ApplicantEducationBackground.Qualifications := Qualifications;
            ApplicantEducationBackground.QualificationDescr := QDescription;
            ApplicantEducationBackground.QualificationType := QualificationType;
            ApplicantEducationBackground.Description := Description;
            ApplicantEducationBackground.QualificationsCode := QualificationsCode;
            ApplicantEducationBackground.QualificationTypeCode := QualificationTypeCode;
            ApplicantEducationBackground.Category := Category;
            ApplicantEducationBackground.QualificationGrade := "Grade Attained";
            ApplicantEducationBackground.RandomMapperEduBackGr := RandomMapperEduBackGr;

            ApplicantEducationBackground."Country Code" := CountryRec;
            ApplicantEducationBackground."Other Grade" := OtherGrade;
            ApplicantEducationBackground.Status := Status;
            ApplicantEducationBackground.Insert(true);
        end
    end;


    procedure ReturnLeaveStartDate(AppNo: Code[20]) ReturnDate: Date
    begin
        HRLeave.Reset();
        HRLeave.SetRange(HRLeave."Application Code", AppNo);
        if HRLeave.Find('-') then
            ReturnDate := HRLeave."Start Date";
    end;


    procedure UploadDocumentLeave(DocumentNo: Code[50]; URL1: Text[250]; Descriprion: Text[250]; UserID: Code[132]; Company: Text[250]) LineNo: Integer
    begin
        HRLeave.Reset();
        HRLeave.SetRange(HRLeave."Application Code", DocumentNo);
        if (HRLeave.Find('-')) then begin

            RecordLink.Init();

            RecordLink."Record ID" := HRLeave.MyRecId;
            RecordLink.URL1 := URL1;
            RecordLink.Description := Descriprion;
            RecordLink."User ID" := UserID;
            RecordLink.Company := Company;
            RecordLink.Created := CurrentDateTime;
            //RecordLink."Document No" := DocumentNo;

            RecordLink.Insert(true);

            LineNo := RecordLink."Link ID";

        end
        else
            Error('Leave Document not found!');
    end;


    procedure UploadDocumentTrainingApplication(DocumentNo: Code[50]; URL1: Text[250]; Descriprion: Text[250]; UserID: Code[132]; Company: Text[250]) LineNo: Integer
    begin
        TrainingApplications.Reset();
        TrainingApplications.SetRange(TrainingApplications."Application No", DocumentNo);
        if (TrainingApplications.Find('-')) then begin

            RecordLink.Init();
            RecordLink."Record ID" := TrainingApplications.MyRecId;
            RecordLink.URL1 := URL1;
            RecordLink.Description := Descriprion;
            RecordLink."User ID" := UserID;
            RecordLink.Company := Company;
            RecordLink.Created := CurrentDateTime;
            //RecordLink."Document No" := DocumentNo;
            RecordLink.Insert(true);


            LineNo := RecordLink."Link ID";

        end
        else
            Error('Training Application Document not found!');
    end;


    procedure UploadDocumentTransportRequisition(DocumentNo: Code[50]; URL1: Text[250]; Descriprion: Text[250]; UserID: Code[132]; Company: Text[250]) LineNo: Integer
    begin
        HRTransportReq.Reset();

        HRTransportReq.SetRange(HRTransportReq."Transport Request No", DocumentNo);
        if (HRTransportReq.Find('-')) then begin

            RecordLink.Init();
            RecordLink."Record ID" := HRTransportReq.MyRecId;
            RecordLink.URL1 := URL1;
            RecordLink.Description := Descriprion;
            RecordLink."User ID" := UserID;
            RecordLink.Company := Company;
            RecordLink.Created := CurrentDateTime;
            //RecordLink."Document No" := DocumentNo;
            RecordLink.Insert(true);


            LineNo := RecordLink."Link ID";

        end
        else
            Error('Training Application Document not found!');
    end;


    procedure UploadDocumentSeparation(DocumentNo: Code[50]; URL1: Text[250]; Descriprion: Text[250]; UserID: Code[132]; Company: Text[250]) LineNo: Integer
    begin
        EmployeeSeparation.Reset();
        EmployeeSeparation.SetRange(EmployeeSeparation."Separation No.", DocumentNo);
        if (EmployeeSeparation.Find('-')) then begin

            RecordLink.Init();

            RecordLink."Record ID" := EmployeeSeparation.MyRecId;
            RecordLink.URL1 := URL1;
            RecordLink.Description := Descriprion;
            RecordLink."User ID" := UserID;
            RecordLink.Company := Company;
            RecordLink.Created := CurrentDateTime;
            //RecordLink."Document No" := DocumentNo;

            RecordLink.Insert(true);

            LineNo := RecordLink."Link ID";

        end
        else
            Error('Separation Document not found!');
    end;


    procedure UploadDocumentClearance(DocumentNo: Code[50]; URL1: Text[250]; Descriprion: Text[250]; UserID: Code[132]; Company: Text[250]) LineNo: Integer
    begin
        ClearanceCertificate.Reset();
        ClearanceCertificate.SetRange(ClearanceCertificate."Clearance No.", DocumentNo);
        if (ClearanceCertificate.Find('-')) then begin

            RecordLink.Init();

            RecordLink."Record ID" := ClearanceCertificate.MyRecId;
            RecordLink.URL1 := URL1;
            RecordLink.Description := Descriprion;
            RecordLink."User ID" := UserID;
            RecordLink.Company := Company;
            RecordLink.Created := CurrentDateTime;
            //RecordLink."Document No" := DocumentNo;

            RecordLink.Insert(true);

            LineNo := RecordLink."Link ID";

        end
        else
            Error('Clearance Document not found!');
    end;


    procedure ApplicantSession(UserName: Text[30]; LoginTime: DateTime; LogoutTime: DateTime)
    begin
        ApplicantSessions.Reset();
        begin
            ApplicantSessions.UserName := UserName;
            ApplicantSessions.LoginTime := LoginTime;
            ApplicantSessions.LogoutTime := LogoutTime;
            ApplicantSessions.Insert(true);
        end;
    end;


    procedure ApplicantIsEmployee(IDNo: Code[10]) ReturnValue: Boolean
    begin
        HREmployees.Reset();
        HREmployees.SetRange(HREmployees."ID Number", IDNo);
        if HREmployees.Find('-') then
            exit(true)
        else
            exit(false);
    end;


    procedure ReturnUserEmailAddress(EmailAddress: Text[100]) E_Address: Text[100]
    begin
        ApplicantRegister.Reset();
        ApplicantRegister.SetRange(ApplicantRegister.EmailAddress, EmailAddress);
        if ApplicantRegister.Find('-') then
            E_Address := ApplicantRegister.EmailAddress;
    end;


    procedure ApplicantResetPassword(EmailAddress: Text[200]; password: Text[200])
    begin
        ApplicantRegister.Reset();
        ApplicantRegister.SetRange(ApplicantRegister.EmailAddress, EmailAddress);
        if ApplicantRegister.Find('-') then begin
            ApplicantRegister.EmailAddress := EmailAddress;
            ApplicantRegister.Password := password;
            ApplicantRegister.Modify();
        end
        else
            Error(TextResetPassWordError);
    end;


    procedure ReturnUserName(UserID: Text[30]) UserName: Code[50]
    begin
        ApplicantRegister.Reset();
        ApplicantRegister.SetRange(ApplicantRegister.UserName, UserID);
        if ApplicantRegister.Find('-') then
            UserName := ApplicantRegister.UserName;
    end;


    procedure DeleteAttachmentIDBuffer()
    begin
        AttachmentIDBuffer.DeleteAll();
    end;


    procedure InsertIntoAttachmentIDBuffer(IdPassportNo: Text[50])
    begin
        AttachmentIDBuffer.Reset();
        begin
            AttachmentIDBuffer."ID Number" := IdPassportNo;
            AttachmentIDBuffer.Insert(true);
        end
    end;


    procedure ApplicantProfileInsertModify(FirstName: Text[100]; MiddleName: Text[100]; LastName: Text[100]; MaritalStatus: Option " ",Single,Married,Divorced,Others,Widowed,Separated; DOB: Date; MobileNo: Text[100]; Email: Text[100]; MedicalCondition: Text[250]; IdNo: Integer; Gender: Text; CitizenShip: Text[100]; citizenshipForNonKenyan: Text[100]; "Postal Address": Text[200]; "Physical Address": Text[200]; FLanguageCode: Code[100]; FLanguageDesc: Text[100]; SLanguageCode: Code[100]; SLanguageDesc: Text[100]; ALanguage: Text[100]; FRead: Boolean; FWrite: Boolean; FSpeak: Boolean; SRead: Boolean; SWrite: Boolean; SSpeak: Boolean; ARead: Boolean; AWrite: Boolean; ASpeak: Boolean; CitamRelative: Text; RelativeRelationship: Text[100]; countyOfBirth: Code[100]; countyOfResidence: Code[100]; physicalImpairment: Text[100]; alternativeCont: Text[100]; Religion: Text[100]; MaritalSatusCode: Code[100]; GenderCode: Code[100]; CitizenshipCode: Code[100]; CountyOfBirthCode: Code[100]; CountyOfResidenceCode: Code[100]; HasRelative: Boolean; RelationshipCode: Code[100]; Ethnicity: Text; DisabilityCertNo: Text; Postalcode: Text)
    begin
        ApplicantProfile.Reset();
        ApplicantProfile.SetRange(ApplicantProfile.IdNo, IdNo);
        if ApplicantProfile.Find('-') then begin
            ApplicantProfile.FirstName := FirstName;
            ApplicantProfile.MiddleName := MiddleName;
            ApplicantProfile.LastName := LastName;
            ApplicantProfile.MaritalStatus := MaritalStatus;
            ApplicantProfile.DOB := DOB;
            ApplicantProfile.MobileNo := MobileNo;
            ApplicantProfile.Email := Email;
            ApplicantProfile.MedicalCondition := MedicalCondition;
            ApplicantProfile.IdNo := IdNo;
            if Gender = 'Male' then
                ApplicantProfile.Gender := ApplicantProfile.Gender::Male;
            if Gender = 'Female' then
                ApplicantProfile.Gender := ApplicantProfile.Gender::Female;
            ApplicantProfile.CitizenShip := CitizenShip;
            ApplicantProfile."CitizenShip For Non-Kenyan" := citizenshipForNonKenyan;
            ApplicantProfile."Postal Address" := "Postal Address";
            ApplicantProfile."Physical Address" := "Physical Address";
            ApplicantProfile.FLanguageCode := FLanguageCode;
            ApplicantProfile.FLanguageDesc := FLanguageDesc;
            ApplicantProfile.SLanguageCode := SLanguageCode;
            ApplicantProfile."Alternative Contacts" := alternativeCont;
            ApplicantProfile.SLanguageDesc := SLanguageDesc;
            ApplicantProfile.ALanguage := ALanguage;
            ApplicantProfile.FRead := FRead;
            ApplicantProfile.FWrite := FWrite;
            ApplicantProfile.FSpeak := FSpeak;
            ApplicantProfile.SRead := SRead;
            ApplicantProfile.SWrite := SWrite;
            ApplicantProfile.Speak := SSpeak;
            ApplicantProfile.ARead := ARead;
            ApplicantProfile.AWrite := AWrite;
            ApplicantProfile.ASpeak := ASpeak;
            ApplicantProfile.CitamRelative := CitamRelative;
            ApplicantProfile.RelativeRelationship := RelativeRelationship;
            ApplicantProfile."County Of Birth" := countyOfBirth;
            ApplicantProfile."County Of Residence" := countyOfResidence;
            ApplicantProfile."Physical impairement" := physicalImpairment;
            ApplicantProfile.MaritalSatusCode := MaritalSatusCode;
            ApplicantProfile.GenderCode := GenderCode;
            ApplicantProfile.CitizenshipCode := CitizenshipCode;
            ApplicantProfile.CountyOfBirthCode := CountyOfBirthCode;
            ApplicantProfile.CountyOfResidenceCode := CountyOfResidenceCode;
            ApplicantProfile.RelationshipCode := RelationshipCode;
            ApplicantProfile.HasRelative := HasRelative;
            ApplicantProfile.Tribe := Ethnicity;
            ApplicantProfile.PostalCode := Postalcode;
            ApplicantProfile.DisabilityCertNo := DisabilityCertNo;
            ApplicantProfile.Modify();
        end
        else begin
            ApplicantProfile.FirstName := FirstName;
            ApplicantProfile.MiddleName := MiddleName;
            ApplicantProfile.LastName := LastName;
            ApplicantProfile.MaritalStatus := MaritalStatus;
            ApplicantProfile.DOB := DOB;
            ApplicantProfile.MobileNo := MobileNo;
            ApplicantProfile.Email := Email;
            ApplicantProfile.MedicalCondition := MedicalCondition;
            ApplicantProfile.IdNo := IdNo;
            if Gender = 'Male' then
                ApplicantProfile.Gender := ApplicantProfile.Gender::Male;
            if Gender = 'Female' then
                ApplicantProfile.Gender := ApplicantProfile.Gender::Female;
            ApplicantProfile.CitizenShip := CitizenShip;
            ApplicantProfile."CitizenShip For Non-Kenyan" := citizenshipForNonKenyan;
            ApplicantProfile."Postal Address" := "Postal Address";
            ApplicantProfile."Physical Address" := "Physical Address";
            ApplicantProfile.FLanguageCode := FLanguageCode;
            ApplicantProfile.FLanguageDesc := FLanguageDesc;
            ApplicantProfile.SLanguageCode := SLanguageCode;
            ApplicantProfile."Alternative Contacts" := alternativeCont;
            ApplicantProfile.SLanguageDesc := SLanguageDesc;
            ApplicantProfile.ALanguage := ALanguage;
            ApplicantProfile.FRead := FRead;
            ApplicantProfile.FWrite := FWrite;
            ApplicantProfile.FSpeak := FSpeak;
            ApplicantProfile.SRead := SRead;
            ApplicantProfile.SWrite := SWrite;
            ApplicantProfile.Speak := SSpeak;
            ApplicantProfile.ARead := ARead;
            ApplicantProfile.AWrite := AWrite;
            ApplicantProfile.ASpeak := ASpeak;
            ApplicantProfile.CitamRelative := CitamRelative;
            ApplicantProfile.RelativeRelationship := RelativeRelationship;
            ApplicantProfile."County Of Birth" := countyOfBirth;
            ApplicantProfile."County Of Residence" := countyOfResidence;
            ApplicantProfile."Physical impairement" := physicalImpairment;
            ApplicantProfile.MaritalSatusCode := MaritalSatusCode;
            ApplicantProfile.GenderCode := GenderCode;
            ApplicantProfile.CitizenshipCode := CitizenshipCode;
            ApplicantProfile.CountyOfBirthCode := CountyOfBirthCode;
            ApplicantProfile.CountyOfResidenceCode := CountyOfResidenceCode;
            ApplicantProfile.RelationshipCode := RelationshipCode;
            ApplicantProfile.HasRelative := HasRelative;
            ApplicantProfile.Tribe := Ethnicity;
            ApplicantProfile.PostalCode := Postalcode;
            ApplicantProfile.DisabilityCertNo := DisabilityCertNo;

            ApplicantProfile.Insert(true);
        end
    end;


    procedure AppEmploymentProfile(ID: Integer; ApplicantNo: Integer; Employer: Text[250]; Contacts: Text[250]; Department: Text[250]; Position: Text[250]; StaffNumber: Text[250]; DateEmployed: Date; DateLeft: Date; DutiesResp: Text[250]; PositionType: Text[100])
    begin
        ApplicantEmploymentProfile.Reset();
        ApplicantEmploymentProfile.SetRange(ApplicantEmploymentProfile.ID, ID);
        if ApplicantEmploymentProfile.Find('-') then begin
            ApplicantEmploymentProfile.Employer := Employer;
            ApplicantEmploymentProfile.Contacts := Contacts;
            ApplicantEmploymentProfile.Department := Department;
            ApplicantEmploymentProfile.Position := Position;
            ApplicantEmploymentProfile.StaffNumber := StaffNumber;
            ApplicantEmploymentProfile.DateEmployed := DateEmployed;
            ApplicantEmploymentProfile.DateLeft := DateLeft;
            ApplicantEmploymentProfile."Position Type" := PositionType;
            ApplicantEmploymentProfile."Description of Duties" := DutiesResp;
            ApplicantEmploymentProfile.Modify();
        end
        else begin
            ApplicantEmploymentProfile.ApplicantNo := ApplicantNo;
            ApplicantEmploymentProfile.Employer := Employer;
            ApplicantEmploymentProfile.Contacts := Contacts;
            ApplicantEmploymentProfile.Department := Department;
            ApplicantEmploymentProfile.Position := Position;
            ApplicantEmploymentProfile.StaffNumber := StaffNumber;
            ApplicantEmploymentProfile.DateEmployed := DateEmployed;
            ApplicantEmploymentProfile.DateLeft := DateLeft;
            ApplicantEmploymentProfile."Position Type" := PositionType;
            ApplicantEmploymentProfile."Description of Duties" := DutiesResp;
            ApplicantEmploymentProfile.Insert(true);
        end;
    end;


    procedure PostApplicationHrApplicant(jobRefNo: Text[200]; appCode: Code[100]; EmplNo: Integer; ReqNo: Code[100])
    var
        HRJobs: Record "HR Jobs";
    begin

        //Niko hapa
        ApplicantEducationBackground.Reset();
        ApplicantEducationBackground.SetRange(ApplicantEducationBackground.ApplicantNo, EmplNo);
        if ApplicantEducationBackground.Find('-') then
            repeat
            begin
                HRApplicantQualifications.Reset();
                HRApplicantQualifications.Init();
                HRApplicantQualifications."Application No" := appCode;
                HRApplicantQualifications."Employee No." := EmplNo;
                HRApplicantQualifications."Qualification Code" := ApplicantEducationBackground.Qualifications;
                HRApplicantQualifications."Qualification Type" := ApplicantEducationBackground.QualificationType;
                HRApplicantQualifications."Qualification Description" := ApplicantEducationBackground.QualificationDescr;
                HRApplicantQualifications."Start Date" := ApplicantEducationBackground.StartDate;
                HRApplicantQualifications."End Date" := ApplicantEducationBackground.EndDate;
                HRApplicantQualifications.Description := ApplicantEducationBackground.Description;
                HRApplicantQualifications."Institution/Company" := ApplicantEducationBackground.InstitutionName;
                HRApplicantQualifications."Qualification Grade" := ApplicantEducationBackground.QualificationGrade;
                HRApplicantQualifications.Category := ApplicantEducationBackground.Category;
                HRApplicantQualifications.RenewalDate := ApplicantEducationBackground.RenewalDate;
                HRApplicantQualifications."Other Grade" := ApplicantEducationBackground."Other Grade";
                HRApplicantQualifications."Country Code" := ApplicantEducationBackground."Country Code";
                HRApplicantQualifications.Status := ApplicantEducationBackground.Status;

                /*
                IF fn_CheckAppQualExist(appCode,ApplicantEducationBackground.QualificationType
                                       ,ApplicantEducationBackground.Qualifications,EmplNo)
                THEN
                BEGIN
                HRApplicantQualifications.INSERT(TRUE);
               END;
                */

            end;
            until ApplicantEducationBackground.Next() = 0;


        ApplicantEmploymentProfile.Reset();
        HREmploymentHistory.Reset();
        ApplicantEmploymentProfile.SetRange(ApplicantEmploymentProfile.ApplicantNo, EmplNo);
        if ApplicantEmploymentProfile.Find('-') then
            repeat
            begin
                HREmploymentHistory.JobID := appCode;
                HREmploymentHistory."Applicant No" := EmplNo;
                HREmploymentHistory.Department := ApplicantEmploymentProfile.Department;
                HREmploymentHistory."Name of Previous Employer" := ApplicantEmploymentProfile.Employer;
                HREmploymentHistory."Previous Employer Contacts" := ApplicantEmploymentProfile.Contacts;
                HREmploymentHistory.Position := ApplicantEmploymentProfile.Position;
                HREmploymentHistory.StaffNumber := ApplicantEmploymentProfile.StaffNumber;
                //HREmploymentHistory."Date Employed / Left" := ApplicantEmploymentProfile.DateEmployed;
                HREmploymentHistory."Date Employed" := ApplicantEmploymentProfile.DateEmployed;
                HREmploymentHistory.DateLeft := ApplicantEmploymentProfile.DateLeft;
                HREmploymentHistory."Position Type" := ApplicantEmploymentProfile."Position Type";
                HREmploymentHistory.PhoneNo := ApplicantEmploymentProfile.Contacts;
                HREmploymentHistory."Description of Duties" := ApplicantEmploymentProfile."Description of Duties";

                //HREmploymentHistory.INSERT(TRUE);
            end
            until ApplicantEmploymentProfile.Next() = 0;

        HREmployemntDetails.Reset();
        HRCurrentEmployment.Reset();
        HREmployemntDetails.SetRange(HREmployemntDetails.ApplicantNo, EmplNo);
        if HREmployemntDetails.Find('-') then
            repeat
            begin
                HRCurrentEmployment.JobID := appCode;
                HRCurrentEmployment."Current Employer" := HREmployemntDetails.Employer;
                HRCurrentEmployment.Contacts := HREmployemntDetails."Phone Number";
                HRCurrentEmployment.Department := HREmployemntDetails.Department;
                HRCurrentEmployment."Position Held" := HREmployemntDetails.Position;
                HRCurrentEmployment."Type Of Position" := HREmployemntDetails."Type Of Position";
                HRCurrentEmployment.Salary := HREmployemntDetails."Current Salary";
                HRCurrentEmployment."Additional Benefits" := HREmployemntDetails."Addtional Benefits";
                HRCurrentEmployment."Acceptable Salary" := HREmployemntDetails."Acceptable Salary";
                HRCurrentEmployment."Applicant No" := HREmployemntDetails.ApplicantNo;
                HRCurrentEmployment."Date Employed" := HREmployemntDetails."Date Employed";
                //HRCurrentEmployment.INSERT(TRUE);
            end
            until HREmployemntDetails.Next() = 0;






        HRCurrentEmployment.Reset();
        HREmployemntDetails.Reset();
        //HREmployemntDetails.SETRANGE() THEN




        NAVApplicantRelevantDocs.Reset();
        ApplicantRelevantDocuments.Reset();
        ApplicantRelevantDocuments.SetRange(ApplicantRelevantDocuments."Applicant No", EmplNo);
        if ApplicantRelevantDocuments.Find('-') then
            repeat
            begin
                NAVApplicantRelevantDocs."Job Application No" := appCode;
                NAVApplicantRelevantDocs."Applicant No" := ApplicantRelevantDocuments."Applicant No";
                NAVApplicantRelevantDocs."Helb Certificate" := ApplicantRelevantDocuments."Helb Certificate";
                NAVApplicantRelevantDocs."Good Conduct Certificate" := ApplicantRelevantDocuments."Good Conduct Certificate";
                NAVApplicantRelevantDocs."CRB Certificate" := ApplicantRelevantDocuments."CRB Certificate";
                NAVApplicantRelevantDocs."EACC Certificate" := ApplicantRelevantDocuments."EACC Certificate";
                NAVApplicantRelevantDocs."KRA Pin Certificate" := ApplicantRelevantDocuments."KRA Pin Certificate";
                NAVApplicantRelevantDocs."Date Modified" := Today;
                NAVApplicantRelevantDocs.Insert(true);
            end
            until ApplicantRelevantDocuments.Next() = 0;




        HRApplicantReferees.Reset();
        ApplicantReferees.Reset();
        ApplicantReferees.SetRange(ApplicantReferees.ApplicantNo, EmplNo);
        if ApplicantReferees.Find('-') then
            repeat
            begin
                HRApplicantReferees."Job Application No" := appCode;
                HRApplicantReferees.Names := ApplicantReferees.FullName;
                HRApplicantReferees.Designation := ApplicantReferees.Occupation;
                HRApplicantReferees.Institution := ApplicantReferees.Company;
                HRApplicantReferees.Address := ApplicantReferees.Address;
                HRApplicantReferees."Telephone No" := ApplicantReferees.MobileNo;
                HRApplicantReferees."E-Mail" := ApplicantReferees.Email;
                HRApplicantReferees."Employee No" := ApplicantReferees.ApplicantNo;
                HRApplicantReferees.Designation := ApplicantReferees.Designation;
                //HRApplicantReferees.INSERT(TRUE);
            end
            until ApplicantReferees.Next() = 0;

        ApplicantProfile.Reset();
        HRJobApplications.Reset();
        ApplicantProfile.SetRange(ApplicantProfile.IdNo, EmplNo);
        if ApplicantProfile.Find('-') then begin
            HRJobApplications."Job Application No." := appCode;
            HRJobApplications."First Name" := ApplicantProfile.FirstName;
            HRJobApplications."Middle Name" := ApplicantProfile.MiddleName;
            HRJobApplications."Last Name" := ApplicantProfile.LastName;
            HRJobApplications."Full Name" := ApplicantProfile.FirstName + ' ' + ApplicantProfile.MiddleName + ' ' + ApplicantProfile.LastName;
            HRJobApplications."Postal Address" := ApplicantProfile."Postal Address";
            HRJobApplications."Residential Address" := ApplicantProfile."Physical Address";
            HRJobApplications."Cell Phone Number" := ApplicantProfile.MobileNo;
            HRJobApplications."E-Mail" := ApplicantProfile.Email;
            HRJobApplications."ID Number" := ApplicantProfile.IdNo;
            HRJobApplications.Gender := ApplicantProfile.Gender;
            HRJobApplications."Country Code" := ApplicantProfile.CitizenShip;
            HRJobApplications."Citizenship Details" := ApplicantProfile."CitizenShip For Non-Kenyan";
            HRJobApplications.Status := 0;
            HRJobApplications."Marital Status" := ApplicantProfile.MaritalStatus;
            HRJobApplications."First Language (R/W/S)" := ApplicantProfile.FLanguageCode;
            HRJobApplications."Physically Challenged?" := ApplicantProfile."Physical impairement";
            HRJobApplications."Physically Challenged Descript" := ApplicantProfile.MedicalCondition;
            HRJobApplications."County Of Birth" := ApplicantProfile."County Of Birth";
            HRJobApplications."County Of Residence" := ApplicantProfile."County Of Residence";
            HRJobApplications."Date Of Birth" := ApplicantProfile.DOB;
            //HRJobApplications.Age :=
            HRJobApplications."Second Language (R/W/S)" := ApplicantProfile.SLanguageCode;
            HRJobApplications."Additional Language" := ApplicantProfile.ALanguage;
            HRJobApplications."First Language Read" := ApplicantProfile.FRead;
            HRJobApplications."First Language Write" := ApplicantProfile.FWrite;
            HRJobApplications."First Language Speak" := ApplicantProfile.FSpeak;
            HRJobApplications."Second Language Read" := ApplicantProfile.SRead;
            HRJobApplications."Second Language Write" := ApplicantProfile.SWrite;
            HRJobApplications."Second Language Speak" := ApplicantProfile.Speak;
            HRJobApplications."Job Applied For" := jobRefNo;
            HRJobApplications."Employee Requisition No" := ReqNo;
            HRJobApplications.Tribe := ApplicantProfile.Tribe;
            HRJobApplications."Postal Code" := ApplicantProfile.PostalCode;
            HRJobApplications."Disability CertNo" := ApplicantProfile.DisabilityCertNo;
            // HRJobs.RESET;
            // IF HRJobs.GET(HRJobApplications."Job Applied For") THEN HRJobApplications."Job Applied for Description":=HRJobs."Job Description";

            HRJobApplications."No. Series" := appCode;
            HRJobApplications."Employee No" := Format(EmplNo);
            HRJobApplications."Date Applied" := Today;
            HRJobApplications."Job Applied for Description" := fnJobDescription(jobRefNo);
            HRJobApplications."Additional Read" := ApplicantProfile.ARead;
            HRJobApplications."Additional Write" := ApplicantProfile.AWrite;
            HRJobApplications."Additional Speak" := ApplicantProfile.ASpeak;
            HRJobApplications."Physically Challenged Descript" := ApplicantProfile.MedicalCondition;
            HRJobApplications."Alternative Contacts" := ApplicantProfile."Alternative Contacts";
            HRJobApplications."Relative Who Work?" := ApplicantProfile.HasRelative;
            HRJobApplications."Relative Relation" := ApplicantProfile.RelationshipCode;

            HRJobApplications.Insert(true);
        end

    end;


    procedure fnJobDescription(JobRefNo: Code[50]) JobDescription: Text[200]
    begin
        HREmployeeRequisitions.Reset();

        HREmployeeRequisitions.SetRange(HREmployeeRequisitions."Job ID", JobRefNo);

        if HREmployeeRequisitions.Find('-') then
            JobDescription := HREmployeeRequisitions."Job Description";
    end;


    procedure fnJobDescription2(JobRefNo: Code[50]) JobDescription: Text[200]
    begin
        JobApplications.Reset();

        JobApplications.SetRange(JobApplications."Job Title/Designation", JobRefNo);

        if JobApplications.Find('-') then
            JobDescription := JobApplications."Job Title/Designation";
    end;


    procedure fnBooleanDescription(BoolValue: Boolean) BoolDescription: Text[200]
    begin
        BoolDescription := 'NO';

        if (BoolValue = true) then
            BoolDescription := 'YES';
    end;


    procedure fnDoDetailsMatch(FirstName: Text[30]; MiddleName: Text[30]; LastName: Text[30]; MaritalStatus: Option " ",Single,Married,Divorced,Others,Widowed,Separated; CountyOfBirth: Code[100]; CountyOfResidence: Code[100]; DOB: Date; MobileNo: Text[30]; Email: Text[250]; MedicalCondition: Text[200]; IdNo: Integer; GenderCode: Code[50]; CitizenshipCode: Code[50]; "CitizenShipForNon-Kenyan": Text[50]; PostalAddress: Text[200]; PhysicalAddress: Text[200]; FLanguageCode: Code[10]; FLanguageDesc: Text[30]; SLanguageCode: Code[10]; SLanguageDesc: Text[30]; ALanguage: Text[30]; FRead: Boolean; FWrite: Boolean; FSpeak: Boolean; SRead: Boolean; SWrite: Boolean; Speak: Boolean; ARead: Boolean; AWrite: Boolean; ASpeak: Boolean; Physicalimpairement: Text[50]; AlternativeContacts: Text[50]; HasRelative: Boolean; RelationshipCode: Code[50]; RelativeRelationship: Text[100]; Religion: Text[100]) IsMatch: Boolean
    begin

        ApplicantProfile.Reset();
        ApplicantProfile.SetRange(ApplicantProfile.IdNo, IdNo);

        IsMatch := true;

        if ApplicantProfile.Find('-') then begin

            if (
                (ApplicantProfile.FirstName <> FirstName) or
                (ApplicantProfile.MiddleName <> MiddleName) or
                (ApplicantProfile.LastName <> LastName) or
                (ApplicantProfile.MaritalStatus <> MaritalStatus) or
                (ApplicantProfile.CountyOfBirthCode <> CountyOfBirth) or
                (ApplicantProfile.DOB <> DOB) or
                (ApplicantProfile.MobileNo <> MobileNo) or
                (ApplicantProfile.Email <> Email) or
                (ApplicantProfile.MedicalCondition <> MedicalCondition) or
                (ApplicantProfile.GenderCode <> GenderCode) or
                (ApplicantProfile.CitizenshipCode <> CitizenshipCode) or
                (ApplicantProfile."CitizenShip For Non-Kenyan" <> "CitizenShipForNon-Kenyan") or
                (ApplicantProfile."Postal Address" <> PostalAddress) or
                (ApplicantProfile."Physical Address" <> PhysicalAddress) or
                (ApplicantProfile.FLanguageCode <> FLanguageCode) or
                (ApplicantProfile.FLanguageDesc <> FLanguageDesc) or
                (ApplicantProfile.SLanguageCode <> SLanguageCode) or
                (ApplicantProfile.SLanguageDesc <> SLanguageDesc) or
                (ApplicantProfile.ALanguage <> ALanguage) or
                (ApplicantProfile.FRead <> FRead) or
                (ApplicantProfile.FWrite <> FWrite) or
                (ApplicantProfile.FSpeak <> FSpeak) or
                (ApplicantProfile.SRead <> SRead) or
                (ApplicantProfile.SWrite <> SWrite) or
                (ApplicantProfile.Speak <> Speak) or
                (ApplicantProfile.ARead <> ARead) or
                (ApplicantProfile.AWrite <> AWrite) or
                (ApplicantProfile.ASpeak <> ASpeak) or
                (ApplicantProfile."Physical impairement" <> Physicalimpairement) or
                (ApplicantProfile."Alternative Contacts" <> AlternativeContacts) or
                (ApplicantProfile.RelationshipCode <> RelationshipCode) or
                (ApplicantProfile.Religion <> Religion)

              )

             then
                IsMatch := false
            else
                IsMatch := true;

            exit(IsMatch);
        end
    end;


    procedure fnCheckIfSkillCompetencyExists(QualificationCode: Code[50]; ApplicantNo: Integer) EntryExists: Boolean
    begin
        ApplicantEducationBackground.Reset();
        ApplicantEducationBackground.SetRange(ApplicantEducationBackground.ApplicantNo, ApplicantNo);
        ApplicantEducationBackground.SetRange(ApplicantEducationBackground.Qualifications, QualificationCode);
        ApplicantEducationBackground.SetRange(ApplicantEducationBackground.Category, ApplicantEducationBackground.Category::"Skills & Competencies");

        if ApplicantEducationBackground.Find('-') then begin

            EntryExists := true;
            exit(EntryExists);

        end
    end;


    procedure fnCheckIfWorkExperienceExists(ApplicantNo: Integer; QualificationCode: Code[150]; QualificationTypeCode: Code[150]; InstitutionName: Text[250]) EntryExists: Boolean
    begin
        ApplicantEducationBackground.Reset();

        ApplicantEducationBackground.SetRange(ApplicantEducationBackground.ApplicantNo, ApplicantNo);
        ApplicantEducationBackground.SetRange(ApplicantEducationBackground.Qualifications, QualificationCode);
        ApplicantEducationBackground.SetRange(ApplicantEducationBackground.QualificationTypeCode, QualificationTypeCode);
        ApplicantEducationBackground.SetRange(ApplicantEducationBackground.Category, ApplicantEducationBackground.Category::Experience);

        if ApplicantEducationBackground.Find('-') then begin

            EntryExists := true;
            exit(EntryExists);

        end
    end;


    procedure fnDoClearanceDocsDetailsMatch(ApplicantNo: Integer; HelbCertificate: Boolean; GoodConductCertificate: Boolean; CRBCertificate: Boolean; EACCCertificate: Boolean; KRAPinCertificate: Boolean) IsMatch: Boolean
    begin

        ApplicantRelevantDocuments.Reset();
        ApplicantRelevantDocuments.SetRange(ApplicantRelevantDocuments."Applicant No", ApplicantNo);

        IsMatch := true;

        if ApplicantRelevantDocuments.Find('-') then begin

            if (
                (ApplicantRelevantDocuments."Helb Certificate" <> HelbCertificate) or
                (ApplicantRelevantDocuments."Good Conduct Certificate" <> GoodConductCertificate) or
                (ApplicantRelevantDocuments."CRB Certificate" <> CRBCertificate) or
                (ApplicantRelevantDocuments."EACC Certificate" <> EACCCertificate) or
                (ApplicantRelevantDocuments."KRA Pin Certificate" <> KRAPinCertificate)
              )

             then
                IsMatch := false
            else
                IsMatch := true;

            exit(IsMatch);
        end
    end;


    procedure fnCheckIfApplicantAccountIsVerified(UserName: Code[50]) Verified: Boolean
    begin

        ApplicantRegister.Reset();

        ApplicantRegister.SetRange(ApplicantRegister.UserName, UserName);
        ApplicantRegister.SetRange(ApplicantRegister.Verified, true);

        if ApplicantRegister.Find('-') then
            Verified := true;
    end;


    procedure fnVerifyApplicantAccount(UserName: Code[50])
    begin

        ApplicantRegister.Reset();

        ApplicantRegister.SetRange(ApplicantRegister.UserName, UserName);

        if ApplicantRegister.Find('-') then begin
            ApplicantRegister.Verified := true;
            ApplicantRegister.Modify();
        end
    end;


    procedure PostApplicationHrApplicantModify(jobRefNo: Text[200]; appCode: Code[50]; EmplNo: Integer)
    var
        HRJobs: Record "HR Jobs";
        ApplicantEducationBackground_2: Record "Applicant Education Background";
        HRApplicantQualifications_2: Record "HR Applicant Qualifications";
    begin

        HRJobApplications.Reset();
        HRJobApplications.SetRange(HRJobApplications."Job Application No.", appCode);
        HRJobApplications.SetRange(HRJobApplications."ID Number", EmplNo);
        if HRJobApplications.Find('-') then begin

            HRApplicantQualifications.Reset();
            ApplicantEducationBackground.Reset();

            HRApplicantQualifications.SetRange(HRApplicantQualifications."Application No", appCode);
            if HRApplicantQualifications.Find('-') then begin
                ApplicantEducationBackground.SetRange(ApplicantEducationBackground.ApplicantNo, EmplNo);
                if ApplicantEducationBackground.Find('-') then
                    if (HRApplicantQualifications."Qualification Code" = ApplicantEducationBackground.Qualifications) and
                     (ApplicantEducationBackground.QualificationType = ApplicantEducationBackground.QualificationType) then;
                /*
HRApplicantQualifications_2.RESET;
HRApplicantQualifications_2."Qualification Description" :=  ApplicantEducationBackground.QualificationDescr;
HRApplicantQualifications_2."Start Date" := ApplicantEducationBackground.StartDate;
HRApplicantQualifications_2."End Date" := ApplicantEducationBackground.EndDate;
HRApplicantQualifications_2.Description := ApplicantEducationBackground.Description;
HRApplicantQualifications_2."Institution/Company" := ApplicantEducationBackground.InstitutionName;
HRApplicantQualifications_2."Qualification Grade" := ApplicantEducationBackground.QualificationGrade;
HRApplicantQualifications_2.Category := ApplicantEducationBackground.Category;
HRApplicantQualifications_2.RenewalDate := ApplicantEducationBackground.RenewalDate;
//HRApplicantQualifications.MODIFY;
*/
            end


        end

    end;

    procedure fnCheckIfApplicationForJobExists(IDNumber: Integer; JobAppliedFor: Text[30]; RequisitionNo: Code[20]) AppCode: Code[50]
    begin
        HREmployeeRequisitions.Reset();
        HREmployeeRequisitions.SetRange(HREmployeeRequisitions."Requisition No.", RequisitionNo);
        if HREmployeeRequisitions.Find('-') then
            HRJobApplications.Reset();
        HRJobApplications.SetRange(HRJobApplications."ID Number", IDNumber);
        HRJobApplications.SetRange(HRJobApplications."Job Applied For", JobAppliedFor);
        HRJobApplications.SetRange(HRJobApplications.ReApplied, false);
        if HRJobApplications.Find('-') then
            repeat
                if ((HRJobApplications."Date Applied" >= HREmployeeRequisitions."Opening Date") and (HRJobApplications."Date Applied" <= HREmployeeRequisitions."Closing Date"))
               then
                    AppCode := HRJobApplications."Job Application No."
                else
                    AppCode := '';
            until HRJobApplications.Next() = 0;
    end;

    local procedure fn_CheckAppQualExist(AppNo: Code[20]; QualType: Code[20]; QualCode: Code[20]; "EmpNo.": Integer): Boolean
    var
        HRAppQual: Record "HR Applicant Qualifications";
    begin
        HRAppQual.Reset();
        HRAppQual.SetRange(HRAppQual."Application No", AppNo);
        HRAppQual.SetRange(HRAppQual."Qualification Type", QualType);
        HRAppQual.SetRange(HRAppQual."Qualification Code", QualCode);
        HRAppQual.SetRange(HRAppQual."Employee No.", "EmpNo.");
        if HRAppQual.Find('-') then
            exit(false)
        else
            exit(true);
    end;


    procedure fnMarkApplicationAsReApplied(JobApplicationNo: Code[50]; JobAppliedFor: Text[30]; IDNumber: Integer)
    begin

        HRJobApplications.Reset();

        HRJobApplications.SetRange(HRJobApplications."Job Application No.", JobApplicationNo);
        HRJobApplications.SetRange(HRJobApplications."Job Applied For", JobAppliedFor);
        HRJobApplications.SetRange(HRJobApplications."ID Number", IDNumber);

        if HRJobApplications.Find('-') then
            repeat
            begin
                HRJobApplications.ReApplied := true;
                HRJobApplications.Modify();
            end
            until HRJobApplications.Next() = 0;
    end;


    procedure fetchApplicantEmail(IdNo: Integer) ApplicantEmail: Text[150]
    begin

        ApplicantProfile.Reset();

        ApplicantProfile.SetRange(ApplicantProfile.IdNo, IdNo);

        if ApplicantProfile.Find('-') then
            ApplicantEmail := ApplicantProfile.Email;
    end;


    procedure ReturnDeptName(DimensionCode: Code[20]) DeptName: Text[200]
    begin
        DimensionValue.Reset();
        DimensionValue.SetRange(DimensionValue.Code, DimensionCode);

        if DimensionValue.Find('-') then
            DeptName := DimensionValue.Name;
    end;


    procedure fetchApplicantFirstName(IdNo: Integer) ApplicantFirstName: Text[150]
    begin

        ApplicantProfile.Reset();

        ApplicantProfile.SetRange(ApplicantProfile.IdNo, IdNo);

        if ApplicantProfile.Find('-') then
            ApplicantFirstName := ApplicantProfile.FirstName;
    end;


    procedure IsThereActiveLeave(EmployeeNo: Code[50]) ActiveLeaveExists: Boolean
    begin
    end;


    procedure ReturnDocWithNewStatus(EmployeeNo: Code[50]) LeaveNewDocNo: Code[50]
    begin

        HRLeave.Reset();

        HRLeave.SetRange(HRLeave."Employee No", EmployeeNo);
        HRLeave.SetRange(HRLeave.Status, HRLeave.Status::New);

        if HRLeave.Find('-') then
            LeaveNewDocNo := HRLeave."Application Code";
    end;


    procedure HRTrainingAppInsertNew(ApplicationCode: Code[50]; CourseCode: Code[50]; Description: Text[100]; Location: Text[100]; empResponsibilityCenter: Code[20]; NoOfParticipant: Integer; PurposeOfTraining: Text[100]; FromDate: Date; ToDate: Date; Duration: Integer; DurationUnits: Integer; EmployeeNo: Code[20]; Provider: Code[10]; ProviderName: Text[150]; ApplicationDate: Date; TableID: Integer; EmployeeName: Text[100]; DurationFormula: DateFormula; UserID: Code[50]; TrainingDescription: Text[250]; TotalCost: Decimal; RecommendedTraining: Integer; Justification: Text[250]; TermsConditionsAgreed: Integer) TrainingNewDocNo: Code[20]
    var
        DocType: Integer;
    begin

        begin

            TrainingApplications.Reset();

            TrainingApplications."Course Title" := CourseCode;
            //TrainingApplications.VALIDATE("Course Title");

            TrainingApplications."Responsibility Center" := empResponsibilityCenter;
            //TrainingApplications.VALIDATE("Responsibility Center");

            TrainingApplications."Start Date" := FromDate;
            //TrainingApplications.VALIDATE("Start Date");

            TrainingApplications.Duration := DurationFormula;
            //TrainingApplications.VALIDATE(Duration);

            TrainingApplications."Employee No_" := EmployeeNo;

            TrainingApplications."Application Date" := Today;

            TrainingApplications.UserId := UserID;

            TrainingApplications."Course Description" := TrainingDescription;

            TrainingApplications."Training Cost Cstimated" := TotalCost;

            //TrainingApplications."Recommended Training" := RecommendedTraining;

            TrainingApplications.Justification := Justification;

            //TrainingApplications."Terms and Conditions Agreed" :=  TermsConditionsAgreed;

            TrainingApplications.Insert(true);

            TrainingNewDocNo := TrainingApplications."Application No";

            //HRTrainingLinesParticipantsInsert(TrainingNewDocNo, EmployeeNo, TRUE);

            //DocType := 22;

            //SumbitTrainingForApproval(TrainingNewDocNo, DocType, UserID);

        end
    end;


    procedure ReturnTrainingDocWithNewStatus(EmployeeNo: Code[50]) NewDocNo: Code[50]
    begin

        TrainingApplications.Reset();

        TrainingApplications.SetRange(TrainingApplications."Employee No_", EmployeeNo);
        TrainingApplications.SetRange(TrainingApplications.Status, TrainingApplications.Status::New);

        if TrainingApplications.Find('-') then
            NewDocNo := TrainingApplications."Application No";
    end;


    procedure AssignDriverNotify(TransportDocumentNo: Code[20])
    begin

        //TransportRequisitionPage.NotifyApplicant;
    end;


    procedure ModifyTransportAllocated(HRTrainingAppNo_Alloc: Code[50])
    begin

        HRTransportReq.Reset();

        HRTransportReq.SetRange(HRTransportReq."Transport Request No", HRTrainingAppNo_Alloc);

        if HRTransportReq.Find('-') then begin

            HRTransportReq.Allocated := true;
            HRTransportReq.Modify();

        end;
    end;


    procedure GetSupervisorEmpNo(UserID: Code[100]) SupervisorNo: Code[50]
    begin


        UserSetup.Reset();

        UserSetup.SetRange(UserSetup."User ID", UserID);
        if UserSetup.Find('-') then begin

            HREmp.Reset();
            HREmp.SetRange(HREmp."User ID", UserSetup."Approver ID");
            if HREmp.Find('-') then
                SupervisorNo := HREmp."No.";

        end;
    end;


    procedure GetUserFullName(EmployeeNo: Code[100]) EmployeeName: Text[200]
    begin

        HREmp.Reset();

        HREmp.SetRange(HREmp."No.", EmployeeNo);
        if HREmp.Find('-') then
            EmployeeName := HREmp."Full Name";
    end;


    procedure ReturnEmpDoc(EmployeeNo: Code[20]) InterviewNo: Code[20]
    begin

        ExitInterviewQuestionnaire.Reset();

        ExitInterviewQuestionnaire.SetRange(ExitInterviewQuestionnaire."Employee No", EmployeeNo);
        ExitInterviewQuestionnaire.SetRange(ExitInterviewQuestionnaire.Status, ExitInterviewQuestionnaire.Status::New);

        if ExitInterviewQuestionnaire.Find('-') then
            InterviewNo := ExitInterviewQuestionnaire."Interview No.";
    end;


    procedure HREmpExitInterviewsInsert(EmployeeNo: Code[50]) InterviewNo: Code[50]
    begin

        ExitInterviewQuestionnaire.Reset();

        ExitInterviewQuestionnaire."Employee No" := EmployeeNo;

        ExitInterviewQuestionnaire.Insert(true);

        InterviewNo := ExitInterviewQuestionnaire."Interview No.";
    end;


    procedure FullName(No: Code[50]) FullName: Text[200]
    begin

        HREmployees.Reset();

        HREmployees.SetRange(HREmployees."No.", No);

        if HREmployees.Find('-') then
            FullName := HREmployees."Full Name";
    end;


    procedure DateOfCurrentEmployment(No: Code[50]) dtCurrentEmployment: Date
    begin

        HREmployees.Reset();

        HREmployees.SetRange(HREmployees."No.", No);

        if HREmployees.Find('-') then
            dtCurrentEmployment := HREmployees."Date of Current Employment";
    end;


    procedure HREmpExitInterviewsModify(InterviewNo: Code[50]; EmployeeNo: Code[50]; ResponsibilityCentre: Code[20]; DateOfEmployement: Date; SeparationDate: Date; Text1: Text[250]; Text2: Text[250]; Text3: Boolean; Text4: Boolean; Text5: Boolean; Text6: Boolean; Text7: Boolean; Text8: Boolean; Text9: Boolean; Text10: Boolean; Text11: Boolean; Text12: Boolean; Text13: Boolean; Text14: Boolean; Text15: Boolean; Text16: Boolean; Text17: Integer; Text18: Integer; Text19: Integer; Text20: Integer; Text21: Integer; Text22: Integer; Text23: Integer; Text24: Integer; Text25: Integer; Text26: Integer; Text27: Integer; Text28: Integer; Text29: Integer; Text30: Integer; Text31: Integer)
    begin

        ExitInterviewQuestionnaire.Reset();
        ExitInterviewQuestionnaire.SetRange(ExitInterviewQuestionnaire."Interview No.", InterviewNo);
        if ExitInterviewQuestionnaire.Find('-') then begin
            ExitInterviewQuestionnaire."Job Title" := RetunJobTitle(EmployeeNo);
            ExitInterviewQuestionnaire."Responsibility Centre" := ResponsibilityCentre;
            ExitInterviewQuestionnaire."Date of Employement" := DateOfEmployement;
            ExitInterviewQuestionnaire."Separation Date" := SeparationDate;
            ExitInterviewQuestionnaire."Text 1" := Text1;
            ExitInterviewQuestionnaire."Text 2" := Text2;
            ExitInterviewQuestionnaire.Dissatisfaction := Text3;
            ExitInterviewQuestionnaire.Relocation := Text4;
            ExitInterviewQuestionnaire."Text 5" := Text5;
            ExitInterviewQuestionnaire."Text 6" := Text6;
            ExitInterviewQuestionnaire."Text 7" := Text7;
            ExitInterviewQuestionnaire."Text 8" := Text8;
            ExitInterviewQuestionnaire."Text 9" := Text9;
            ExitInterviewQuestionnaire."Text 10" := Text10;
            ExitInterviewQuestionnaire."Text 11" := Text11;
            ExitInterviewQuestionnaire."Text 12" := Text12;
            ExitInterviewQuestionnaire."Text 13" := Text13;
            ExitInterviewQuestionnaire."Text 14" := Text14;
            ExitInterviewQuestionnaire."Text 15" := Text15;
            ExitInterviewQuestionnaire."Text 16" := Text16;
            ExitInterviewQuestionnaire."Text 17" := Text17;
            ExitInterviewQuestionnaire."Text 18" := Text18;
            ExitInterviewQuestionnaire."Text 19" := Text19;
            ExitInterviewQuestionnaire."Text 20" := Text20;
            ExitInterviewQuestionnaire."Text 21" := Text21;
            ExitInterviewQuestionnaire."Text 22" := Text22;
            ExitInterviewQuestionnaire."Text 23" := Text23;
            ExitInterviewQuestionnaire."Text 24" := Text24;
            ExitInterviewQuestionnaire."Text 25" := Text25;
            ExitInterviewQuestionnaire."Text 26" := Text26;
            ExitInterviewQuestionnaire."Text 27" := Text27;
            ExitInterviewQuestionnaire."Text 28" := Text28;
            ExitInterviewQuestionnaire."Text 29" := Text29;
            ExitInterviewQuestionnaire."Text 30" := Text30;
            ExitInterviewQuestionnaire."Text 31" := Text31;
            ExitInterviewQuestionnaire.Modify();
        end
    end;


    procedure RetunJobTitle(UserName: Code[50]) JobTitle: Text[150]
    begin
        HREmployees.Reset();
        HREmployees.SetRange(HREmployees."No.", UserName);
        if HREmployees.Find('-') then
            JobTitle := HREmp."Job Title";
    end;


    procedure ReturnDocWithNewStatus_EmployeeReq(EmployeeNo: Code[50]) NewDocNo: Code[50]
    begin

        HREmployeeRequisitions.Reset();

        HREmployeeRequisitions.SetRange(HREmployeeRequisitions."Employee No", EmployeeNo);
        HREmployeeRequisitions.SetRange(HREmployeeRequisitions.Status, HREmployeeRequisitions.Status::New);

        if HREmployeeRequisitions.Find('-') then
            NewDocNo := HREmployeeRequisitions."Requisition No.";
    end;


    procedure ExitInterviewQuestionnaire_InsertNew(EmployeeNo: Code[50]) NewDocNo: Code[50]
    begin

        HREmployeeRequisitions.Reset();

        HREmployeeRequisitions."Employee No" := EmployeeNo;
        HREmployeeRequisitions.Requestor := GetHR_UserID(EmployeeNo);

        HREmployeeRequisitions.Insert(true);

        NewDocNo := HREmployeeRequisitions."Requisition No.";
    end;


    procedure GetHR_UserID(EmployeeNo: Code[100]) UserID: Code[50]
    begin

        HREmp.Reset();

        HREmp.SetRange(HREmp."No.", EmployeeNo);
        if HREmp.Find('-') then
            UserID := HREmp."User ID";
    end;

    procedure GetHR_Department(EmployeeNo: Code[100]) Dept: Code[50]
    begin
        HREmp.Reset();
        HREmp.SetRange(HREmp."No.", EmployeeNo);
        if HREmp.Find('-') then
            Dept := HREmp."Global Dimension 2 Code";
    end;


    procedure GetHR_ResponsibilityCenter(EmployeeNo: Code[100]) Dept: Code[50]
    begin

        HREmp.Reset();

        HREmp.SetRange(HREmp."No.", EmployeeNo);
        if HREmp.Find('-') then
            Dept := HREmp."Responsibility Center";
    end;


    procedure Get_HRJobs_VacantPositions(JobID: Code[50]) VacantPositions: Decimal
    begin

        HRJobs.Reset();

        HRJobs.SetRange(HRJobs."Job ID", JobID);

        if HRJobs.Find('-') then
            VacantPositions := HRJobs."Vacant Positions";
    end;


    procedure Get_HRJobs_JobGrade(JobID: Code[50]) Grade: Code[20]
    begin

        HRJobs.Reset();

        HRJobs.SetRange(HRJobs."Job ID", JobID);

        if HRJobs.Find('-') then
            Grade := HRJobs.Grade;
    end;


    procedure Get_HRJobs_JobDescription(JobID: Code[50]) JobDescription: Text[150]
    begin

        HRJobs.Reset();

        HRJobs.SetRange(HRJobs."Job ID", JobID);

        if HRJobs.Find('-') then
            JobDescription := HRJobs."Job Description";
    end;


    procedure HREmployeeRequisitions_Modify(EmployeeNo: Code[20]; RequisitionNo: Code[50]; JobID: Code[20]; ResponsibilityCenter: Code[50]; RequiredPositions: Decimal; ReasonForRequest: Integer; RequisitionType: Integer; TypeOfContractRequired: Option Permanent,Contract,Casual,Internship,Attachment; Priority: Integer; ReasonForRequest_Other: Text[250]; AnyAdditionalInformation: Text[250])
    begin

        HREmployeeRequisitions.Reset();

        HREmployeeRequisitions.SetRange(HREmployeeRequisitions."Requisition No.", RequisitionNo);
        HREmployeeRequisitions.SetRange(HREmployeeRequisitions."Employee No");

        if HREmployeeRequisitions.Find('-') then begin

            HREmployeeRequisitions."Job ID" := JobID;
            HREmployeeRequisitions."Job Description" := Get_HRJobs_JobDescription(JobID);
            HREmployeeRequisitions."Job Grade" := Get_HRJobs_JobGrade(JobID);
            HREmployeeRequisitions."Responsibility Center" := ResponsibilityCenter;
            HREmployeeRequisitions."Required Positions" := RequiredPositions;
            HREmployeeRequisitions."Reason For Request" := ReasonForRequest;
            HREmployeeRequisitions."Requisition Type" := RequisitionType;
            HREmployeeRequisitions."Type of Contract Required" := TypeOfContractRequired;
            HREmployeeRequisitions.Priority := Priority;
            HREmployeeRequisitions."Reason for Request(Other)" := ReasonForRequest_Other;
            HREmployeeRequisitions."Any Additional Information" := AnyAdditionalInformation;
            HREmployeeRequisitions."Full Name" := FullName(EmployeeNo);
            HREmployeeRequisitions.Modify();

            SendEmployeeReqForApproval(RequisitionNo);


        end
    end;


    procedure SendEmployeeReqForApproval(ApplicationCode: Code[10])
    var
        LeaveApplication: Record "HR Leave Application";
        HRLeaveLedger: Record "HR Leave Ledger Entries";
        HRLvType: Record "HR Leave Types";
        HRCalendar_L: Record "HR Calendar";
    begin

        HREmployeeRequisitions.Reset();

        HREmployeeRequisitions.SetRange(HREmployeeRequisitions."Requisition No.", ApplicationCode);

        if HREmployeeRequisitions.Find('-') then begin

            HREmployeeRequisitions.Reset();
            HREmployeeRequisitions.SetRange(HREmployeeRequisitions."Employee No", HREmployeeRequisitions."Employee No");
            HREmployeeRequisitions.SetRange(HREmployeeRequisitions.Status, HREmployeeRequisitions.Status::"Pending Approval");
            if HREmployeeRequisitions.Find('-') then
                Error(TextEmployeeReqExists, HREmployeeRequisitions."Requisition No.", HREmployeeRequisitions."Requisition Type");

            VarVariant := HREmployeeRequisitions;
            ApprovalMgt.OnSendDocForApproval(VarVariant);
            //EmpRequisitionApprovalRequest(HREmployeeRequisitions);
        end
    end;


    procedure ReturnDocWithNewStatus_Separation(StaffCode: Code[50]) NewDocNo: Code[50]
    begin

        EmployeeSeparation.Reset();

        EmployeeSeparation.SetRange(EmployeeSeparation."Staff Code", StaffCode);
        EmployeeSeparation.SetRange(EmployeeSeparation.Status, EmployeeSeparation.Status::New);

        if EmployeeSeparation.Find('-') then
            NewDocNo := EmployeeSeparation."Separation No.";
    end;


    procedure EmployeeSeparation_InsertNew(StaffCode: Code[50]) NewDocNo: Code[50]
    begin

        EmployeeSeparation.Reset();

        EmployeeSeparation."Staff Code" := StaffCode;
        EmployeeSeparation."User ID" := GetHR_UserID(StaffCode);

        EmployeeSeparation.Insert(true);

        NewDocNo := EmployeeSeparation."Separation No.";
    end;


    procedure EmployeeSeparation_Modify(StaffCode: Code[50]; SeparationNo: Code[50]; JobID: Code[50]; ResponsibilityCenter: Code[50]; ReasonForSeparation: Integer; DateOfLeaving: Date; Details: Text[250])
    begin

        EmployeeSeparation.Reset();

        EmployeeSeparation.SetRange(EmployeeSeparation."Separation No.", SeparationNo);
        EmployeeSeparation.SetRange(EmployeeSeparation."Staff Code", StaffCode);

        if EmployeeSeparation.Find('-') then begin

            EmployeeSeparation."Staff Name" := FullName(StaffCode);
            EmployeeSeparation."User ID" := GetHR_UserID(StaffCode);
            EmployeeSeparation."Responsibility Center" := ResponsibilityCenter;
            EmployeeSeparation."Reason for Separation" := ReasonForSeparation;
            EmployeeSeparation."Date of Leaving" := DateOfLeaving;
            EmployeeSeparation."Request Date" := Today;
            EmployeeSeparation.Details := Details;
            EmployeeSeparation.Department := GetHR_Department(StaffCode);
            EmployeeSeparation."Job ID" := JobID;
            EmployeeSeparation."Job Description" := Get_HRJobs_JobDescription(JobID);


            EmployeeSeparation.Modify();

            SendSeparationReqForApproval(EmployeeSeparation."Separation No.");

        end
    end;


    procedure SendSeparationReqForApproval(ApplicationCode: Code[50])
    var
        EmployeeSeparationBuffer: Record "Employee Separation Header";
    begin

        EmployeeSeparationBuffer.Reset();

        EmployeeSeparationBuffer.SetRange(EmployeeSeparationBuffer."Separation No.", ApplicationCode);

        if EmployeeSeparationBuffer.Find('-') then begin

            EmployeeSeparation.Reset();
            EmployeeSeparation.SetRange(EmployeeSeparation."Staff Code", EmployeeSeparationBuffer."Staff Code");
            EmployeeSeparation.SetRange(EmployeeSeparation.Status, EmployeeSeparationBuffer.Status::"Pending Approval");
            if EmployeeSeparation.Find('-') then
                Error(TextSeparationReqExists);

            VarVariant := EmployeeSeparation;
            ApprovalMgt.OnSendDocForApproval(VarVariant);

        end
    end;


    procedure ReturnDocWithNewStatus_Clearance(EmployeeNo: Code[50]) NewDocNo: Code[50]
    begin

        ClearanceCertificate.Reset();

        ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", EmployeeNo);
        //ClearanceCertificate.SETRANGE(ClearanceCertificate.Status, EmployeeSeparation.Status :: New);

        if ClearanceCertificate.Find('-') then
            NewDocNo := ClearanceCertificate."Clearance No.";
    end;


    procedure ClearanceCertificate_InsertNew(EmployeeNo: Code[50]) NewDocNo: Code[50]
    begin

        ClearanceCertificate.Reset();

        ClearanceCertificate."Employee No" := EmployeeNo;
        ClearanceCertificate."USER ID" := GetHR_UserID(EmployeeNo);
        ClearanceCertificate.Name := FullName(EmployeeNo);
        ClearanceCertificate.Date := Today;
        ClearanceCertificate.Directorate := GetHR_Department(EmployeeNo);
        ClearanceCertificate."Responsibility Center" := GetHR_ResponsibilityCenter(EmployeeNo);

        ClearanceCertificate.Insert(true);

        NewDocNo := ClearanceCertificate."Clearance No.";
    end;


    procedure ReturnDocWithSeparation_Clearance(EmployeeNo: Code[50]) NewDocNo: Code[50]
    begin

        EmployeeSeparation.Reset();

        EmployeeSeparation.SetRange(EmployeeSeparation."Staff Code", EmployeeNo);
        EmployeeSeparation.SetRange(EmployeeSeparation.Status, EmployeeSeparation.Status::Approved);

        if EmployeeSeparation.Find('-') then
            NewDocNo := EmployeeSeparation."Separation No.";
    end;


    procedure ReturnDocWithExitInterview_Clearance(EmployeeNo: Code[50]) NewDocNo: Code[50]
    begin

        ClearanceCertificate.Reset();

        ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", EmployeeNo);
        ClearanceCertificate.SetRange(ClearanceCertificate.Status, ClearanceCertificate.Status::Approved);

        if ClearanceCertificate.Find('-') then
            NewDocNo := ClearanceCertificate."Clearance No.";
    end;


    procedure ClearanceCertificate_Modify(EmployeeNo: Code[50]; Details: Text[100]; ClearanceNo: Code[30]): Code[50]
    begin

        ClearanceCertificate.Reset();
        ClearanceCertificate.SetRange(ClearanceCertificate."Clearance No.", ClearanceNo);
        ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", EmployeeNo);
        if ClearanceCertificate.Find('-') then begin

            ClearanceCertificate."Employee No" := EmployeeNo;
            ClearanceCertificate."USER ID" := GetHR_UserID(EmployeeNo);
            ClearanceCertificate.Name := FullName(EmployeeNo);
            ClearanceCertificate.Date := Today;
            ClearanceCertificate.Directorate := GetHR_Department(EmployeeNo);
            ClearanceCertificate."Responsibility Center" := GetHR_ResponsibilityCenter(EmployeeNo);
            ClearanceCertificate.Details := Details;
            //ClearanceCertificate.INSERT(TRUE);
            //NewDocNo := ClearanceCertificate."Clearance No.";
            ClearanceCertificate.Modify();
            SendClearanceReqForApproval(ClearanceCertificate."Clearance No.");

        end
    end;


    procedure SendClearanceReqForApproval(ClearanceNo: Code[50])
    var
        ClearanceCertificateBuffer: Record "Clearance Certificate";
    begin
        ClearanceCertificateBuffer.Reset();
        ClearanceCertificateBuffer.SetRange(ClearanceCertificateBuffer."Clearance No.", ClearanceNo);

        if ClearanceCertificateBuffer.Find('-') then begin

            ClearanceCertificate.Reset();
            ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", ClearanceCertificateBuffer."Employee No");
            //ClearanceCertificateBuffer.SETRANGE(ClearanceCertificate.Status, ClearanceCertificateBuffer.Status::"Pending Approval");
            ClearanceCertificate.SetRange(ClearanceCertificate.Status, ClearanceCertificateBuffer.Status::"Pending Approval");

            if ClearanceCertificate.Find('-') then
                Error(TextSeparationReqExists);
            VarVariant := ClearanceCertificate;
            ApprovalMgt.OnSendDocForApproval(VarVariant);
            //ClearanceAppApprovalReq(ClearanceCertificate);

        end
    end;


    procedure ClearanceICT(computerict: Boolean; phoneict: Boolean; laptopict: Boolean; iCTSecurity: Boolean; iPADTabletict: Boolean; othersict: Text[100]; txtictothers: Text[100]; ClearanceNo: Code[30]; EmployeeNo: Code[30]; approverComment: Text[100])
    begin
        ClearanceCertificate.Reset();
        ClearanceCertificate.SetRange(ClearanceCertificate."Clearance No.", ClearanceNo);
        ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", EmployeeNo);
        if ClearanceCertificate.Find('-') then begin

            ClearanceCertificate.Laptop := laptopict;
            ClearanceCertificate."Ipad/Tablet" := iPADTabletict;
            ClearanceCertificate."Others ICT" := othersict;
            ClearanceCertificate."Comments ICT" := approverComment;
            ClearanceCertificate."Mobile Phone" := phoneict;
            ClearanceCertificate."ICT Computer" := computerict;
            ClearanceCertificate."ICT & Security Clearance" := iCTSecurity;
            ClearanceCertificate.Modify();
            //SendClearanceReqForApproval(ClearanceCertificate."Clearance No.");

        end
    end;


    procedure ClearanceSCM(store: Boolean; othersSCM: Boolean; txtSCMothers: Text[100]; ClearanceNo: Code[30]; EmployeeNo: Code[30]; approverComment: Text[100])
    begin
        ClearanceCertificate.Reset();
        ClearanceCertificate.SetRange(ClearanceCertificate."Clearance No.", ClearanceNo);
        ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", EmployeeNo);
        if ClearanceCertificate.Find('-') then begin

            ClearanceCertificate.Store := store;
            ClearanceCertificate."Other SCM" := txtSCMothers;
            ClearanceCertificate.Modify();
            //SendClearanceReqForApproval(ClearanceCertificate."Clearance No.");

        end
    end;


    procedure ClearanceCommunication(library: Boolean; CbOthersLibrary: Boolean; OthersSpecify: Text; ClearanceNo: Code[30]; EmployeeNo: Code[30]; approverComment: Text[100])
    begin
        ClearanceCertificate.Reset();
        ClearanceCertificate.SetRange(ClearanceCertificate."Clearance No.", ClearanceNo);
        ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", EmployeeNo);
        if ClearanceCertificate.Find('-') then begin

            ClearanceCertificate.Library := library;
            ClearanceCertificate."Other Comm" := OthersSpecify;
            ClearanceCertificate.Modify();
            //SendClearanceReqForApproval(ClearanceCertificate."Clearance No.");

        end
    end;

    procedure SendEmailNofications(Subject: Text; MSg: Text; EmailAddress: Text): Text
    var
        myInt: Integer;
        CompanyIInf: Record "Company Information";
        EmailManger: Codeunit "Email Message";
        Email: Codeunit Email;
    begin
        if MSg <> '' then
            if EmailAddress <> '' then begin
                EmailManger.Create(EmailAddress, Subject, msg, true);
                Email.Send(EmailManger, Enum::"Email Scenario"::Default);
                exit('Email Sent Successfully')
            end;

    end;


    procedure ClearanceCLMB(workingToolsCLMB: Boolean; iOfficeDeskKeys: Boolean; othersCLMB: Boolean; ClearanceNo: Code[30]; EmployeeNo: Code[30]; approverComment: Text[100])
    begin
        ClearanceCertificate.Reset();
        ClearanceCertificate.SetRange(ClearanceCertificate."Clearance No.", ClearanceNo);
        ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", EmployeeNo);
        if ClearanceCertificate.Find('-') then begin

            ClearanceCertificate."Working Tools" := workingToolsCLMB;
            ClearanceCertificate."Office & Desk Keys" := iOfficeDeskKeys;
            ClearanceCertificate.OthersCLMB := othersCLMB;
            ClearanceCertificate.CLMB := approverComment;
            ClearanceCertificate.Modify();
            //SendClearanceReqForApproval(ClearanceCertificate."Clearance No.");

        end
    end;


    procedure ClearanceNLIMS(NLIMSCleared: Boolean; OtherNLIMS: Boolean; OthersSpecify: Text[100]; ClearanceNo: Code[30]; EmployeeNo: Code[30]; approverComment: Text[100])
    begin
        ClearanceCertificate.Reset();
        ClearanceCertificate.SetRange(ClearanceCertificate."Clearance No.", ClearanceNo);
        ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", EmployeeNo);
        if ClearanceCertificate.Find('-') then begin


            ClearanceCertificate.NLIMS := OthersSpecify;
            ClearanceCertificate."Comments NLIMS" := approverComment;

            ClearanceCertificate.Modify();
            //SendClearanceReqForApproval(ClearanceCertificate."Clearance No.");

        end
    end;


    procedure ClearanceLegalAffairs(LegalCleared: Boolean; OthersLegal: Boolean; OthersSpecify: Text[100]; ClearanceNo: Code[30]; EmployeeNo: Code[30]; approverComment: Text[100])
    begin
        ClearanceCertificate.Reset();
        ClearanceCertificate.SetRange(ClearanceCertificate."Clearance No.", ClearanceNo);
        ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", EmployeeNo);
        if ClearanceCertificate.Find('-') then begin


            ClearanceCertificate.Legal := OthersSpecify;
            ClearanceCertificate."Comments LA" := approverComment;
            ClearanceCertificate.Modify();
            //SendClearanceReqForApproval(ClearanceCertificate."Clearance No.");

        end
    end;


    procedure ClearanceLandAdministration(OthersSpecify: Text[100]; ClearanceNo: Code[30]; EmployeeNo: Code[30]; approverComment: Text[100]; SelectedYear: Integer; filenameFromApp: Text[150])
    var
        "Employee Card": Record "HR Employees";
        PRSalaryCard: Record "PR Salary Card";
        P9: Record "PR Employee P9 Info";
    begin
        ClearanceCertificate.Reset();
        ClearanceCertificate.SetRange(ClearanceCertificate."Clearance No.", ClearanceNo);
        ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", EmployeeNo);
        if ClearanceCertificate.Find('-') then begin
            ClearanceCertificate.LAdm := approverComment;
            ClearanceCertificate.Modify();
            //SendClearanceReqForApproval(ClearanceCertificate."Clearance No.");

        end
    end;


    procedure ClearanceResearchAdvocacy(OthersSpecify: Text[100]; ClearanceNo: Code[30]; EmployeeNo: Code[30]; approverComment: Text[100])
    begin
        ClearanceCertificate.Reset();
        ClearanceCertificate.SetRange(ClearanceCertificate."Clearance No.", ClearanceNo);
        ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", EmployeeNo);
        if ClearanceCertificate.Find('-') then begin
            ClearanceCertificate."Research & Advocacy" := approverComment;
            ClearanceCertificate.Modify();
            //SendClearanceReqForApproval(ClearanceCertificate."Clearance No.");

        end
    end;


    procedure ClearanceValuationTaxation(ClearanceNo: Code[30]; EmployeeNo: Code[30]; approverComment: Text[100])
    begin
        ClearanceCertificate.Reset();
        ClearanceCertificate.SetRange(ClearanceCertificate."Clearance No.", ClearanceNo);
        ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", EmployeeNo);
        if ClearanceCertificate.Find('-') then begin

            ClearanceCertificate."Valuation & Taxation" := approverComment;
            ClearanceCertificate.Modify();
            //SendClearanceReqForApproval(ClearanceCertificate."Clearance No.");

        end
    end;


    procedure ClearanceNaturalResource(CommentsNR: Text[100]; ClearanceNo: Code[30]; EmployeeNo: Code[30])
    begin
        ClearanceCertificate.Reset();
        ClearanceCertificate.SetRange(ClearanceCertificate."Clearance No.", ClearanceNo);
        ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", EmployeeNo);
        if ClearanceCertificate.Find('-') then begin
            ClearanceCertificate."Natural Resource" := CommentsNR;
            ClearanceCertificate.Modify();
            //SendClearanceReqForApproval(ClearanceCertificate."Clearance No.");

        end
    end;


    procedure ClearanceSurveyAdjudication(ClearanceNo: Code[30]; EmployeeNo: Code[30]; CommentSurvey: Text[100])
    begin
        ClearanceCertificate.Reset();
        ClearanceCertificate.SetRange(ClearanceCertificate."Clearance No.", ClearanceNo);
        ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", EmployeeNo);
        if ClearanceCertificate.Find('-') then begin
            ClearanceCertificate.Survey := CommentSurvey;
            ClearanceCertificate.Modify();
            //SendClearanceReqForApproval(ClearanceCertificate."Clearance No.");

        end
    end;


    procedure ClearanceAudit(approverComment: Text[100]; ClearanceNo: Code[30]; EmployeeNo: Code[30])
    begin
        ClearanceCertificate.Reset();
        ClearanceCertificate.SetRange(ClearanceCertificate."Clearance No.", ClearanceNo);
        ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", EmployeeNo);
        if ClearanceCertificate.Find('-') then begin
            ClearanceCertificate.Audit := approverComment;

            ClearanceCertificate.Modify();
            //SendClearanceReqForApproval(ClearanceCertificate."Clearance No.");

        end
    end;


    procedure ClearanceFinance(SalaryAdvance: Boolean; WorkingTools: Boolean; Imprest: Boolean; OfficeDeskKeys: Boolean; PettyCash: Boolean; CarKeys: Boolean; CarLoan: Boolean; Mortgage: Boolean; OthersSpecify: Text[100]; approverComment: Text[100]; ClearanceNo: Code[30]; EmployeeNo: Code[30])
    begin
        ClearanceCertificate.Reset();
        ClearanceCertificate.SetRange(ClearanceCertificate."Clearance No.", ClearanceNo);
        ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", EmployeeNo);
        if ClearanceCertificate.Find('-') then begin
            ClearanceCertificate."Salary Advance" := SalaryAdvance;
            ClearanceCertificate."Petty Cash" := PettyCash;
            ClearanceCertificate.Imprest := Imprest;
            ClearanceCertificate."Car Loan" := CarLoan;
            ClearanceCertificate.Mortgage := Mortgage;
            ClearanceCertificate."Working Tools" := WorkingTools;
            ClearanceCertificate."Office & Desk Keys" := OfficeDeskKeys;
            ClearanceCertificate."Car Keys" := CarKeys;
            //ClearanceCertificate."Other Fin" :=OthersSpecify;
            ClearanceCertificate."Comments Finance" := approverComment;
            ClearanceCertificate.Modify();
            //SendClearanceReqForApproval(ClearanceCertificate."Clearance No.");

        end
    end;


    procedure ClearanceHumanResource(NLCIDCard: Boolean; LeaveBalance: Boolean; MedicalCard: Boolean; OthersHR: Boolean; approverComment: Text[100]; ClearanceNo: Code[30]; EmployeeNo: Code[30])
    begin
        ClearanceCertificate.Reset();
        ClearanceCertificate.SetRange(ClearanceCertificate."Clearance No.", ClearanceNo);
        ClearanceCertificate.SetRange(ClearanceCertificate."Employee No", EmployeeNo);
        if ClearanceCertificate.Find('-') then begin
            ClearanceCertificate."NLC ID Card" := NLCIDCard;
            ClearanceCertificate."Leave Balance" := LeaveBalance;
            ClearanceCertificate."Medical Card" := MedicalCard;
            ClearanceCertificate."Comments HR" := approverComment;
            ClearanceCertificate."Other HR" := OthersHR;
            ClearanceCertificate.Modify();
            //SendClearanceReqForApproval(ClearanceCertificate."Clearance No.");

        end
    end;


    procedure GetClearanceDepartmentByEmployeeNo(EmpNo: Code[50]) CleranaceDept: Integer
    begin
        HREmployees.Reset();
        UserSetup.Reset();

        HREmployees.SetRange(HREmployees."No.", EmpNo);
        if HREmployees.Find('-') then begin
            UserSetup.SetRange(UserSetup."User ID", HREmployees."User ID");
            if UserSetup.Find('-') then
                CleranaceDept := UserSetup."Clearance Department";
        end
    end;


    procedure GetCurrentCalendarPeriod() varCode: Code[50]
    begin
        HRCalendar_Period.Reset();

        HRCalendar_Period.SetRange(HRCalendar_Period.Current, true);

        if HRCalendar_Period.Find('-') then
            varCode := HRCalendar_Period.Code;
    end;


    procedure GetHR_Grade_ByEmployeeNo(EmpNo: Code[50]) HR_Grade: Code[20]
    begin
        HREmployees.Reset();

        HREmployees.SetRange(HREmployees."No.", EmpNo);
        if HREmployees.Find('-') then
            HR_Grade := HREmployees.Grade;
    end;


    procedure Return_Separation_Doc_Status(ApplicationCode: Code[50]) Status: Integer
    begin

        EmployeeSeparation.Reset();

        EmployeeSeparation.SetRange(EmployeeSeparation."Separation No.", ApplicationCode);

        if EmployeeSeparation.Find('-') then
            Status := EmployeeSeparation.Status;
    end;


    procedure Salary_GenerateP9Report(EmployeeNo: Code[20]; SelectedYear: Integer; filenameFromApp: Text[150]): Text
    var
        "Employee Card": Record "HR Employees";
        PRSalaryCard: Record "PR Salary Card";
        P9: Record "PR Employee P9 Info";
        filename: text;
        BlobInStream: InStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        FileContentsB64: Text;
        BlobOutStream: OutStream;
        RecRef: RecordRef;
    begin

        filename := filenameFromApp;
        IF EXISTS(filename) THEN
            ERASE(filename);
        TempBlob.CreateInStream(BlobInStream);
        TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
        P9.RESET;
        P9.SETRANGE(P9."Employee Code", EmployeeNo);
        P9.SETRANGE(P9."Period Year", SelectedYear);
        IF P9.FIND('-') THEN BEGIN
            REPORT.SAVEASPDF(REPORT::"PR P9", filename, P9);
            RecRef.GetTable(P9);
            // Report.SaveAsPdf(Report::"PR Individual Payslip Portal", filename, PRSalaryCard);
            Report.SaveAs(REPORT::"PR P9", '', ReportFormat::Pdf, BlobOutStream, RecRef);
            FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
            exit(FileContentsB64);
        END;
    end;


    procedure EmployeeCardGeneralDetails("Employee No": Code[20]; "Passport Number": Code[20]; Citizenship: Code[20]; "Citizenship Text": Text[50]; Directorate: Code[20]; "Directorate Name": Text[50]; Station: Code[20]; "Station Name": Text[50]; "Department Code": Code[20]; "Department Name": Text[50]; County: Code[20]; "County Name": Text[50]; Title: Option ,MR,MRS,MISS,MS,DR," ENG. ","DR.",CC,Prof; "Post Code": Code[20]; "Postal Address": Text[100]; City: Text[50]; "Home District": Text[50]; Division: Text[50]; Location: Text[50]; "Sub Location": Text[50]; Ethnicity: Text[50]; "Blood Group": Code[10]; Weight: Decimal; Height: Decimal)
    var
        employee: Record "HR Employees";
    begin
        employee.Reset();
        employee.SetRange(employee."No.", "Employee No");

        if (employee.Find('-')) then begin

            employee."Passport Number" := "Passport Number";
            employee.Citizenship := Citizenship;
            //employee."Citizenship Text":="Citizenship Text";
            //employee.DirectorateCode:=DirectorateCode;
            //employee."Directorate Name":="Directorate Name";
            //employee.StationCode:=StationCode;
            //employee."Station Name":="Station Name";
            /*employee."Department Code":="Department Code";
            employee."Department Name":="Department Name";
            employee.CountyCode:=CountyCode;
            employee."County Name":="County Name";*/
            employee.Title := Title;
            employee."Post Code" := "Post Code";
            employee."Postal Address" := "Postal Address";
            employee.City := City;

            //additional fields
            employee."Home District" := "Home District";
            employee.Weight := Weight;
            employee.Height := Height;
            employee.Division := Division;
            employee.Location := Location;
            employee."Sub Location" := "Sub Location";
            employee.Ethnicity := Ethnicity;
            //employee."Blood Group":="Blood Group";

            employee.Modify();
        end else
            Error('The employee number ' + "Employee No" + ' was not found');

    end;


    procedure GetRecordLinkID(empNo: Code[20]) recID: Integer
    var
        emp: Record "HR Employees";
        recordLink: Record "Record Link";
    begin
        emp.Reset();
        emp.Get(empNo);
        if emp.Find('-') then begin
            recID := emp.AddLink('Temp_Link_ID', 'Temp_Link_ID');

            recordLink.Reset();
            recordLink.SetRange(recordLink.Description, 'Temp_Link_ID');
            if (recordLink.Find('-')) then
                recordLink.Delete();
        end;
    end;


    procedure SaveNOK(EmpCode: Code[20]; Type: Option "PropertyValue                                                                      OptionStringNext of Kin",Beneficiary,Dependant,Spouse,Siblings,"In-Laws",Parent; Relationship: Code[20]; Name: Text[100]; IDPassportNo: Text[20]; DOB: DateTime; Occupation: Text[100]; Address: Text[100]; Email: Text[60]; OfficeTelephone: Text[30]; HomeTelephone: Text[30]; PercentageShares: Decimal)
    var
        NOK: Record "HR Employee Kin";
    begin
        DeleteNOK(EmpCode, Relationship, IDPassportNo);

        NOK.Reset();

        NOK."Employee Code" := EmpCode;
        NOK.Type := Type;
        NOK.Relationship := Relationship;
        NOK."ID No/Passport No" := IDPassportNo;

        NOK.Name := Name;
        NOK."Full Name" := Name;
        NOK."Date Of Birth" := DT2Date(DOB);
        NOK.Occupation := Occupation;
        NOK.Address := Address;
        NOK."E-mail" := Email;
        NOK."Office Tel No" := OfficeTelephone;
        NOK."Home Tel No" := HomeTelephone;
        NOK."Percentage Shares" := PercentageShares;

        NOK.Insert(true);
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


    procedure Leave_DaysAvailable(LeaveType: Text[20]; EmpNo: Code[30]) DaysAvailable: Decimal
    var
        UploadDocumentAttachment: Integer;
    begin

        DaysAllocated := 0;
        DaysTaken := 0;
        HRSetup.Get();
        Employee.Get(EmpNo);
        //get days allocated
        if LeaveType = 'ANNUAL' then begin
            LeaveLedgerEntry.Reset();
            LeaveLedgerEntry.SetRange("Staff No.", EmpNo);
            LeaveLedgerEntry.SetRange("Leave Type", 'ANNUAL');
            LeaveLedgerEntry.SetRange(Closed, false);
            //LeaveLedgerEntry.SETRANGE("Leave Entry Type",LeaveLedgerEntry."Leave Entry Type"::Positive,LeaveLedgerEntry."Leave Entry Type"::Positive);
            LeaveLedgerEntry.SetRange(LeaveLedgerEntry."Posting Date", HRSetup."Leave Posting Period[FROM]", HRSetup."Leave Posting Period[TO]");
            if LeaveLedgerEntry.Find('-') then
                repeat
                    DaysAllocated := LeaveLedgerEntry."No. of days" + DaysAllocated;
                    DaysAvailable := DaysAllocated;
                until LeaveLedgerEntry.Next() = 0;
        end;


        /*{
        //get days gone
          LeaveLedgerEntry .RESET;
          LeaveLedgerEntry.SETRANGE("Staff No.",EmpNo);
          LeaveLedgerEntry.SETRANGE("Leave Type",'ANNUAL');
          LeaveLedgerEntry.SETRANGE(Closed,FALSE);
          LeaveLedgerEntry.SETRANGE("Leave Entry Type",LeaveLedgerEntry."Leave Entry Type"::Negative,LeaveLedgerEntry."Leave Entry Type"::Negative);
          LeaveLedgerEntry.SETRANGE(LeaveLedgerEntry."Posting Date",HRSetup."Leave Posting Period[FROM]",HRSetup."Leave Posting Period[TO]");
          IF LeaveLedgerEntry.FIND('-')THEN BEGIN
               REPEAT
            DaysTaken:=LeaveLedgerEntry."No. of days"+DaysTaken;
          UNTIL LeaveLedgerEntry.NEXT=0;
          END;
          DaysAvailable:=DaysAllocated-DaysTaken;
        END;
        }*/

        //ovaa
        /*
         FindMaturityDate;
        "Maturity Date":=MaturityDate;
        "Fiscal Start Date":=FiscalStart;

        //MESSAGE(FORMAT(DaysAvailable));
        //MESSAGE(FORMAT("Return Date"));

        IF "Return Date" > "Maturity Date" THEN BEGIN
             ERROR('Return Date %1 is not within the Current Financial Year!!',"Return Date");
           END
        */

    end;


    procedure DetermineAge(DateOfBirth: Date) Age: Text[100]
    begin
        Age := Dates.DetermineAge(DateOfBirth, Today);
    end;


    procedure FindMaturityDate()
    var
        AccPeriod: Record "HR Leave Periods";
    begin
        AccPeriod.Reset();
        AccPeriod.SetRange(AccPeriod."Starting Date", 0D, Today);
        AccPeriod.SetRange(AccPeriod."New Fiscal Year", true);
        AccPeriod.SetRange(AccPeriod.Closed, false);
        if AccPeriod.Find('+') then begin
            //MESSAGE(FORMAT(AccPeriod."Starting Date"));
            FiscalStart := AccPeriod."Starting Date";
            MaturityDate := CalcDate('1Y', AccPeriod."Starting Date");
            MaturityDate := CalcDate('-1D', MaturityDate);
            //MESSAGE('New Maturity Date %1',FORMAT(MaturityDate));
        end;
    end;

    local procedure ReturnEmployeEmailAddress()
    begin
    end;


    procedure Cancel_Staff_Advance(Staff_Advance_No: Code[10])
    begin

        StaffAdvance.Reset();
        StaffAdvance.SetRange(StaffAdvance."No.", Staff_Advance_No);
        if StaffAdvance.Find('-') then begin
            VarVariant := StaffAdvance;
            ApprovalMgt.OnCancelDocApprovalRequest(VarVariant);
            //appMngt.CancelAdvanceApprovalRequest(StaffAdvance, false, false);
        end;
    end;


    procedure GenerateP9Report(PayrollYear: Text; EmployeeNumber: Code[50]): Text
    var
        ThisPayrollYear: Integer;
        //PRSalaryCard: Record "PR Salary Card";
        P9: Record "PR Employee P9 Info";
        filename: text;
        BlobInStream: InStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        FileContentsB64: Text;
        BlobOutStream: OutStream;
        HRemployees: Record "HR Employees";
        RecRef: RecordRef;
    begin
        Evaluate(ThisPayrollYear, PayrollYear);
        HRSetup.Get();
        HRSetup.TestField("Portal Files Path");
        HRemployees.Reset();
        HRemployees.SetRange("No.", EmployeeNumber);
        if HRemployees.FindFirst() then begin
            HRemployees."Period Year" := ThisPayrollYear;
            HRemployees.Modify();
        end;
        Evaluate(ThisPayrollYear, PayrollYear);
        IF EXISTS(filename) THEN
            ERASE(filename);
        TempBlob.CreateInStream(BlobInStream);
        TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
        P9.RESET;
        P9.SETRANGE(P9."Employee Code", EmployeeNumber);
        P9.SETRANGE(P9."Period Year", ThisPayrollYear);
        IF P9.FIND('-') THEN BEGIN
            //REPORT.SAVEASPDF(REPORT::"PR P9", filename, P9);
            RecRef.GetTable(P9);
            // Report.SaveAsPdf(Report::"PR Individual Payslip Portal", filename, PRSalaryCard);
            Report.SaveAs(REPORT::"PR P9", '', ReportFormat::Pdf, BlobOutStream, RecRef);
            FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
            //Message(FileContentsB64);
            exit(FileContentsB64);
        END;
    end;


    procedure UploadDocumentStaffAdvance(DocumentNo: Code[50]; URL1: Text[250]; Descriprion: Text[250]; UserID: Code[132]; Company: Text[250]) LineNo: Integer
    begin
        StaffAdvance.Reset();
        StaffAdvance.SetRange(StaffAdvance."No.", DocumentNo);
        if (StaffAdvance.Find('-')) then begin

            RecordLink.Init();

            RecordLink."Record ID" := StaffAdvance.MyRecId;
            RecordLink.URL1 := URL1;
            RecordLink.Description := Descriprion;
            RecordLink."User ID" := UserID;
            RecordLink.Company := Company;
            RecordLink.Created := CurrentDateTime;
            //RecordLink."Document No" := DocumentNo;

            RecordLink.Insert(true);

            LineNo := RecordLink."Link ID";

        end
        else
            Error('Staff Advance Document not found!');
    end;


    procedure Approval_Transport_Requisition(Transport_Req_No: Code[10])
    begin

        HRTransportReq.Reset();
        HRTransportReq.SetRange(HRTransportReq."Transport Request No", Transport_Req_No);
        if HRTransportReq.Find('-') then;
        // appMngt.SendTransportReqApproval(HRTransportReq);
    end;


    procedure SubmitSalaryAdvanceRequestForApproval(ApplicationNo: Code[10]; UserID: Text)
    begin

        StaffAdvance.SetRange(StaffAdvance."No.", ApplicationNo);
        if StaffAdvance.Find('-') then begin
            //ApprovalMgt.SendSalAdvanceAppApprovalReq(StaffAdvance);
            VarVariant := StaffAdvance;
            ApprovalMgt.OnSendDocForApproval(VarVariant);
        end
    end;


    procedure Leave_DaysAvailableOthers(LeaveType: Text[20]; EmpNo: Code[30]) DaysAvailable: Decimal
    var
        UploadDocumentAttachment: Integer;
    begin
        DaysAllocated := 0;
        DaysTaken := 0;
        HRSetup.Get();
        Employee.Get(EmpNo);

        //get days allocated
        if LeaveType <> 'ANNUAL' then begin
            LeaveLedgerEntry.Reset();
            LeaveLedgerEntry.SetRange("Staff No.", EmpNo);
            LeaveLedgerEntry.SetRange("Leave Type", LeaveType);
            LeaveLedgerEntry.SetRange(Closed, false);
            LeaveLedgerEntry.SetRange("Leave Entry Type", LeaveLedgerEntry."Leave Entry Type"::Positive, LeaveLedgerEntry."Leave Entry Type"::Positive);
            LeaveLedgerEntry.SetRange(LeaveLedgerEntry."Posting Date", HRSetup."Leave Posting Period[FROM]", HRSetup."Leave Posting Period[TO]");
            if LeaveLedgerEntry.Find('-') then
                repeat
                    DaysAllocated := LeaveLedgerEntry."No. of days" + DaysAllocated;
                    DaysAvailable := DaysAllocated;
                until LeaveLedgerEntry.Next() = 0;
        end;
    end;

    procedure GenerateTransferLetter(DocumentNo: Code[50]; EmployeeNo: Code[40]) filename: Text
    var
        BlobOutStream: OutStream;
        RecRef: RecordRef;
        BlobInStream: InStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        FileContentsB64: Text;
        ResponseObject: JsonObject;
        filenameFromApp: text;
        TransferLines: Record "HR Employee Transfer Lines";
        EmplTransfer: Record "Employee Transfers";
    begin
        HRSetup.Get();
        HRSetup.TestField("Portal Files Path");
        filenameFromApp := DocumentNo;
        filename := HRSetup."Portal Files Path" + filenameFromApp + '.pdf';
        if Exists(filename) then
            Erase(filename);
        TempBlob.CreateInStream(BlobInStream);
        TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
        TransferLines.Reset();
        TransferLines.SetRange(TransferLines."Request No", DocumentNo);
        TransferLines.SetRange(TransferLines."Employee No", EmployeeNo);
        if TransferLines.Find('-') then begin
            RecRef.GetTable(TransferLines);
            Report.SaveAs(Report::"Transfer Letter Report", '', ReportFormat::Pdf, BlobOutStream, RecRef);
            FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
            // Message(FileContentsB64);
            exit(FileContentsB64)
        end;
    end;

    procedure GeneratePromotionLetter(DocumentNo: Code[50]; EmployeeNo: Code[40]) filename: Text
    var
        BlobOutStream: OutStream;
        RecRef: RecordRef;
        BlobInStream: InStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        FileContentsB64: Text;
        ResponseObject: JsonObject;
        filenameFromApp: text;
        PromotionLines: Record "HR Promo. Recommend Lines";
        EmplTransfer: Record "Employee Transfers";
    begin
        HRSetup.Get();
        HRSetup.TestField("Portal Files Path");
        filenameFromApp := DocumentNo;
        filename := HRSetup."Portal Files Path" + filenameFromApp + '.pdf';
        if Exists(filename) then
            Erase(filename);
        TempBlob.CreateInStream(BlobInStream);
        TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
        PromotionLines.Reset();
        PromotionLines.SetRange(PromotionLines."Document No", DocumentNo);
        PromotionLines.SetRange(PromotionLines."Employee No.", EmployeeNo);
        if PromotionLines.Find('-') then begin
            RecRef.GetTable(PromotionLines);
            Report.SaveAs(Report::"Promotion Letter ", '', ReportFormat::Pdf, BlobOutStream, RecRef);
            FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
            //Message(FileContentsB64);
            exit(FileContentsB64)
        end;
    end;

    procedure ConvertBas64ToPdf(Bas64Text: Text)
    var
        Base64String: Text;
        PDFBinaryData: Codeunit "File Management";
        FilePath: Text;
        PDFFile: File;
        PDfOutstream: OutStream;
        Base64: Codeunit "Base64 Convert";
        Tempblob: Codeunit "Temp Blob";

    begin
        // PDFBinaryData.CreateAndWriteToServerFile(Bas64Text,FilePath);
        Base64String := Base64.FromBase64(Bas64Text);
        FilePath := 'C:\Users\kkaimor\Documents\TestHRms\output.pdf'; // Specify the desired file path
        PDFFile.CREATE(FilePath);
        PDFFile.CREATEOUTSTREAM(PDfOutstream);
        PDfOutstream.WRITE(Base64String);
        //PDfOutstream.CLOSE();
        PDFFile.CLOSE();
    end;




    procedure GenerateAppraisalReport(AppraisalNo: Code[50]; AppraisalPeriod: Text; StatusRec: Option; filenameFromApp: Text[200]) filename: Text
    var
        BlobOutStream: OutStream;
        RecRef: RecordRef;
        BlobInStream: InStream;
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        FileContentsB64: Text;
        ResponseObject: JsonObject;
    begin
        HRSetup.Get();
        HRSetup.TestField("Portal Files Path");

        filename := HRSetup."Portal Files Path" + filenameFromApp + '.pdf';
        //filename := APath + filenameFromApp + '.pdf';
        //Message(filename);
        if Exists(filename) then
            Erase(filename);
        TempBlob.CreateInStream(BlobInStream);
        TempBlob.CreateOutStream(BlobOutStream, TextEncoding::UTF8);
        AppraisalHeader.Reset();
        AppraisalHeader.SetRange(AppraisalHeader."Appraisal No", AppraisalNo);
        AppraisalHeader.SetRange(AppraisalHeader."Appraisal Period", AppraisalPeriod);
        if AppraisalHeader.Find('-') then begin
            //MESSAGE('%1%2%3%4',AppraisalNo,AppraisalPeriod,StatusRec,filename);
            // Report.SaveAsPdf(Report::"Appraisal Report NEW", filename, AppraisalHeader);
            RecRef.GetTable(AppraisalHeader);
            Report.SaveAs(Report::"Appraisal Report NEW", '', ReportFormat::Pdf, BlobOutStream, RecRef);
            FileContentsB64 := Base64Convert.ToBase64(BlobInStream);
            //Message(FileContentsB64);
            exit(FileContentsB64)
        end;
    end;


    procedure Approval_Purchase_Requsition(Purchase_Req_No: Code[10])
    begin

        StoresReqHeader.Reset();
        StoresReqHeader.SetRange(StoresReqHeader."No.", Purchase_Req_No);
        if StoresReqHeader.Find('-') then;
        //appMngt.SendPRequestApprovalRequest(StoresReqHeader)
    end;


    procedure Approval_Store_Requsition(Purchase_Req_No: Code[10])
    begin
        StoresReqHeader.Reset();
        StoresReqHeader.SetRange(StoresReqHeader."No.", Purchase_Req_No);
        if StoresReqHeader.Find('-') then;
        // appMngt.SendSRequestApprovalRequest(StoresReqHeader)
    end;

    procedure fnInsertLeavePlannerHeader(empno: Code[50]; StaffID: Text): Code[50]
    var
        LeavePlanner: Record "HR Leave Planner Header";
        hrEmpRec: Record "HR Employees";
        HrSetup: Record "HR Setup";
    begin
        HrSetup.Get();
        LeavePlanner.Reset();
        LeavePlanner.SetRange("Employee No", empno);
        LeavePlanner.SetRange("Application Date", HrSetup."Leave Posting Period[FROM]", HrSetup."Leave Posting Period[TO]");
        if LeavePlanner.FindFirst() then
            Error('You can only have one leave plan within the calender year');
        hrEmpRec.Reset();
        hrEmpRec.SetRange(hrEmpRec."User ID", StaffID);
        if hrEmpRec.FindFirst() then begin
            LeavePlanner.init;
            UserSetup.Reset();
            UserSetup.SetRange("User ID", StaffID);
            if UserSetup.FindFirst() then begin
                LeavePlanner.Supervisor := UserSetup."Approver ID";
                LeavePlanner."Supervisor Email" := UserSetup."E-Mail";
            end;
            LeavePlanner."Application Code" := '';
            LeavePlanner."Application Date" := Today;
            LeavePlanner.Names := HREmp.FullName;
            LeavePlanner."Job Tittle" := HREmp."Job Title";
            LeavePlanner."Employee No" := hrEmpRec."No.";
            LeavePlanner."User ID" := StaffID;
            LeavePlanner.Type := LeavePlanner.Type::Functional;
            LeavePlanner.Validate("Employee No");
            if LeavePlanner.Insert(true) then
                exit(LeavePlanner."Application Code");
        end;

    end;

    procedure InsertHREmpQualifications(EmploNo: Code[20]; QualType: Code[20]; QualCode: Code[30]; QualDesc: Text[100]; FromDate: Date; ToDate: Date; Institution: Text[100]; CourseGrade: Text[30]; CommentsRE: Boolean; Score: Decimal): Text
    var
        myInt: Integer;
        HREmpQualChanges: Record "HR Emp Qualification Changes";
        SeriesSetup: Record "HR Setup";
        Inserted: Boolean;
        NewNom: Code[20];
        NewNoSeriesCode: Code[20];

    begin
        Inserted := false;

        HREmpQualChanges.Reset();
        if HREmpQualChanges.FindLast() then begin
            HREmpQualChanges.Init();
            HREmpQualChanges."Employee No." := EmploNo;
            SeriesSetup.Get;
            SeriesSetup.TestField(SeriesSetup."EducaQual Setup");
            NoSeriesMgt.InitSeries(SeriesSetup."EducaQual Setup", SeriesSetup."EducaQual Setup", 0D, NewNom, NewNoSeriesCode);
            HREmpQualChanges."Qualfi Code" := NewNom;
            HREmpQualChanges.Validate(HREmpQualChanges."Employee No.");
            HREmpQualChanges."Qualification Code" := QualCode;
            HREmpQualChanges."Qualification Type" := QualType;
            HREmpQualChanges."Qualification Description" := QualDesc;
            HREmpQualChanges."From Date" := FromDate;
            HREmpQualChanges."To Date" := ToDate;
            HREmpQualChanges.Comment := CommentsRE;
            HREmpQualChanges."Institution/Company" := Institution;
            HREmpQualChanges."Course Grade" := CourseGrade;
            HREmpQualChanges.Score := Score;
            Inserted := true;
            HREmpQualChanges.Insert(true);
            if Inserted = true then
                exit('Qualifications Uploaded Successfully')
            else
                Error('Qualifications upload Fail');
        end else begin
            HREmpQualChanges.Init();
            HREmpQualChanges."Employee No." := EmploNo;
            HREmpQualChanges.Validate(HREmpQualChanges."Employee No.");
            HREmpQualChanges."Qualification Code" := QualCode;
            HREmpQualChanges."Qualification Type" := QualType;
            HREmpQualChanges."Qualification Description" := QualDesc;
            HREmpQualChanges."From Date" := FromDate;
            HREmpQualChanges."To Date" := ToDate;
            HREmpQualChanges.Comment := CommentsRE;
            HREmpQualChanges."Institution/Company" := Institution;
            HREmpQualChanges."Course Grade" := CourseGrade;
            HREmpQualChanges.Score := Score;
            Inserted := true;
            HREmpQualChanges.Insert(true);
            if Inserted = true then
                exit('Qualifications Uploaded Successfully');
        end;

    end;

    procedure fnInsertLeavePlannerLines(empno: code[50]; startDate: Date; reliverNo: Code[50]; docNo: Code[30]; leaveType: Code[50]; daysApplied: Decimal; comments: Text)
    var
        LeavePlannerReliever: Record "HR Leave Planner Lines";
    begin
        LeavePlannerReliever.Init();
        LeavePlannerReliever."Application Code" := docNo;
        LeavePlannerReliever."Employee No" := empno;
        LeavePlannerReliever."Leave Type" := leaveType;
        LeavePlannerReliever."Start Date" := startDate;
        LeavePlannerReliever."Days Applied" := daysApplied;
        LeavePlannerReliever.Validate("Start Date");
        LeavePlannerReliever.Reliever := reliverNo;
        LeavePlannerReliever."Applicant Comments" := comments;
        //LeavePlannerReliever.Validate("Employee No");
        //LeavePlannerReliever.Validate("Leave Type");
        //LeavePlannerReliever.Validate("Start Date");
        //LeavePlannerReliever.Validate(Reliever);
        LeavePlannerReliever.Insert();
    end;

    procedure GenerateDocTransNum(UserID: Text): Code[40]
    var
        myInt: Integer;
        DocNo: code[40];
        Inserted: Boolean;
    begin
        Inserted := false;
        HRSetup.Get;
        HRSetup.TestField(HRSetup."Transport Req Nos");
        DocNo := NoSeriesMgt.GetNextNo(HRSetup."Transport Req Nos", 0D, True);
        HRTransportReq.Init();
        HRTransportReq."Transport Request No" := DocNo;
        HRTransportReq."User ID" := UserID;
        HRTransportReq."Application Date" := Today;
        Inserted := true;
        HRTransportReq.Insert();
        if Inserted = true then
            exit(DocNo);
    end;

    procedure fnInsertSelfInitiatedTransfer(EmployeeNo: Text; TransferDate: Date; Newstation: Code[20]; StaffUserId: Text; Reason: Text) DocNo: Text
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Mobility: Record "Employee Transfers";
        TransAllowance: Record "HR Employee Transfer Lines";
    begin
        HRSetup.Get;
        HRSetup.TestField("Employee Transfer Nos.");
        HRSetup.TestField("Transfer Allowance");
        DocNo := NoSeriesMgt.GetNextNo(HRSetup."Employee Transfer Nos.", 0D, True);
        Mobility.Init();
        Mobility."Employee No" := EmployeeNo;
        Mobility."Document No" := DocNo;
        Mobility.Validate(Mobility."Employee No");
        Mobility.Type := Mobility.Type::"Self initiated";
        Mobility."New Station" := Newstation;
        Mobility.Validate(Mobility."New Station");
        Mobility."No. Series" := HRSetup."Employee Transfer Nos.";
        Mobility."Created By" := StaffUserId;
        Mobility."Date Created" := Today;
        Mobility."Time Created" := Time;
        Mobility."Request Date" := TransferDate;
        Mobility.Remarks := Reason;
        Mobility.Insert(false);
        TransAllowance.Reset();
        TransAllowance.Init();
        TransAllowance."Request No" := DocNo;
        TransAllowance."Employee No" := EmployeeNo;
        TransAllowance.Validate("Employee No");
        TransAllowance."Transaction Code" := HRSetup."Transfer Allowance";
        TransAllowance.Validate(TransAllowance."Transaction Code");
        TransAllowance."New Global Dimension 1 Code" := Newstation;
        TransAllowance.Validate(TransAllowance."New Global Dimension 1 Code");
        TransAllowance.Insert();

    end;

    procedure fnModifySelfInitiatedTransfer(DocNo: Text; EmployeeNo: Text; Station1: Text; Station2: Text; Station3: Text; StaffUserId: Text; Comments: Text; Reason: Text)
    begin
        Mobility.Reset();
        Mobility.SetRange("Employee No", EmployeeNo);
        Mobility.SetRange("Document No", DocNo);
        if Mobility.Find('-') then begin
            if Station1 <> ' ' then
                Mobility."New Station" := Station1;
            Mobility.Remarks := Comments;
            Mobility."Transfer Reason Code" := Reason;
            Mobility.Modify(false);
        end;
    end;

    procedure fnSendMobilityApproval(DocNo: Text)
    begin
        Mobility.Reset();
        Mobility.SetRange("Document No", DocNo);
        if Mobility.Find('-') then begin
            VarVariant := Mobility;
            IF CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                CustomApprovalMgt.OnSendDocForApproval(VarVariant);
        end;
    end;

    procedure fnCancelMobilityApproval(DocNo: Text)
    begin
        Mobility.Reset();
        Mobility.SetRange("Document No", DocNo);
        if Mobility.Find('-') then begin
            VarVariant := Mobility;
            CustomApprovalMgt.OnCancelDocApprovalRequest(VarVariant);
        end;
    end;

    procedure fnInsertManagementInitiatedTransfer(EmployeeNo: Text; Station1: Text; StaffUserId: Text; Comments: Text; TransferDate: Date) DocNo: Text
    begin
        HRSetup.Get;
        HRSetup.TestField("Employee Transfer Nos.");
        DocNo := NoSeriesMgt.GetNextNo(HRSetup."Employee Transfer Nos.", 0D, True);

        Mobility.Init();
        Mobility."Employee No" := EmployeeNo;
        Mobility."Document No" := DocNo;
        Mobility.Validate("Employee No");
        Mobility.Type := Mobility.Type::"Management initiated";
        Mobility."New Station" := Station1;
        Mobility.Validate("New Station");
        Mobility."No. Series" := HRSetup."Employee Transfer Nos.";
        Mobility."Created By" := StaffUserId;
        Mobility."Transfer Date" := TransferDate;
        Mobility."Date Created" := Today;
        Mobility."Time Created" := Time;
        Mobility.Remarks := Comments;
        Mobility.Insert(false);

    end;

    procedure fnModifyManagementInitiatedTransfer(DocNo: Text; EmployeeNo: Text; Station1: Text; StaffUserId: Text; Comments: Text; TransferDate: Date)
    begin
        Mobility.Reset();
        Mobility.SetRange("Employee No", EmployeeNo);
        Mobility.SetRange("Document No", DocNo);
        if Mobility.Find('-') then begin
            Mobility."New Station" := Station1;
            Mobility.Validate("New Station");
            Mobility."Transfer Date" := TransferDate;
            Mobility.Remarks := Comments;
            Mobility.Modify(false);
        end;
    end;

    procedure fnGenerateSalaryAdvanceReport(advanceNo: Code[50]; period: Text; filenameFromApp: Text[200]) filename: Text[200]
    var
        SalaryAdvance: Record "Staff Advance Header";
    begin
        HRSetup.Get();
        HRSetup.TestField("Portal Files Path");

        filename := HRSetup."Portal Files Path" + filenameFromApp + '.pdf';

        if Exists(filename) then
            Erase(filename);

        SalaryAdvance.SetRange(SalaryAdvance."No.", advanceNo);
        //SalaryAdvance.SetRange(SalaryAdvance., AppraisalPeriod);
        if SalaryAdvance.Find('-') then
            Report.SaveAsPdf(Report::"Salary Advance", filename, SalaryAdvance);
        exit(filename)
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

    procedure fnInsertPromotionLines(employeeNo: code[20]; documentNo: Code[20]; newCounty: code[20]; newDirectorate: code[20]; newRespCenter: Code[20]; newJobID: code[20]; newSalaryGrade: code[20]; promotionReason: Text[100])
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
        PromoLines."Reason" := promotionReason;
        PromoLines.Validate("New Job ID");
        PromoLines."New Salary Grade" := newSalaryGrade;
        PromoLines.Validate("New Salary Grade");
        //a if PromoLines.Insert(true) then
        PromoLines.Insert(true)
        //    else
        //      PromoLines.Modify(true);
    end;

    procedure fnSendPromotionForApproval(DocNo: Text)
    var
        prom: Record "HR Promo. Recommend Header";
    begin
        prom.Reset();
        prom.SetRange(prom.No, DocNo);
        if prom.FindFirst() then begin
            VarVariant := prom;
            if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
                CustomApprovalMgt.OnSendDocForApproval(VarVariant);
        end;
    end;

    procedure fnSendSalaryAdvForApproval(DocNo: Text)
    var
        SalaryAdv: Record "Staff Advance Headers";
    begin
        SalaryAdv.Reset();
        SalaryAdv.SetRange(SalaryAdv."No.", DocNo);
        if SalaryAdv.FindFirst() then begin
            VarVariant := SalaryAdv;
            if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
                CustomApprovalMgt.OnSendDocForApproval(VarVariant);
        end;
    end;


    procedure fnSendLeavePlannerForApproval(DocNo: Text)
    var
        LeavePlan: Record "HR Leave Planner Header";
    begin
        LeavePlan.Reset();
        LeavePlan.SetRange(LeavePlan."Application Code", DocNo);
        if LeavePlan.FindFirst() then begin
            VarVariant := LeavePlan;
            if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
                CustomApprovalMgt.OnSendDocForApproval(VarVariant);
        end;
    end;

    procedure fnCancelLeavePlannerApproval(DocNo: Text)
    var
        LeavePlan: Record "HR Leave Planner Header";
    begin
        LeavePlan.Reset();
        LeavePlan.SetRange(LeavePlan."Application Code", DocNo);
        if LeavePlan.FindFirst() then begin
            VarVariant := LeavePlan;
            CustomApprovalMgt.OnCancelDocApprovalRequest(VarVariant);
        end;
    end;
}
