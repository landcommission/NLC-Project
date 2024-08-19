#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193514 "HR OSIncident List"
{
    ApplicationArea = Basic;
    CardPageId = "HR OSIncident Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "HR OSIncident";
    UsageCategory = Lists;
    Caption = 'HR OSIncident List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Incident No"; Rec."Incident No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident No field.';
                }
                field("Incident Description"; Rec."Incident Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incident Description field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Birth field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Home Phone No."; Rec."Home Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Home Phone No. field.';
                }
                field(Section; Rec.Section)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section field.';
                }
                field("Type of Incident"; Rec."Type of Incident")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Incident field.';
                }
                field("Location Name"; Rec."Location Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Name field.';
                }
                field("Part of Body Affected"; Rec."Part of Body Affected")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Part of Body Affected field.';
                }
                field("Date of Incident"; Rec."Date of Incident")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Incident field.';
                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time field.';
                }
                field("Date Notification Received"; Rec."Date Notification Received")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Notification Received field.';
                }
                field("First Witness Name"; Rec."First Witness Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Witness Name field.';
                }
                field("First Witness Address"; Rec."First Witness Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Witness Address field.';
                }
                field("Second Witness Name"; Rec."Second Witness Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Witness Name field.';
                }
                field("Second Witness Address"; Rec."Second Witness Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Witness Address field.';
                }
                field("First Aid Given"; Rec."First Aid Given")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Aid Given field.';
                }
                field("Taken Home"; Rec."Taken Home")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taken Home field.';
                }
                field("Return to Work on same day"; Rec."Return to Work on same day")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return to Work on same day field.';
                }
                field("Went Absent"; Rec."Went Absent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Went Absent field.';
                }
                field("Taken to Hospital"; Rec."Taken to Hospital")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taken to Hospital field.';
                }
                field(Admitted; Rec.Admitted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Admitted field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions { }
}
