#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194206 "HR Employee List - Changes"
{
    ApplicationArea = Basic;
    CardPageId = "HR Employee Card - Changes";
    Editable = true;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Employee';
    SourceTable = "HR Employees - Changes";
    UsageCategory = Lists;
    Caption = 'HR Employee List - Changes';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = all;
                    // AssistEdit = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Code field.';
                    // trigger OnAssistEdit()
                    // begin
                    //     if Rec.AssistEdit() then
                    //         CurrPage.Update();
                    // end;
                }
                field("Employee No."; "Employee No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Caption = 'Employee No.';
                }
                field(EmployeeFullName; EmployeeFullName)
                {
                    ApplicationArea = all;
                    Caption = 'Employee Name';
                    Editable = false;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755003; Outlook) { }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Update Salary Increments")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Executes the Update Salary Increments action.';

            }
        }
    }

    var
        HREmp: Record "HR Employees";
        EmployeeFullName: Text;
        Dates: Codeunit "HR Dates";
        PRSalCard: Record "PR Salary Card";
}
