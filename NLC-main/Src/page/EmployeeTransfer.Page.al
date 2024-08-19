#pragma implicitwith disable
page 50094 "Employee Transfer"
{
    Caption = 'Employee Transfer';
    PageType = Card;
    SourceTable = "Employee Transfers";
    PromotedActionCategories = 'New,process,Report,Workflow Process,Print,Transfer History';
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


                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
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
                    Enabled = false;

                }
                field("Original Station"; Rec."Original Station")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Original Station field.';
                }
                field("Original Station Name"; Rec."Original Station Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Original Station Name field.';
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



                field("To Hardship Area?"; Rec."To Hardship Area?")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Hardship Area';
                    ToolTip = 'Specifies the value of the To Hardship Area? field.';
                }
                field("Transfer Reason Code"; Rec."Transfer Reason Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Reason Code field.';
                    Visible = false;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                    //MultiLine = true;
                }
                field("Transfer Appeal"; Rec."Transfer Appeal")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Transfer Appeal field.';
                }
                field("Reason(s) for Appeal"; Rec."Reason(s) for Appeal")
                {
                    ApplicationArea = All;
                    Visible = false;

                    ToolTip = 'Specifies the value of the Reason(s) for Appeal field.';
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

                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }

            }
            part(Control5; "Employee Transfer Allowance")
            {
                Caption = 'Employee Transfer Allowances';
                SubPageLink = "Request No" = field("Document No"), "Employee No" = field("Employee No");
            }

            part(PreviousStations; "Employee  Transfer History")
            {

                SubPageLink = "Employee No" = field("Employee No");
                ApplicationArea = Basic;
                Editable = false;
                Visible = false;

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
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        ApprovalsMgmt: Codeunit "Approvals Mgt";
                        TransferLines: Record "HR Employee Transfer Lines";
                    begin
                        rec.TestField(Status, rec.Status::Open);
                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                        TransferLines.Reset();
                        TransferLines.Init();
                        TransferLines."Employee No" := rec."Employee No";
                        TransferLines.Validate(TransferLines."Employee No");
                        // TransferLines."New Designation" := Rec."New Station";
                        // TransferLines.Validate(TransferLines."New Designation");
                        TransferLines."New Global Dimension 1 Code" := Rec."New Station";
                        TransferLines.Validate(TransferLines."New Global Dimension 1 Code");
                        TransferLines.Insert();
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
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    begin
                        rec.TestField(Status, rec.Status::"Pending Approval");
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        CurrPage.Close();
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
                        rec.Status := rec.Status::Rejected;
                        CurrPage.Close();
                    end;
                }

                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Enabled = true;
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the approvals action.';
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
                PromotedCategory = Category5;
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
                ApplicationArea = Basic;
                Caption = 'Employee  Transfer History';
                Image = History;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = page "Employee  Transfer History";
                RunPageLink = "Employee No" = field("Employee No");
                ToolTip = 'Executes the Employee  Transfer History action.';
            }
        }
    }
    trigger OnNewRecord(BelowXrec: Boolean)
    begin
        Rec.Type := Rec.Type::"Self initiated";
        Rec."Request Date" := Today;
        Rec."Document Type" := Rec."Document Type"::Application;
    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        SetAppearance();
    end;

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        SetAppearance();
    end;

    trigger OnOpenPage()
    begin
        SetAppearance();
        if Rec."Transfer Appeal" = true then
            Editable1 := true
        else
            Editable1 := false;

    end;

    local procedure SetAppearance()
    var
        myInt: Integer;
    begin
        if rec.Status <> rec.Status::Open then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;

    end;

    var
        Editable1: Boolean;
}

#pragma implicitwith restore
