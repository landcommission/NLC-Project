#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193520 "Transfer Schedule Card"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Transfer Schedule 1";
    UsageCategory = Lists;
    Caption = 'Transfer Schedule Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Change Type"; Rec."Change Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Change Type field.';
                }
                field("Transfer Type"; Rec."Transfer Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer Type field.';
                    trigger OnValidate()
                    begin
                        if Rec."Transfer Type" = Rec."Transfer Type"::Transfer then begin

                            JobMngt := true;
                            CurrentBranch := true;
                            LeaveDays := false;
                            Salary := true;
                            BankDetails := false;
                        end;


                        if Rec."Transfer Type" = Rec."Transfer Type"::Confirmation then begin
                            JobMngt := true;
                            CurrentBranch := false;
                            LeaveDays := false;
                            Salary := true;
                            BankDetails := false;
                        end;



                        if Rec."Transfer Type" = Rec."Transfer Type"::Promotion then begin
                            JobMngt := true;
                            CurrentBranch := true;
                            LeaveDays := false;
                            Salary := true;
                            BankDetails := false;
                        end;


                        if Rec."Transfer Type" = Rec."Transfer Type"::Demotion then begin
                            JobMngt := true;
                            CurrentBranch := true;
                            LeaveDays := false;
                            Salary := true;
                            BankDetails := false;
                        end;

                        if Rec."Transfer Type" = Rec."Transfer Type"::"Basic Pay" then begin
                            JobMngt := false;
                            CurrentBranch := true;
                            LeaveDays := false;
                            Salary := true;
                            BankDetails := false;
                        end;

                        if Rec."Transfer Type" = Rec."Transfer Type"::Exits then begin
                            JobMngt := true;
                            CurrentBranch := false;
                            LeaveDays := false;
                            Salary := false;
                            BankDetails := false;
                        end;


                        if Rec."Transfer Type" = Rec."Transfer Type"::"Extend Probation" then begin
                            JobMngt := true;
                            CurrentBranch := false;
                            LeaveDays := false;
                            Salary := false;
                            BankDetails := false;
                        end;

                        if Rec."Transfer Type" = Rec."Transfer Type"::"Bank Details" then begin
                            JobMngt := false;
                            CurrentBranch := false;
                            LeaveDays := false;
                            Salary := false;
                            BankDetails := true;

                        end;


                        if Rec."Transfer Type" = Rec."Transfer Type"::Leave then begin
                            JobMngt := false;
                            CurrentBranch := false;
                            LeaveDays := true;
                            Salary := false;
                            BankDetails := false;
                        end;



                        if Rec."Transfer Type" = Rec."Transfer Type"::"Rated Pay" then begin
                            JobMngt := false;
                            CurrentBranch := true;
                            LeaveDays := false;
                            Salary := true;
                            BankDetails := false;
                        end;


                        if Rec."Transfer Type" = Rec."Transfer Type"::Promotion then begin
                            JobMngt := true;
                            CurrentBranch := true;
                            LeaveDays := false;
                            Salary := true;
                            BankDetails := false;
                        end;
                    end;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Date Requested"; Rec."Date Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Requested field.';
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Confirmation Date"; Rec."Confirmation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Confirmation Date field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
            }
            group("Job Mngt")
            {
                Visible = JobMngt;
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("New Job ID"; Rec."New Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Job ID field.';
                }
                field("New Job Title"; Rec."New Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Job Title field.';
                }
                field("Current Status"; Rec."Current Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Employment  Status';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Employment  Status field.';
                }
                field("New  status"; Rec."New  status")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Employment  status';
                    ToolTip = 'Specifies the value of the New Employment  status field.';
                }
                field("Current Probation End Date"; Rec."Current Probation End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Probation End Date field.';
                }
                field("Extended Probation Duration"; Rec."Extended Probation Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Extended Probation Duration field.';
                }
                field("Probation Extension Reason"; Rec."Probation Extension Reason")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Probation Extension Reason field.';
                }
                field("Extended Probation End Date"; Rec."Extended Probation End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Extended Probation End Date field.';
                }
                field("Email Address"; Rec."Email Address")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Email Address';
                    ToolTip = 'Specifies the value of the Current Email Address field.';
                }
                field("New Email address"; Rec."New Email address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Email address field.';
                }
                field("Current Username"; Rec."Current Username")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Username field.';
                }
                field("New Username"; Rec."New Username")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Username field.';
                }
                field("Current CellPhone No"; Rec."Current CellPhone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current CellPhone No field.';
                }
                field("New CellPhone No"; Rec."New CellPhone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New CellPhone No field.';
                }
                field("KRA PIN"; Rec."KRA PIN")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KRA PIN field.';
                }
                field("NHIF No"; Rec."NHIF No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NHIF No field.';
                }
                field("NSSF No"; Rec."NSSF No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NSSF No field.';
                }
                field("Reason for exit"; Rec."Termination Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason for exit';
                    ToolTip = 'Specifies the value of the Reason for exit field.';
                }
            }
            group("Current Branch")
            {
                Visible = CurrentBranch;
                field("Curent Branch"; Rec."Curent Branch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Curent Branch field.';
                }
                field("Curent Branch Name"; Rec."Curent Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Curent Branch Name field.';
                }
                field("New Branch"; Rec."New Branch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Branch field.';
                }
                field("New Branch Name"; Rec."New Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Branch Name field.';
                }
                field("Current Department"; Rec."Current Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Department field.';
                }
                field("New Department"; Rec."New Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Department field.';
                }
                field("Current Supervisor"; Rec."Current Supervisor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Supervisor field.';
                }
                field("New Supervisor"; Rec."New Supervisor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Supervisor field.';
                }
                field("HOD Level"; Rec."HOD Level")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current HOD Level';
                    ToolTip = 'Specifies the value of the Current HOD Level field.';
                }
                field("New HOD Level"; Rec."New HOD Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New HOD Level field.';
                }
            }
            group("Leave Days")
            {
                Visible = LeaveDays;
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Type field.';
                }
                field("Days Compensated"; Rec."Days Compensated")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days Compensated field.';
                }
                field("Leave Calendar Code"; Rec."Leave Calendar Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Calendar Code field.';
                }
                field("Leave Entry Type"; Rec."Leave Entry Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Entry Type field.';
                }
            }
            group(Salary)
            {
                Visible = Salary;
                field("Current Pay"; Rec."Current Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Pay field.';
                }
                field("Pay Change"; Rec."Pay Change")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Change field.';
                }
                field("Current Rated Pay"; Rec."Rated Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rated Pay field.';
                }
                field("New Rated Pay"; Rec."New Rated Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Rated Pay field.';
                }
            }
            group("Bank Details")
            {
                Visible = BankDetails;
                field("Current Bank"; Rec."Current Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Bank field.';
                }
                field("Current Bank Name"; Rec."Current Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Bank Name field.';
                }
                field("Current Bank Branch"; Rec."Current Bank Branch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Bank Branch field.';
                }
                field("Current Bank  Branch Name"; Rec."Current Bank  Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Bank  Branch Name field.';
                }
                field("Current Bank Account No."; Rec."Current Bank Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Bank Account No. field.';
                }
                field("Current Lock  Bank Details"; Rec."Current Lock  Bank Details")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Lock  Bank Details field.';
                }
                field("New Bank"; Rec."New Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Bank field.';
                }
                field("New Bank Name"; Rec."New Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Bank Name field.';
                }
                field("New Bank  Branch"; Rec."New Bank  Branch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Bank  Branch field.';
                }
                field("New Bank Branch Name"; Rec."New Bank Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Bank Branch Name field.';
                }
                field("New Bank Account No"; Rec."New Bank Account No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Bank Account No field.';
                }
                field("New Lock  Bank Details"; Rec."New Lock  Bank Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Lock  Bank Details field.';
                }
            }
            group(Approvals)
            {
                field(Remark; Rec.Remark)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remark field.';
                }
                field("Transfer Status"; Rec."Transfer Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Transfer Status field.';
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved By field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Current Location"; Rec."Current Location")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Location field.';
                }
                field("Approvals Remarks"; Rec."Approvals Remarks")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approvals Remarks field.';
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
            group("Document Approvals")
            {
                action("Send Approval")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    Visible = false;
                    ToolTip = 'Executes the Send Approval action.';
                    trigger OnAction()
                    begin
                        if Rec."New Lock  Bank Details" = true then
                            if Confirm('Are you sure you want to Unlock the Bank Details for' + ' ' + Rec.Description + ' ?', true) then
    ;
                    end;
                }
                action(Approval)
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    Visible = false;
                    ToolTip = 'Executes the Approval action.';

                }
                action("Reject Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reject Approval';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = false;
                    ToolTip = 'Executes the Reject Approval action.';

                }
                action("Cancel Application")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Executes the Cancel Application action.';
                    trigger OnAction()
                    begin
                        Rec."Transfer Status" := Rec."Transfer Status"::Cancelled;

                        Rec.Modify();
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Basic;
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Approve action.';
                    trigger OnAction()
                    begin
                        Rec."Transfer Status" := Rec."Transfer Status"::Approved;

                        Rec.Modify();
                        Rec."Approved By" := UserId;
                    end;
                }
                action("Effect Change")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;
                    ToolTip = 'Executes the Effect Change action.';

                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    begin
                        DocumentType := DocumentType::TS;
                        ApprovalEntries.Setfilters(Database::"Transfer Schedule 1", DocumentType, Rec.Code);
                        ApprovalEntries.Run();




                        if Rec."Transfer Status" = Rec."Transfer Status"::Approved then
                            if CompanyStaff.Get(Rec."Employee Code") then begin
                                if Rec."Effective Date" <= Today then begin
                                    if Rec."New Branch" <> '' then begin
                                        CompanyStaff."Global Dimension 1 Code" := Rec."New Branch";

                                        // CompanyStaff."Global Dimension 1 Name":="New Branch Name";
                                        CompanyStaff.Modify();
                                    end;

                                    if Rec."New Job ID" <> '' then begin
                                        CompanyStaff."Job ID" := Rec."New Job ID";
                                        CompanyStaff."Job Title" := Rec."New Job Title";
                                        CompanyStaff.Modify();




                                        /*  EmpKin.RESET;
                                          EmpKin.SETRANGE(EmpKin."Employee Code",CompanyStaff."No.");
                                          EmpKin.SETRANGE(EmpKin.Relation,EmpKin.Relation::Member);
                                          IF EmpKin.FIND('-') THEN
                                            BEGIN
                                              EmpKin."Job Title":=CompanyStaff."Job Title";
                                              EmpKin.MODIFY;
                                              END

                                       END;

                                       IF "New Supervisor"<>'' THEN BEGIN
                                          CompanyStaff."Supervisor Staff ID":="New Supervisor";
                                         CompanyStaff.MODIFY;
                                        END; */

                                        if Rec."New Department" <> '' then begin
                                            CompanyStaff."Responsibility Center" := Rec."New Department";
                                            CompanyStaff."Job Title" := Rec."New Job Title";
                                            CompanyStaff.Modify();
                                        end;

                                        if Rec."Transfer Type" = Rec."Transfer Type"::Exits then begin
                                            //CompanyStaff.Status:="New  status";
                                            CompanyStaff."Date Of Leaving" := Rec."Effective Date";
                                            CompanyStaff.Modify();

                                        end;


                                        if Rec."Transfer Type" = Rec."Transfer Type"::Exits then
                                            if Rec."Termination Category" <> Rec."Termination Category"::" " then begin
                                                CompanyStaff."Termination Grounds" := Rec."Termination Category";
                                                CompanyStaff.Modify();
                                            end;

                                        /*
                                        IF "New HOD Level"<> "HOD Level" THEN BEGIN
                                           CompanyStaff."HOD Level":="New HOD Level";
                                           CompanyStaff.MODIFY;
                                           END;  */


                                        if Rec."New Email address" <> '' then begin
                                            CompanyStaff."Company E-Mail" := Rec."New Email address";
                                            CompanyStaff.Modify();
                                        end;


                                        if Rec."New Username" <> '' then begin
                                            CompanyStaff."User ID" := Rec."Current Username";
                                            CompanyStaff.Modify();
                                        end;

                                        if Rec."KRA PIN" <> '' then begin
                                            CompanyStaff."PIN No." := Rec."KRA PIN";
                                            CompanyStaff.Modify();
                                        end;

                                        if Rec."NHIF No" <> '' then begin
                                            CompanyStaff."NHIF No." := Rec."NHIF No";
                                            CompanyStaff.Modify();
                                        end;


                                        if Rec."NSSF No" <> '' then begin
                                            CompanyStaff."NSSF No." := Rec."NSSF No";
                                            CompanyStaff.Modify();
                                        end;

                                        if Rec."New CellPhone No" <> '' then begin
                                            CompanyStaff."Cell Phone Number" := Rec."New CellPhone No";
                                            CompanyStaff.Modify();
                                        end;


                                        /*
                                        IF "Extended Probation End Date"<> 0D THEN BEGIN
                                          CompanyStaff."Extended Probation End Date":="Extended Probation End Date";
                                          CompanyStaff."Extended Probation Duration":="Extended Probation Duration";
                                          CompanyStaff.MODIFY;
                                        END;  */


                                        /* IF "Transfer Type"="Transfer Type"::Confirmation THEN BEGIN

                                           TESTFIELD("Confirmation Date");
                                           CompanyStaff."Confirmation Date":="Confirmation Date";
                                           CompanyStaff.Status:=CompanyStaff.Status::Active;
                                           CompanyStaff.MODIFY;

                                         END;  */

                                        if Rec."Transfer Type" = Rec."Transfer Type"::"Bank Details" then begin
                                            Rec.TestField("New Bank");
                                            Rec.TestField("New Bank  Branch");
                                            Rec.TestField("New Bank Account No");
                                            CompanyStaff."Main Bank" := Rec."New Bank";
                                            CompanyStaff.Validate(CompanyStaff."Main Bank");
                                            CompanyStaff.Modify();
                                        end;

                                        if Rec."Transfer Type" = Rec."Transfer Type"::"Bank Details" then begin
                                            Rec.TestField("New Bank");
                                            Rec.TestField("New Bank  Branch");
                                            Rec.TestField("New Bank Account No");
                                            CompanyStaff."Branch Bank" := Rec."New Bank  Branch";
                                            CompanyStaff.Validate(CompanyStaff."Branch Bank");
                                            CompanyStaff.Modify();
                                        end;

                                        if Rec."Transfer Type" = Rec."Transfer Type"::"Bank Details" then begin
                                            Rec.TestField("New Bank");
                                            Rec.TestField("New Bank  Branch");
                                            Rec.TestField("New Bank Account No");
                                            CompanyStaff."Bank Account Number" := Rec."New Bank Account No";
                                            CompanyStaff.Modify();
                                        end;

                                        // CompanyStaff.MODIFY;

                                    end;
                                    CompanyStaff.Modify();
                                end;


                                if SalarySetUp.Get(Rec."Employee Code") then
                                    if Rec."Effective Date" <= Today then
                                        if Rec."Pay Change" <> 0 then begin
                                            SalarySetUp."Basic Pay" := Rec."Pay Change";
                                            SalarySetUp.Modify();
                                        end;


                                /*//rated pay****
                                      IF SalarySetUp.GET("Employee Code") THEN
                                        BEGIN
                                           IF "Effective Date"<= TODAY THEN
                                           BEGIN
                                             IF "New Rated Pay" <> 0 THEN BEGIN
                                             SalarySetUp."Rated Amount":="New Rated Pay";
                                             SalarySetUp.MODIFY;
                                           END;
                                           END;
                                           END;      */
                                //rated pay****

                                if Rec."Transfer Type" = Rec."Transfer Type"::Leave then begin
                                    Rec.TestField(Remark);
                                    Rec.TestField("Days Compensated");
                                    Rec.TestField("Leave Type");
                                    Rec.TestField("Leave Calendar Code");

                                    LeaveLedger.Init();
                                    LeaveLedger2.Reset();
                                    if LeaveLedger2.FindLast() then
                                        LeaveLedger."Entry No." := LeaveLedger2."Entry No." + 1;
                                    LeaveLedger."Leave Calendar Code" := Rec."Leave Calendar Code";
                                    LeaveLedger."Staff No." := Rec."Employee Code";
                                    LeaveLedger."Staff Name" := Rec.Description;
                                    LeaveLedger."Posting Date" := Today;
                                    LeaveLedger."Document No." := Rec.Code;
                                    LeaveLedger."No. of days" := Rec."Days Compensated";
                                    LeaveLedger."Leave Posting Description" := Rec.Remark;
                                    // LeaveLedger."User ID":=USERID;
                                    LeaveLedger."Leave Type" := Rec."Leave Type";
                                    LeaveLedger."Leave Entry Type" := Rec."Leave Entry Type";
                                    LeaveLedger.Insert();
                                end;


                                Rec.Modify();

                            end else begin
                                Rec."Transfer Status" := Rec."Transfer Status"::"Pending Approval";
                                Rec.Modify();
                            end;

                    end;
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Send Approval Request action.';
                    trigger OnAction()
                    begin
                        //TESTFIELDS;



                        if Confirm('Send this Application for Approval?', true) = false then
                            exit;

                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //ApprovalMgt.SendTSApprovalReq(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = '&Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        //ApprovalMgt.CancelTSRequest(Rec,true,true);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if Rec."Transfer Status" = Rec."Transfer Status"::Approved then //BEGIN
            CurrPage.Editable := false;
        //END;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Change Type" := Rec."Change Type"::Transfer;
    end;

    trigger OnOpenPage()
    begin
        if Rec."Transfer Status" <> Rec."Transfer Status"::Application then
            CurrPage.Editable := false;
        /*
        JobMngt:=FALSE;
        CurrentBranch:=FALSE;
        LeaveDays:=FALSE;
        Salary:=FALSE;
        BankDetails:=FALSE;
        */


        if Rec."Transfer Type" = Rec."Transfer Type"::Transfer then begin

            JobMngt := true;
            CurrentBranch := true;
            LeaveDays := false;
            Salary := true;
            BankDetails := false;
        end;


        if Rec."Transfer Type" = Rec."Transfer Type"::Confirmation then begin
            JobMngt := true;
            CurrentBranch := false;
            LeaveDays := false;
            Salary := true;
            BankDetails := false;
        end;


        if Rec."Transfer Type" = Rec."Transfer Type"::Demotion then begin
            JobMngt := true;
            CurrentBranch := true;
            LeaveDays := false;
            Salary := true;
            BankDetails := false;
        end;

        if Rec."Transfer Type" = Rec."Transfer Type"::"Basic Pay" then begin
            JobMngt := false;
            CurrentBranch := true;
            LeaveDays := false;
            Salary := true;
            BankDetails := false;
        end;

        if Rec."Transfer Type" = Rec."Transfer Type"::Exits then begin
            JobMngt := true;
            CurrentBranch := false;
            LeaveDays := false;
            Salary := false;
            BankDetails := false;
        end;


        if Rec."Transfer Type" = Rec."Transfer Type"::"Extend Probation" then begin
            JobMngt := true;
            CurrentBranch := false;
            LeaveDays := false;
            Salary := false;
            BankDetails := false;
        end;

        if Rec."Transfer Type" = Rec."Transfer Type"::"Bank Details" then begin
            JobMngt := false;
            CurrentBranch := false;
            LeaveDays := false;
            Salary := false;
            BankDetails := true;
        end;


        if Rec."Transfer Type" = Rec."Transfer Type"::Leave then begin
            JobMngt := false;
            CurrentBranch := false;
            LeaveDays := true;
            Salary := false;
            BankDetails := false;
        end;



        if Rec."Transfer Type" = Rec."Transfer Type"::"Rated Pay" then begin
            JobMngt := false;
            CurrentBranch := true;
            LeaveDays := false;
            Salary := true;
            BankDetails := false;
        end;


        if Rec."Transfer Type" = Rec."Transfer Type"::Promotion then begin
            JobMngt := true;
            CurrentBranch := true;
            LeaveDays := false;
            Salary := true;
            BankDetails := false;
        end;

    end;

    var
        ApprovalsSetup: Record "HR Approvals Set Up";
        MovementTracker: Record "Time Sheet Header";
        FileMovementTracker: Record "Time Sheet Header";
        NextStage: Integer;
        EntryNo: Integer;
        NextLocation: Text[100];
        CompanyStaff: Record "HR Employees";
        SalarySetUp: Record "prSalary Card Casual";
        HREmp: Record "HR Employees";
        MailContents: Text;
        MailContents2: Text;
        MailContents3: Text;
        MailContent: Text;
        //SMTPMail: Codeunit "SMTP Mail";
        //SMTPMailSetup: Record "SMTP Mail Setup";
        EmpKin: Record "HR Leave Ledger Entries";
        LeaveLedger: Record "HR Leave Ledger Entries";
        LeaveLedger2: Record "HR Leave Ledger Entries";
        JobMngt: Boolean;
        CurrentBranch: Boolean;
        LeaveDays: Boolean;
        Salary: Boolean;
        BankDetails: Boolean;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,None,PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;
        ApprovalEntries: Page "Approval Entries";
        AppEntry: Record "Approval Entry";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
    //ApprovalMgt: Codeunit "Export F/O Consolidation";
}

