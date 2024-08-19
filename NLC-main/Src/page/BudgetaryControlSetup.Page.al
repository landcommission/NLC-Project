#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193655 "Budgetary Control Setup"
{
    PageType = Card;
    SourceTable = "Budgetary Control Setup";
    ApplicationArea = All;
    Caption = 'Budgetary Control Setup';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Mandatory; Rec.Mandatory)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mandatory field.';
                }
                field("Allow OverExpenditure"; Rec."Allow OverExpenditure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow OverExpenditure field.';
                }
                field("Budget Check Criteria"; Rec."Budget Check Criteria")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Check Criteria field.';
                }
                field("Partial Budgetary Check"; Rec."Partial Budgetary Check")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Partial Budgetary Check field.';
                }
                field("Use Totaling Account"; Rec."Use Totaling Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Use Totaling Account field.';
                }
            }
            group(Budget)
            {
                Caption = 'Budget';
                field("Current Budget Code"; Rec."Current Budget Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Budget Code field.';
                }
                field("Current Budget Start Date"; Rec."Current Budget Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Budget Start Date field.';
                }
                field("Current Budget End Date"; Rec."Current Budget End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Budget End Date field.';
                }
            }
            group(Actuals)
            {
                Caption = 'Actuals';
                Visible = false;
                field("Analysis View Code"; Rec."Analysis View Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Analysis View Code field.';
                }
                field("Dimension 1 Code"; Rec."Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension 1 Code field.';
                }
                field("Dimension 2 Code"; Rec."Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension 2 Code field.';
                }
                field("Dimension 3 Code"; Rec."Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension 3 Code field.';
                }
                field("Dimension 4 Code"; Rec."Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension 4 Code field.';
                }
            }
        }
    }

    actions { }
}
