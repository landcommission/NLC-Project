#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193913 "Workplan Budget List"
{
    CardPageId = "Tender Plan Header";
    PageType = List;
    SourceTable = "Temp Budget Alloc Purch";
    ApplicationArea = All;
    Caption = 'Workplan Budget List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Budget Dimension 1 Code"; Rec."Budget Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Dimension 1 Code field.';
                }
                field("Budget Dimension 2 Code"; Rec."Budget Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Dimension 2 Code field.';
                }
                field("Budget Dimension 3 Code"; Rec."Budget Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Dimension 3 Code field.';
                }
                field("Budget Dimension 4 Code"; Rec."Budget Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Dimension 4 Code field.';
                }
                field("Budget Dimension 5 Code"; Rec."Budget Dimension 5 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Dimension 5 Code field.';
                }
                field("Budget Dimension 6 Code"; Rec."Budget Dimension 6 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Dimension 6 Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Period Type"; Rec."Period Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period Type field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item No field.';
                }
            }
        }
    }

    actions { }
}
