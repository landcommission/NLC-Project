#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193963 "Evaluation Criteria List"
{
    ApplicationArea = Basic;
    CardPageId = "Evaluation Criteria Header";
    PageType = List;
    SourceTable = "Evaluation Criterial Header";
    UsageCategory = Lists;
    Caption = 'Evaluation Criteria List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Evaluation Year"; Rec."Evaluation Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Year field.';
                }
                field("Actual Weight Assigned"; Rec."Actual Weight Assigned")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Weight Assigned field.';
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
