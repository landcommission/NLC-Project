#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194133 "HR Induction Participants List"
{
    PageType = List;
    SourceTable = "HR Staff  Induction";
    ApplicationArea = All;
    Caption = 'HR Induction Participants List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Induction Code"; Rec."Induction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Induction Code field.';
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("Employee name"; Rec."Employee name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee name field.';
                }
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From field.';
                }
                field(Todate; Rec.Todate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Todate field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("Days Attended"; Rec."Days Attended")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days Attended field.';
                }
                field(Depatment; Rec.Depatment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Depatment field.';
                }
                field("Induction Status"; Rec."Induction Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Induction Status field.';
                }
            }
        }
    }

    actions { }
}
