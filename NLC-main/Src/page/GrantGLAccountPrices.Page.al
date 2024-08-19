#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193854 "Grant G/L Account Prices"
{
    Caption = 'Grant G/L Account Prices';
    PageType = Card;
    SourceTable = "Job-G/L Account Price";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account No. field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Unit Cost Factor"; Rec."Unit Cost Factor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Cost Factor field.';
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Discount % field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions { }
}
