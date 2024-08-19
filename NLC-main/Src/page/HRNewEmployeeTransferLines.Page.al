#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193581 "HR New Employee Transfer Lines"
{
    //DeleteAllowed = false;
    //InsertAllowed = false;
    PageType = ListPart;
    SourceTable = "HR Employee Transfer Lines";
    //SourceTableView = where("Employee No" = const('<>'''''));
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'HR New Employee Transfer Lines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Request No"; Rec."Request No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Request No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Current Grade"; Rec."Current Grade")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Grade';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Grade field.';
                }
                field("Current Designation"; Rec."Current Designation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Designation';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Current Designation field.';
                }
                field("Current Designation Name"; Rec."Current Designation Name")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    Caption = 'Designation';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Designation Name field.';
                }
                field("New Grade"; Rec."New Grade")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Grade';
                    ToolTip = 'Specifies the value of the New Grade field.';
                }
                field("Current workstation"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current workstation';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Region Code field.';
                }
                field("Current Workstation Name"; Rec."Current Region Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Current Region Name field.';
                }

                field("New Workstation"; Rec."New Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Workstation';
                    ToolTip = 'Specifies the value of the New County Code field.';
                }
                field("New Workstation Name"; Rec."New Region Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Workstation Name';
                    Visible = true;
                    Editable = false;
                    ToolTip = 'Specifies the value of the New County Name field.';
                }
                field("Date Of Transfer"; "Date Of Transfer")
                {
                    ApplicationArea = all;
                    Caption = 'Transfer Date';
                }
                field("From payroll Period"; Rec."From payroll Period")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the From payroll Period field.';
                }
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Period Month field.';
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Period Year field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
                field("Hardship Area"; "Hardship Area")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
        }
    }

    actions { }

    trigger OnDeleteRecord(): Boolean
    begin
        if EmpHdr.Get(Rec."Request No") then
            if EmpHdr.Status <> EmpHdr.Status::New then
                Error('You are not allowed to delete at this level');
    end;

    trigger OnModifyRecord(): Boolean
    begin

        if EmpHdr.Get(Rec."Request No") then
            if EmpHdr.Status <> EmpHdr.Status::New then
                Error('You are not allowed to modif at this level');
    end;

    var
        EmpHdr: Record "HR Employee Transfer Header";
}
