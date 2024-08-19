page 69570 "Approved Transfer Requests"
{
    Caption = 'Approved Transfer Requests';

    PageType = Card;
    SourceTable = "Employee Transfers";
    ApplicationArea = All;
    PromotedActionCategories = 'New,Report,process,Employee Trans,Print ';

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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Transfer Appeal"; Rec."Transfer Appeal")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Appeal field.';
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
                field("Transfer Reason Code"; Rec."Transfer Reason Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Reason Code field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    Editable = false;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                group(Transfer)
                {
                    Caption = 'Transfer Details';
                    field("Transfer Date"; Rec."Transfer Date")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Transfer Date field.';
                    }
                    field("Reporting Date"; Rec."Reporting Date")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Reporting Date field.';
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
                    field("Professional Opinion"; Rec."Professional Opinion")
                    {
                        ApplicationArea = All;
                        MultiLine = true;
                        ToolTip = 'Specifies the value of the Professional Opinion field.';
                    }

                    field("To Hardship Area?"; Rec."To Hardship Area?")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the To Hardship Area? field.';
                    }



                    field(Distance; Rec.Distance)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Distance field.';
                    }
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }

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

            // group("Request Approval")
            // {
            //     Caption = 'Request Approval';
            //     action(SendApprovalRequest)
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Send A&pproval Request';
            //         Image = SendApprovalRequest;
            //         Promoted = true;
            //         PromotedCategory = Process;

            //         trigger OnAction()
            //         var
            //             VarVariant: Variant;
            //             ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
            //         begin

            //             VarVariant := Rec;
            //             IF ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) THEN
            //                 ApprovalsMgmt.OnSendDocForApproval(VarVariant);

            //         end;
            //     }
            //     action(CancelApprovalRequest)
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Cancel Approval Re&quest';
            //         Enabled = true;
            //         Image = Cancel;
            //         Promoted = true;
            //         PromotedCategory = Process;

            //         trigger OnAction()
            //         var
            //             VarVariant: Variant;
            //             CustomApprovals: Codeunit "Custom Approvals Codeunit";
            //             ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
            //         begin
            //             VarVariant := Rec;
            //             CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
            //         end;
            //     }

            //     // action(Approvals)
            //     // {
            //     //     ApplicationArea = Basic;
            //     //     Caption = 'Approvals';
            //     //     Image = Approvals;
            //     //     Promoted = true;
            //     //     PromotedCategory = Process;
            //     //     PromotedIsBig = false;

            //     //     trigger OnAction()
            //     //     var
            //     //         ApprovalsMgt: Codeunit "Approvals Mgmt.";
            //     //     begin

            //     //         ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
            //     //     end;
            //     // }
            // }
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

                    Report.Run(Report::"Employee Transfer Letter", true, true, Rec);
                end;
            }
            action("Employee  Transfer History")
            {
                ApplicationArea = all;
                Caption = 'Employee  Transfer History';
                Image = History;
                PromotedOnly = true;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = page "Employee  Transfer History";
                RunPageLink = "Employee No" = field("Employee No");
                ToolTip = 'Executes the Employee  Transfer History action.';
            }
            action(Post)
            {
                ApplicationArea = all;
                Caption = 'Submit/ Release Application';
                Promoted = true;
                PromotedCategory = Category4;
                Image = PostApplication;
                PromotedIsBig = true;
                PromotedOnly = true;
                Enabled = Rec.Status = Rec.Status::Released;
                ToolTip = 'Executes the Submit/ Release Application action.';
                trigger OnAction()

                begin
                    Rec.TestField(Status, Rec.Status::Released);


                    if Rec.Status = Rec.Status::Released then begin
                        Rec.SendApproved();
                        Rec.Status := Rec.Status::"Awaiting HOS";
                        Message('Sucessfully Submitted');

                    end;
                end;

            }

        }
    }
}

#pragma implicitwith restore

