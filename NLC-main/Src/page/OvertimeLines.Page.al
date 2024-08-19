#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69174 "Overtime Lines"
{
    PageType = ListPart;
    SourceTable = "Overtime lines";
    ApplicationArea = All;
    Caption = 'Overtime Lines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Day; Rec.Day)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Day field.';
                }
                field("Overtime Type"; Rec."Overtime Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overtime Type field.';
                }
                field("Overtime Rate"; Rec."Overtime Rate")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Overtime Rate field.';
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Time field.';
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Time field.';
                }
                field(Hours; Rec.Hours)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Hours field.';
                }
                field("Employee Basic Pay"; Rec."Employee Basic Pay")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Basic Pay field.';
                }
                field("Overtime Amount"; Rec."Overtime Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Overtime Amount field.';
                }
                field("Work Done"; Rec."Work Done")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Done field.';
                }
            }
        }
    }

    actions { }

    var
        OvertimD: Record "Overtime lines";
        Overtim: Record "Overtime Header";
}

#pragma implicitwith restore

