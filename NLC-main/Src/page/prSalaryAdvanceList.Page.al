#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193560 "prSalary Advance List"
{
    CardPageId = "prSalary Advance";
    Editable = false;
    PageType = List;
    SourceTable = "prSalary Advance";
    ApplicationArea = All;
    Caption = 'prSalary Advance List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition No. field.';
                }
                field("Loan Type"; Rec."Loan Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan Type field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions { }
}
