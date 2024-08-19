#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194016 "Approved Salary Advance List"
{
    CardPageId = "Salary Advance Lists";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Staff Advance Headers";
    SourceTableView = where(Status = const(Approved));
    ApplicationArea = All;
    Caption = 'Approved Salary Advance List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';

                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    Caption = 'Requestor ID';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requestor ID field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions { }

    trigger OnOpenPage()
    begin
        Rec.FilterGroup(2);
        Rec.SetRange(Rec.Cashier, UserId);
        Rec.FilterGroup(0);
    end;
}
