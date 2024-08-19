#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193462 "HR Employee List (ALL)-New"
{
    ApplicationArea = Basic;
    Caption = 'HR Employee List (ALL-NEW)';
    CardPageId = "HR Employee Card";
    Editable = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Employee';
    SourceTable = "HR Employees";
    SourceTableView = where(Status = filter(New));
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Date Of Joining the Company"; Rec."Date Of Joining the Company")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Joining the Company field.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Incremental Month"; Rec."Incremental Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incremental Month field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay field.';
                }
                field("New Basic Pay"; Rec."New Basic Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Basic Pay field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Style = Attention;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';

                }
                field(DAge; Rec.DAge)
                {
                    ApplicationArea = Basic;
                    Caption = 'Age';
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field("Retirement date"; Rec."Retirement date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Retirement date field.';
                }
                field(DPension; Rec.DPension)
                {
                    ApplicationArea = Basic;
                    Caption = 'Days to Retire';
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Days to Retire field.';
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
                ToolTip = 'Executes the Update Salary Increments action.';
                trigger OnAction()
                begin
                    //ERROR('Disabled');

                    if Confirm('Update Basic Pay with Values from New Basic Pay, This process cannot be Reversed?') = false then
                        Error('Process Aboreted');

                    HREmp.Reset();
                    HREmp.SetFilter(HREmp."New Basic Pay", '<>%1', 0);
                    if HREmp.Find('-') then begin
                        repeat
                            PRSalCard.Reset();
                            PRSalCard.SetRange(PRSalCard."Employee Code", HREmp."No.");
                            if PRSalCard.Find('-') then begin
                                PRSalCard."Basic Pay" := HREmp."New Basic Pay";
                                PRSalCard.Modify();
                            end;
                            HREmp."New Basic Pay" := 0;
                            HREmp.Modify();
                        until HREmp.Next() = 0;
                        Message('%1 Records Updated', HREmp.Count);
                    end;
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Status := Rec.Status::New;
        //  MODIFY;
    end;

    var
        HREmp: Record "HR Employees";
        EmployeeFullName: Text;
        Dates: Codeunit "HR Dates";
        PRSalCard: Record "PR Salary Card";
}
