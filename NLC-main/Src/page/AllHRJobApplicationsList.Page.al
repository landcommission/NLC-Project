#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193604 "All HR Job Applications List"
{
    PageType = List;
    SourceTable = "HR Job Applications";
    ApplicationArea = All;
    Caption = 'All HR Job Applications List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Job Application No."; Rec."Job Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Application No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Initials field.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Search Name field.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Postal Address field.';
                }
                field("Residential Address"; Rec."Residential Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Residential Address field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Home Phone Number field.';
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cell Phone Number field.';
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Phone Number field.';
                }
                field("Ext."; Rec."Ext.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ext. field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Picture field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Country Code"; Rec."Country Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country Code field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Fax Number"; Rec."Fax Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fax Number field.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marital Status field.';
                }
                field("Ethnic Origin"; Rec."Ethnic Origin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ethnic Origin field.';
                }
                field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Language (R/W/S) field.';
                }
                field("Driving Licence"; Rec."Driving Licence")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driving Licence field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabled field.';
                }
                field("Health Assesment?"; Rec."Health Assesment?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Health Assesment? field.';
                }
                field("Health Assesment Date"; Rec."Health Assesment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Health Assesment Date field.';
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Language (R/W/S) field.';
                }
                field("Additional Language"; Rec."Additional Language")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Language field.';
                }
                field("Primary Skills Category"; Rec."Primary Skills Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Skills Category field.';
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Level field.';
                }
                field("Termination Category"; Rec."Termination Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Termination Category field.';
                }
                field("Postal Address2"; Rec."Postal Address2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Postal Address2 field.';
                }
                field("Postal Address3"; Rec."Postal Address3")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Postal Address3 field.';
                }
                field("Residential Address2"; Rec."Residential Address2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Residential Address2 field.';
                }
                field("Residential Address3"; Rec."Residential Address3")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Residential Address3 field.';
                }
                field("Post Code2"; Rec."Post Code2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code2 field.';
                }
                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Citizenship field.';
                }
                field("Disabling Details"; Rec."Disabling Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabling Details field.';
                }
                field("Disability Grade"; Rec."Disability Grade")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Grade field.';
                }
                field("Passport Number"; Rec."Passport Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passport Number field.';
                }
                field("2nd Skills Category"; Rec."2nd Skills Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 2nd Skills Category field.';
                }
                field("3rd Skills Category"; Rec."3rd Skills Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 3rd Skills Category field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("First Language Read"; Rec."First Language Read")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Language Read field.';
                }
                field("First Language Write"; Rec."First Language Write")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Language Write field.';
                }
                field("First Language Speak"; Rec."First Language Speak")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Language Speak field.';
                }
                field("Second Language Read"; Rec."Second Language Read")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Language Read field.';
                }
                field("Second Language Write"; Rec."Second Language Write")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Language Write field.';
                }
                field("Second Language Speak"; Rec."Second Language Speak")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Language Speak field.';
                }
                field("PIN Number"; Rec."PIN Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PIN Number field.';
                }
                field("Job Applied For"; Rec."Job Applied For")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Applied For field.';
                }
                field("Employee Requisition No"; Rec."Employee Requisition No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Requisition No field.';
                }
                field("Total Score"; Rec."Total Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Score field.';
                }
                field(Shortlist; Rec.Shortlist)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortlist field.';
                }
                field(Qualified; Rec.Qualified)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualified field.';
                }
                field(Stage; Rec.Stage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stage field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Applicant Type"; Rec."Applicant Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicant Type field.';
                }
                field("Interview Invitation Sent"; Rec."Interview Invitation Sent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Invitation Sent field.';
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Applied field.';
                }
                field("Citizenship Details"; Rec."Citizenship Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Citizenship Details field.';
                }
                field(Expatriate; Rec.Expatriate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expatriate field.';
                }
                field("Total Score After Interview"; Rec."Total Score After Interview")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Score After Interview field.';
                }
                field("Total Score After Shortlisting"; Rec."Total Score After Shortlisting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Score After Shortlisting field.';
                }
                field("Date of Interview"; Rec."Date of Interview")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Interview field.';
                }
                field("From Time"; Rec."From Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From Time field.';
                }
                field("To Time"; Rec."To Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Time field.';
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Venue field.';
                }
                field("Job Applied for Description"; Rec."Job Applied for Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Applied for Description field.';
                }
                field("Regret Notice Sent"; Rec."Regret Notice Sent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Regret Notice Sent field.';
                }
                field("Interview Type"; Rec."Interview Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Type field.';
                }
                field(Uploaded; Rec.Uploaded)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Uploaded field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("County Of Birth"; Rec."County Of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County Of Birth field.';
                }
                field("County Of Residence"; Rec."County Of Residence")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County Of Residence field.';
                }
                field(Tribe; Rec.Tribe)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tribe field.';
                }
                field("Physically Challenged?"; Rec."Physically Challenged?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Physically Challenged? field.';
                }
                field("Physically Challenged Descript"; Rec."Physically Challenged Descript")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Physically Challenged Descript field.';
                }
                field("Additional Read"; Rec."Additional Read")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Read field.';
                }
                field("Additional Write"; Rec."Additional Write")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Write field.';
                }
                field("Additional Speak"; Rec."Additional Speak")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Speak field.';
                }
                field("Alternative Contacts"; Rec."Alternative Contacts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Alternative Contacts field.';
                }
                field("Relative Who Work?"; Rec."Relative Who Work?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Relative Who Work? field.';
                }
                field("Relative Relation"; Rec."Relative Relation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Relative Relation field.';
                }
                field(ReApplied; Rec.ReApplied)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ReApplied field.';
                }
                field("Postal Code"; Rec."Postal Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Postal Code field.';
                }
                field("Disability CertNo"; Rec."Disability CertNo")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability CertNo field.';
                }
            }
        }
    }

    actions { }
}
