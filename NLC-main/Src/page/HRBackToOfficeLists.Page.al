#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193599 "HR Back To Office Lists"
{
    CardPageId = "Hr Back To Office Forms";
    Editable = false;
    PageType = List;
    SourceTable = "HRBack To Office Forms";
    ApplicationArea = All;
    Caption = 'HR Back To Office Lists';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Title field.';
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
                field("Duration Units"; Rec."Duration Units")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration Units field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("Cost Of Training"; Rec."Cost Of Training")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cost Of Training field.';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Training Evaluation Results"; Rec."Training Evaluation Results")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Evaluation Results field.';
                }
                field(Provider; Rec.Provider)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Provider field.';
                }
                field("Purpose of Training"; Rec."Purpose of Training")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose of Training field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Provider Name"; Rec."Provider Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Provider Name field.';
                }
                field("Training category"; Rec."Training category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training category field.';
                }
                field("Table ID"; Rec."Table ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Table ID field.';
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor field.';
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Name field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Station; Rec.Station)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Station field.';
                }
                field("Period Filter"; Rec."Period Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period Filter field.';
                }
                field("Training Status"; Rec."Training Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Status field.';
                }
                field("Text 1"; Rec."Text 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Text 1 field.';
                }
                field("Text 2"; Rec."Text 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Text 2 field.';
                }
                field("Text 3"; Rec."Text 3")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Text 3 field.';
                }
                field("Text 4"; Rec."Text 4")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Text 4 field.';
                }
                field("Text 5"; Rec."Text 5")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Text 5 field.';
                }
                field("Text 6"; Rec."Text 6")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Text 6 field.';
                }
                field("Text 9"; Rec."Text 9")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Text 9 field.';
                }
                field("Text 10"; Rec."Text 10")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Text 10 field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Station Name"; Rec."Station Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Station Name field.';
                }
                field("Directorate Name"; Rec."Directorate Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate Name field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Training Application No"; Rec."Training Application No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Application No field.';
                }
            }
        }
    }

    actions { }
}
