#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193847 "Grant Task List"
{
    Caption = 'Grant Activity List';
    DataCaptionFields = "Grant No.";
    Editable = false;
    PageType = Card;
    SourceTable = "Job-Task";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Grant No."; Rec."Grant No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant No.';
                    ToolTip = 'Specifies the value of the Grant No. field.';
                }
                field("Grant Task No."; Rec."Grant Task No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Task No.';
                    ToolTip = 'Specifies the value of the Grant Task No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Grant Task Type"; Rec."Grant Task Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Task Type';
                    ToolTip = 'Specifies the value of the Grant Task Type field.';
                }
                field("WIP-Total"; Rec."WIP-Total")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP-Total field.';
                }
                field(Totaling; Rec.Totaling)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Totaling field.';
                }
                field("Grant Posting Group"; Rec."Grant Posting Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Clusters';
                    ToolTip = 'Specifies the value of the Grant Clusters field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Grant Task")
            {
                Caption = '&Grant Task';
                action("<Page Grant Task Card>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = page "Grant Task Card";
                    RunPageLink = "Grant No." = field("Grant No."),
                                  "Grant Task No." = field("Grant Task No.");
                    ShortcutKey = 'Shift+F7';
                    ToolTip = 'Executes the Card action.';
                }
                action("<Page Grant Task Dimensions>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = page "Grant Task Dimensions";
                    RunPageLink = "Job No." = field("Grant No."),
                                  "Job Task No." = field("Grant Task No.");
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        GrantNoOnFormat();
        GrantTaskNoOnFormat();
    end;

    var
        [InDataSet]
        "Grant No.Emphasize": Boolean;
        [InDataSet]
        "Grant Task No.Emphasize": Boolean;

    local procedure GrantNoOnFormat()
    begin
        "Grant No.Emphasize" := Rec."Grant Task Type" <> Rec."Grant Task Type"::Posting;
    end;

    local procedure GrantTaskNoOnFormat()
    begin
        "Grant Task No.Emphasize" := Rec."Grant Task Type" <> Rec."Grant Task Type"::Posting;
    end;
}
