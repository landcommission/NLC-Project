#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194044 "Exit Questinnaire Card"
{
    PageType = Card;
    SourceTable = "Exit Interview Questionnaire";
    ApplicationArea = All;
    Caption = 'Exit Questinnaire Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Interview No."; Rec."Interview No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview No. field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Seperation No"; Rec."Seperation No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Seperation No field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Responsibility Centre"; Rec."Responsibility Centre")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Centre field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field("Date of Employement"; Rec."Date of Employement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Employement field.';
                }
                field("Start Date in Position"; Rec."Start Date in Position")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Start Date in Position field.';
                }
                field("Separation Date"; Rec."Separation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Separation Date field.';
                }
                field("Total Length of Service"; Rec."Total Length of Service")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Length of Service field.';
                }
                field("Other Positions Held in the Co"; Rec."Other Positions Held in the Co")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Other Positions Held in the Co field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group("Section A Exit Interview")
            {
                Caption = '1. What are your reasons for leaving the Commission?(Tick all items that apply)';
                field(Dissatisfaction; Rec.Dissatisfaction)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dissatisfaction with Job';
                    ToolTip = 'Specifies the value of the Dissatisfaction with Job field.';
                }
                field(Relocation; Rec.Relocation)
                {
                    ApplicationArea = Basic;
                    Caption = 'Relocation';
                    ToolTip = 'Specifies the value of the Relocation field.';
                }
                field("Text 15"; Rec."Text 15")
                {
                    ApplicationArea = Basic;
                    Caption = 'Retirement';
                    ToolTip = 'Specifies the value of the Retirement field.';
                }
                field("Text 5"; Rec."Text 5")
                {
                    ApplicationArea = Basic;
                    Caption = 'Home Duties/family Obligation';
                    ToolTip = 'Specifies the value of the Home Duties/family Obligation field.';
                }
                field("Text 6"; Rec."Text 6")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job closer to home';
                    ToolTip = 'Specifies the value of the Job closer to home field.';
                }
                field("Text 7"; Rec."Text 7")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-structuring';
                    ToolTip = 'Specifies the value of the Re-structuring field.';
                }
                field("Text 16"; Rec."Text 16")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disability';
                    ToolTip = 'Specifies the value of the Disability field.';
                }
                field("Text 8"; Rec."Text 8")
                {
                    ApplicationArea = Basic;
                    Caption = 'Career Growth/Change';
                    ToolTip = 'Specifies the value of the Career Growth/Change field.';
                }
                field("Text 9"; Rec."Text 9")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transportation difficulties';
                    ToolTip = 'Specifies the value of the Transportation difficulties field.';
                }
                field("Text 10"; Rec."Text 10")
                {
                    ApplicationArea = Basic;
                    Caption = 'Attend School';
                    ToolTip = 'Specifies the value of the Attend School field.';
                }
                field("Text 11"; Rec."Text 11")
                {
                    ApplicationArea = Basic;
                    Caption = 'Better opportunity';
                    ToolTip = 'Specifies the value of the Better opportunity field.';
                }
                field("Text 12"; Rec."Text 12")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ill Health';
                    ToolTip = 'Specifies the value of the Ill Health field.';
                }
                field("Text 13"; Rec."Text 13")
                {
                    ApplicationArea = Basic;
                    Caption = 'Own accord/Personal';
                    ToolTip = 'Specifies the value of the Own accord/Personal field.';
                }
                field("Text 14"; Rec."Text 14")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disciplinary related separation';
                    ToolTip = 'Specifies the value of the Disciplinary related separation field.';
                }
            }
            group(Control30)
            {
                Caption = '2. Please Answer the following questions by indication the extent to which you agree/disagree by choosin one of the following Statements';
                field("Text 17"; Rec."Text 17")
                {
                    ApplicationArea = Basic;
                    Caption = 'I enjoyed my work activities';
                    ToolTip = 'Specifies the value of the I enjoyed my work activities field.';
                }
                field("Text 18"; Rec."Text 18")
                {
                    ApplicationArea = Basic;
                    Caption = 'I was challenged by my job';
                    ToolTip = 'Specifies the value of the I was challenged by my job field.';
                }
                field("Text 19"; Rec."Text 19")
                {
                    ApplicationArea = Basic;
                    Caption = 'I was paid for my work';
                    ToolTip = 'Specifies the value of the I was paid for my work field.';
                }
                field("Text 20"; Rec."Text 20")
                {
                    ApplicationArea = Basic;
                    Caption = 'My supervisor demonstrated fair and equitable treatment';
                    ToolTip = 'Specifies the value of the My supervisor demonstrated fair and equitable treatment field.';
                }
                field("Text 21"; Rec."Text 21")
                {
                    ApplicationArea = Basic;
                    Caption = 'My supervisor gave clear instructions for wor assignments and responsibilities';
                    ToolTip = 'Specifies the value of the My supervisor gave clear instructions for wor assignments and responsibilities field.';
                }
                field("Text 22"; Rec."Text 22")
                {
                    ApplicationArea = Basic;
                    Caption = 'I was recognized for my good work';
                    ToolTip = 'Specifies the value of the I was recognized for my good work field.';
                }
                field("Text 23"; Rec."Text 23")
                {
                    ApplicationArea = Basic;
                    Caption = 'My job description accurately reflected my job responsibilities';
                    ToolTip = 'Specifies the value of the My job description accurately reflected my job responsibilities field.';
                }
                field("Text 24"; Rec."Text 24")
                {
                    ApplicationArea = Basic;
                    Caption = 'I was given honest Performance Appraisals';
                    ToolTip = 'Specifies the value of the I was given honest Performance Appraisals field.';
                }
                field("Text 25"; Rec."Text 25")
                {
                    ApplicationArea = Basic;
                    Caption = 'I felt there were opportunities for career advancement.';
                    ToolTip = 'Specifies the value of the I felt there were opportunities for career advancement. field.';
                }
                field("Text 26"; Rec."Text 26")
                {
                    ApplicationArea = Basic;
                    Caption = 'I can recommend the Organization as a good place to work.';
                    ToolTip = 'Specifies the value of the I can recommend the Organization as a good place to work. field.';
                }
                field("Text 27"; Rec."Text 27")
                {
                    ApplicationArea = Basic;
                    Caption = 'Workload was manageable.';
                    ToolTip = 'Specifies the value of the Workload was manageable. field.';
                }
                field("Text 28"; Rec."Text 28")
                {
                    ApplicationArea = Basic;
                    Caption = 'There was availability of working resources';
                    ToolTip = 'Specifies the value of the There was availability of working resources field.';
                }
                field("Text 29"; Rec."Text 29")
                {
                    ApplicationArea = Basic;
                    Caption = 'My colleagues listened and appreciated my suggestions.';
                    ToolTip = 'Specifies the value of the My colleagues listened and appreciated my suggestions. field.';
                }
                field("Text 30"; Rec."Text 30")
                {
                    ApplicationArea = Basic;
                    Caption = 'My skills were properly utilized.';
                    ToolTip = 'Specifies the value of the My skills were properly utilized. field.';
                }
                field("Text 31"; Rec."Text 31")
                {
                    ApplicationArea = Basic;
                    Caption = 'I had access to adequate training and development programs.';
                    ToolTip = 'Specifies the value of the I had access to adequate training and development programs. field.';
                }
            }
            field("Text 1"; Rec."Text 1")
            {
                ApplicationArea = Basic;
                Caption = '3. What did you find most satisfying about your job?';
                MultiLine = true;
                ToolTip = 'Specifies the value of the 3. What did you find most satisfying about your job? field.';
            }
            field("Text 2"; Rec."Text 2")
            {
                ApplicationArea = Basic;
                Caption = '4. What did you find most challenging about your job?';
                MultiLine = true;
                ToolTip = 'Specifies the value of the 4. What did you find most challenging about your job? field.';
            }
        }
    }

    actions { }
}
