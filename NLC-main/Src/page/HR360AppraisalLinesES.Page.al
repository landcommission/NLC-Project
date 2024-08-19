#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194103 "HR 360 Appraisal Lines - ES"
{
    Caption = 'HR Appraisal Lines - Employee Subordinates';
    PageType = ListPart;
    SourceTable = "HR Appraisal Lines";
    SourceTableView = where("Categorize As" = const("Employee's Subordinates"));
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Sub Category"; Rec."Sub Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Category field.';
                }
                field("Perfomance Goals and Targets"; Rec."Perfomance Goals and Targets")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Perfomance Goals and Targets field.';
                }
                field("Min. Target Score"; Rec."Min. Target Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min. Target Score field.';
                }
                field("Max Target Score"; Rec."Max Target Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Target Score field.';
                }
                field("Sub-ordinates Rating"; Rec."Sub-ordinates Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub-ordinates Rating field.';
                }
                field("Subordinates Comments"; Rec."Subordinates Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subordinates Comments field.';
                }
                field("Employee Comments"; Rec."Employee Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Comments field.';
                }
            }
        }
    }

    actions { }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Categorize As" := Rec."Categorize As"::"Employee's Subordinates";
    end;
}
