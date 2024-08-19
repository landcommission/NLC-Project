#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194104 "HR Employee Transfer Line"
{
    PageType = ListPart;
    SourceTable = "HR Employee Transfer Lines";
    SourceTableView = where("Employee No" = const('<>'''''));
    ApplicationArea = All;
    Caption = 'HR Employee Transfer Line';
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
                    Editable = false;
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
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Region Code';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Region Code field.';
                }
                field("Current Region Name"; Rec."Current Region Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Current Region Name field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Directorate Code';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Current Directorate Code field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Responsibility Center';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Responsibility Center field.';
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

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if EmpHdr.Get(Rec."Request No") then
            if EmpHdr.Status <> EmpHdr.Status::New then
                Error('You are not allowed to insert at this level');
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
