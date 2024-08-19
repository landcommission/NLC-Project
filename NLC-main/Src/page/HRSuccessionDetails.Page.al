#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194091 "HR Succession Details"
{
    PageType = Card;
    SourceTable = "HR Jobs to Succeed";
    ApplicationArea = All;
    Caption = 'HR Succession Details';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Position Reporting to"; Rec."Position Reporting to")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Position Reporting to field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vacant Positions field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(DesiredScore; DesiredScore)
                {
                    ApplicationArea = Basic;
                    Caption = 'Desired Score';
                    ToolTip = 'Specifies the value of the Desired Score field.';
                }
            }
            part(Control11; "HR Successor")
            {
                SubPageLink = "Position to Succeed" = field("Job ID");
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    DocumentType := DocumentType::SuccDetails;
                    ApprovalEntries.Setfilters(Database::"HR Jobs to Succeed", DocumentType, Rec."Job ID");
                    ApprovalEntries.Run();
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    //TESTFIELDS;

                    if Confirm('Send this Application for Approval?', true) = false then
                        exit;
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //ApprovalMgt.SendSuccessionDetailsApproval(Rec);
                end;
            }
            action("Cancel Approvals")
            {
                ApplicationArea = Basic;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Cancel Approvals action.';
                trigger OnAction()
                begin
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    //ApprovalMgt.CancelSuccessionDetailsApproval(Rec,true,true);
                end;
            }
            action("Suggest Successors")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Suggest Successors action.';
                trigger OnAction()
                begin




                    HRSuccessionEmployee.Reset();
                    HRSuccessionEmployee.SetRange(HRSuccessionEmployee."Position to Succeed", Rec."Job ID");
                    if HRSuccessionEmployee.Find('-') then begin
                        HRSuccessionEmployee.DeleteAll();
                        LNo := 0;
                    end;
                    HRSuccessionEmployee."Position to Succeed" := Rec."Job ID";
                    NumDays := 0;

                    HREmp.Reset();
                    HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                    if HREmp.Find('-') then
                        repeat
                            countcompetence := 0;
                            sumcompetence := 0;
                            CountQulify := 0;
                            sumqulify := 0;
                            Resqulify := 0;
                            Rescompetence := 0;
                            countjreq := 0;
                            sumjreq := 0;
                            resjreq := 0;
                            PerformanceScore := 0;
                            ExperienceRating := 0;
                            Jobcount := 0;

                            //Experience
                            ReqExperience := Rec."Succession Experience";
                            //length of service
                            NumDays := Today - HREmp."Date Of Joining the Company";
                            LengthofService := Round(NumDays / 365, 0.1);
                            if ReqExperience > 0 then
                                ExperienceRating := ((LengthofService / ReqExperience) * 30);
                            if ExperienceRating > 30 then
                                ExperienceRating := 30;
                            //  IF HREmp."No."='EMP0018' THEN  BEGIN
                            // MESSAGE(FORMAT(ExperienceRating)+' eXPERIENCE');
                            // mESSAGE(FORMAT(NumDays))
                            // END;
                            //Performance Rating

                            HRIndividualTargetsHeader.Reset();
                            HRIndividualTargetsHeader.SetRange(HRIndividualTargetsHeader."Employee No", HREmp."No.");
                            HRIndividualTargetsHeader.SetRange(HRIndividualTargetsHeader.Status, HRIndividualTargetsHeader.Status::Posted);
                            if HRIndividualTargetsHeader.Find('+') then
                                PerformanceScore := ((HRIndividualTargetsHeader."Overall Rating" / 100) * 30);
                            // IF HREmp."No."='EMP0018' THEN
                            // MESSAGE(FORMAT(PerformanceScore)+'pERFORMANCE');


                            //    //competency

                            //      HREmployeeCompetency.RESET;
                            //      HREmployeeCompetency.SETRANGE(HREmployeeCompetency."Employee No", HREmp."No.");
                            //      IF HREmployeeCompetency.FIND('-') THEN
                            //      countcompetence:=HREmployeeCompetency.COUNT;
                            //      BEGIN
                            //          REPEAT
                            //         sumcompetence:=sumcompetence+HREmployeeCompetency."Competency Score";
                            //          UNTIL HREmployeeCompetency.NEXT=0;

                            //      END;
                            //
                            //      //check for averAGE
                            //      Rescompetence:=((sumcompetence/countcompetence)/100) * 33.3;

                            //qualification
                            //     HREmployeeQualifications_2.RESET;
                            //     HREmployeeQualifications_2.SETRANGE(HREmployeeQualifications_2."Employee No.",  HREmp."No.");
                            //     IF HREmployeeQualifications_2.FIND('-') THEN
                            //        CountQulify:=HREmployeeQualifications_2.COUNT;
                            //     BEGIN
                            //         REPEAT
                            //          sumqulify:=sumqulify+HREmployeeQualifications_2.Score;
                            //         UNTIL HREmployeeQualifications_2.NEXT=0;
                            //     END;
                            //        Resqulify:=((sumqulify/CountQulify)/100)*33.3);
                            HRJobRequirements.Reset();
                            HRJobRequirements.SetRange(HRJobRequirements."Job ID", Rec."Job ID");
                            Jobcount := HRJobRequirements.Count;


                            //job requirements
                            HRJobRequirements.Reset();
                            HRJobRequirements.SetRange(HRJobRequirements."Job ID", Rec."Job ID");
                            if HRJobRequirements.Find('-') then
                            //MESSAGE(FORMAT(Jobcount)+HREmp."No.") ;
                            begin
                                repeat
                                    //for each JR compare with Emp qlfction
                                    HREmployeeQualifications.Reset();
                                    HREmployeeQualifications.SetRange(HREmployeeQualifications."Employee No.", HREmp."No.");
                                    HREmployeeQualifications.SetRange(HREmployeeQualifications."Qualification Code", HRJobRequirements."Qualification Code");
                                    if HREmployeeQualifications.FindFirst() then begin

                                        countjreq := countjreq + 1;
                                        sumjreq := sumjreq + HREmployeeQualifications.Score;
                                        //MESSAGE(FORMAT(countjreq)+ 'Count ');
                                        // MESSAGE(FORMAT(sumjreq)+ 'sum ');


                                    end;
                                until HRJobRequirements.Next() = 0;
                                if countjreq <> 0 then
                                    resjreq := (countjreq / Jobcount) * 40;

                                //  IF HREmp."No."='EMP0016' THEN
                                //  MESSAGE(FORMAT(countjreq)+ 'Countreq');




                            end;

                            //message(format(resjreq));
                            //message(format(Resqulify));


                            //if true insert into hr successors
                            TotalScore := ExperienceRating + PerformanceScore + resjreq;
                            // MESSAGE(FORMAT(TotalScore) +(FORMAT( HREmp."No.")));
                            //check if emp has met the threshold (Desired score)
                            if TotalScore >= DesiredScore then begin


                                // MESSAGE(FORMAT(TotalScore));
                                //  MESSAGE(FORMAT(HREmp."No."));

                                //insert into HR Successor
                                HRSuccessionEmployee.Init();
                                HRSuccessionEmployee."Line No.2" += 1;
                                HRSuccessionEmployee."Position to Succeed" := Rec."Job ID";
                                HRSuccessionEmployee."Staff No." := HREmp."No.";
                                HRSuccessionEmployee."First Name" := HREmp."First Name";
                                HRSuccessionEmployee."Middle Name" := HREmp."Middle Name";
                                HRSuccessionEmployee."Last Name" := HREmp."Last Name";
                                HRSuccessionEmployee."Department Code" := HREmp."Responsibility Center";
                                HRSuccessionEmployee."Date of Join" := HREmp."Date Of Joining the Company";
                                HRSuccessionEmployee.Readiness := HRSuccessionEmployee.Readiness::Ready;
                                HRSuccessionEmployee.Insert();

                            end
                            else
                                if TotalScore < DesiredScore then begin



                                    //insert into HR Successor
                                    HRSuccessionEmployee.Init();
                                    HRSuccessionEmployee."Line No.2" += 1;
                                    HRSuccessionEmployee."Position to Succeed" := Rec."Job ID";
                                    HRSuccessionEmployee."Staff No." := HREmp."No.";
                                    HRSuccessionEmployee."First Name" := HREmp."First Name";
                                    HRSuccessionEmployee."Middle Name" := HREmp."Middle Name";
                                    HRSuccessionEmployee."Last Name" := HREmp."Last Name";
                                    HRSuccessionEmployee."Department Code" := HREmp."Responsibility Center";
                                    HRSuccessionEmployee."Date of Join" := HREmp."Date Of Joining the Company";
                                    HRSuccessionEmployee.Readiness := HRSuccessionEmployee.Readiness::Waiting;
                                    HRSuccessionEmployee.Insert();

                                end;




                        until HREmp.Next() = 0;







                    /*

                    //Clear entries in  HR Succesor Lines before re populating
                    HRSuccessionEmployee.RESET;
                    HRSuccessionEmployee.SETRANGE(HRSuccessionEmployee."Position to Succeed","Job ID");
                    IF HRSuccessionEmployee.FIND('-') THEN HRSuccessionEmployee.DELETEALL;

                    //Get job requirements
                    HRJobRequirements.RESET;
                    HRJobRequirements.SETRANGE(HRJobRequirements."Job ID","Job ID");
                    HRJobRequirements.SETRANGE(HRJobRequirements.Mandatory,TRUE);
                    IF HRJobRequirements.FIND('-') THEN
                    BEGIN
                        REPEAT
                            //Check if employee qualifications match jus the Job requirements without the score
                            HREmployeeQualifications.RESET;
                            HREmployeeQualifications.SETRANGE(HREmployeeQualifications."Qualification Code",HRJobRequirements."Qualification Code");
                            IF HREmployeeQualifications.FIND('-') THEN
                            BEGIN
                                //REPEAT
                                    //Insert into HR Succesor Lines
                                    HRSuccessionEmployee.RESET;

                                    HRSuccessionEmployee.INIT;

                                    HRSuccessionEmployee."Line No.":=fnGetLastLineNo;
                                    HRSuccessionEmployee."Staff No.":=HREmployeeQualifications."Employee No.";
                                    HRSuccessionEmployee.VALIDATE(HRSuccessionEmployee."Staff No.");
                                    HRSuccessionEmployee."Position to Succeed":="Job ID";

                                    HRSuccessionEmployee.INSERT;

                               // UNTIL HREmployeeQualifications.NEXT =0;
                            END;
                        UNTIL HRJobRequirements.NEXT =0;
                        MESSAGE('Process Complete');
                    END;

                    //HRSuccessionEmployee.RESET;
                    //HRSuccessionEmployee.SETRANGE(HRSuccessionEmployee."Position to Succeed","Job ID");
                    //IF HRSuccessionEmployee.FIND('-') THEN HRSuccessionEmployee.DELETEALL;

                    //HREmployeeQualifications.RESET;
                    //IF HREmployeeQualifications.FIND('-') THEN
                    //BEGIN
                    //    REPEAT
                    //        //Searh Job Requirments for this qualification
                    //        HRJobRequirements.RESET;
                    //        HRJobRequirements.SETRANGE(HRJobRequirements."Qualification Code",HREmployeeQualifications."Qualification Code");
                    //        //HRJobRequirements.SETRANGE(HRJobRequirements.Mandatory,true);
                    //        HRJobRequirements.SETRANGE(HRJobRequirements."Job ID","Job ID");
                    //        IF HRJobRequirements.FIND('-') THEN
                    //        BEGIN
                    //            HREmployeeQualifications_2.reset;
                    //            HREmployeeQualifications_2.setrange();
                    //            //Insert into HR Succesor Lines
                    //            HRSuccessionEmployee.RESET;
                    //
                    //            HRSuccessionEmployee.INIT;

                    //            HRSuccessionEmployee."Line No.":=fnGetLastLineNo;
                    //            HRSuccessionEmployee."Staff No.":=HREmployeeQualifications."Employee No.";
                    //            HRSuccessionEmployee.VALIDATE(HRSuccessionEmployee."Staff No.");
                    //            HRSuccessionEmployee."Position to Succeed":="Job ID";

                    //            HRSuccessionEmployee.INSERT;
                    //        END;
                    //     UNTIL HREmployeeQualifications.NEXT =0;
                    //     MESSAGE('Process Complete');
                    //END;
                         */


                    /*
                   HRSuccessionEmployee.RESET;
                   HRSuccessionEmployee.SETRANGE(HRSuccessionEmployee."Position to Succeed","Job ID");
                   IF HRSuccessionEmployee.FIND('-') THEN
                   BEGIN
                       IF TotalScore>=DesiredScore THEN
                       HRSuccessionEmployee.Readiness:=HRSuccessionEmployee.Readiness::Ready
                       ELSE
                       IF TotalScore=DesiredScore-20 THEN
                       HRSuccessionEmployee.Readiness:=HRSuccessionEmployee.Readiness::Waiting;
                       HRSuccessionEmployee.MODIFY ;

                   END
                      */

                end;
            }
            action(Successors)
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = false;
                ToolTip = 'Executes the Successors action.';
                trigger OnAction()
                begin
                    countcompetence := 0;
                    sumcompetence := 0;
                    CountQulify := 0;
                    sumqulify := 0;
                    Resqulify := 0;
                    Rescompetence := 0;
                    countjreq := 0;
                    sumjreq := 0;
                    resjreq := 0;


                    HRSuccessionEmployee.Reset();
                    HRSuccessionEmployee.SetRange(HRSuccessionEmployee."Position to Succeed", Rec."Job ID");
                    if HRSuccessionEmployee.Find('-') then begin
                        HRSuccessionEmployee.DeleteAll();
                        LNo := 0;
                    end;
                    HRSuccessionEmployee."Position to Succeed" := Rec."Job ID";


                    HREmp.Reset();
                    HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                    if HREmp.Find('-') then
                        repeat
                            //competency
                            HREmployeeCompetency.Reset();
                            HREmployeeCompetency.SetRange(HREmployeeCompetency."Employee No", HREmp."No.");
                            if HREmployeeCompetency.Find('-') then
                                countcompetence := HREmployeeCompetency.Count;

                            repeat
                                sumcompetence := sumcompetence + HREmployeeCompetency."Competency Score";
                            until HREmployeeCompetency.Next() = 0;

                            //check for averAGE
                            Rescompetence := ((sumcompetence / countcompetence) / 100) * 33.3;

                            //qualification
                            HREmployeeQualifications_2.Reset();
                            HREmployeeQualifications_2.SetRange(HREmployeeQualifications_2."Employee No.", HREmp."No.");
                            if HREmployeeQualifications_2.Find('-') then
                                CountQulify := HREmployeeQualifications_2.Count;

                            repeat
                                sumqulify := sumqulify + HREmployeeQualifications_2.Score;
                            until HREmployeeQualifications_2.Next() = 0;
                            Resqulify := ((sumqulify / CountQulify) / 100) * 33.3;

                            //job requirements
                            HRJobRequirements.Reset();
                            HRJobRequirements.SetRange(HRJobRequirements."Job ID", Rec."Job ID");
                            if HRJobRequirements.Find('-') then begin
                                repeat
                                    //for each JR compare with Emp qlfction
                                    HREmployeeQualifications.Reset();
                                    HREmployeeQualifications.SetRange(HREmployeeQualifications."Employee No.", HREmp."No.");
                                    HREmployeeQualifications.SetRange(HREmployeeQualifications."Qualification Code", HRJobRequirements."Qualification Code");
                                    if HREmployeeQualifications.FindFirst() then begin

                                        countjreq := countjreq + 1;
                                        sumjreq := sumjreq + HREmployeeQualifications.Score;

                                    end;
                                until HRJobRequirements.Next() = 0;
                                if countjreq <> 0 then
                                    resjreq := ((sumjreq / countjreq) / 100) * 33.3;



                            end;

                            //message(format(resjreq));
                            //message(format(Resqulify));


                            //if true insert into hr successors
                            TotalScore := Rescompetence + Resqulify + resjreq;
                            //check if emp has met the threshold (Desired score)
                            if TotalScore >= DesiredScore then begin


                                // MESSAGE(FORMAT(TotalScore));
                                //  MESSAGE(FORMAT(HREmp."No."));

                                //insert into HR Successor
                                HRSuccessionEmployee.Init();
                                HRSuccessionEmployee."Line No.2" += 1;
                                HRSuccessionEmployee."Position to Succeed" := Rec."Job ID";
                                HRSuccessionEmployee."Staff No." := HREmp."No.";
                                HRSuccessionEmployee."First Name" := HREmp."First Name";
                                HRSuccessionEmployee."Middle Name" := HREmp."Middle Name";
                                HRSuccessionEmployee."Last Name" := HREmp."Last Name";
                                HRSuccessionEmployee."Department Code" := HREmp."Responsibility Center";
                                HRSuccessionEmployee."Date of Join" := HREmp."Date Of Joining the Company";
                                HRSuccessionEmployee.Insert();

                            end;


                        until HREmp.Next() = 0;







                    /*

                    //Clear entries in  HR Succesor Lines before re populating
                    HRSuccessionEmployee.RESET;
                    HRSuccessionEmployee.SETRANGE(HRSuccessionEmployee."Position to Succeed","Job ID");
                    IF HRSuccessionEmployee.FIND('-') THEN HRSuccessionEmployee.DELETEALL;

                    //Get job requirements
                    HRJobRequirements.RESET;
                    HRJobRequirements.SETRANGE(HRJobRequirements."Job ID","Job ID");
                    HRJobRequirements.SETRANGE(HRJobRequirements.Mandatory,TRUE);
                    IF HRJobRequirements.FIND('-') THEN
                    BEGIN
                        REPEAT
                            //Check if employee qualifications match jus the Job requirements without the score
                            HREmployeeQualifications.RESET;
                            HREmployeeQualifications.SETRANGE(HREmployeeQualifications."Qualification Code",HRJobRequirements."Qualification Code");
                            IF HREmployeeQualifications.FIND('-') THEN
                            BEGIN
                                //REPEAT
                                    //Insert into HR Succesor Lines
                                    HRSuccessionEmployee.RESET;

                                    HRSuccessionEmployee.INIT;

                                    HRSuccessionEmployee."Line No.":=fnGetLastLineNo;
                                    HRSuccessionEmployee."Staff No.":=HREmployeeQualifications."Employee No.";
                                    HRSuccessionEmployee.VALIDATE(HRSuccessionEmployee."Staff No.");
                                    HRSuccessionEmployee."Position to Succeed":="Job ID";

                                    HRSuccessionEmployee.INSERT;

                               // UNTIL HREmployeeQualifications.NEXT =0;
                            END;
                        UNTIL HRJobRequirements.NEXT =0;
                        MESSAGE('Process Complete');
                    END;

                    //HRSuccessionEmployee.RESET;
                    //HRSuccessionEmployee.SETRANGE(HRSuccessionEmployee."Position to Succeed","Job ID");
                    //IF HRSuccessionEmployee.FIND('-') THEN HRSuccessionEmployee.DELETEALL;

                    //HREmployeeQualifications.RESET;
                    //IF HREmployeeQualifications.FIND('-') THEN
                    //BEGIN
                    //    REPEAT
                    //        //Searh Job Requirments for this qualification
                    //        HRJobRequirements.RESET;
                    //        HRJobRequirements.SETRANGE(HRJobRequirements."Qualification Code",HREmployeeQualifications."Qualification Code");
                    //        //HRJobRequirements.SETRANGE(HRJobRequirements.Mandatory,true);
                    //        HRJobRequirements.SETRANGE(HRJobRequirements."Job ID","Job ID");
                    //        IF HRJobRequirements.FIND('-') THEN
                    //        BEGIN
                    //            HREmployeeQualifications_2.reset;
                    //            HREmployeeQualifications_2.setrange();
                    //            //Insert into HR Succesor Lines
                    //            HRSuccessionEmployee.RESET;
                    //
                    //            HRSuccessionEmployee.INIT;

                    //            HRSuccessionEmployee."Line No.":=fnGetLastLineNo;
                    //            HRSuccessionEmployee."Staff No.":=HREmployeeQualifications."Employee No.";
                    //            HRSuccessionEmployee.VALIDATE(HRSuccessionEmployee."Staff No.");
                    //            HRSuccessionEmployee."Position to Succeed":="Job ID";

                    //            HRSuccessionEmployee.INSERT;
                    //        END;
                    //     UNTIL HREmployeeQualifications.NEXT =0;
                    //     MESSAGE('Process Complete');
                    //END;
                         */

                end;
            }
            action("Propose Successors")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = false;
                ToolTip = 'Executes the Propose Successors action.';
                trigger OnAction()
                begin
                    HREmp.Reset();
                    HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                    if HREmp.Find('-') then
                        repeat
                            HRJobRequirements.Reset();
                            HRJobRequirements.SetRange(HRJobRequirements."Job ID", Rec."Job ID");
                            if HRJobRequirements.Find('-') then begin
                                CountQulify := HRJobRequirements.Count;   //Count Total Requirments for the Job
                                repeat
                                    HREmployeeQualifications.Reset();
                                    HREmployeeQualifications.SetRange(HREmployeeQualifications."Employee No.", HREmp."No.");
                                    HREmployeeQualifications.SetRange(HREmployeeQualifications."Qualification Code", HRJobRequirements."Qualification Code");
                                    if HREmployeeQualifications.Find('-') then
                                        repeat
                                            HRSuccessionEmployee.Reset();

                                            HRSuccessionEmployee.Init();
                                            HRSuccessionEmployee."Line No." := fnGetLastLineNo();
                                            HRSuccessionEmployee."Staff No." := HREmployeeQualifications."Employee No.";
                                            HRSuccessionEmployee.Validate(HRSuccessionEmployee."Staff No.");
                                            HRSuccessionEmployee."Position to Succeed" := Rec."Job ID";

                                            HRSuccessionEmployee.Insert();
                                        until HREmployeeQualifications.Next() = 0;
                                until HRJobRequirements.Next() = 0;
                            end;
                        until HREmp.Next() = 0;
                end;
            }
        }
    }

    var
        HREmp: Record "HR Employees";
        EmpJobDesc: Text[50];
        HRJobs: Record "HR Jobs";
        SupervisorName: Text[60];
        //SMTP: Codeunit "SMTP Mail";
        URL: Text[500];
        HRSetup: Record "HR Setup";
        EmpDept: Text[30];
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDetails;
        ApprovalEntries: Page "Approval Entries";
        HRLeaveLedgerEntries: Record "HR Leave Ledger Entries";
        EmpName: Text[70];
        ApprovalComments: Page "Approval Comments";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        varDaysApplied: Integer;
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        "LineNo.": Integer;
        sDate: Record Date;
        Customized: Record "HR Calendar";
        HREmailParameters: Record "HR E-Mail Parameters";
        HRJournalBatch: Record "HR Leave Journal Batch";
        HRJobRequirements: Record "HR Job Requirements";
        HREmployeeQualifications: Record "HR Employee Qualifications";
        HRSuccessionEmployee: Record "HR Succession Employee";
        HREmployeeQualifications_2: Record "HR Employee Qualifications";
        DesiredScore: Decimal;
        HREmployeeCompetency: Record "HR Employee Competence";
        countcompetence: Integer;
        sumcompetence: Decimal;
        Rescompetence: Decimal;
        CountQulify: Integer;
        sumqulify: Decimal;
        Resqulify: Decimal;
        countjreq: Integer;
        sumjreq: Decimal;
        resjreq: Decimal;
        TotalScore: Decimal;
        LNo: Integer;
        ReqExperience: Decimal;
        LengthofService: Decimal;
        years: Decimal;
        Months: Decimal;
        NumDays: Integer;
        ExperienceRating: Decimal;
        HRIndividualTargetsHeader: Record "HR Individual Targets Header";
        PerformanceScore: Decimal;
        Jobcount: Integer;

    local procedure fnGetLastLineNo() LastLineNum: Integer
    var
        HRSuccessionEmployee_2: Record "HR Succession Employee";
    begin
        HRSuccessionEmployee_2.Reset();
        if HRSuccessionEmployee_2.Find('+') then
            LastLineNum := HRSuccessionEmployee_2."Line No." + 1
        else
            LastLineNum := 1000;
    end;
}
