#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194150 "HR Succession Details list"
{
    ApplicationArea = Basic;
    CardPageId = "HR Succession Details";
    PageType = List;
    SourceTable = "HR Jobs to Succeed";
    SourceTableView = sorting("Job ID")
                      where(Status = filter(Approved));
    UsageCategory = Lists;
    Caption = 'HR Succession Details list';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }

                field(Availability; Rec.Availability)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Availability field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("No of Posts"; Rec."No of Posts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Posts field.';
                }
                field("Position Reporting to"; Rec."Position Reporting to")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position Reporting to field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = all;
                    Editable = false;
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
            group(Succession)
            {
                Caption = 'Succession';
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Approvals action.';

                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send Approval Request action.';

                }
                action("Cancel Approvals")
                {
                    ApplicationArea = Basic;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approvals action.';

                }
            }
        }
    }
}
