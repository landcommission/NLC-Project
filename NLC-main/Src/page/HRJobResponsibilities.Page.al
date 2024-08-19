#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193431 "HR Job Responsibilities"
{
    Caption = 'HR Job Responsibilities';
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Qualification';
    SourceTable = "HR Jobs";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Job Details';
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field("Position Reporting to"; Rec."Position Reporting to")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Position Reporting to field.';
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Supervisor Name field.';
                }
                field("No of Posts"; Rec."No of Posts")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the No of Posts field.';
                }
                field("Occupied Positions"; Rec."Occupied Positions")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Occupied Positions field.';
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Vacant Positions field.';
                }
                field("Employee Requisitions"; Rec."Employee Requisitions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Requisitions field.';
                }
            }
            part(Control1102755008; "HR Job Responsiblities Lines")
            {
                Caption = 'Job Responsibilities';
                SubPageLink = "Job ID" = field("Job ID");
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755013; Outlook) { }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Import Evaluation Areas")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Import Evaluation Areas action.';
                trigger OnAction()
                begin

                    //DELETE RESPONSIBILITIES PREVIOUSLY IMPORTED
                    HRJobResponsibilities.Reset();
                    HRJobResponsibilities.SetRange(HRJobResponsibilities."Responsibility Description", Rec."Job ID");
                    if HRJobResponsibilities.Find('-') then
                        HRJobResponsibilities.DeleteAll();
                    /*
                    //IMPORT EVALUATION AREAS FOR THIS JOB
                    HRAppraisalEvaluationAreas.RESET;
                    HRAppraisalEvaluationAreas.SETRANGE(HRAppraisalEvaluationAreas."External Source Name","Job ID");
                    IF HRAppraisalEvaluationAreas.FIND('-') THEN
                    HRAppraisalEvaluationAreas.FINDFIRST;
                    BEGIN
                         HRJobResponsibilities.RESET;
                              REPEAT
                                  HRJobResponsibilities.INIT;
                                  HRJobResponsibilities."Job ID":="Job ID";
                                  HRJobResponsibilities."Responsibility Code":=HRAppraisalEvaluationAreas.Code;
                                  HRJobResponsibilities."Responsibility Description":= HRAppraisalEvaluationAreas."Measure No";
                                  HRJobResponsibilities.INSERT();
                              UNTIL HRAppraisalEvaluationAreas.NEXT=0;
                    END;
                    */

                end;
            }
        }
    }

    var
        HRJobResponsibilities: Record "HR Job Responsiblities";
}
