page 50034 "Hr Disciplanary Cases Created"
{
    ApplicationArea = All;
    Caption = 'Hr Disciplanary Cases Created';
    PageType = List;
    CardPageId = "Hr Cases Submitted ";
    SourceTable = "HR Disciplinary Cases";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No"; "Document No")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the document No';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ToolTip = 'Specifies the value of the Case Number field.';
                }

                field("Case Number"; Rec."Case Number")
                {
                    ToolTip = 'Specifies the value of the Case Number field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Disciplinary status"; Rec."Disciplinary status")
                {
                    ToolTip = 'Specifies the value of the Disciplinary status field.';
                }

                field(Accuser; Rec.Accuser)
                {
                    ToolTip = 'Specifies the value of the Originator field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }
}
