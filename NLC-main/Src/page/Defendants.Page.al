#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 56102 Defendants
{
    PageType = List;
    SourceTable = "Plaintive-Defentants";
    SourceTableView = where(Type = const(Defendant));
    ApplicationArea = All;
    Caption = 'Defendants';
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
                field(Names; Rec.Names)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact field.';
                }
            }
        }
    }

    actions { }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Defendant;
    end;
}

#pragma implicitwith restore

