#pragma implicitwith disable
page 69855 "Awaiting HOS Action"
{
    Caption = 'Awaiting HOS Action';
    PageType = Card;
    SourceTable = "Employee Transfers";
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
                        Editable = false;
                        ToolTip = 'Specifies the value of the Transfer Date field.';
                    }
                    field("New Station"; Rec."New Station")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        ToolTip = 'Specifies the value of the New Station field.';

                    }
                    field("New Sattion Name"; Rec."New Sattion Name")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        ToolTip = 'Specifies the value of the New Sattion Name field.';

                    }
                    field("Professional Opinion"; Rec."Professional Opinion")
                    {
                        ApplicationArea = All;
                        MultiLine = true;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Professional Opinion field.';
                    }

                    field("To Hardship Area?"; Rec."To Hardship Area?")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        ToolTip = 'Specifies the value of the To Hardship Area? field.';
                    }



                    field(Distance; Rec.Distance)
                    {
                        Editable = false;
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
                field("Reporting Date"; Rec."Reporting Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Reporting Date field.';
                }
                field("Actual Reporting Date"; Rec."Actual Reporting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Actual Reporting Date field.';
                }
                // field("Reason(s) for Appeal"; Rec."Reason(s) for Appeal")
                // {
                //     ApplicationArea = All;
                //     multiline = true;
                //     ToolTip = 'Specifies the value of the Reason(s) for Appeal field.';
                // }

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
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        ApprovalsMgmt: Codeunit "Approvals Mgt";
                    begin

                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }

                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';
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
                PromotedCategory = Category6;
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
                ApplicationArea = Basic;
                Caption = 'Employee  Transfer History';
                Image = History;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Employee  Transfer History";
                RunPageLink = "Employee No" = field("Employee No");
                ToolTip = 'Executes the Employee  Transfer History action.';
            }
            action(Confirm)
            {
                ApplicationArea = Basic;
                Caption = 'Acknowledge Employee Reporting';
                Image = PostApplication;
                Promoted = true;
                PromotedCategory = Process;
                Enabled = Rec.Status = Rec.Status::"Awaiting HOS";
                ToolTip = 'Executes the Acknowledge Employee Reporting action.';
                trigger OnAction()
                var
                    Employee: Record "HR Employees";
                    ApprovalMgt: Codeunit "Approvals Mgt";
                begin
                    Rec.TestField(Posted, false);
                    Rec.TestField(Status, Rec.Status::"Awaiting HOS");
                    Rec.TestField("Actual Reporting Date");


                    if Rec.Status = Rec.Status::"Awaiting HOS" then begin
                        Employee.Reset();
                        Employee.SetRange("No.", Rec."Employee No");
                        if Employee.FindFirst() then
                            Employee."Current Duty Station" := Rec."New Station";
                        //  if type = type::"Management initiated" then begin
                        //  Employee.Validate("Current Duty Station");
                        //  end;

                        if Employee.Modify(true) then begin
                            ApprovalMgt.CreateTransferAllowancePayChange(Rec);
                            Rec.Posted := true;
                            Rec."Posted On" := CurrentDateTime;
                            Rec.Status := Rec.Status::"HOS Confirmed";
                            Message('Employee Reporting Sucessfully Confirmed');
                        end;
                    end;





                end;
            }

            action(Appeal)
            {
                ApplicationArea = Basic;
                Caption = 'Appeal Transfer';
                Image = PostApplication;
                Enabled = Rec.Status = Rec.Status::"HOS Confirmed";
                ToolTip = 'Executes the Appeal Transfer action.';
                trigger OnAction()
                var
                    Opinion: Record "Employee Transfers";
                    Employee: Record "HR Employees";

                begin
                    Rec.TestField(Posted, false);
                    Rec.TestField(Status, Rec.Status::"HOS Confirmed");
                    Rec.TestField("Actual Reporting Date");


                    if Rec.Status = Rec.Status::"HOS Confirmed" then begin
                        Employee.Reset();
                        Employee.SetRange("No.", Rec."Employee No");
                        if Employee.FindFirst() then
                            Employee."Current Duty Station" := Rec."New Station";

                        Opinion.Init();

                        Opinion."Document Type" := Opinion."Document Type"::Application;
                        Opinion."Transfer No" := Rec."Document No";
                        Opinion.Type := Rec.Type;
                        Opinion."Request Date" := Rec."Request Date";
                        Opinion."Employee No" := Rec."Employee No";
                        Opinion.Validate("Employee No");
                        Opinion."Employee Name" := Rec."Employee Name";
                        Opinion."Original Station" := Rec."Original Station";
                        Opinion."New Station" := Rec."New Station";
                        Opinion."Original Station Name" := Rec."Original Station Name";
                        Opinion."New Sattion Name" := Rec."New Sattion Name";
                        Opinion."To Hardship Area?" := Rec."To Hardship Area?";
                        Opinion.Distance := Rec.Distance;
                        Opinion."Job Title" := Rec."Job Title";
                        Opinion.Remarks := Rec.Remarks;
                        Opinion."Transfer Appeal" := true;
                        Opinion."Reason(s) for Appeal" := Rec."Reason(s) for Appeal";
                        Opinion."Original Transfer No" := Rec."Document No";
                        Opinion.Insert(true);
                        Message('Appeal Created successfully');

                    end;





                end;
            }

        }
    }
}

#pragma implicitwith restore

#pragma implicitwith restore

