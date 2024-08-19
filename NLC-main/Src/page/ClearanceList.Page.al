#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194184 "Clearance List"
{
    ApplicationArea = Basic;
    CardPageId = "Clearance Certificate Card";
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "Clearance Certificate";
    UsageCategory = Lists;
    Caption = 'Clearance List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Clearance No."; Rec."Clearance No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Clearance No. field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Separation No"; "Separation No")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }

                field("USER ID"; Rec."USER ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the USER ID field.';
                }
            }
        }
    }

    actions { }
}
