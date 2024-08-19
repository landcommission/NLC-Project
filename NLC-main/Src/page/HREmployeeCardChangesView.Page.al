#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194164 "HR Employee Card Changes View"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Print,Functions,Employee,Attachments';
    SourceTable = "HR Employees - Changes";
    ApplicationArea = All;
    Caption = 'HR Employee Card Changes View';
    layout
    {
        area(Content)
        {
            group("General Details")
            {
                Caption = 'General Details';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    AssistEdit = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Code field.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit() then
                            CurrPage.Update();
                    end;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Approval Responsibility Center"; Rec."Approval Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Responsibility Center field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Bank Info Updated"; Rec."Bank Info Updated")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Info Updated field.';
                }
            }
            part(Control1904937601; "HR Employee Bank TransferLine")
            {
                Caption = 'Bank Details';
                SubPageLink = "Request No" = field(Code);
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755002; Outlook) { }
            systempart(Control1; Links) { }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
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
                        DocumentType := DocumentType::Emp;
                        ApprovalEntries.Setfilters(Database::"HR Employees - Changes", DocumentType, Rec.Code);
                        ApprovalEntries.Run();
                    end;
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                    //ApprovalTemplates: Record "Approval Templates";
                    //AdditionalApprovers: Record "Additional Approvers";
                    begin

                        /*
                        UserSetup.RESET;
                        UserSetup.SETRANGE(UserSetup."User ID",USERID);
                        IF UserSetup.FIND('-') THEN
                        BEGIN
                            IF (UserSetup."Approver ID"='') OR (UserSetup."Approver ID"=USERID) THEN
                            BEGIN
                                    ApprovalTemplates.RESET;
                                    ApprovalTemplates.SETRANGE(ApprovalTemplates."Document Type",ApprovalTemplates."Document Type"::Emp);
                                    ApprovalTemplates.SETRANGE(ApprovalTemplates."Responsibility Center",'HRM');
                                    ApprovalTemplates.SETRANGE(ApprovalTemplates.Enabled,TRUE);
                                    IF ApprovalTemplates.FIND('-') THEN
                                    BEGIN
                                            AdditionalApprovers.RESET;
                                            AdditionalApprovers.SETRANGE(AdditionalApprovers."Approval Code",ApprovalTemplates."Approval Code");
                                            AdditionalApprovers.SETRANGE(AdditionalApprovers."Document Type",AdditionalApprovers."Document Type"::EmpReq);
                                            IF AdditionalApprovers.FIND('-') THEN
                                            BEGIN
                                                IF (AdditionalApprovers."Approver ID"='') OR (AdditionalApprovers."Approver ID"=USERID) THEN
                                                  ERROR('You must have a Recommender in User Setup or an Approver in Additional Approvers')
                                          END
                                    END ELSE
                                    BEGIN
                                        ERROR('You must have a Recommender in User Setup or an Approver in Additional Approvers')
                                    END;
                            END;
                        END ELSE
                        BEGIN
                            ERROR('You must have a Recommender in User Setup or an Approver in Additional Approvers')
                        END;
                        */


                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        if not AllFieldsEntered() then
                            Error('Some of the Key Fields on the Lines:[Employee No.,New BankCode,New Branch,New A/C Number,New Percentage to transfer,From Payroll Period] Have not been Entered please RECHECK your entries');

                        if Rec."Approval Status" <> Rec."Approval Status"::Open then
                            exit;
                        if Confirm('Send Approval Request?', true) = false then
                            exit;
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //AppMgmt.Send_Employee_ApprovalRequest(Rec);

                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        if Confirm('Cancel Approval Request?', true) = false then
                            exit;
                        // AppMgmt.Cancel_Employee_ApprovalRequest(Rec, true, true);
                    end;
                }
            }
        }
    }


    trigger OnDeleteRecord(): Boolean
    begin

        if Rec."Approval Status" <> Rec."Approval Status"::Open then
            Error('You are not allowed to delete at this level');
    end;

    var
        PictureExists: Boolean;
        Text001: Label 'Do you want to replace the existing picture of %1 %2?';
        Text002: Label 'Do you want to delete the picture of %1 %2?';
        Dates: Codeunit "HR Dates";
        DoclLink: Record "HR Employee Attachments";
        "Filter": Boolean;
        prEmployees: Record "HR Employees";
        prPayrollType: Record "prPayroll Type";
        Mail: Codeunit Mail;
        HREmp: Record "HR Employees";
        SupervisorNames: Text[60];
        Misc: Record "Misc. Article Information";
        Conf: Record "Confidential Information";
        //SMTP: Codeunit "SMTP Mail";
        CompInfo: Record "Company Information";
        Body: Text[1024];
        Text003: Label 'Welcome to Lotus Capital Limited';
        Filename: Text;
        Recordlink: Record "Record Link";
        Text004a: Label 'It is a great pleasure to welcome you to Moi Teaching and Referral Hospital. You are now part of an organization that has its own culture and set of values. On your resumption and during your on-boarding process,  to help you to understand and adapt quickly and easily to the LOTUS CAPITAL culture and values, HR Unit shall provide you with various important documents that you are encouraged to read and understand.';
        Text004b: Label 'On behalf of the Managing Director, I congratulate you for your success in the interview process and I look forward to welcoming you on board LOTUS CAPITAL Limited.';
        Text004c: Label 'Adebola SAMSON-FATOKUN';
        Text004d: Label 'Strategy & Corporate Services';
        NL: Char;
        LF: Char;
        objpostingGroup: Record "prEmployee Posting Group";
        objDimVal: Record "Dimension Value";
        "Citizenship Text": Text[200];
        BankEditable: Boolean;
        HRBankAccounts: Record "HR Employee Bank Accounts";
        Dretire: Text[100];
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //AppMgmt: Codeunit "Export F/O Consolidation";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,None,PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Staff Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;
        ApprovalEntries: Page "Approval Entries";
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;


    procedure GetSupervisor(var sUserID: Code[50]) SupervisorName: Text[200]
    var
        UserSetup: Record "User Setup";
    begin
        /*
         IF sUserID<>'' THEN
        BEGIN
                UserSetup.RESET;
                IF UserSetup.GET(sUserID) THEN
                BEGIN

                SupervisorName:=UserSetup."Approver ID";
                    IF SupervisorName<>'' THEN BEGIN

                    HREmp.SETRANGE(HREmp."User ID",SupervisorName);
                    IF HREmp.FIND('-') THEN
                    SupervisorName:=HREmp.FullName;

                    END ELSE BEGIN
                    SupervisorName:='';
                    END;


                END ELSE BEGIN
                ERROR('User'+' '+ sUserID +' '+ 'does not exist in the user setup table');
                SupervisorName:='';
                END;
          END;
            */

    end;


    procedure GetSupervisorID(var EmpUserID: Code[50]) SID: Text[200]
    var
        UserSetup: Record "User Setup";
        SupervisorID: Code[20];
    begin
        /*
          IF EmpUserID<>'' THEN
        BEGIN
             SupervisorID:='';

             UserSetup.RESET;
             IF UserSetup.GET(EmpUserID) THEN
             BEGIN
                SupervisorID:=UserSetup."Approver ID";
                IF SupervisorID <> '' THEN
                BEGIN
                   SID:=SupervisorID;
                END ELSE
                BEGIN
                   SID:='';
                END;
             END ELSE BEGIN
             ERROR('User'+' '+ EmpUserID +' '+ 'does not exist in the user setup table');
             END;
          END;
         */

    end;


    procedure LinesExists(): Boolean
    var
        PayLines: Record "HR Employee Transfer Lines";
    begin

        HasLines := false;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Request No", Rec.Code);
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;


    procedure AllFieldsEntered(): Boolean
    var
        PayLines: Record "HR Employee Transfer Lines";
    begin

        AllKeyFieldsEntered := true;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Request No", Rec.Code);
        if PayLines.Find('-') then begin
            repeat
                if (PayLines."Employee No" = '') or (PayLines."New Bank  Code" = '') or (PayLines."New Branch Code" = '') or (PayLines."New A/C  Number" = '') or (PayLines."From payroll Period" = 0D) or (PayLines."New Percentage to Transfer" = 0) then
                    AllKeyFieldsEntered := false;
            until PayLines.Next() = 0;
            exit(AllKeyFieldsEntered);
        end;
    end;
}
