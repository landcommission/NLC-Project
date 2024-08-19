#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69203 "HR Disciplinary Cases SF"
{
    PageType = Card;
    SourceTable = "HR Disciplinary Cases NCA";
    PromotedActionCategories = 'Home,Process,Report,Details,Action,Notifications';
    ApplicationArea = All;
    Caption = 'HR Disciplinary Cases SF';

    layout
    {
        area(Content)
        {
            group("General Details")
            {
                Caption = 'General Details';
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the Document No.';
                }

                field("Employee Name"; Rec."Accused Employee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Designation; Rec."Accused Employee Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Number field.';
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Complaint field.';
                }
                field("Case Description"; Rec."Description of Complaint")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Case Description field.';
                }

                field("Mode of Lodging the Complaint"; Rec."Mode of Lodging the Complaint")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mode of Lodging the Case field.';
                }
                field("Accussed Email"; Rec."Accussed Email")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the Accussed email address';
                }

                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }

                field(Accuser; Rec.Accuser)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Originator field.';
                }
                field("Accuser Name"; Rec."Accuser Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                    ToolTip = 'Specifies the accuser name';
                }
                field("Disciplinary Stage Status"; Rec."Disciplinary Stage Status")
                {
                    ApplicationArea = all;
                    Editable = false;
                    OptionCaption = ' ,Reported,Under Review,Inprogress,Closed,Appealled';
                    ToolTip = 'specifies the displinary cases statuses';
                }
                field(Appealed; Rec.Appealed)
                {
                    ApplicationArea = all;
                    Editable = false;
                }

                field(Response; Rec.Response)
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    ToolTip = 'Specifies the value of the Employee response.';
                }


            }


            group("Case Details")
            {
                Caption = 'Case Details';
                Visible = true;
                field("Date To Discuss Case"; Rec."Date To Discuss Case")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date To Discuss Case field.';
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disciplinary Action Taken';
                    ToolTip = 'Specifies the value of the Disciplinary Action Taken field.';
                }
                field("End Date"; Rec."Date Of Appeal")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Case Closure Date';
                    ToolTip = 'Specifies the value of the Case Closure Date field.';
                }
                field("Disciplinary Remarks"; Rec."Disciplinary Remarks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disciplinary Remarks';
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Professional Opinion field.';
                }
                field("HR/Payroll Implications"; Rec."HR/Payroll Implications")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR/Payroll Implications field.';
                }
                field("Policy Guidlines In Effect"; Rec."Policy Guidlines In Effect")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Guidlines In Effect field.';
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    toolTip = 'Specifies the value of the Closed By field.';
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = all;
                    Editable = false;
                }

            }
            group("Case Appeal Information")
            {
                Caption = 'Case Appeal Information';
                Visible = corec2;
                field("Disciplinary Case Type"; Rec."Type Complaint")
                {
                    ApplicationArea = Basic;
                    Visible = corec2;
                    ToolTip = 'Specifies the value of the Disciplinary Case Type field.';
                }
            }
        }
        area(FactBoxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(50062),
                              "No." = field("Case Number");
            }
            systempart(Control1000000019; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action("Discipline Detail")
            {
                ApplicationArea = Basic;
                //Visible = Rec.Status = Rec.Status::Submitted;
                PromotedCategory = Category4;
                Image = TaxDetail;
                Promoted = true;
                Visible = false;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = page "Discipline Details List";
                RunPageLink = "Discipline Case No." = field("Case Number");
                ToolTip = 'Executes the Discipline Detail action.';
            }
            // action("Accused Employees")
            // {
            //     ApplicationArea = Basic;
            //     // Visible = Rec.Status = Rec.Status::Open;
            //     // Visible = Rec."Has Multiple Accused Employees";
            //     PromotedCategory = Category4;
            //     Image = AddContacts;
            //     Promoted = true;
            //     PromotedIsBig = true;
            //     PromotedOnly = true;
            //     RunObject = page "Discipline Accused Employees";
            //     RunPageLink = "Case Number" = field("Case Number");
            //     ToolTip = 'Executes the Accused Employees action.';
            // }
        }
        area(Processing)
        {
            group(ActionGroup4)
            {
                Image = Alerts;
                action("Notify Commitee By Email")
                {
                    ApplicationArea = Basic;
                    Image = Email;
                    Promoted = true;
                    Visible = true;
                    PromotedIsBig = true;
                    PromotedCategory = Category6;
                    PromotedOnly = true;
                    ToolTip = 'Email all Board Members of this case';

                    trigger OnAction()
                    var
                        msg: Text;
                        AccName: Text;
                        CompanIn: Record "Company Information";
                        DispAccused: Record "Disciplinary Committee Members";
                        ErrorMultAccused: Label 'You need to specify at least one of the Commitee Cubs on the actions';
                        HRDisciplinaryCases: Record "HR Disciplinary Cases";
                    begin
                        DispAccused.Reset();
                        DispAccused.SetRange(DispAccused."Commitee Code", Rec."Document No.");
                        if DispAccused.FindSet() then
                            repeat
                                DispAccused.TestField("Employee No");
                            until DispAccused.Next() = 0
                        else
                            Error(ErrorMultAccused);
                        if Confirm('Do you want to notify the Commitee Members?') = true then begin
                            NotifyCommittee();
                            // HRDiscipMemb.Reset();
                            // HRDiscipMemb.SetRange(HRDiscipMemb."Commitee Code", Rec."Document No.");
                            // if HRDiscipMemb.Find('-') then
                            //     repeat
                            //         if Employee.Get(HRDiscipMemb."Employee No") then begin
                            //             AccName := '';
                            //             CompanIn.Get();
                            //             AccName := Employee."First Name";
                            //             if AccName = '' then
                            //                 AccName := Employee."Middle Name";
                            //             msg := 'Dear ' + AccName + ', you have  been Selected to be a Disciplinary Commitee Of case no. ' + ' ' + Rec."Case Number" + ' ' + ' ' + 'Kindly for Further Information Contact the HR department. Thank you.';
                            //             EmailManager.Create(Employee."E-Mail", 'Disciplinary Notifications', msg, true);
                            //             Email.Send(EmailManager, Enum::"Email Scenario"::Default);
                            //         end;
                            //     until HRDiscipMemb.Next() = 0;
                            // Message('Email sent successfully');
                        end;

                    end;
                }
            }
            group("Case Management")
            {
                Caption = 'Case Management';
                Image = BankContact;
                action("Submit Case")
                {
                    ApplicationArea = Basic;
                    Image = PostApplication;
                    //   Visible = Rec.Status = Rec.Status::Open;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Submit Case action.';
                    trigger OnAction()
                    var
                        DispAccused: Record "Disciplinary Committee Members";
                        ErrorMultAccused: Label 'You need to specify at least one of the Commitee Cubs on the actions';
                        HRDisciplinaryCases: Record "HR Disciplinary Cases";
                        DisciplinaryStatusTable: Record "Disciplinary Status Table";
                        HrModels: Record "HR Models";
                    begin
                        Rec.TestField("Date of Complaint");
                        Rec.TestField("Responsibility Center");
                        Rec.TestField(Accuser);
                        rec.TestField("Case Number");
                        if not Confirm('Sure to submit the case?', false) then
                            exit;
                        HrModels.Reset();
                        HrModels.SetRange("Requires Prev Interventions", true);
                        HrModels.SetRange(Type, HrModels.Type::"Disciplinary Case");
                        Begin
                            DispAccused.Reset();
                            DispAccused.SetRange(DispAccused."Commitee Code", Rec."Document No.");
                            if DispAccused.FindSet() then
                                repeat
                                    DispAccused.TestField("Employee No");
                                until DispAccused.Next() = 0
                            else
                                Error(ErrorMultAccused);
                            rec."Disciplinary Stage Status" := rec."Disciplinary Stage Status"::Inprogress;
                            rec.Modify();
                            Message('Case In progress');
                        end;
                        CurrPage.Close();
                    end;
                }
                action("Create Court Case")
                {
                    ApplicationArea = Basic;
                    Image = BankContact;
                    Promoted = true;
                    Visible = true;
                    ToolTip = 'Executes the Create Court Case action.';
                    PromotedCategory = Process;
                    trigger OnAction()
                    begin
                        begin
                            if Dialog.Confirm('Are you sure you want to send this case to Legal?', true) then begin
                                CaseRegister.Reset();
                                CaseRegister.SetRange("No.", Rec."Document No.");
                                if not CaseRegister.FindFirst() then begin
                                    CaseRegister.Init();
                                    CaseRegister."No." := Rec."Document No.";
                                    CaseRegister.Status := CaseRegister.Status::New;
                                    CaseRegister."Employee No" := Rec."Accused Employee";
                                    CaseRegister."Case Number" := Rec."Case Number";
                                    CaseRegister."Employee Name" := Rec."Accused Employee Name";
                                    CaseRegister."From Document Number" := Rec."Case Number";
                                    CaseRegister.Insert(true);
                                end Else
                                    Message('%1 Legal case created', CaseRegister."No.");
                            end;
                            Message('%1 Legal case created', CaseRegister."No.");
                            CR.Reset();
                            CR.SetRange(CR."No.", CaseRegister."No.");
                            Page.Run(Page::"Case Register Card", CR);
                        end;
                    end;
                }
                action("Close Case File")
                {
                    ApplicationArea = Basic;
                    Image = Close;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    //  Visible = Rec.Status = Rec.Status::Submitted;
                    ToolTip = 'Executes the Close Case File action.';
                    trigger OnAction()
                    var
                        TestClose: Boolean;
                    begin
                        TestClose := false;
                        Rec.TestField("Action Taken");
                        if Dialog.Confirm('Are you sure you want to close case ' + Rec."Case Number" + '?', true) then begin
                            TestClose := true;
                            Cases.Reset();
                            Cases.SetRange("Case Number", Rec."Case Number");
                            if Cases.FindFirst() then begin
                                Cases."Disciplinary Stage Status" := Rec."Disciplinary Stage Status"::Closed;
                                Cases."Closed By" := UserId;
                                Cases."End Date" := Today;
                                Cases.Modify(true);
                                if TestClose = true then begin
                                    Rec."Disciplinary Stage Status" := Rec."Disciplinary Stage Status"::Closed;
                                    rec."Closed By" := UserId;
                                    Rec."Date Closed" := Today;
                                    rec.Modify(true);
                                end;
                            end else begin
                                Rec."Disciplinary Stage Status" := Rec."Disciplinary Stage Status"::Closed;
                                rec."Closed By" := UserId;
                                Rec."Date Closed" := Today;
                                rec.Modify(true);
                            end;
                        end;
                        Message('Case Closed');
                        CurrPage.Close();
                    end;
                }

                action("Notify Accusser")
                {
                    ApplicationArea = all;
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        if Confirm('Do you want to notify the accused Employee?') = true then
                            NotifyAccuser();


                    end;

                }
                action("Appeal Case")
                {
                    ApplicationArea = Basic;
                    Image = PostApplication;
                    Promoted = true;
                    Visible = false;
                    ToolTip = 'Executes the Appeal Case action.';
                    trigger OnAction()
                    begin
                        rec.TestField(Appealed, false);
                        if not Confirm('Do you want appeal this case?') then
                            exit;
                        Cases.Reset();
                        Cases.SetRange("Case Number", Rec."Case Number");
                        //  Cases.SetRange("Employee No", Rec."Employee No");
                        if Cases.FindSet() then
                            Cases.Init();
                        Cases."Case Number" := '';
                        //   Cases."Accuser Is Staff" := Rec."Accuser Is Staff";
                        Cases.Accuser := Rec.Accuser;
                        Cases.Type := Cases.Type::Disciplinary;
                        Cases."Created By" := UserId;

                        Cases."Mode of Lodging the Complaint" := Rec."Mode of Lodging the Complaint";
                        Cases."Responsibility Center" := Rec."Responsibility Center";
                        Cases."Disciplinary Case Type" := Cases."Disciplinary Case Type"::Appeal;
                        Cases.Insert(true);
                        HrCaseWitness.Reset();
                        HrCaseWitness.SetRange("Case Number", Rec."Case Number");
                        if HrCaseWitness.Find('-') then
                            repeat
                                HrCaseWitness.Init();
                                HrCaseWitness."Line No" := HrCaseWitness."Line No" + 100;
                                HrCaseWitness."Case Number" := Cases."Case Number";
                                HrCaseWitness."Witness is Staff" := HrCaseWitness."Witness is Staff";
                                HrCaseWitness."Employee No" := HrCaseWitness."Employee No";
                                HrCaseWitness."Witness Number" := HrCaseWitness."Witness Number";
                                HrCaseWitness."Witness Name" := HrCaseWitness."Witness Name";
                                HrCaseWitness."Witness Statement" := HrCaseWitness."Witness Statement";
                                HrCaseWitness.Insert();
                            until HrCaseWitness.Next() = 0;
                        Rec.Appealed := true;
                        rec."Disciplinary Stage Status" := Rec."Disciplinary Stage Status"::Appealled;
                        Rec.Modify(true);
                        Message('Appeal Case Created');
                    end;
                }
                action("Close Case Appeal")
                {
                    ApplicationArea = Basic;
                    Image = Close;
                    Promoted = true;
                    PromotedIsBig = true;
                    Visible = corec2;
                    ToolTip = 'Executes the Close Case Appeal action.';
                    trigger OnAction()
                    begin
                        //TESTFIELD(Status,Status::Open);
                        Rec.TestField("Action Taken");
                        if Dialog.Confirm('Are you sure you want to close the Appeal' + Rec."Case Number" + '?', true) then begin
                            Cases.Reset();
                            Cases.SetRange("Case Number", Rec."Case Number");
                            if Cases.FindSet() then begin
                                // Rec.Status := Rec.Status::Closed;
                                Rec."Disciplinary Stage Status" := Rec."Disciplinary Stage Status"::Closed;
                                Rec."Closed By" := UserId;
                                Rec."Date Closed" := Today;
                                Rec.Modify(true);
                                Message('Payroll deduction Added');
                            end;
                            //end;

                        end;
                    end;
                }

                action(Attachments)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal();
                    end;
                }

                action("Case Witnesses")
                {
                    ApplicationArea = Basic;
                    Image = CustomerGroup;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = page "Hr Case Witness";
                    RunPageLink = "Case Number" = field("Case Number");
                    ToolTip = 'Executes the Case Witnesses action.';
                }
                action("Commitee Members")
                {
                    ApplicationArea = all;
                    Promoted = true;
                    Image = Customer;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = page "Disciplanary  Commitee Members";
                    RunPageLink = "Commitee Code" = field("Document No.");

                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        ControlPage();
    end;

    trigger OnAfterGetRecord()
    begin
        ControlPage();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        ControlPage();

    end;

    trigger OnClosePage()
    var
        myInt: Integer;
    begin
        if rec.Response = '' then
            if Confirm('Do you want to notify the accused Employee?') = true then begin
                NotifyAccuser();
            end;

    end;

    trigger OnOpenPage()
    begin
        corec := false;
        ControlPage();

    end;

    procedure NotifyCommittee()
    var
        myInt: Integer;
        AccName: Text;
        CompanIn: Record "Company Information";
        msg: Text;
    begin
        HRDiscipMemb.Reset();
        HRDiscipMemb.SetRange(HRDiscipMemb."Commitee Code", Rec."Document No.");
        if HRDiscipMemb.Find('-') then
            repeat
                if Employee.Get(HRDiscipMemb."Employee No") then begin
                    AccName := '';
                    CompanIn.Get();
                    AccName := Employee."First Name";
                    if AccName = '' then
                        AccName := Employee."Middle Name";
                    msg := 'Dear ' + AccName + ', you have  been Selected to be a Disciplinary Commitee Of case no. ' + ' ' + Rec."Case Number" + ' ' + ' ' + 'Kindly for Further Information Contact the HR department. Thank you.';
                    EmailManager.Create(Employee."E-Mail", 'Disciplinary Notifications', msg, true);
                    Email.Send(EmailManager, Enum::"Email Scenario"::Default);
                end;
            until HRDiscipMemb.Next() = 0;
        Message('Email sent successfully');

    end;

    procedure NotifyAccuser()
    var
        myInt: Integer;
        EmployeRec: Record "HR Employees";
        Emailmessage: Codeunit "Email Message";
        EmailTable: Record "Email Account";
        CompanIn: Record "Company Information";
        AccName: Text;
        msg: Text;
    begin
        if rec.Response = '' then begin
            AccName := '';
            CompanIn.Get();
            EmployeRec.Reset();
            EmployeRec.SetRange("No.", Rec."Accused Employee");
            if EmployeRec.FindFirst() then begin
                AccName := EmployeRec."First Name";
                if AccName = '' then
                    AccName := EmployeRec."Middle Name";
                msg := 'Dear ' + AccName + ' you have  an accused Case of case no. ' + ' ' + Rec."Case Number" + ' ' + ' ' + 'Kindly take necessary action to respond Using the portal. Thank you.';
                EmailManager.Create(rec."Accussed Email", 'Disciplinary Notifications', msg, true);
                Email.Send(EmailManager, Enum::"Email Scenario"::Default);
                Message('Email sent successfully');
            end;
        end;
    end;

    local procedure ControlPage()
    var
        myInt: Integer;
    begin
        if (Rec."Disciplinary Stage Status" = Rec."Disciplinary Stage Status"::Reported) or (Rec."Disciplinary Stage Status" = Rec."Disciplinary Stage Status"::" ") then
            CurrPage.Editable := true
        else
            CurrPage.Editable := false;
    end;

    var
        Cases: Record "HR Disciplinary Cases";
        ProgressWindow: Dialog;
        Filename: Text;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        Employee: Record Employee;
        HRDiscipMemb: Record "Disciplinary Committee Members";
        HRCases: Record "HR Disciplinary Cases";
        CaseRegister: Record "Case Register";
        AssignmentMatrixX: Record "PR Transaction Codes";
        DisciplinaryStatus: Record "Disciplinary Status Table";
        PayPeriod: Record "PR Payroll Periods";
        CR: Record "Case Register";
        AmountDeducted: Decimal;
        Emp: Record Employee;
        AssMatx: Record "PR Transaction Codes";
        HRDisciplinaryCases: Record "HR Disciplinary Cases";
        corec: Boolean;
        corec1: Boolean;
        corec2: Boolean;
        HrCaseWitness: Record "Hr Case Witness";
        EmailManager: Codeunit "Email Message";
        Email: Codeunit Email;
}

#pragma implicitwith restore

