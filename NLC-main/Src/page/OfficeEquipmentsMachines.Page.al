#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193771 "Office Equipments/Machines"
{
    PageType = List;
    SourceTable = "Employee Equipment";
    ApplicationArea = All;
    Caption = 'Office Equipments/Machines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Employee code"; Rec."Employee code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee code field.';
                }
                field("Office Equipment/Machine"; Rec."Office Equipment/Machine")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Office Equipment/Machine field.';
                }
            }
        }
    }

    actions { }
}
