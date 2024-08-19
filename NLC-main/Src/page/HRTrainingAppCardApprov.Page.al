#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194065 "HR Training App. Card - Approv"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Show';
    SourceTable = "HR Training App Header";
    ApplicationArea = All;
    Caption = 'HR Training Approved';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Course Title field.';
                }
                field("Bonded Training?"; Rec."Bonded Training?")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Bonded Training? field.';
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Course Description field.';
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. of Participants field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }

                field("Actual Start Date"; Rec."Actual Start Date")
                {
                    ApplicationArea = Basic;
                    // Visible = false;
                    ToolTip = 'Specifies the value of the Actual Start Date field.';
                }
                field("Actual Duration"; Rec."Actual Duration")
                {
                    ApplicationArea = Basic;
                    // Visible = false;
                    ToolTip = 'Specifies the value of the Actual Duration field.';
                }
                field("Actual End Date"; Rec."Actual End Date")
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the Actual End Date field.';
                }
                field(Workstation; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Workstation';
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Workstation Name"; "Workstation Name")
                {
                    ApplicationArea = all;
                    Editable = false;

                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Training Status"; Rec."Training Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Training Status field.';
                }
                field("Approved By"; "Approved By")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
            part(Control3; "HR Training Application Lines")
            {
                SubPageLink = "Application No." = field("Application No");
            }
        }
        area(FactBoxes)
        {
            systempart(Control14; Outlook) { }
            systempart(Control15; Notes) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Show")
            {
                Caption = '&Show';
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                    Image = Comment;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Comments action.';
                    RunObject = Page "Hr Appraisal Comments";
                    RunPageLink = "Sal No." = field("Application No");
                    // trigger OnAction()
                    // var
                    //     DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                    // begin
                    //     DocumentType := DocumentType::"Training Application";

                    //     ApprovalComments.Setfilters(Database::"HR Training App Header", DocumentType, Rec."Application No");
                    //     ApprovalComments.SetUpLine(Database::"HR Training App Header", DocumentType, Rec."Application No");
                    //     ApprovalComments.Run();
                    // end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Close / Re-Open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Close / Re-Open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Close / Re-Open action.';
                    trigger OnAction()
                    begin
                        if Rec."Training Status" = Rec."Training Status"::Ongoing then begin
                            if not Confirm('Close Training?', false) then
                                exit;
                            Rec."Training Status" := Rec."Training Status"::Closed;
                            Rec.TestField(Rec."Actual Duration");
                            Rec.TestField(Rec."Actual End Date");
                            Rec.Modify();
                            exit;
                        end;

                        if Rec."Training Status" = Rec."Training Status"::Closed then begin
                            if not Confirm('Re-Open Training?', false) then
                                exit;
                            Rec.TestField(Rec."Actual Start Date");
                            Rec."Training Status" := Rec."Training Status"::Ongoing;
                            Rec.Modify();
                            exit;
                        end;
                    end;
                }
                action("Mark as Ongoing")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mark as Ongoing';
                    Image = Register;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Mark as Ongoing action.';
                    trigger OnAction()
                    begin

                        if Rec."Training Status" = Rec."Training Status"::" " then begin
                            if not Confirm('Mark training as ongoing ?', false) then
                                exit;
                            Rec."Training Status" := Rec."Training Status"::Ongoing;
                            Rec.TestField(Rec."Actual Start Date");
                            Rec.Modify();
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        if Rec.Status = Rec.Status::New then begin
            "Responsibility CenterEditable" := true;
            "Application NoEditable" := true;
            "Employee No.Editable" := true;
            "Employee NameEditable" := true;
            "Employee DepartmentEditable" := true;
            "Purpose of TrainingEditable" := true;
            "Course TitleEditable" := true;
        end else begin
            "Responsibility CenterEditable" := false;
            "Application NoEditable" := false;
            "Employee No.Editable" := false;
            "Employee NameEditable" := false;
            "Employee DepartmentEditable" := false;
            "Purpose of TrainingEditable" := false;
            "Course TitleEditable" := false;
        end;
    end;

    trigger OnInit()
    begin
        "Course TitleEditable" := true;
        "Purpose of TrainingEditable" := true;
        "Employee DepartmentEditable" := true;
        "Employee NameEditable" := true;
        "Employee No.Editable" := true;
        "Application NoEditable" := true;
        "Responsibility CenterEditable" := true;
    end;

    var
        HREmp: Record "FA Budget Entry";
        EmpNames: Text[40];
        sDate: Date;
        HRTrainingApplications: Record "HR Training App Header";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        ApprovalComments: Page "Approval Comments";
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        "Application NoEditable": Boolean;
        [InDataSet]
        "Employee No.Editable": Boolean;
        [InDataSet]
        "Employee NameEditable": Boolean;
        [InDataSet]
        "Employee DepartmentEditable": Boolean;
        [InDataSet]
        "Purpose of TrainingEditable": Boolean;
        [InDataSet]
        "Course TitleEditable": Boolean;
        HRExitTrainingBond: Record "HR Exit Training Bonding";
        HRTrainingAppLines: Record "HR Training App Lines";
        HRTrainingNeeds: Record "HR Training Needs";


    procedure TESTFIELDS()
    begin
    end;

    local procedure get_LastLineNo() LastLineNo: Integer
    var
        HRExitTrainingBonding2: Record "HR Exit Training Bonding";
    begin
        HRExitTrainingBonding2.Reset();
        if HRExitTrainingBonding2.Find('+') then begin
            Rec.Status := Rec.Status::Approved;
            LastLineNo := HRExitTrainingBonding2."Line No.";
        end else begin
            Rec.Status := Rec.Status::Approved;
            LastLineNo := 1;
        end;
    end;
}
