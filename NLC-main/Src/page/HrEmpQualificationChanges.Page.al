page 50036 "Hr Emp Qualification Changes"
{
    ApplicationArea = All;
    Caption = 'Academic Qualification Changes';
    PageType = List;
    SourceTable = "HR Emp Qualification Changes";
    UsageCategory = Lists;
    CardPageId = "HR Qualifications Update";
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                    Visible = false;
                }
                field("Qualfi Code"; "Qualfi Code")
                {
                    ApplicationArea = all;
                    Editable = false;
                    ToolTip = 'specifies the qualifications Code';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                    ToolTip = 'Specifies the  Employee name';
                }
                field("Employee Status"; Rec."Employee Status")
                {
                    ToolTip = 'Specifies the value of the Employee Status field.';
                }
                field("From Date"; Rec."From Date")
                {
                    ToolTip = 'Specifies the value of the From Date field.';
                }
                field("To Date"; Rec."To Date")
                {
                    ToolTip = 'Specifies the value of the To Date field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                    ToolTip = 'Specifies the value of the Qualification Description field.';
                }
                field("Qualification Type"; Rec."Qualification Type")
                {
                    ToolTip = 'Specifies the value of the Qualification Type field.';
                }
                field("Institution/Company"; Rec."Institution/Company")
                {
                    ToolTip = 'Specifies the value of the Institution/Company field.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Status; Status)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the Document Status';
                }
                field(Posted; Posted)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies if the document is posted';
                }
            }
        }
    }
}
