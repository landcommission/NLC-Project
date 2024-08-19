#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194096 "HR 360 Appraisals List - TS"
{
    ApplicationArea = Basic;
    CardPageId = "HR 360 Appraisal Card";
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Functions,Appraisal';
    SourceTable = "HR Appraisal Header";
    SourceTableView = SORTING("Appraisal No") ORDER(DESCENDING) where("Appraisal Stage" = const("Target Setting"));
    //SourceTableView = SORTING("No.") ORDER(DESCENDING);
    UsageCategory = Lists;
    Caption = 'HR 360 Appraisals List - TS';
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
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Description field.';
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
            group(Appraisal)
            {
                Caption = 'Appraisal';
                action(SendSupervisor)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send to Supervisor';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Send to Supervisor action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Appraisal Stage", Rec."Appraisal Stage"::"Target Setting");
                        Rec.TestField(Rec."Employee No");

                        if Confirm('Send to supervisor?', false) = false then
                            exit;

                        Rec."Appraisal Stage" := Rec."Appraisal Stage"::"Target Approval";
                        Rec.Modify();
                        Message('Appraisal sent to supervisor');
                    end;
                }
            }
        }
    }
}
