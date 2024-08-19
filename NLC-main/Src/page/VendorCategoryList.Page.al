#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193782 "Vendor Category List"
{
    CardPageId = "Vendor Category Card";
    Editable = false;
    PageType = List;
    SourceTable = "HR Disciplinary Cases";
    ApplicationArea = All;
    Caption = 'Vendor Category List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Number field.';
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Complaint field.';
                }
                field("Type of Disciplinary Case"; Rec."Type of Disciplinary Case")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Disciplinary Case field.';
                }
                field("Recommended Action"; Rec."Recommended Action")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommended Action field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1000000008; Outlook) { }
            systempart(Control1000000009; Notes) { }
            systempart(Control1000000010; MyNotes) { }
        }
    }

    actions { }
}
