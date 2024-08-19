#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194241 "Payroll Request Lines"
{
    Caption = 'Payroll Change Lines Existing';
    PageType = ListPart;
    SourceTable = "Payroll Change Request Line";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Payroll Change No"; Rec."Payroll Change No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payroll Change No field.';
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Existing Transaction Code"; Rec."Existing Transaction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Existing Transaction Code field.';
                }
                field("Existing Transaction Name"; Rec."Existing Transaction Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Existing Transaction Name field.';
                }
                field("Old Amount"; Rec."Old Value")
                {
                    ApplicationArea = Basic;
                    Caption = 'Old Amount';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Old Amount field.';
                }
                field("New Amount"; Rec."New Value")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Amount';
                    ToolTip = 'Specifies the value of the New Amount field.';
                }
                field("Old Balance"; Rec."Old Balance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Old Balance';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Old Balance field.';
                }
                field("New Balance"; Rec."New Balance")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Balance';
                    ToolTip = 'Specifies the value of the New Balance field.';
                }
                field("Old Original Amount"; Rec."Old Original Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Old Original Amount';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Old Original Amount field.';
                }
                field("New Original Amount"; Rec."New Original Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Original Amount';
                    ToolTip = 'Specifies the value of the New Original Amount field.';
                }
                field("Old Stop for Next Period"; Rec."Old Stop for Next Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'Old Stop for Next Period';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Old Stop for Next Period field.';
                }
                field("New Stop for Next Period"; Rec."New Stop for Next Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Stop for Next Period';
                    ToolTip = 'Specifies the value of the New Stop for Next Period field.';
                }
                field("Old Stopped"; Rec."Old Stopped")
                {
                    ApplicationArea = Basic;
                    Caption = 'Old Stopped';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Old Stopped field.';
                }
                field("New Stopped"; Rec."New Stopped")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Stopped';
                    ToolTip = 'Specifies the value of the New Stopped field.';
                }
                field("Effective Payroll Period"; Rec."Effective Payroll Period")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Effective Payroll Period field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
            }
        }
    }

    actions { }

    trigger OnModifyRecord(): Boolean
    begin

        PayrollChanges.Reset();
        if PayrollChanges.Get(Rec."Payroll Change No") then
            if PayrollChanges.Status <> PayrollChanges.Status::New then
                Error('You are not allowed to Modify at this level');
    end;

    var
        PRTransCode: Record "PR Transaction Codes";
        PREmpTrans: Record "PR Employee Transactions";
        PayrollChanges: Record "Payroll Changes";
}
