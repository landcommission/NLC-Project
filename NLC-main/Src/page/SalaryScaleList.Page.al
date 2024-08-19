#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69022 "Salary Scale List"
{
    PageType = List;
    SourceTable = "Salary Scales";
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Salary Scale List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Scale; Rec.Scale)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scale field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Minimum Pointer"; Rec."Minimum Pointer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Pointer field.';
                }
                field("Maximum Pointer"; Rec."Maximum Pointer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Pointer field.';
                }
                field("Responsibility Allowance"; Rec."Responsibility Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Allowance field.';
                }
                field("Commuter Allowance"; Rec."Commuter Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commuter Allowance field.';
                }
                field("In Patient Limit"; Rec."In Patient Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the In Patient Limit field.';
                }
                field("Out Patient Limit"; Rec."Out Patient Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Out Patient Limit field.';
                }
                field("Maximum Cover"; Rec."Maximum Cover")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Cover field.';
                }
                field("Maximum Car Loan"; Rec."Maximum Car Loan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Car Loan field.';
                }
                field("Maximum Mortage Loan"; Rec."Maximum Mortage Loan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Mortage Loan field.';
                }

            }
        }
        area(FactBoxes)
        {
            systempart(Control1000000010; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000011; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000012; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000013; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

