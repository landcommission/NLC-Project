#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193766 "Acceleration Pool List"
{
    ApplicationArea = Basic;
    CardPageId = "Acceleration Pool Nom. Card";
    PageType = List;
    SourceTable = "Acceleration Pool Nomination";
    UsageCategory = Lists;
    Caption = 'Acceleration Pool List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Pool No."; Rec."Pool No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pool No. field.';
                }
                field("Nominee Name"; Rec."Nominee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nominee Name field.';
                }
                field("Job to Succeed"; Rec."Job to Succeed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job to Succeed field.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions { }
}
