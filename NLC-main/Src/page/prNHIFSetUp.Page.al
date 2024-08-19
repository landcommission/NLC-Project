#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193522 "prNHIF SetUp"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "PR NHIF";
    SourceTableView = sorting(Order)
                      order(ascending);
    UsageCategory = Lists;
    Caption = 'prNHIF SetUp';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Tier Code"; Rec."Tier Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tier Code field.';
                }
                field("Lower Limit"; Rec."Lower Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lower Limit field.';
                }
                field("Upper Limit"; Rec."Upper Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Upper Limit field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }

    actions { }
}
