#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193490 "HR OSInjured Person List"
{
    PageType = ListPart;
    SourceTable = "HR OSInjured Person";
    ApplicationArea = All;
    Caption = 'HR OSInjured Person List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                    trigger OnValidate()
                    begin
                        if (Rec.Type = Rec.Type::" ") then begin
                            Casual := true;
                            Rec.Modify();
                        end else
                            Casual := false;
                        Rec.Modify();
                    end;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Injured Person"; Rec."Injured Person")
                {
                    ApplicationArea = Basic;
                    Editable = Casual;
                    ToolTip = 'Specifies the value of the Injured Person field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    Editable = Casual;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Phone No"; Rec."Phone No")
                {
                    ApplicationArea = Basic;
                    Editable = Casual;
                    ToolTip = 'Specifies the value of the Phone No field.';
                }
                field("ID No"; Rec."ID No")
                {
                    ApplicationArea = Basic;
                    Editable = Casual;
                    ToolTip = 'Specifies the value of the ID No field.';
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    Editable = Casual;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Editable = Casual;
                    ToolTip = 'Specifies the value of the Email field.';
                }
            }
        }
    }

    actions { }

    trigger OnInit()
    begin
        Casual := false;
    end;

    var
        Casual: Boolean;
}
