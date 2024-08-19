#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50177 "Maintanance Type"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Maintanance Types";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(MaintananceCode; Rec."Maintanance Code")
                {
                    ApplicationArea = Basic;
                }
                field(MaintananceDescription; Rec."Maintanance Description")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
