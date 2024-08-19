#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194140 "HR Company Activities Card"
{
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Functions,Workflow  Process';
    SaveValues = true;
    SourceTable = "HR Company Activities";
    ApplicationArea = All;
    Caption = 'HR Company Activities Card';
    layout
    {
        area(Content)
        {
            group(Control1102755007)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Venue field.';
                }
                field("Employee Responsible"; Rec."Employee Responsible")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Employee Responsible field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Email Message"; Rec."Email Message")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email Message field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Activity Status"; Rec."Activity Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Status field.';
                }
            }
            part(Control1102755011; "HR Activity Participants SF")
            {
                SubPageLink = "Document No." = field(Code);
            }
        }
        area(FactBoxes)
        {
            part(Control1102755024; "HR Company Activities Factbox")
            {
                SubPageLink = Code = field(Code);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Functions)
            {
                action("Get Participants")
                {
                    ApplicationArea = Basic;
                    Image = SalesPurchaseTeam;
                    Promoted = true;
                    Visible = false;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Get Participants action.';
                }
                action("Notify Participants")
                {
                    ApplicationArea = Basic;
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Notify Participants action.';
                    trigger OnAction()
                    var
                        myInt: Integer;
                        HRAct: Record "HR Activity Participants";
                        CompanyIInf: Record "Company Information";
                        EmailManger: Codeunit "Email Message";
                        Email: Codeunit Email;
                        msg: Text;
                    begin
                        HRAct.Reset();
                        HRAct.SetRange(HRAct."Document No.", rec.Code);
                        if HRAct.FindFirst() then begin
                            repeat
                                msg := 'Dear Staff,' + Rec."Email Message" + '';
                                EmailManger.Create(HRAct."Email Address", 'Company Activity', msg, true);
                                Email.Send(EmailManger, Enum::"Email Scenario"::Default);
                                HRAct.Notified := true;
                                HRAct.Modify();
                            until HRAct.Next() = 0;

                        end;

                    end;
                }
                action(Close)
                {
                    ApplicationArea = Basic;
                    Image = Close;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Close action.';
                    trigger OnAction()
                    begin
                        if Confirm('Do you want to close this activity?') = true then begin
                            Rec.Closed := true;
                            Rec.Modify();
                            Message('Event :: %1 :: has been marked as Closed', Rec.Description);
                        end else
                            exit;
                        CurrPage.Close();
                    end;
                }
                action("Re-Open")
                {
                    ApplicationArea = Basic;
                    Image = Open;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Re-Open action.';
                    trigger OnAction()
                    begin
                        if Confirm('Do you want to reopen this document?') = true then begin
                            Rec.Closed := false;
                            rec.Status := rec.Status::New;
                            Rec.Modify();
                            Message('Event :: %1 :: has been Re-Opened', Rec.Description);
                        end else
                            exit;
                        CurrPage.Close();
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Print action.';
                    trigger OnAction()
                    begin
                        HRCompanyActivities.Reset();
                        HRCompanyActivities.SetRange(HRCompanyActivities.Code, Rec.Code);
                        if HRCompanyActivities.Find('-') then
                            Report.Run(39005492, true, true, HRCompanyActivities);
                    end;
                }
            }
            group(Approvals)
            {
                Caption = 'Approvals';

                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    var
                        CustomAppr: Codeunit "Custom Approvals Codeunit";
                    begin
                        rec.TestField(Status, rec.Status::New);
                        if Confirm('Send this Company Activity for Approval?') = true then begin
                            VarVariant := Rec;
                            if CustomAppr.CheckApprovalsWorkflowEnabled(Varvariant) then
                                CustomAppr.OnSendDocForApproval(Varvariant);
                        end;
                        CurrPage.Close();
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = CancelAllLines;
                    PromotedOnly = true;
                    PromotedIsBig = true;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Cancel Approval Request action.';
                    trigger OnAction()
                    var
                        CustomAppr: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField(Status, Status::"Pending Approval");
                        if Confirm('Cancel Approval Request for this Company Activity?') = true then begin
                            VarVariant := Rec;
                            CustomAppr.OnCancelDocApprovalRequest(VarVariant);
                        end;
                        CurrPage.Close();
                        ;
                    end;
                }
                action(Action1102755030)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalMt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalMt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        UpdateControls();
    end;

    trigger OnAfterGetRecord()
    begin
        UpdateControls();
    end;


    trigger OnOpenPage()
    begin
        UpdateControls();
    end;

    var
        D: Date;
        //SMTP: Codeunit "SMTP Mail";
        CTEXTURL: Text[500];
        HREmp: Record "HR Employees";
        ApprovalSetup: Record "User Setup";
        //ApprovalsMgtNotification: Codeunit "Approvals Mgt Notification";
        HRCompanyActivities: Record "HR Company Activities";
        HRActivityApprovalEntry: Record "HR Activity Participants";
        DocType: Option "Company Activity";
        Text001: Label 'All Participants have been notified via E-Mail';
        GenJournal: Record "Gen. Journal Line";
        LineNo: Integer;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
    //AppMgmt: Codeunit "Export F/O Consolidation";


    procedure UpdateControls()
    begin
        if Rec.Closed then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
        if Rec.Status = rec.Status::New then
            CurrPage.Editable := true
        else
            CurrPage.Editable := false;

    end;
}
