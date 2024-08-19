#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193997 Others
{
    PageType = List;
    SourceTable = Contracts;
    ApplicationArea = All;
    Caption = 'Others';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Advocates; Rec.Advocates)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advocates field.';
                }
                field("Quantum of Claim"; Rec."Quantum of Claim")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantum of Claim field.';
                }
                field("Review Interval"; Rec."Review Interval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Review Interval field.';
                }
                field("Next Review Date"; Rec."Next Review Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Review Date field.';
                }
                field("Last Review Date"; Rec."Last Review Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Review Date field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field(Reasons; Rec.Reasons)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons field.';
                }
            }
        }
    }

    actions { }
}
