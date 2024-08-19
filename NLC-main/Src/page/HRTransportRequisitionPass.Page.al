#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194036 "HR Transport Requisition Pass"
{
    PageType = List;
    SourceTable = "HR Transport Allocations";
    SourceTableView = sorting("Allocation No", "Requisition No");
    ApplicationArea = All;
    Caption = 'HR Transport Requisition Pass';
    layout
    {
        area(Content)
        {
            repeater(Control1102756000)
            {
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Passenger/s Full Name/s"; Rec."Passenger/s Full Name/s")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Passenger/s Full Name/s field.';
                }
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From field.';
                }
                field("To"; Rec."To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To field.';
                }
                field(Dept; Rec.Dept)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dept field.';
                }
            }
        }
    }

    actions { }
}
