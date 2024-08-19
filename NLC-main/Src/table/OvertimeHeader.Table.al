#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69126 "Overtime Header"
{
    Caption = 'Overtime Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "EMp No."; Code[10])
        {
            TableRelation = Employee."No.";
            Caption = 'EMp No.';
            trigger OnValidate()
            begin

                if "Application Code" <> xRec."Application Code" then begin
                    hrsetup.Get();
                    NoSeriesMgt.TestManual(hrsetup."Overtime Req Nos.");
                    "No. series" := '';
                end;


                if "EMp No." = '' then
                    Name := '';

                Employee.Reset();
                if Employee.Get("EMp No.") then begin
                    Name := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Responsibility Center" := Employee."Job Title";
                    "Dim Code 1" := Employee."Global Dimension 1 Code";
                    "Dim Code 2" := Employee."Global Dimension 2 Code";
                    //MODIFY
                end

                /*employee.SETRANGE(employee."No.",OT."EMp No.");
                IF employee.FIND('-') THEN BEGIN
                OT.Name:=employee."First Name"+' '+employee."Middle Name"+' '+employee."Last Name";
                OT.MODIFY
                END*/

            end;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; "Convert to pay"; Boolean)
        {
            Caption = 'Convert to pay';

        }
        field(4; "Convert to Leave"; Boolean)
        {
            Caption = 'Convert to Leave';

        }
        field(5; "Application Code"; Code[10])
        {
            Caption = 'Application Code';
        }
        field(6; Status; Option)
        {
            OptionMembers = Open,Pending,Approved,Rejected;
            Caption = 'Status';
            trigger OnValidate()
            begin
                if Status = Status::Approved then
                    if Employee.Get("EMp No.") then begin
                        //Filename:= ObjCompany."HR Document Link"+Employee."First Name"+'_'+Employee."Last Name"+' '+Cases."Case Number"+'.pdf';

                        Header := 'OVERTIME APPLICATION APPROVAL';

                        if SMTPSetup.Get() then;
                        //     SenderEmail := SMTPSetup."Email Sender Address";
                        //      SenderName := SMTPSetup."Email Sender Name";
                        if Employee."E-Mail" <> '' then;
                        //   SMTPMail.Create(SenderName, SenderEmail, Employee."E-Mail", Header, '', true);
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('Dear ' + Employee."First Name" + ' ' + Employee."Last Name" + ',');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('This is to inform you that your overtime application ' + "Application Code" + ' has been approved');// for the month of January 2014');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('Thanks & Regards');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody(SenderName);
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('<HR>');
                        // SMTPMail.AppendToBody('This is a system generated mail.');
                        // SMTPMail.AppendToBody('<br><br>');
                        // SMTPMail.AppendToBody('All Enquires regarding wages should be sent to HR@kerra.go.ke');
                        // SMTPMail.AppendToBody('<br><br>');
                        //  SMTPMail.Send;
                        //MESSAGE('The email %1 for %2 is invalid',Employee."E-Mail",Employee."No.");
                        //IF EXISTS(Filename) THEN
                        //ERASE(Filename);
                    end;
            end;
        }
        field(7; "No. series"; Code[10])
        {
            Caption = 'No. series';
        }
        field(8; "Weekend Hours"; Decimal)
        {
            CalcFormula = sum("Overtime lines".Hours where("Application Code" = field("Application Code"),
                                                            "Overtime Type" = filter('2' | '1')));
            FieldClass = FlowField;
            Caption = 'Weekend Hours';
            Editable = false;
        }
        field(9; "Application Date"; Date)
        {
            Caption = 'Application Date';
        }
        field(10; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
        }
        field(11; "Dim Code 1"; Code[20])
        {
            Caption = 'Dim Code 1';
        }
        field(12; "Dim Code 2"; Code[20])
        {
            Caption = 'Dim Code 2';
        }
        field(13; "Weekday Hours"; Decimal)
        {
            CalcFormula = sum("Overtime lines".Hours where("Application Code" = field("Application Code"),
                                                            "Overtime Type" = filter('3')));
            FieldClass = FlowField;
            Caption = 'Weekday Hours';
            Editable = false;
        }
        field(14; "Total Hours"; Decimal)
        {
            CalcFormula = sum("Overtime lines".Hours where("Application Code" = field("Application Code")));
            FieldClass = FlowField;
            TableRelation = "Overtime lines".Hours where("Application Code" = field("Application Code"));
            Caption = 'Total Hours';
            Editable = false;
        }
        field(15; Converted; Boolean)
        {
            Caption = 'Converted';
        }
        field(16; "Overtime Amount"; Decimal)
        {
            CalcFormula = sum("Overtime lines"."Overtime Amount" where("Application Code" = field("Application Code")));
            FieldClass = FlowField;
            Caption = 'Overtime Amount';
            Editable = false;
        }
        field(17; "Leave Created"; Boolean)
        {
            Caption = 'Leave Created';
        }
    }

    keys
    {
        key(Key1; "Application Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin

        if "Application Code" = '' then begin
            hrsetup.Get();
            hrsetup.TestField(hrsetup."Overtime Req Nos.");
            NoSeriesMgt.InitSeries(hrsetup."Overtime Req Nos.", xRec."No. series", 0D, "Application Code", "No. series");
        end;



        /*IF usersetup.GET(USERID) THEN BEGIN
          IF NOT usersetup."Assigned to Employee" THEN
             ERROR('Your USERID should be linked to an employee account contact your system administrator');

        {Employee.GET(Employee."No.");
        Employee.CALCFIELDS(Employee.Picture);
        Picture:=Employee.Picture;
         "User ID":=USERID;
        END ELSE BEGIN
         ERROR('User id'+' '+'['+USERID+']'+' has not been assigned to any employee. Please consult the HR officer for assistance')
        END; }*/


        Employee.Reset();
        //Employee.SetRange(Employee."User ID", UserId);
        if Employee.Find('-') then
            "EMp No." := Employee."No."
        else
            Error('User id' + ' ' + '[' + UserId + ']' + ' has not been assigned to any employee. Please consult the HR officer for assistance');

        "Application Date" := Today;

        Validate("EMp No.");
        /*employee.RESET;
        employee.SETRANGE(employee."No.","EMp No.");
        IF employee.FIND('-') THEN BEGIN
        Name:=employee."First Name"+' '+employee."Middle Name"+' '+employee."Last Name";
        MODIFY
        END*/

    end;

    var
        Employee: Record Employee;
        hrsetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        OT: Record "Overtime Header";
        usersetup: Record "User Setup";
        HrLeavePeriods: Record "HR Leave Periods";
        //LeaveGjline: Record "HR Journal Line";
        "LineNo.": Integer;
        "Days Applied": Decimal;
        "Hours Earned": Decimal;
        "Amount Earned": Decimal;
        //EmpTrans: Record "Assignment Matrix-X";
        //Assignmatrix: Record "Assignment Matrix-X";
        ///PayPeriod: Record "Payroll PeriodX";
        //PayrollPeriod: Record "Payroll PeriodX";
        Month: Date;
        LeaveEntries: Record "HR Leave Ledger Entries";
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;


    procedure "Convert Overtime"()
    begin

    end;


    procedure "Convert Payroll"()
    begin
        hrsetup.Reset();
        hrsetup.Get();


        OT.Reset();
        OT.SetRange(OT."Application Code", "Application Code");
        if OT.Find('-') then begin
            OT.CalcFields(OT."Total Hours");
            Message('test, %1,%2', "Application Code", OT."Total Hours");
            "Amount Earned" := OT."Total Hours" * hrsetup."Amount Per Hour";
            //IF "Hours Earned">0 THEN
            //"Days Applied":="Hours Earned"/8;
        end;

        // if "Amount Earned" <> 0 then begin
        //     EmpTrans.Reset;
        //     EmpTrans.SetRange(EmpTrans."Employee No", "EMp No.");

        //     if EmpTrans.Find('-') then begin
        //         EmpTrans.Init;
        //         EmpTrans."Employee No" := "EMp No.";
        //         /*EmpTrans."Transaction Code":=
        //         EmpTrans."Period Month":=
        //         EmpTrans."Period Year":=
        //         EmpTrans."Transaction Name":=*/
        //         EmpTrans.Amount := "Amount Earned";

        //         EmpTrans.Insert;


        //     end

        // end

    end;
}

