#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69201 "HR Models List"
{
    CardPageId = "HR Models Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Models";
    ApplicationArea = All;
    Caption = 'HR Models List';
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
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1102755004; "HR Model Factbox")
            {
                SubPageLink = Type = field(Type);
                ApplicationArea = Basic;
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

