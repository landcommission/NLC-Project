/* #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70002 "Object Renumbering Tool"
{
    // http://www.dynamics.is/wp-admin/post.php?post=2064

    Caption = 'Object Renumbering';
    PageType = List;
    SaveValues = true;
    SourceTable = "Object Renumbering Tool";

    layout
    {
        area(content)
        {
            group("Using Renumbering Lines")
            {
                Caption = 'Using Renumbering Lines';
                repeater(Group)
                {
                    field("Source Type";Rec."Source Type")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Source ID";Rec."Source ID")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Destination ID";Rec."Destination ID")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
            group(Controls)
            {
                Caption = 'Using Control IDs';
                field(ControlStartRange;ControlStartRange)
                {
                    ApplicationArea = Basic;
                    Caption = 'Control Start Range';
                }
                field(ControlEndRange;ControlEndRange)
                {
                    ApplicationArea = Basic;
                    Caption = 'Control End Range';
                }
                field(ControlNewStartRange;ControlNewStartRange)
                {
                    ApplicationArea = Basic;
                    Caption = 'Control New Start Range';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Read Object Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Read Object Lines';
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Creates renumbering lines base on the objects in the selected object file';

                trigger OnAction()
                begin
                    Rec.LoadObjectDataIntoSetup;
                end;
            }
            action("Suggest IDs")
            {
                ApplicationArea = Basic;
                Caption = 'Suggest IDs';
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Suggest new object numbers in the range from 50.000 based on the available objects in the current license';

                trigger OnAction()
                begin
                    Rec.SuggestIDsFromPermissionRange;
                end;
            }
            action("Read from Excel")
            {
                ApplicationArea = Basic;
                Caption = 'Read from Excel';
                Image = Excel;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Reads object renumbering lines from Excel Sheet created with the Write to Excel process';

                trigger OnAction()
                begin
                    Rec.ImportSetupFromExcel;
                end;
            }
            action("Write to Excel")
            {
                ApplicationArea = Basic;
                Caption = 'Write to Excel';
                Image = Excel;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Writes current renumbering lines to a new Excel Sheet to me managed within Excel and reread into the renumbering lines';

                trigger OnAction()
                begin
                    Rec.ExportSetupToExcel;
                end;
            }
            action("Renumber Using Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Renumber Using Lines';
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Prompts for a file to read and for a new file to save with renumbered objects based on the rules in the renumbering lines';

                trigger OnAction()
                var
                    TempRenumberingSetup: Record "Object Renumbering Tool" temporary;
                    RenumberingSetup: Record "Object Renumbering Tool";
                begin
                    Rec.CopyToTemp(RenumberingSetup,TempRenumberingSetup);
                    Rec.ReplaceObjectDataContentByRenumberingLines(TempRenumberingSetup);
                end;
            }
            action("Renumber Using Controls")
            {
                ApplicationArea = Basic;
                Caption = 'Renumber Using Controls';
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Prompts for a file to read and for a new file to save with renumbered objects based on the rules in the control IDs setup';

                trigger OnAction()
                begin
                    Rec.ReplaceObjectDataContentByControlIDs(ControlStartRange,ControlEndRange,ControlNewStartRange);
                end;
            }
        }
    }

    var
        ControlStartRange: Integer;
        ControlEndRange: Integer;
        ControlNewStartRange: Integer;
}
 */