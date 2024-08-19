#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193506 "HR Lookup Values List"
{
    ApplicationArea = Basic;
    CardPageId = "HR Lookup Values Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Lookup Values";
    UsageCategory = Administration;
    Caption = 'HR Lookup Values List';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                Editable = true;
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Previous Job Position"; Rec."Previous Job Position")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous Job Position field.';
                }
                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Type field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Level field.';
                }
                field("Previous Appraisal Period"; Rec."Previous Appraisal Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous Appraisal Period field.';
                }
                field("Current Appraisal Period"; Rec."Current Appraisal Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Appraisal Period field.';
                }
            }
        }
    }

    actions { }
}
