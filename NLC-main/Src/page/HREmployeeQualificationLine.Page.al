#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193453 "HR Employee Qualification Line"
{
    Caption = 'Employee Qualification Lines';
    PageType = List;
    SourceTable = "HR Employee Qualifications";
    ApplicationArea = All;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Type field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Description field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Course of Study"; Rec."Course of Study")
                {
                    ApplicationArea = Basic;
                    Caption = 'Specialization';
                    ToolTip = 'Specifies the value of the Specialization field.';
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From Date field.';
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Date field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Institution/Company"; Rec."Institution/Company")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution/Company field.';
                }
                field("Course Grade"; Rec."Course Grade")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Grade field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Score field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("Q&ualification")
            {
                Caption = 'Q&ualification';
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    RunObject = page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = const("Employee Qualification"),
                                  "No." = field("Employee No."),
                                  "Table Line No." = field("Line No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
                separator(Action1102755021) { }
                action("Q&ualification Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q&ualification Overview';
                    RunObject = page "Qualification Overview";
                    ToolTip = 'Executes the Q&ualification Overview action.';
                }
            }
        }
    }
}
