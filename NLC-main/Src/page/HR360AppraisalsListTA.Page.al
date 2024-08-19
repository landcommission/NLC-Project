#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194098 "HR 360 Appraisals List - TA"
{
    ApplicationArea = Basic;
    CardPageId = "HR 360 Appraisal Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Functions,Appraisal';
    SourceTable = "HR Appraisal Header";
    SourceTableView = where("Appraisal Stage" = const("Target Approval"));
    UsageCategory = Lists;
    Caption = 'HR 360 Appraisals List - TA';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Appraisal No"; Rec."Appraisal No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    HideValue = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Type field.';
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Period field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Appraisal Stage"; Rec."Appraisal Stage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Stage field.';
                }
                field(Sent; Rec.Sent)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sent field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control26; Outlook) { }
            systempart(Control27; Notes) { }
            systempart(Control28; MyNotes) { }
            systempart(Control29; Links) { }
        }
    }

    actions
    {
        area(Processing)
        {
            group(ActionGroup1000000004)
            {
                Caption = 'Functions';
                action(ReturnAppraisee)
                {
                    ApplicationArea = Basic;
                    Caption = 'Return to Appraisee';
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Return to Appraisee action.';
                    trigger OnAction()
                    begin
                        /*
                       TESTFIELD("Appraisal Stage","Appraisal Stage"::"Target Approval");
                       IF CONFIRM('Return to appraisee?',FALSE) = FALSE THEN EXIT;
                       "Appraisal Stage":="Appraisal Stage"::"Target Setting";
                       MODIFY;
                       MESSAGE('Appraisal returned to appraisee');
                       */

                        if Confirm('Are you sure you want to Return this Appraisal to the appraisee?', false, Rec."Appraisal No") = false then
                            exit;
                        Rec."Appraisal Stage" := Rec."Appraisal Stage"::"Target Setting";
                        Rec.Status := Rec.Status::Appraisee;
                        Message('Appraisal returned to appraisee');

                    end;
                }
                action(ApproveTargets)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approve Targets';
                    Image = Approval;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Approve Targets action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Appraisal Stage", Rec."Appraisal Stage"::"Target Approval");
                        Rec.TestField(Rec."Employee No");

                        if Confirm('Approve targets?', false) = false then
                            exit;

                        Rec."Appraisal Stage" := Rec."Appraisal Stage"::"End Year Evalauation";
                        Rec.Modify();
                        Message('Appraisal targets approved');
                    end;
                }
            }
        }
    }
}
