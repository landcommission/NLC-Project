#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 56110 "Confirm Verdict"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Case Register";
    ApplicationArea = All;
    Caption = 'Confirm Verdict';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Verdict; Rec.Verdict)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Verdict Status field.';
                }
            }
        }
    }

    actions { }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        Rec.TestField(Verdict);
    end;
}

#pragma implicitwith restore

