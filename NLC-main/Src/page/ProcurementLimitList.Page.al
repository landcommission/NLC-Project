#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193912 "Procurement Limit List"
{
    PageType = List;
    SourceTable = "Procurement Limit Code";
    ApplicationArea = All;
    Caption = 'Procurement Limit List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Procurement Code"; Rec."Procurement Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Code field.';
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Type field.';
                }
                field("Procurement Amount Type"; Rec."Procurement Amount Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Amount Type field.';
                }
                field("Min. Amount"; Rec."Min. Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min. Amount field.';
                }
                field("Max Amount"; Rec."Max Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Amount field.';
                }
                field("Fixed Amount"; Rec."Fixed Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fixed Amount field.';
                }
            }
        }
    }

    actions { }
}
