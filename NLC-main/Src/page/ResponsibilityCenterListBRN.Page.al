#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193541 "Responsibility Center List BRN"
{
    Caption = 'Responsibility Center List';
    Editable = true;
    PageType = List;
    SourceTable = "Responsibility Center BR NEW";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Resp. Ctr.")
            {
                Caption = '&Resp. Ctr.';
                action(Card)
                {
                    ApplicationArea = Basic;
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = page "Responsibility Center Card BR";
                    RunPageLink = Code = field(Code);
                    ShortcutKey = 'Shift+F7';
                    ToolTip = 'Executes the Card action.';
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    action("Dimensions-Single")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-Single';
                        RunObject = page "Default Dimensions";
                        RunPageLink = "Table ID" = const(5714),
                                      "No." = field(Code);
                        ShortcutKey = 'Shift+Ctrl+D';
                        ToolTip = 'Executes the Dimensions-Single action.';
                    }
                    action("Dimensions-&Multiple")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        ToolTip = 'Executes the Dimensions-&Multiple action.';

                    }
                }
            }
        }
    }
}
