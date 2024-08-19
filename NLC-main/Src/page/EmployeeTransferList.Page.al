#pragma implicitwith disable
page 50093 "Employee Transfer List"
{
    Caption = 'Self initiated Employee Transfer List';
    PageType = List;
    CardPageId = "Employee Transfer";
    SourceTable = "Employee Transfers";
    UsageCategory = None;
    SourceTableView = where(Type = const("Self initiated"), "Document Type" = filter(Application));
    //Status = filter(Open | "Pending Approval"));
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Transfer Date field.';
                }
                field("Transfer Date"; Rec."Transfer Date")
                {
                    ApplicationArea = all;
                    Editable = false;
                    ToolTip = 'Specifies the value effcteive transfer date';

                }
                field("Original Station"; Rec."Original Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Original Station field.';
                }
                field("Original Station Name"; Rec."Original Station Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Original Station Name field.';
                }
                field("New Station"; Rec."New Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Station field.';
                }
                field("New Sattion Name"; Rec."New Sattion Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Sattion Name field.';
                }
                field("To Hardship Area?"; Rec."To Hardship Area?")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the To Hardship Area? field.';
                }

                field("Transfered By"; Rec."Transfered By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfered By field.';
                    Visible = false;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }

            }
        }
    }
}

#pragma implicitwith restore
