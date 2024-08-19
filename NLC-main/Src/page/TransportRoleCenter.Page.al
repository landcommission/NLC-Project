#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193840 "Transport Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(rolecenter)
        {
            group(Control7)
            {
                part(Control6; "HR Employee Cue")
                {
                    Caption = 'Employees Cue';
                }
            }
            group(Control5)
            {
                systempart(Control4; Links) { }
                systempart(Control3; MyNotes) { }
            }
        }
    }

    actions
    {
        area(sections)
        {
            group("HR Transport Management")
            {
                Caption = 'HR Transport Management';
                Image = ResourcePlanning;
                action("HR Transport Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Transport Requisition';
                    RunObject = page "HR Transport Requisition List";
                    ToolTip = 'Executes the HR Transport Requisition action.';
                }
                action("HR Transport Allocations")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Transport Allocations';
                    RunObject = page "HR Transport Allocations List";
                    ToolTip = 'Executes the HR Transport Allocations action.';
                }
            }
        }
        area(Reporting)
        {
            action(Action2)
            {
                ApplicationArea = Basic;
                Caption = 'HR Transport Allocations';
                Image = SalesShipment;
                Promoted = true;
                RunObject = report "HR Transport Allocations";
                ToolTip = 'Executes the HR Transport Allocations action.';
            }
            action("HR Transport Requests")
            {
                ApplicationArea = Basic;
                Caption = 'HR Transport Requests';
                Image = TransferOrder;
                Promoted = true;
                RunObject = report "HR Transport Requisitions";
                ToolTip = 'Executes the HR Transport Requests action.';
            }
        }
    }
}
