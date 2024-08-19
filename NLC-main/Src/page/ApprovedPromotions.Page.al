page 69841 "Approved Promotions"
{

    CardPageId = "Employee Promotion Card";
    PageType = List;
    SourceTable = "Employee Acting Position";
    SourceTableView = where("Promotion Type" = filter(Promotion),
                            Status = filter(Approved));
    ApplicationArea = All;
    Caption = 'Approved Promotions';
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
                field("Promotion Type"; Rec."Promotion Type")
                {
                    ToolTip = 'Specifies the value of the Promotion Type field';
                    ApplicationArea = All;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ToolTip = 'Specifies the value of the Employee No. field';
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
            }
        }
    }

    actions { }
}

