page 50019 "HR Attitudes Targets Setup"
{
    ApplicationArea = All;
    Caption = 'HR Attitudes Targets Setup';
    PageType = Card;
    SourceTable = "HR Attitudes Targets Setup";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Appraisal Year"; Rec."Appraisal Year")
                {
                    ToolTip = 'Specifies the value of the Appraisal Year field.';
                }
                field("Attitude Description"; Rec."Attitude Description")
                {
                    ToolTip = 'Specifies the value of the Attitude Description field.';
                }
                field(Attributes; Rec.Attributes)
                {
                    ToolTip = 'Specifies the value of the Attributes field.';
                }
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Criteria; Rec.Criteria)
                {
                    ToolTip = 'Specifies the value of the Criteria field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Job Grade"; Rec."Job Grade")
                {
                    ToolTip = 'Specifies the value of the Job Grade field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
    }
}
