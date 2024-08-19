#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193610 "HR Staff Transport  List"
{
    CardPageId = "HR Staff Transport Card";
    PageType = List;
    SourceTable = "HR Transport Requisition";
    ApplicationArea = All;
    Caption = 'HR Staff Transport  List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Transport Request No"; Rec."Transport Request No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transport Request No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Supervisor Email"; Rec."Supervisor Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Email field.';
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Tittle field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose of Trip field.';
                }
                field("Transport type"; Rec."Transport type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transport type field.';
                }
                field("Time of Trip"; Rec."Time of Trip")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time of Trip field.';
                }
                field("Time of Return"; Rec."Time of Return")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time of Return field.';
                }
                field("Trip From Destination"; Rec."Trip From Destination")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trip From Destination field.';
                }
                field("Trip To Destination"; Rec."Trip To Destination")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trip To Destination field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return Date field.';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days Applied field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
                field("Number of Employees"; Rec."Number of Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number of Employees field.';
                }
                field("Trip Return Destination"; Rec."Trip Return Destination")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trip Return Destination field.';
                }
            }
        }
    }

    actions { }
}
