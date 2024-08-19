#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194050 "HR Emp Transfer List"
{
    ApplicationArea = Basic;
    CardPageId = "HR Emp Transfer Card";
    Editable = false;
    PageType = List;
    SourceTable = "HR Employee Transfer Header";
    UsageCategory = Lists;
    Caption = 'HR Emp Transfer List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Request No"; Rec."Request No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request No field.';
                }
                field("Date Requested"; Rec."Date Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Requested field.';
                }
                field("Date Approved"; Rec."Date Approved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Approved field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Transfer details Updated"; Rec."Transfer details Updated")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Transfer details Updated field.';
                }
            }
        }
    }

    actions { }
}
