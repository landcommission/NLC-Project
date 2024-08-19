#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193792 "Investment List"
{
    CardPageId = "Investment Card";
    PageType = List;
    SourceTable = "Investment Header";
    SourceTableView = where("Investment Rollover Status" = filter(<> Closed));
    ApplicationArea = All;
    Caption = 'Investment List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Investment Start Date"; Rec."Investment Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Start Date field.';
                }
                field("Investment End Date"; Rec."Investment End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment End Date field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Investment Firm Code"; Rec."Investment Firm Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Company Code field.';
                }
                field("Investment Firm Name"; Rec."Investment Firm Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Company Code field.';
                }
                field("Investment Rate"; Rec."Investment Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Rate field.';
                }
                field("Investment Withholding Tax"; Rec."Investment Withholding Tax")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Withholding Tax field.';
                }
                field("Investment Type"; Rec."Investment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Type field.';
                }
                field("Investment Principal"; Rec."Investment Principal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Principal field.';
                }
                field("Investment Duration"; Rec."Investment Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Duration field.';
                }
                field("Investment Rollover Status"; Rec."Investment Rollover Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Rollover Status field.';
                }
                field("Interest Earned"; Rec."Interest Earned")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Earned field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control18; MyNotes) { }
            systempart(Control19; Links) { }
        }
    }

    actions { }
}
