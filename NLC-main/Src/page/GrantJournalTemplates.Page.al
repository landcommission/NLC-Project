#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193824 "Grant Journal Templates"
{
    Caption = 'Grant Journal Templates';
    PageType = Card;
    SourceTable = "Job-Journal Template";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Posting No. Series"; Rec."Posting No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting No. Series field.';
                }
                field(Recurring; Rec.Recurring)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recurring field.';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Code field.';
                    trigger OnValidate()
                    begin
                        SourceCodeOnAfterValidate();
                    end;
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason Code field.';
                }
                field("Form ID"; Rec."Form ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Form ID field.';
                }
                field("Form Name"; Rec."Form Name")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Form Name field.';
                }
                field("Test Report ID"; Rec."Test Report ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Test Report ID field.';
                }
                field("Test Report Name"; Rec."Test Report Name")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Test Report Name field.';
                }
                field("Posting Report ID"; Rec."Posting Report ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posting Report ID field.';
                }
                field("Posting Report Name"; Rec."Posting Report Name")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posting Report Name field.';
                }
                field("Force Posting Report"; Rec."Force Posting Report")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Force Posting Report field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("Te&mplate")
            {
                Caption = 'Te&mplate';
                action(Batches)
                {
                    ApplicationArea = Basic;
                    Caption = 'Batches';
                    RunObject = page "Job Journal Batches";
                    RunPageLink = "Journal Template Name" = field(Name);
                    ToolTip = 'Executes the Batches action.';
                }
            }
        }
    }

    local procedure SourceCodeOnAfterValidate()
    begin
        CurrPage.Update(false);
    end;
}
