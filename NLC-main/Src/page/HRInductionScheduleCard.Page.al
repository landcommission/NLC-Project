#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194134 "HR Induction Schedule Card"
{
    PageType = Card;
    SourceTable = "HR Induction Schedule";
    ApplicationArea = All;
    Caption = 'HR Induction Schedule Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Induction Code"; Rec."Induction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Induction Code field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Selected field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Induction Period"; Rec."Induction Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Induction Period field.';
                }
                field("Induction Start date"; Rec."Induction Start date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Induction Start date field.';
                }
                field("Induction End  date"; Rec."Induction End  date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Induction End  date field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(ActionGroup1102755014) { }
            action("&Approvals")
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Approvals action.';
                trigger OnAction()
                begin

                    DocumentType := DocumentType::"Induction Approval";
                    Inductionschedule.Reset();
                    Inductionschedule.SetRange(Inductionschedule.Selected, true);
                    Inductionschedule.SetRange(Inductionschedule."Department Code", Rec."Department Code");
                    if Inductionschedule.Find('-') then begin

                        //ENSURE SELECTED RECORDS DO NOT EXCEED ONE
                        Number := 0;
                        Number := Inductionschedule.Count;
                        if Number > 1 then
                            Error('You cannot have more than one application selected');
                        // ERROR(FORMAT(Number)+' applications selected');

                        ApprovalEntries.Setfilters(Database::"HR Induction Schedule", DocumentType, Inductionschedule."Department Code");
                        ApprovalEntries.Run();
                    end else
                        Error('No Application Selected');
                end;
            }
            action("&Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = '&Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Send Approval Request action.';
                trigger OnAction()
                begin

                    Inductionschedule.Reset();
                    Inductionschedule.SetRange(Inductionschedule.Selected, true);
                    Inductionschedule.SetRange(Inductionschedule."Induction Code", Rec."Induction Code");
                    Inductionschedule.SetRange(Inductionschedule."Department Code", Rec."Department Code");
                    if Inductionschedule.Find('-') then begin
                        //ENSURE THAT SELECTED RECORDS DO NOT EXCEED ONE
                        Number := 0;
                        Number := Inductionschedule.Count;
                        if Number > 1 then
                            Error('You cannot have more than one application selected');

                        TESTFIELDS();

                        if Confirm('Send this Induction Schedule for Approval?', true) = false then
                            exit;

                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //ApprovalMgt.SendInductionApprovalReq(Inductionschedule);

                    end else
                        Message('Please Select one Induction schedule');
                end;
            }
            action("&Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = '&Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Cancel Approval Request action.';
            }
            action("Induction Participants ")
            {
                ApplicationArea = Basic;
                Caption = 'Induction Participants';
                Image = PersonInCharge;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = page "HR Induction Participants List";
                RunPageLink = "Induction Code" = field("Induction Code");
                ToolTip = 'Executes the Induction Participants action.';

            }
            action("HR Staff  Induction Report")
            {
                ApplicationArea = Basic;
                RunObject = report "HR Recruitment - Long List";
                ToolTip = 'Executes the HR Staff  Induction Report action.';
            }
        }
    }

    var
        "Induction`": Record "HR Induction Schedule";
        DepartmentName: Text[40];
        sDate: Date;
        Inductionschedule: Record "HR Induction Schedule";
        Number: Integer;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Budget Transfer","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Induction Approval";
        ApprovalEntries: Page "Approval Entries";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        HRJobs: Record "HR Jobs";
        Department: Record "Dimension Value";


    procedure TESTFIELDS()
    begin

        Inductionschedule.TestField(Inductionschedule."Department Code");
        Inductionschedule.TestField(Inductionschedule."Induction Start date");
        Inductionschedule.TestField(Inductionschedule."Induction End  date");
        Inductionschedule.TestField(Inductionschedule."Induction Period");
    end;


    procedure FillVariables()
    begin
        //GET THE APPLICANT DETAILS

        Department.Reset();
        if Department.Get(Rec."Department Code") then
            Rec."Department Name" := Department.Name;
    end;


    procedure UpdateControls()
    begin
    end;


    procedure GetTrainingTypes("Course Title": Text[50])
    begin
    end;
}
