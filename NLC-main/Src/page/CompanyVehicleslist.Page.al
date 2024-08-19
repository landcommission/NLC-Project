#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194139 "Company Vehicles list"
{
    ApplicationArea = Basic;
    CardPageId = "Company Vehicles Card";
    PageType = List;
    SourceTable = "Company Vehicles";
    UsageCategory = Lists;
    Caption = 'Company Vehicles list';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Capacity; Rec.Capacity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Capacity field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Allocated; Rec.Allocated)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allocated field.';
                }
                field("Wheelchair Accessible"; "Wheelchair Accessible")
                {
                    ApplicationArea = all;
                }

            }
        }
    }

    actions { }
}
