page 50139 "HR Disciplinary Cases Listpart"
{
    Caption = 'HR Disciplinary Cases Listpart';
    PageType = ListPart;
    SourceTable = "HR Disciplinary Cases";
    Editable = false;
    ApplicationArea = All;


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Disciplinary Case Type"; Rec."Disciplinary Case Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Disciplinary Case Type field.';
                }
                field(Accuser; Rec.Accuser)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Originator field.';
                }
                field("Accuser Is Staff"; Rec."Accuser Is Staff")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Originator Is Staff field.';
                }
                field(Brief; Rec.Brief)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Brief field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Type of Disciplinary Case"; Rec."Type of Disciplinary Case")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type of Disciplinary Case field.';
                }
                field("Mode of Lodging the Complaint"; Rec."Mode of Lodging the Complaint")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mode of Lodging the Case field.';
                }
                field("Legal Case No."; Rec."Legal Case No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Legal Case No. field.';
                }
                field("Legal Case Recommendation"; Rec."Legal Case Recommendation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Legal Case Recommendation field.';
                }
                field("Handled By"; Rec."Handled By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Handled By field.';
                }
                field("Case Description"; Rec."Case Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Case Description field.';
                }
                field("Case Discussion"; Rec."Case Discussion")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Case Discussion field.';
                }
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Case Number field.';
                }
                field("Case Severity"; Rec."Case Severity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Offence Type field.';
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Disciplinary Action Taken field.';
                }
                field("Appealed case No"; Rec."Appealed case No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Appealed case No field.';
                }
                field("Body Handling The Complaint"; Rec."Body Handling The Complaint")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Body Handling The Case field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Date To Discuss Case"; Rec."Date To Discuss Case")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date To Discuss Case field.';
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Complaint field.';
                }
                field("Disciplinary Commitee"; Rec."Disciplinary Commitee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Commitee Membership field.';
                }
                field("Disciplinary Remarks"; Rec."Disciplinary Remarks")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Professional Opinion field.';
                }
                field("Disciplinary status"; Rec."Disciplinary status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Disciplinary status field.';
                }
                field("HR/Payroll Implications"; Rec."HR/Payroll Implications")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HR/Payroll Implications field.';
                }
                field(Recomendations; Rec.Recomendations)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Recomendations field.';
                }
                field("Recommended Action"; Rec."Recommended Action")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Recommended Action field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Witness #1"; Rec."Witness #1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Witness #1 field.';
                }
                field("Witness #2"; Rec."Witness #2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Witness #2 field.';
                }
                field("Witness#1 Staff"; Rec."Witness#1 Staff")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Witness#1 Staff field.';
                }
                field("Witness#2 Staff"; Rec."Witness#2 Staff")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Witness#2 Staff field.';
                }
            }
        }
    }
}
