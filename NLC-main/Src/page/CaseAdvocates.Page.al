#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 56105 "Case Advocates"
{
    PageType = List;
    SourceTable = "Case Advocates";
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Case Advocates';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Caption = 'First Names';
                    ToolTip = 'Specifies the value of the First Names field.';
                }
                field("Second name"; Rec."Second name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second name field.';
                }
                field(Contacts; Rec.Contacts)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contacts field.';
                }
                field("Firm Code"; Rec."Firm Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Firm Code field.';
                }
                field("Firm name"; Rec."Firm name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Firm name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Postal Code"; Rec."Postal Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Postal Code field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

