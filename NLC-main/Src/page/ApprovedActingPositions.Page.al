page 69842 "Approved Acting Positions"
{

    PageType = List;
    SourceTable = "Employee Acting Position";
    SourceTableView = where("Promotion Type" = filter("Acting Position"),
                            Status = filter(Approved));
    ApplicationArea = All;
    Caption = 'Approved Acting Positions';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No field';
                    ApplicationArea = All;
                }
                field(Position; Rec.Position)
                {
                    ToolTip = 'Specifies the value of the Position field';
                    ApplicationArea = All;
                }
                field("Relieved Employee"; Rec."Relieved Employee")
                {
                    ToolTip = 'Specifies the value of the Relieved Employee field';
                    ApplicationArea = All;
                }
                field("Relieved Name"; Rec."Relieved Name")
                {
                    ToolTip = 'Specifies the value of the Relieved Name field';
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field';
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field';
                    ApplicationArea = All;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    Caption = 'Reliever';
                    ToolTip = 'Specifies the value of the Reliever field';
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field';
                    ApplicationArea = All;
                }
                field("Promotion Type"; Rec."Promotion Type")
                {
                    ToolTip = 'Specifies the value of the Promotion Type field';
                    ApplicationArea = All;
                }
                field("Acting Amount"; Rec."Acting Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Acting Amount field';
                }
            }
        }
    }

    actions { }
}

