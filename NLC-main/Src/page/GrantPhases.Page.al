#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193835 "Grant Phases"
{
    CardPageId = "Grant Phase Card";
    DelayedInsert = true;
    Editable = true;
    PageType = List;
    SourceTable = "Grant Phases";
    ApplicationArea = All;
    Caption = 'Grant Phases';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
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
                field("Technical Reporting Date"; Rec."Technical Reporting Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disbursement Date';
                    ToolTip = 'Specifies the value of the Disbursement Date field.';
                }
                field("Financial Reporting Date"; Rec."Financial Reporting Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Next Disbursment due Date';
                    ToolTip = 'Specifies the value of the Next Disbursment due Date field.';
                }
            }
        }
    }

    actions { }
}
