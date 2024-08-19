#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193579 "Payroll Change Lists New"
{
    ApplicationArea = Basic;
    CardPageId = "Payroll Change Cards New";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Payroll Changes";
    SourceTableView = where(Type = const("New Staff"));
    UsageCategory = Lists;
    Caption = 'Payroll Change Lists New';
    PromotedActionCategories = 'New,Report,process,Workflow Process';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Payroll Change No"; Rec."Payroll Change No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Change No field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Date Requested"; Rec."Date Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Requested field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Payroll Updated"; Rec."Payroll Updated")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Updated field.';
                }
                field(Narrations; Rec.Narrations)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Narrations field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    begin

        Rec.Narration := 'This is for modifying the already Existing Employee Earnings and Deductions in the System';
        Rec.Narrations := 'This is for Inserting New Employee Earnings and Deductions in the System';

        Rec.FilterGroup(2);
        Rec.SetRange(Rec."User ID", UserId);
        Rec.FilterGroup(0);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec.Type := Rec.Type::"New Staff"
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        Rec.Type := Rec.Type::"New Staff"
    end;

    trigger OnOpenPage()
    begin

        Rec.FilterGroup(2);
        Rec.SetRange(Rec."User ID", UserId);
        Rec.FilterGroup(0);
    end;
}
