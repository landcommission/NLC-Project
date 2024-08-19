#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193515 "HR OSAccident Incident line"
{
    PageType = ListPart;
    SourceTable = "HR OSAccident Incident Line";
    ApplicationArea = All;
    Caption = 'HR OSAccident Incident line';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Accident No."; Rec."Accident No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accident No. field.';
                }
                field(Incident; Rec.Incident)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Incident field.';
                }
                field("Cause No"; Rec."Cause No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cause No';
                    ToolTip = 'Specifies the value of the Cause No field.';
                }
                field(Cause; Rec.Cause)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cause';
                    ToolTip = 'Specifies the value of the Cause field.';
                }
                field("Resolution/Recommendation"; Rec."Resolution/Recommendation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resolution/Recommendation field.';
                }
            }
        }
    }

    actions { }
}
