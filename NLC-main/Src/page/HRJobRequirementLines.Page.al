#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193434 "HR Job Requirement Lines"
{
    PageType = List;
    SourceTable = "HR Job Requirements";
    ApplicationArea = All;
    Caption = 'HR Job Requirement Lines';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }

                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Caption = 'Qualification Type';
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Qualification Type field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }

                field("Qualification Description"; Rec."Qualification Description")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Qualification Description field.';
                }
                field("Minimum Score"; Rec."Minimum Score")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Minimum Score field.';
                }
                field("Maximum Score"; Rec."Maximum Score")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Maximum Score field.';
                }
                field(Control3; Rec."Related Qualification")
                {
                    ApplicationArea = Basic;
                    Caption = 'Related Qualification';
                    ToolTip = 'Specifies the value of the Related Qualification field.';

                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action("Related Qualification")
            {
                ApplicationArea = Basic;
                Caption = 'Related Qualification';
                Image = JobLines;
                Promoted = true;
                PromotedCategory = Category4;
                RunPageMode = Create;
                ToolTip = 'Executes the Related Qualification action.';
                trigger OnAction()
                begin

                    JobRelated.Reset();
                    JobRelated.SetRange(JobRelated."Qualification Type", Rec."Qualification Type");
                    JobRelated.SetRange(JobRelated."Qualification ID", Rec."Qualification Code");
                    JobRelated.SetRange(JobRelated."Job ID", Rec."Job ID");
                    if not JobRelated.Find('-') then begin
                        JobRelated.No := SeriesRec.GetNextNo('APNO', WorkDate(), true);
                        JobRelated."Qualification Type" := Rec."Qualification Type";
                        JobRelated."Qualification ID" := Rec."Qualification Code";
                        JobRelated."Job ID" := Rec."Job ID";
                        JobRelated.Insert();
                    end;
                    Page.Run(Page::"HR Related Job Qualification", JobRelated);
                end;
            }
        }
    }


    var
        IsEnabled: Boolean;
        JobRelated: Record "HR Job Related Requirements";
        SeriesRec: Codeunit NoSeriesManagement;
}
