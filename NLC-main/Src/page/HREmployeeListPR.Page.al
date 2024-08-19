#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193450 "HR Employee List -  PR"
{
    Editable = false;
    PageType = List;
    SourceTable = "HR Employees";
    SourceTableView = sorting("No.")
                      order(ascending)
                      where(Status = filter(Active));
    ApplicationArea = All;
    Caption = 'HR Employee List -  PR';
    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
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
                field("Length Of Service"; Rec."Length Of Service")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Length Of Service field.';
                }
                field("Date Of Join"; Rec."Date Of Join")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Join field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Postal Address field.';
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
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Residential Address"; Rec."Residential Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Residential Address field.';
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
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workstation field.';
                }
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Home Phone Number field.';
                }
                field("Cellular Phone Number"; Rec."Cellular Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cellular Phone Number field.';
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
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("Union Code"; Rec."Union Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Union Code field.';
                }
                field("UIF Number"; Rec."UIF Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UIF Number field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                // field("Country Code"; Rec."Country Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Country Code field.';
                // }
                field("Statistics Group Code"; Rec."Statistics Group Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Statistics Group Code field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Office; Rec.Office)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Office field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field("Fax Number"; Rec."Fax Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fax Number field.';
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company E-Mail field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salespers./Purch. Code field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Known As"; Rec."Known As")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Known As field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position field.';
                }
                field("Full / Part Time"; Rec."Full / Part Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full / Part Time field.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract End Date field.';
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice Period field.';
                }
                field("Union Member?"; Rec."Union Member?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Union Member? field.';
                }
                field("Shift Worker?"; Rec."Shift Worker?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shift Worker? field.';
                }
                field("Contracted Hours"; Rec."Contracted Hours")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contracted Hours field.';
                }
                field("Pay Period"; Rec."Pay Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Period field.';
                }
                field("Cost Code"; Rec."Cost Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cost Code field.';
                }
                field("UIF Contributor?"; Rec."UIF Contributor?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UIF Contributor? field.';
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
                field("Vehicle Registration Number"; Rec."Vehicle Registration Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Registration Number field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PWD field.';
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
                field("End Of Probation Date"; Rec."End Of Probation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Of Probation Date field.';
                }
                field("Pension Scheme Join"; Rec."Pension Scheme Join")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pension Scheme Join field.';
                }
                field("Time Pension Scheme"; Rec."Time Pension Scheme")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Pension Scheme field.';
                }
                field("Medical Scheme Join"; Rec."Medical Scheme Join")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medical Scheme Join field.';
                }
                field("Time Medical Scheme"; Rec."Time Medical Scheme")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Medical Scheme field.';
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Leaving field.';
                }
                field(Paterson; Rec.Paterson)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paterson field.';
                }
                field(Peromnes; Rec.Peromnes)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Peromnes field.';
                }
                field(Hay; Rec.Hay)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hay field.';
                }
                field(Castellion; Rec.Castellion)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Castellion field.';
                }
                field("Allow Overtime"; Rec."Allow Overtime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow Overtime field.';
                }
                field("Medical Scheme No."; Rec."Medical Scheme No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medical Scheme No. field.';
                }
                field("Medical Scheme Head Member"; Rec."Medical Scheme Head Member")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medical Scheme Head Member field.';
                }
                field("Number Of Dependants"; Rec."Number Of Dependants")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number Of Dependants field.';
                }
                field("Medical Scheme Name"; Rec."Medical Scheme Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medical Scheme Name field.';
                }
                field("Receiving Car Allowance ?"; Rec."Receiving Car Allowance ?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receiving Car Allowance ? field.';
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
                field("Cell Phone Reimbursement?"; Rec."Cell Phone Reimbursement?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cell Phone Reimbursement? field.';
                }
                field("Amount Reimbursed"; Rec."Amount Reimbursed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Reimbursed field.';
                }
                field("UIF Country"; Rec."UIF Country")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UIF Country field.';
                }
                field("Direct/Indirect"; Rec."Direct/Indirect")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Direct/Indirect field.';
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
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field(DateOfBirth; Rec.DateOfBirth)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DateOfBirth field.';
                }
                field(DateEngaged; Rec.DateEngaged)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DateEngaged field.';
                }
                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Citizenship field.';
                }
                field("Name Of Manager"; Rec."Name Of Manager")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name Of Manager field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
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
                field(PensionJoin; Rec.PensionJoin)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PensionJoin field.';
                }
                field(DateLeaving; Rec.DateLeaving)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DateLeaving field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
            }
        }
    }

    actions { }


    var
        Mail: Codeunit Mail;
        PictureExists: Boolean;
        DepCode: Code[10];
        OfficeCode: Code[10];


    procedure SetNewFilter(var DepartmentCode: Code[10]; var "Office Code": Code[10])
    begin
        DepCode := DepartmentCode;
        OfficeCode := "Office Code";
    end;
}
