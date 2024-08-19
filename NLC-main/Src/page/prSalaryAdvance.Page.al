#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193559 "prSalary Advance"
{
    PageType = Card;
    SourceTable = "prSalary Advance";
    ApplicationArea = All;
    Caption = 'prSalary Advance';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requisition No. field.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit() then
                            CurrPage.Update();
                    end;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                field("Loan Type"; Rec."Loan Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan Type field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Names"; Rec."Employee Names")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Names field.';
                }
                field("ID No."; Rec."ID No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID No. field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Advance Amount Requested"; Rec."Advance Amount Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance Amount Requested field.';
                }
                field("Reasons for Advance Amount"; Rec."Reasons for Advance Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons for Advance Amount field.';
                }
                field("Payroll Deduction Month"; Rec."Payroll Deduction Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Deduction Month field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Eligible; Rec.Eligible)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Eligible field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    begin

                        //Code
                        Rec.TestField(Rec."Loan Type");
                        Rec.TestField(Rec."Advance Amount Requested");
                        Rec.TestField(Rec."Reasons for Advance Amount");
                        Rec.TestField(Rec."Payroll Deduction Month");
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Request action.';

                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Approvals action.';

                }
            }
        }
    }
}
