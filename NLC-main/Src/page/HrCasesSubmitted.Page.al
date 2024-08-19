page 50035 "Hr Cases Submitted "
{
    ApplicationArea = All;
    Caption = 'Hr Cases Submitted ';
    PageType = Card;
    SourceTable = "HR Disciplinary Cases";
    Editable = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ToolTip = 'Specifies the value of the Case Number field.';
                }

                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }


                field(Accuser; Rec.Accuser)
                {
                    ToolTip = 'Specifies the value of the Originator field.';
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ToolTip = 'Specifies the value of the Disciplinary Action Taken field.';
                }
                field("Appealed case No"; Rec."Appealed case No")
                {
                    ToolTip = 'Specifies the value of the Appealed case No field.';
                }
                field("Case Created"; Rec."Case Created")
                {
                    ToolTip = 'Specifies the value of the Case Created field.';
                }
                field("Case Description"; Rec."Case Description")
                {
                    ToolTip = 'Specifies the value of the Case Description field.';
                }
                field("Case Number"; Rec."Case Number")
                {
                    ToolTip = 'Specifies the value of the Case Number field.';
                }
                field("Case Severity"; Rec."Case Severity")
                {
                    ToolTip = 'Specifies the value of the Offence Type field.';
                }
                field("Closed By"; Rec."Closed By")
                {
                    ToolTip = 'Specifies the value of the Closed By field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date Submitted"; Rec."Date Submitted")
                {
                    ToolTip = 'Specifies the value of the Date Submitted field.';
                }
                field("Date To Discuss Case"; Rec."Date To Discuss Case")
                {
                    ToolTip = 'Specifies the value of the Date To Discuss Case field.';
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ToolTip = 'Specifies the value of the Date of Complaint field.';
                }
                field(Designation; Rec.Designation)
                {
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Disciplinary Case Type"; Rec."Disciplinary Case Type")
                {
                    ToolTip = 'Specifies the value of the Disciplinary Case Type field.';
                }
                field("Disciplinary Commitee"; Rec."Disciplinary Commitee")
                {
                    ToolTip = 'Specifies the value of the Commitee Membership field.';
                }
                field("Disciplinary Officer In Charge"; Rec."Disciplinary Officer In Charge")
                {
                    ToolTip = 'Specifies the value of the Disciplinary Officer In Charge field.';
                }
                field("Disciplinary Officer Name"; Rec."Disciplinary Officer Name")
                {
                    ToolTip = 'Specifies the value of the Disciplinary Officer In Charge Name field.';
                }
                field("Disciplinary Remarks"; Rec."Disciplinary Remarks")
                {
                    ToolTip = 'Specifies the value of the Professional Opinion field.';
                }
                field("Disciplinary Stage Status"; Rec."Disciplinary Stage Status")
                {
                    ToolTip = 'Specifies the value of the Disciplinary Stage Status field.';
                }
                field("Disciplinary status"; Rec."Disciplinary status")
                {
                    ToolTip = 'Specifies the value of the Disciplinary status field.';
                }

                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
                    Caption = 'Date Closed';
                }

                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Submitted By"; Rec."Submitted By")
                {
                    ToolTip = 'Specifies the value of the Submitted By field.';
                }
                field("Supervisor Remarks"; Rec."Supervisor Remarks")
                {
                    ToolTip = 'Specifies the value of the Supervisor Remarks field.';
                }
            }
        }
    }
}
