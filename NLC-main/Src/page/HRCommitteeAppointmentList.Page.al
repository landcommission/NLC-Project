#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
page 70021 "HR Committee Appointment List"
{
    UsageCategory = Lists;
    CardPageId = "HR Committee Appointment";
    Editable = false;
    PageType = List;
    SourceTable = "Commitee Appointment Voucher";
    SourceTableView = where("Document Type" = filter(Appointment));
    ApplicationArea = All;
    Caption = 'HR Committee Appointment List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Committee Type ID"; Rec."Committee Type ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Type ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Original Appointment No."; Rec."Original Appointment No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Appointment No. field.';
                }
                field("Appointment Effective Date"; Rec."Appointment Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment Effective Date field.';
                }
                field("Tenure End Date"; Rec."Tenure End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tenure End Date field.';
                }
                field("Appointing Authority"; Rec."Appointing Authority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointing Authority field.';
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                field("Staff ID"; Rec."Staff ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff ID field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Branch/Centre"; Rec."Branch/Centre")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch/Centre field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control26; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control27; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control28; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control29; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    actions { }
}

