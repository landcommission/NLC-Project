#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193442 "HR Job Applications Card"
{
    Editable = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Other Details,Job Details';
    SourceTable = "HR Job Applications";
    ApplicationArea = All;
    Caption = 'HR Job Applications Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Job Application No."; Rec."Job Application No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job Application No. field.';
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Date Applied field.';
                }
                field("Applicant Type"; Rec."Applicant Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Applicant Type field.';
                }
                group(Control39)
                {
                    grid(Control38)
                    {
                        GridLayout = Rows;
                        group(Control21)
                        {
                            field("Employee Requisition No"; Rec."Employee Requisition No")
                            {
                                ApplicationArea = Basic;
                                Caption = 'Application Reff No.';
                                Importance = Promoted;
                                ToolTip = 'Specifies the value of the Application Reff No. field.';
                            }
                            field("Job Applied For"; Rec."Job Applied For")
                            {
                                ApplicationArea = Basic;
                                Caption = 'Position Applied For';
                                Editable = false;
                                Enabled = true;
                                Importance = Promoted;
                                ToolTip = 'Specifies the value of the Position Applied For field.';
                            }
                            field("Job Applied for Description"; Rec."Job Applied for Description")
                            {
                                ApplicationArea = Basic;
                                Editable = false;
                                ShowCaption = false;
                            }
                        }
                    }
                }
                group(Control18)
                {
                    grid(Control15)
                    {
                        GridLayout = Rows;
                        group(Control16)
                        {
                            field("First Name"; Rec."First Name")
                            {
                                ApplicationArea = Basic;
                                Importance = Promoted;
                                StyleExpr = true;
                                ToolTip = 'Specifies the value of the First Name field.';
                            }
                            field("Middle Name"; Rec."Middle Name")
                            {
                                ApplicationArea = Basic;
                                Importance = Promoted;
                                StyleExpr = true;
                                ToolTip = 'Specifies the value of the Middle Name field.';
                            }
                            field("Last Name"; Rec."Last Name")
                            {
                                ApplicationArea = Basic;
                                Importance = Promoted;
                                StyleExpr = true;
                                ToolTip = 'Specifies the value of the Last Name field.';
                            }
                            field(Initials; Rec.Initials)
                            {
                                ApplicationArea = Basic;
                                StyleExpr = true;
                                ToolTip = 'Specifies the value of the Initials field.';
                            }
                        }
                    }
                }
                group(Control20)
                {
                    grid(Control19)
                    {
                        GridLayout = Rows;
                        group(Control17)
                        {
                            field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                            {
                                ApplicationArea = Basic;
                                Caption = '1st Language (R/W/S)';
                                Importance = Promoted;
                                StyleExpr = true;
                                ToolTip = 'Specifies the value of the 1st Language (R/W/S) field.';
                            }
                            field("First Language Read"; Rec."First Language Read")
                            {
                                ApplicationArea = Basic;
                                Caption = 'R';
                                ToolTip = 'Specifies the value of the R field.';
                            }
                            field("First Language Write"; Rec."First Language Write")
                            {
                                ApplicationArea = Basic;
                                Caption = 'W';
                                ToolTip = 'Specifies the value of the W field.';
                            }
                            field("First Language Speak"; Rec."First Language Speak")
                            {
                                ApplicationArea = Basic;
                                Caption = 'S';
                                ToolTip = 'Specifies the value of the S field.';
                            }
                            field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                            {
                                ApplicationArea = Basic;
                                Caption = '2nd Language (R/W/S)';
                                Importance = Promoted;
                                ToolTip = 'Specifies the value of the 2nd Language (R/W/S) field.';
                            }
                            field("Second Language Read"; Rec."Second Language Read")
                            {
                                ApplicationArea = Basic;
                                Caption = 'R';
                                ToolTip = 'Specifies the value of the R field.';
                            }
                            field("Second Language Write"; Rec."Second Language Write")
                            {
                                ApplicationArea = Basic;
                                Caption = 'W';
                                ToolTip = 'Specifies the value of the W field.';
                            }
                            field("Second Language Speak"; Rec."Second Language Speak")
                            {
                                ApplicationArea = Basic;
                                Caption = 'S';
                                ToolTip = 'Specifies the value of the S field.';
                            }
                            field("Additional Language"; Rec."Additional Language")
                            {
                                ApplicationArea = Basic;
                                ToolTip = 'Specifies the value of the Additional Language field.';
                            }
                            field("ID Number"; Rec."ID Number")
                            {
                                ApplicationArea = Basic;
                                ToolTip = 'Specifies the value of the ID Number field.';
                            }
                        }
                    }
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Home Phone Number field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Postal Address field.';
                }
                field("Residential Address"; Rec."Residential Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Residential Address field.';
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Cell Phone Number field.';
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Phone Number field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Marital Status field.';
                }
                field("Ethnic Origin"; Rec."Ethnic Origin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ethnic Origin field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabled field.';
                }
                group(Control37)
                {
                    grid(Control36)
                    {
                        GridLayout = Rows;
                        group(Control35)
                        {
                            field("Date Of Birth"; Rec."Date Of Birth")
                            {
                                ApplicationArea = Basic;
                                ToolTip = 'Specifies the value of the Date Of Birth field.';
                                trigger OnValidate()
                                begin

                                    if Rec."Date Of Birth" >= Today then
                                        Error('Invalid Entry');
                                    DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);
                                    Rec.Age := DAge;
                                end;
                            }
                            field(Age; Rec.Age)
                            {
                                ApplicationArea = Basic;
                                Editable = false;
                                Importance = Promoted;
                                ToolTip = 'Specifies the value of the Age field.';
                            }
                        }
                    }
                }
                group(Control5)
                {
                    grid(Control2)
                    {
                        GridLayout = Rows;
                        group(Control1)
                        {
                            field(Citizenship; Rec.Citizenship)
                            {
                                ApplicationArea = Basic;
                                ToolTip = 'Specifies the value of the Citizenship field.';
                            }
                            field("Country Details"; Rec."Citizenship Details")
                            {
                                ApplicationArea = Basic;
                                Editable = false;
                                ShowCaption = false;
                            }
                        }
                    }
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755008; Outlook) { }
            systempart(Control3; Links) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("Other Details")
            {
                Caption = 'Other Details';
                action(Qualifications)
                {
                    ApplicationArea = Basic;
                    Caption = 'Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = page "Applicant Job Requirements";
                    RunPageLink = "Application No." = field("Employee Requisition No");
                    ToolTip = 'Executes the Qualifications action.';
                }
                action(Referees)
                {
                    ApplicationArea = Basic;
                    Caption = 'Referees';
                    Image = ContactReference;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = page "HR Applicant Referees";
                    RunPageLink = "Application No." = field("Employee Requisition No");
                    
                    ToolTip = 'Executes the Referees action.';
                }
                action(Hobbies)
                {
                    ApplicationArea = Basic;
                    Caption = 'Hobbies';
                    Image = Holiday;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = page "HR Applicant Hobbies";
                    RunPageLink = "Job Application No" = field("Job Application No.");
                    ToolTip = 'Executes the Hobbies action.';
                }
            }
            group("Job Details")
            {
                Caption = 'Job Details';
                action(Requirements)
                {
                    ApplicationArea = Basic;
                    Caption = 'Requirements';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "HR Job Requirement Lines";
                    RunPageLink = "Job ID" = field("Job Applied For");
                    ToolTip = 'Executes the Requirements action.';
                }
                action(Responsibilities)
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsibilities';
                    Image = JobResponsibility;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "HR Job Responsiblities Lines";
                    RunPageLink = "Job ID" = field("Job Applied For");
                    ToolTip = 'Executes the Responsibilities action.';
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Applicant Type" := Rec."Applicant Type"::Internal;
    end;

    var
        HRJobApplications: Record "HR Job Applications";
        //SMTP: Codeunit "SMTP Mail";
        HREmailParameters: Record "HR E-Mail Parameters";
        Employee: Record "HR Employees";
        Text19064672: Label 'Shortlisting Summary';
        Dates: Codeunit "HR Dates";
        DAge: Text[100];
        Text0000: Label '                     ';
}
