#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69301 "Disciplinary Commite Card"
{
    PageType = Card;
    SourceTable = "Disciplinary Committees";
    ApplicationArea = All;
    Caption = 'Disciplinary Commite Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Mandate; Rec.Mandate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mandate field.';
                }
            }
            part(Control10; "Disciplinary Committe Members")
            {
                SubPageLink = "Commitee Code" = field(Code);
                ApplicationArea = Basic;
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

