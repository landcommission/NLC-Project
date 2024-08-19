#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193781 "Grants Lookup Values List"
{
    Caption = 'Close Out Checklist Setup';
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "Grants Lookup Values";
    SourceTableView = sorting(Order, Type, Code)
                      order(ascending);
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                Editable = true;
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    Caption = 'Checklist Details';
                    Editable = true;
                    ToolTip = 'Specifies the value of the Checklist Details field.';
                }
            }
        }
    }

    actions { }
}
