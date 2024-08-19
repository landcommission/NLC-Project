#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193489 "HR OSSafety Checklist List"
{
    PageType = ListPart;
    SourceTable = "HR OSSafety Checklist";
    ApplicationArea = All;
    Caption = 'HR OSSafety Checklist List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(SafetyNo; Rec.SafetyNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SafetyNo field.';
                }
                field("Safety Rules"; Rec."Safety Rules")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Safety Rules field.';
                }
                field(Observed; Rec.Observed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Observed field.';
                }
                field("Not Observed"; Rec."Not Observed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Not Observed field.';
                }
                field("Accident No"; Rec."Accident No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Accident No field.';
                }
                field("Observation Made"; Rec."Observation Made")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Observation Made field.';
                }
            }
        }
    }

    actions { }
}
