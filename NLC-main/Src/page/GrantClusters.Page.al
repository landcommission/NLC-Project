#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193882 "Grant Clusters"
{
    Caption = 'Grant Clusters';
    PageType = Card;
    SourceTable = "Job-Posting Group";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("WIP Costs Account"; Rec."WIP Costs Account")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the WIP Costs Account field.';
                }
                field("WIP Accrued Costs Account"; Rec."WIP Accrued Costs Account")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the WIP Accrued Costs Account field.';
                }
                field("Job Costs Applied Account"; Rec."Job Costs Applied Account")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Costs Applied Account field.';
                }
                field("Job Costs Adjustment Account"; Rec."Job Costs Adjustment Account")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Costs Adjustment Account field.';
                }
                field("G/L Expense Acc. (Contract)"; Rec."G/L Expense Acc. (Contract)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the G/L Expense Acc. (Contract) field.';
                }
                field("WIP Accrued Sales Account"; Rec."WIP Accrued Sales Account")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the WIP Accrued Sales Account field.';
                }
                field("WIP Invoiced Sales Account"; Rec."WIP Invoiced Sales Account")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the WIP Invoiced Sales Account field.';
                }
                field("Job Sales Applied Account"; Rec."Job Sales Applied Account")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Sales Applied Account field.';
                }
                field("Job Sales Adjustment Account"; Rec."Job Sales Adjustment Account")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Sales Adjustment Account field.';
                }
                field("Recognized Costs Account"; Rec."Recognized Costs Account")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Recognized Costs Account field.';
                }
                field("Recognized Sales Account"; Rec."Recognized Sales Account")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Recognized Sales Account field.';
                }
            }
        }
    }

    actions { }
}
