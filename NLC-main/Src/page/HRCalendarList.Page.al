#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194138 "HR Calendar List"
{
    ApplicationArea = Basic;
    CardPageId = "HR Calendar Card";
    DeleteAllowed = false;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "HR Calendar";
    UsageCategory = Tasks;
    Caption = 'HR Calendar List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control10; Outlook) { }
        }
    }

    actions { }
}
