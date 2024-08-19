#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193443 "HR Employee Card (Commissioner"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Print,Functions,Employee,Attachments';
    SourceTable = "HR Employees";
    ApplicationArea = All;
    Caption = 'HR Employee Card (Commissioner';
    layout
    {
        area(Content)
        {
            group("General Details")
            {
                Caption = 'General Details';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    AssistEdit = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("Passport Number"; Rec."Passport Number")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Passport Number field.';
                }
                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Citizenship field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("<GlobSal Dimension 1 Code>"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workstation field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Postal Address field.';
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
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Picture field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the User ID field.';
                    trigger OnValidate()
                    begin
                        SupervisorNames := GetSupervisor(Rec."User ID");
                    end;
                }
                field("Employee Type"; Rec."Employee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Type field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Style = Attention;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Commisioner?"; Rec."Commisioner?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commisioner? field.';
                }
            }
            group("Communication Details")
            {
                Caption = 'Communication Details';
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = PhoneNo;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Home Phone Number field.';
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = PhoneNo;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Cell Phone Number field.';
                }
                field("Fax Number"; Rec."Fax Number")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = PhoneNo;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Fax Number field.';
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = PhoneNo;
                    ToolTip = 'Specifies the value of the Work Phone Number field.';
                }
                field("Ext."; Rec."Ext.")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = PhoneNo;
                    ToolTip = 'Specifies the value of the Ext. field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = EMail;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Company E-Mail field.';
                }
            }
            group("Personal Details")
            {
                Caption = 'Personal Details';
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Marital Status field.';
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Religion field.';
                }
                field(Tribe; Rec.Tribe)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tribe field.';
                }
                field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the First Language (R/W/S) field.';
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
                field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Second Language (R/W/S) field.';
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
                field("Additional Language"; Rec."Additional Language")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Language field.';
                }
                field("Vehicle Registration Number"; Rec."Vehicle Registration Number")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Vehicle Registration Number field.';
                }
                field("Number Of Dependants"; Rec."Number Of Dependants")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number Of Dependants field.';
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
                field("Medical Scheme Name"; Rec."Medical Scheme Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medical Scheme Name field.';
                }
                field("Cause of Inactivity Code"; Rec."Cause of Inactivity Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cause of Inactivity Code field.';
                }
                field("Health Assesment Date"; Rec."Health Assesment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Health Assesment Date field.';
                }
            }
            group("Bank Details")
            {
                Caption = 'Bank Details';
                field("No. Of Bank A/Cs"; Rec."No. Of Bank A/Cs")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. Of Bank A/Cs field.';
                }
            }
            group("Important Dates")
            {
                Caption = 'Important Dates';
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                    trigger OnValidate()
                    begin
                        if Rec."Date Of Birth" >= Today then
                            Error('Invalid Entry');
                        Rec.DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);
                    end;
                }
                field(DAge; Rec.DAge)
                {
                    ApplicationArea = Basic;
                    Caption = 'Age';
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field("Date Of Joining the Company"; Rec."Date Of Joining the Company")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Date Of Joining the Company field.';
                    trigger OnValidate()
                    begin
                        DService := Dates.DetermineAge(Rec."Date Of Joining the Company", Today);
                    end;
                }
                field(DService; DService)
                {
                    ApplicationArea = Basic;
                    Caption = 'Length of Service';
                    Editable = false;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Length of Service field.';
                }
                field("End Of Probation Date"; Rec."End Of Probation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Of Probation Date field.';
                }
                field("Retirement date"; Rec."Retirement date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retirement date field.';
                    trigger OnValidate()
                    begin
                        Dretire := Dates.DetermineAge(Rec."Retirement date", Today);
                    end;
                }
                field("Pension Scheme Join Date"; Rec."Pension Scheme Join Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pension Scheme Join Date field.';
                    trigger OnValidate()
                    begin
                        Rec.DPension := Dates.DetermineAge(Rec."Pension Scheme Join Date", Today);
                    end;
                }
                field(Dretire; Dretire)
                {
                    ApplicationArea = Basic;
                    Caption = 'Days to Retire';
                    ToolTip = 'Specifies the value of the Days to Retire field.';
                }
                field(DPension; Rec.DPension)
                {
                    ApplicationArea = Basic;
                    Caption = 'Days to Retirement';
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Days to Retirement field.';
                }
                field("Medical Scheme Join Date"; Rec."Medical Scheme Join Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medical Scheme Join Date field.';
                    trigger OnValidate()
                    begin
                        DMedical := Dates.DetermineAge(Rec."Medical Scheme Join Date", Today);
                    end;
                }
                field(DMedical; DMedical)
                {
                    ApplicationArea = Basic;
                    Caption = 'Time On Medical Aid Scheme';
                    Editable = false;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Time On Medical Aid Scheme field.';
                }
                field("Wedding Anniversary"; Rec."Wedding Anniversary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Wedding Anniversary field.';
                }
                field("Passport Expiry Date"; Rec."Passport Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passport Expiry Date field.';
                }
            }
            group("Job Details")
            {
                Caption = 'Job Details';
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Payroll Code"; Rec."Payroll Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Code field.';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
            }
            group("Terms of Service")
            {
                Caption = 'Terms of Service';
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Type';
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
                field("Secondment Institution"; Rec."Secondment Institution")
                {
                    ApplicationArea = Basic;
                    Caption = 'Seondment';
                    ToolTip = 'Specifies the value of the Seondment field.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Contract End Date field.';
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice Period field.';
                }
                field("Send Alert to"; Rec."Send Alert to")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Send Alert to field.';
                }
                field("Full / Part Time"; Rec."Full / Part Time")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Full / Part Time field.';
                }
            }
            group("Payment Information")
            {
                Caption = 'Payment Information';
                field("PIN No."; Rec."PIN No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the PIN No. field.';
                }
                field("NSSF No."; Rec."NSSF No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the NSSF No. field.';
                }
                field("NHIF No."; Rec."NHIF No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the NHIF No. field.';
                }
            }
            group("Separation Details")
            {
                Caption = 'Separation Details';
                field("Date Of Leaving"; "Date Of Leaving")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Date Of Leaving the Company field.';

                }
                field("Termination Grounds"; Rec."Termination Grounds")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Termination Grounds field.';
                }
                field("Exit Interview Date"; Rec."Exit Interview Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Exit Interview Date field.';
                }
                field("Exit Interview Done by"; Rec."Exit Interview Done by")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Exit Interview Done by field.';
                }
            }
            group("Leave Details")
            {
                Caption = 'Leave Details';
                field("Reimbursed Leave Days"; Rec."Reimbursed Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Reimbursed Leave Days field.';
                }
                field("Allocated Leave Days"; Rec."Allocated Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Allocated Leave Days field.';
                }
                field("Total (Leave Days)"; Rec."Total (Leave Days)")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Total (Leave Days) field.';
                }
                field("Total Leave Taken"; Rec."Total Leave Taken")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Total Leave Taken field.';
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Balance field.';
                }
                field("Acrued Leave Days"; Rec."Acrued Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Acrued Leave Days field.';
                }
                field("Cash per Leave Day"; Rec."Cash per Leave Day")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Cash per Leave Day field.';
                }
                field("Cash - Leave Earned"; Rec."Cash - Leave Earned")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Cash - Leave Earned field.';
                }
                field("Leave Status"; Rec."Leave Status")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Status field.';
                }
                field("Leave Type Filter"; Rec."Leave Type Filter")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Type Filter field.';
                }
                field("Leave Period Filter"; Rec."Leave Period Filter")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Period Filter field.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1102755004; "HR Employees Factbox")
            {
                SubPageLink = "No." = field("No.");
            }
            systempart(Control1102755002; Outlook) { }
            systempart(Control1; Links) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Print")
            {
                Caption = '&Print';
                action("Personal Information File")
                {
                    ApplicationArea = Basic;
                    Caption = 'Personal Information File';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Personal Information File action.';
                    trigger OnAction()
                    begin
                        HREmp.Reset();
                        HREmp.SetRange(HREmp."No.", Rec."No.");
                        if HREmp.Find('-') then
                            Report.Run(39005585, true, true, HREmp);
                    end;
                }
                action("Misc. Article Info")
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Article Info';
                    Image = PrintReport;
                    Promoted = false;
                    ToolTip = 'Executes the Misc. Article Info action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Misc.Reset();
                        Misc.SetRange(Misc."Employee No.", Rec."No.");
                        if Misc.Find('-') then
                            Report.Run(Report::"Employee - Misc. Article Info.", true, true, Misc);
                    end;
                }
                action("Confidential Info")
                {
                    ApplicationArea = Basic;
                    Caption = 'Confidential Info';
                    Image = PrintReport;
                    Promoted = false;
                    ToolTip = 'Executes the Confidential Info action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Conf.Reset();
                        Conf.SetRange(Conf."Employee No.", Rec."No.");
                        if Conf.Find('-') then
                            Report.Run(Report::"Employee - Confidential Info.", true, true, Conf);
                    end;
                }
                action(Label)
                {
                    ApplicationArea = Basic;
                    Caption = 'Label';
                    Image = PrintReport;
                    Promoted = false;
                    ToolTip = 'Executes the Label action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HREmp.Reset();
                        HREmp.SetRange(HREmp."No.", Rec."No.");
                        if HREmp.Find('-') then
                            Report.Run(Report::"Employee - Labels", true, true, HREmp);
                    end;
                }
                action(Addresses)
                {
                    ApplicationArea = Basic;
                    Caption = 'Addresses';
                    Image = PrintReport;
                    Promoted = false;
                    ToolTip = 'Executes the Addresses action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HREmp.Reset();
                        HREmp.SetRange(HREmp."No.", Rec."No.");
                        if HREmp.Find('-') then
                            Report.Run(Report::"Employee - Addresses", true, true, HREmp);
                    end;
                }
                action("Alt. Addresses")
                {
                    ApplicationArea = Basic;
                    Caption = 'Alt. Addresses';
                    Image = PrintReport;
                    Promoted = false;
                    ToolTip = 'Executes the Alt. Addresses action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HREmp.Reset();
                        HREmp.SetRange(HREmp."No.", Rec."No.");
                        if HREmp.Find('-') then
                            Report.Run(Report::"Employee - Alt. Addresses", true, true, HREmp);
                    end;
                }
                action("Phone Nos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Phone Nos';
                    Image = PrintReport;
                    Promoted = false;
                    ToolTip = 'Executes the Phone Nos action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HREmp.Reset();
                        HREmp.SetRange(HREmp."No.", Rec."No.");
                        if HREmp.Find('-') then
                            Report.Run(Report::"Employee - Phone Nos.", true, true, HREmp);
                    end;
                }
            }
            group("&Employee")
            {
                Caption = '&Employee';
                action("Next of Kin")
                {
                    ApplicationArea = Basic;
                    Caption = 'Next of Kin';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "HR Employee Kin SF";
                    RunPageLink = "Employee Code" = field("No.");
                    RunPageView = where(Type = filter("Next of Kin"));
                    ToolTip = 'Executes the Next of Kin action.';
                }
                action(Beneficiaries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Beneficiaries';
                    Image = Opportunity;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "HR Employee Kin SF";
                    RunPageLink = "Employee Code" = field("No.");
                    RunPageView = where(Type = filter(Beneficiary));
                    ToolTip = 'Executes the Beneficiaries action.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = const(Employee),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
                action(Qualifications)
                {
                    ApplicationArea = Basic;
                    Caption = 'Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "HR Employee Qualification Line";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the Qualifications action.';
                }
                action("Employment History")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employment History';
                    Image = History;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "HR Employment History Lines";
                    RunPageLink = JobID = field("No.");
                    ToolTip = 'Executes the Employment History action.';
                }
                action("Alternative Addresses")
                {
                    ApplicationArea = Basic;
                    Caption = 'Alternative Addresses';
                    Image = AlternativeAddress;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = page "Alternative Address Card";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the Alternative Addresses action.';
                }
                action("Misc. Articles")
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Articles';
                    Image = ExternalDocument;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "Misc. Article Information";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the Misc. Articles action.';
                }
                action("Misc. Articles Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Articles Overview';
                    Image = ViewSourceDocumentLine;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "Misc. Articles Overview";
                    ToolTip = 'Executes the Misc. Articles Overview action.';
                }
                action("&Confidential Information")
                {
                    ApplicationArea = Basic;
                    Caption = '&Confidential Information';
                    Image = SNInfo;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = page "Confidential Information";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the &Confidential Information action.';
                }
                action("Co&nfidential Info. Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&nfidential Info. Overview';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = page "Confidential Info. Overview";
                    ToolTip = 'Executes the Co&nfidential Info. Overview action.';
                }
                action("A&bsences")
                {
                    ApplicationArea = Basic;
                    Caption = 'A&bsences';
                    Image = AbsenceCalendar;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = page "Employee Absences";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the A&bsences action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5200),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Dimensions action.';
                }
                action("Bank Accounts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "HR Bank Accounts List";
                    RunPageLink = "Employee Code" = field("No.");
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Bank Accounts action.';
                }
                action("<Page Employee Competence>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Competence';
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "HR Employee Competence List";
                    RunPageLink = "Employee No" = field("No.");
                    ToolTip = 'Executes the Employee Competence action.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        fnMultipleBankAC();

        Rec.DAge := '';
        DService := '';
        Rec.DPension := '';
        DMedical := '';
        Dretire := '';

        //Recalculate Important Dates
        if (Rec."Date Of Leaving" = 0D) then begin
            if (Rec."Date Of Birth" <> 0D) then
                Rec.DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);
            if (Rec."Date Of Joining the Company" <> 0D) then
                DService := Dates.DetermineAge(Rec."Date Of Joining the Company", Today);
            if (Rec."Pension Scheme Join Date" <> 0D) then
                Rec.DPension := Dates.DetermineAge(Rec."Pension Scheme Join Date", Today);
            if (Rec."Medical Scheme Join Date" <> 0D) then
                DMedical := Dates.DetermineAge(Rec."Medical Scheme Join Date", Today);
            //MODIFY;
        end else begin
            if (Rec."Date Of Birth" <> 0D) then
                Rec.DAge := Dates.DetermineAge(Rec."Date Of Birth", Rec."Date Of Leaving");
            if (Rec."Date Of Joining the Company" <> 0D) then
                DService := Dates.DetermineAge(Rec."Date Of Joining the Company", Rec."Date Of Leaving");
            if (Rec."Pension Scheme Join Date" <> 0D) then
                Rec.DPension := Dates.DetermineAge(Rec."Pension Scheme Join Date", Rec."Date Of Leaving");
            if (Rec."Medical Scheme Join Date" <> 0D) then
                DMedical := Dates.DetermineAge(Rec."Medical Scheme Join Date", Rec."Date Of Leaving");
            //MODIFY;
        end;

        //Recalculate Leave Days
        Rec.Validate(Rec."Allocated Leave Days");
        SupervisorNames := GetSupervisor(Rec."User ID");

        if Rec."Retirement date" <> 0D then
            Dretire := Dates.DetermineAge(Today, Rec."Retirement date");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Commisioner?" := true;
    end;

    trigger OnOpenPage()
    begin
        fnMultipleBankAC();
    end;

    var
        PictureExists: Boolean;
        Text001: Label 'Do you want to replace the existing picture of %1 %2?';
        Text002: Label 'Do you want to delete the picture of %1 %2?';
        Dates: Codeunit "HR Dates";
        DAge: Text[100];
        DService: Text[100];
        DPension: Text[100];
        DMedical: Text[100];
        D: Date;
        DoclLink: Record "HR Employee Attachments";
        "Filter": Boolean;
        prEmployees: Record "HR Employees";
        prPayrollType: Record "prPayroll Type";
        Mail: Codeunit Mail;
        HREmp: Record "HR Employees";
        SupervisorNames: Text[60];
        Misc: Record "Misc. Article Information";
        Conf: Record "Confidential Information";
        //SMTP: Codeunit "SMTP Mail";
        CompInfo: Record "Company Information";
        Body: Text[1024];
        Text003: Label 'Welcome to Lotus Capital Limited';
        Filename: Text;
        Recordlink: Record "Record Link";
        Text004a: Label 'It is a great pleasure to welcome you to Moi Teaching and Referral Hospital. You are now part of an organization that has its own culture and set of values. On your resumption and during your on-boarding process,  to help you to understand and adapt quickly and easily to the LOTUS CAPITAL culture and values, HR Unit shall provide you with various important documents that you are encouraged to read and understand.';
        Text004b: Label 'On behalf of the Managing Director, I congratulate you for your success in the interview process and I look forward to welcoming you on board LOTUS CAPITAL Limited.';
        Text004c: Label 'Adebola SAMSON-FATOKUN';
        Text004d: Label 'Strategy & Corporate Services';
        NL: Char;
        LF: Char;
        objpostingGroup: Record "prEmployee Posting Group";
        objDimVal: Record "Dimension Value";
        "Citizenship Text": Text[200];
        BankEditable: Boolean;
        HRBankAccounts: Record "HR Employee Bank Accounts";
        Dretire: Text[100];


    procedure GetSupervisor(var sUserID: Code[50]) SupervisorName: Text[200]
    var
        UserSetup: Record "User Setup";
    begin
        if sUserID <> '' then begin
            UserSetup.Reset();
            if UserSetup.Get(sUserID) then begin

                SupervisorName := UserSetup."Approver ID";
                if SupervisorName <> '' then begin

                    HREmp.SetRange(HREmp."User ID", SupervisorName);
                    if HREmp.Find('-') then
                        SupervisorName := HREmp.FullName();

                end else
                    SupervisorName := '';


            end else begin
                Error('User' + ' ' + sUserID + ' ' + 'does not exist in the user setup table');
                SupervisorName := '';
            end;
        end;
    end;


    procedure GetSupervisorID(var EmpUserID: Code[50]) SID: Text[200]
    var
        UserSetup: Record "User Setup";
        SupervisorID: Code[20];
    begin
        if EmpUserID <> '' then begin
            SupervisorID := '';

            UserSetup.Reset();
            if UserSetup.Get(EmpUserID) then begin
                SupervisorID := UserSetup."Approver ID";
                if SupervisorID <> '' then
                    SID := SupervisorID
                else
                    SID := '';
            end else
                Error('User' + ' ' + EmpUserID + ' ' + 'does not exist in the user setup table');
        end;
    end;

    local procedure fnMultipleBankAC()
    begin
        if Rec."Mutliple Bank A/Cs" then begin
            Rec."Main Bank" := '';
            Rec."Branch Bank" := '';
            Rec."Bank Account Number" := '';
            BankEditable := false;
        end else
            BankEditable := true;
    end;
}
