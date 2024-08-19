page 69836 "Management Employee Transfer"
{

    Caption = 'Employee Transfer';
    PageType = Card;
    SourceTable = "Employee Transfers";
    PromotedActionCategories = 'New,Process,Report,Workflow Process,Transfer History,Post,Print';
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';


                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }

                field("Transfer Appeal"; Rec."Transfer Appeal")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Appeal field.';
                }
                field("Reason(s) for Appeal"; Rec."Reason(s) for Appeal")
                {
                    ApplicationArea = All;
                    Visible = Editable1;
                    ToolTip = 'Specifies the value of the Reason(s) for Appeal field.';
                }

                field("Original Station"; Rec."Original Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Original Station field.';
                }
                field("Original Station Name"; Rec."Original Station Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Original Station Name field.';
                }

                field("New Station"; Rec."New Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Station field.';

                }
                field("New Sattion Name"; Rec."New Sattion Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Sattion Name field.';

                }
                field(PLWD; Rec.PLWD)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PLWD field.';
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Age field.';
                }

                field("To Hardship Area?"; Rec."To Hardship Area?")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the To Hardship Area? field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Transfer Date"; Rec."Transfer Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Transfer Date field.';
                }
                field(Distance; Rec.Distance)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Distance field.';
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
            }
            part(PreviousStations; "Employee  Transfer History")
            {

                SubPageLink = "Employee No" = field("Employee No");
                ApplicationArea = Basic;
                Editable = false;

            }
        }
        area(FactBoxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(69055),
                              "No." = field("Document No");
            }
            systempart(PyamentTermsLinks; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(PyamentTermsNotes; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }
    actions
    {
        area(Navigation)
        {

            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = All;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedOnly = true;
                    PromotedIsBig = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        ApprovalsMgmt: Codeunit "Approvals Mgt";
                    begin

                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                        CurrPage.Close();

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedOnly = true;
                    PromotedIsBig = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    begin
                        Rec.TestField(Status, Status::"Pending Approval");
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        CurrPage.Close();
                    end;
                }
                action("Re-open Document")
                {
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Caption = 'Reopen Document';
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        // if rec."Approval Status" = rec."Approval Status"::"Pending approval" then
                        //     Error('cancell the approval Request');
                        if Confirm('Do you want to reopen this document?') = true then begin
                            rec.Status := rec.Status::Open;
                            Rec.Modify();
                            Message('Document Reopend successfully');
                            CurrPage.Close();
                        end;

                    end;
                }
                action("Reject Approval")
                {
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                        rec.Status := Rec.Status::Rejected;
                        Rec.Modify();
                    end;
                }

                action(Approvals)
                {
                    ApplicationArea = All;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = false;
                    PromotedOnly = true;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }

            }
            action(Print)
            {
                ApplicationArea = Suite;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category7;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetRange("Document No", Rec."Document No");

                    Report.Run(70047, true, true, Rec);
                end;
            }
            action("Employee  Transfer History")
            {
                ApplicationArea = all;
                Caption = 'Employee  Transfer History';
                Image = History;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Category5;
                RunObject = page "Employee  Transfer History";
                RunPageLink = "Employee No" = field("Employee No");
                ToolTip = 'Executes the Employee  Transfer History action.';
            }
            action(Post)
            {
                ApplicationArea = all;
                Caption = 'Create Professional Opinion';
                Image = PostApplication;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedOnly = true;
                Enabled = Rec.Status = Rec.Status::Released;
                ToolTip = 'Executes the Create Professional Opinion action.';
                trigger OnAction()
                var
                    Opinion: Record "Employee Transfers";

                begin
                    Rec.TestField(Posted, false);
                    Rec.TestField(Status, Rec.Status::Released);
                    if Rec.Posted = false then begin
                        Opinion.Init();

                        Opinion."Document Type" := Opinion."Document Type"::"Professional Opinion";
                        // Opinion."Document No" := Opinion."Document No";
                        Opinion."Transfer No" := Rec."Document No";
                        Opinion.Type := Opinion.Type::"...";
                        Opinion."Request Date" := Rec."Request Date";
                        Opinion."Employee No" := Rec."Employee No";
                        Opinion."Employee Name" := Rec."Employee Name";
                        Opinion."Original Station" := Rec."Original Station";
                        Opinion."New Station" := Rec."New Station";
                        Opinion."Original Station Name" := Rec."Original Station Name";
                        Opinion."New Sattion Name" := Rec."New Sattion Name";
                        Opinion."To Hardship Area?" := Rec."To Hardship Area?";
                        Opinion.Distance := Rec.Distance;
                        Opinion."Job Title" := Rec."Job Title";
                        Opinion.Remarks := Rec.Remarks;

                        if Opinion.Insert(true) then
                            Message('Professional Opinion %1 Sucessfully created, Proceed', Opinion."Document No");
                    end;
                    Rec.Posted := true;
                    Rec."Posted On" := CurrentDateTime;
                    // Message('Professional Opinion Sucessfully created, Proceed');
                end;
            }

        }
    }
    trigger OnNewRecord(BelowXrec: Boolean)
    begin
        Rec.Type := Rec.Type::"Management initiated";
        Rec."Request Date" := Today;
        Rec."Document Type" := Rec."Document Type"::Application;
    end;

    trigger OnOpenPage()
    begin
        Setapparance();
        if Rec."Transfer Appeal" = true then
            Editable1 := true
        else
            Editable1 := false;

    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        Setapparance();

    end;

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        Setapparance();

    end;

    local procedure Setapparance()
    var
        myInt: Integer;
    begin
        if rec.Status = rec.Status::Open then
            CurrPage.Editable := true
        else
            CurrPage.Editable := false;

    end;

    var
        Editable1: Boolean;
}

#pragma implicitwith restore
