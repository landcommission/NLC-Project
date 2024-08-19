#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193806 "Employee Requisition Internal"
{
    CardPageId = "HR Employee Requisition Card";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Job,Functions,Employee';
    ShowFilter = true;
    SourceTable = "HR Employee Requisitions";
    ApplicationArea = All;
    Caption = 'Employee Requisition Internal';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = Basic;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Requisition No. field.';
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = Basic;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Requisition Date field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field("Reason For Request"; Rec."Reason For Request")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason For Request field.';
                }
                field("Required Positions"; Rec."Required Positions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Required Positions field.';
                }
                field("Type of Contract Required"; Rec."Type of Contract Required")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Style = Attention;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Advertised; Rec.Advertised)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advertised field.';
                }
                field(Positions; Rec.Positions)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Positions field.';
                }
                field("Closing Date"; Rec."Closing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closing Date field.';
                }
                field("Opening Date"; Rec."Opening Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Date field.';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755008; Outlook) { }
        }
    }

    actions
    {
        area(Creation)
        {
            action(Action2)
            {
                ApplicationArea = Basic;
                Caption = 'Mark as Closed/Open';
                Image = ReopenCancelled;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Executes the Mark as Closed/Open action.';
                trigger OnAction()
                begin
                    if Rec.Closed then begin
                        if not Confirm('Are you sure you want to Re-Open this Document', false) then
                            exit;
                        Rec.Closed := false;
                        Rec.Modify();
                        Message('Employee Requisition %1 has been Re-Opened', Rec."Requisition No.");

                    end else begin
                        if not Confirm('Are you sure you want to close this Document', false) then
                            exit;
                        Rec.Closed := true;
                        Rec.Modify();
                        Message('Employee Requisition %1 has been marked as Closed', Rec."Requisition No.");
                    end;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        Rec.SetFilter("Opening Date", '<=TODAY');
        Rec.SetFilter("Closing Date", '>=TODAY');
        Rec.SetRange(Status, Rec.Status::Approved);
        Rec.SetRange(Advertised, true);
        Rec.SetFilter(Rec."Requisition Type", '%1|%2', Rec."Requisition Type"::Internal, Rec."Requisition Type"::Both);
        Rec.SetFilter("Required Positions", '>0');
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.SetFilter("Opening Date", '<=TODAY');
        Rec.SetFilter("Closing Date", '>=TODAY');
        Rec.SetRange(Status, Rec.Status::Approved);
        Rec.SetRange(Advertised, true);
        Rec.SetFilter(Rec."Requisition Type", '%1|%2', Rec."Requisition Type"::Internal, Rec."Requisition Type"::Both);
        Rec.SetFilter("Required Positions", '>0');
    end;

    trigger OnOpenPage()
    begin

        Rec.SetFilter("Opening Date", '<=TODAY');
        Rec.SetFilter("Closing Date", '>=TODAY');
        Rec.SetRange(Status, Rec.Status::Approved);
        Rec.SetRange(Advertised, true);
        Rec.SetFilter(Rec."Requisition Type", '%1|%2', Rec."Requisition Type"::Internal, Rec."Requisition Type"::Both);
        Rec.SetFilter("Required Positions", '>0');
    end;

    var
        HREmp: Record "HR Employees";
        HREmailParameters: Record "HR E-Mail Parameters";
        //SMTP: Codeunit "SMTP Mail";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition";
        ApprovalEntries: Page "Approval Entries";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        HREmpReq: Record "HR Employee Requisitions";


    procedure TESTFIELDS()
    begin
        Rec.TestField(Rec."Job ID");
        Rec.TestField(Rec."Closing Date");
        Rec.TestField(Rec."Type of Contract Required");
        Rec.TestField(Rec."Requisition Type");
        Rec.TestField(Rec."Required Positions");
        if Rec."Reason For Request" = Rec."Reason For Request"::Other then
            Rec.TestField(Rec."Reason for Request(Other)");
    end;
}
