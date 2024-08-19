#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193681 "Close out List"
{
    CardPageId = "Close out Header";
    PageType = List;
    SourceTable = "HR OSInjured Person";
    ApplicationArea = All;
    Caption = 'Close out List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(LineNo; Rec.LineNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the LineNo field.';
                }
                field("Incident No"; Rec."Incident No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Injured Person"; Rec."Injured Person")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Injured Person field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("ID No"; Rec."ID No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID No field.';
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
            }
        }
    }

    actions { }
}
