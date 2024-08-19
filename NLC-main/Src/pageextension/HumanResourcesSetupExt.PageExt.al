#pragma implicitwith disable
pageextension 50003 "Human Resources Setup Ext" extends "Human Resources Setup"
{
    layout
    {
        addafter(Numbering)
        {
            field("CandidateNo"; Rec."Candidate No.")
            {
                ApplicationArea = Basic;
            }
            field("HREmailAddress"; Rec."HR E-mail Address")
            {

            }
            field("Disciplinary Cases Nos."; Rec."Disciplinary Cases Nos.")
            {
                ApplicationArea = Basic;
            }

            field("Recruitment Requsition Nos."; Rec."Recruitment Requsition Nos.")
            {
                ApplicationArea = Basic;
            }

            field("Disciplinary Committee Nos"; Rec."Disciplinary Committee Nos")

            {
                ApplicationArea = Basic;
            }
            field("Discipline Grievance Nos."; Rec."Discipline Grievance Nos.")
            {
                ApplicationArea = All;

            }

            field("Discipline Surcharge Nos."; Rec."Discipline Surcharge Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Legal Case Nos"; Rec."Legal Case Nos")
            {
                ApplicationArea = all;
            }


            field("Employee Transfer Nos"; Rec."Employee Transfer Nos")
            {
                ApplicationArea = Basic;
            }
            field("Leave Planner Nos."; Rec."Leave Planner Nos.")
            {
                ApplicationArea = Basic;
            }

        }
    }
}

#pragma implicitwith restore
