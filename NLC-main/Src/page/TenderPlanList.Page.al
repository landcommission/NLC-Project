#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193929 "Tender Plan List"
{
    ApplicationArea = Basic;
    CardPageId = "Tender Plan Header";
    Editable = true;
    PageType = List;
    SourceTable = "Tender Plan Header";
    SourceTableView = sorting(No, "Proc. method number")
                      order(ascending)
                      where("Start Date" = filter(<> ''));
    UsageCategory = Lists;
    Caption = 'Tender Plan List';
    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Workplan Code"; Rec."Workplan Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Code field.';
                }
                field("Proc. method number"; Rec."Proc. method number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proc. method number field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Workplan Description"; Rec."Workplan Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Description field.';
                }
            }
        }
    }

    actions { }
}
