#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69664 "Commitee Type"
{
    PageType = Card;
    SourceTable = "Committee Type";
    ApplicationArea = All;
    Caption = 'Commitee Type';
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
                field("Functional Classification"; Rec."Functional Classification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Functional Classification field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Title of Appointing Officer"; Rec."Title of Appointing Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title of Appointing Officer field.';
                }
                field("Non-Staff Allowed"; Rec."Non-Staff Allowed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Non-Staff Allowed field.';
                }
                field("Minimim No. of Members"; Rec."Minimim No. of Members")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimim No. of Members field.';
                }
                field("No. of Appointments Made"; Rec."No. of Appointments Made")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Appointments Made field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control20; "Commitee Composition")
            {
                SubPageLink = "Committee Type ID" = field(Code);
                ApplicationArea = Basic;
            }
        }
        area(FactBoxes)
        {
            systempart(Control12; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Commitee Function")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = page "Commitee Function";
                RunPageLink = "Committee Type ID" = field(Code);
                ToolTip = 'Executes the Commitee Function action.';
            }
            action("Commitee Guidelines")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = page "Commitee Guidelines";
                RunPageLink = "Committee Type ID" = field(Code);
                ToolTip = 'Executes the Commitee Guidelines action.';
            }
            action("Commitee Composition")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = page "Commitee Composition";
                RunPageLink = "Committee Type ID" = field(Code);
                Visible = false;
                ToolTip = 'Executes the Commitee Composition action.';
            }
        }
    }
}

#pragma implicitwith restore

