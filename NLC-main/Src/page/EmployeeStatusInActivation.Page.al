#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194161 "Employee Status InActivation"
{
    ApplicationArea = Basic;
    CardPageId = "Employee Status Activation";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Payroll Changes";
    SourceTableView = where(Type = const("Staff Status"));
    UsageCategory = Lists;
    Caption = 'Employee Status InActivation';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Payroll Change No"; Rec."Payroll Change No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Change No field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Date Requested"; Rec."Date Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Requested field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
            }

        }
    }

    actions { }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec.Type := Rec.Type::"Staff Status"
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        Rec.Type := Rec.Type::"Staff Status"
    end;
}
