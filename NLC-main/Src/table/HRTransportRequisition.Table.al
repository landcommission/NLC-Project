#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193487 "HR Transport Requisition"
{
    DrillDownPageId = "HR Transport Requisition List";
    LookupPageId = "HR Transport Requisition List";
    Caption = 'HR Transport Requisition';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Transport Request No"; Code[20])
        {
            Caption = 'Transport Request No';
            trigger OnValidate()
            begin

                //TEST IF MANUAL NOs ARE ALLOWED
                if "Transport Request No" <> xRec."Transport Request No" then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(HRSetup."Transport Req Nos");
                    "No series" := '';
                end;
            end;
        }
        field(4; "Days Applied"; Decimal)
        {
            Caption = 'Days Applied';
            trigger OnValidate()
            var
                TDays: Decimal;
            begin
                if ("Days Applied" <> 0) and ("Start Date" <> 0D) then begin
                    TDays := "Days Applied" + "Days Added";
                    "Return Date" := DetermineLeaveReturnDate("Start Date", TDays);
                    // "End Date" := DeterminethisLeaveEndDate("Return Date");
                    //Modify();
                    if "Add Days ?" = true then
                        rec."Days Added By" := UserId
                    else
                        rec."Days Added By" := '';
                end;


            end;
        }
        field(5; "Start Date"; Date)
        {
            Caption = 'Start Date';
            trigger OnValidate()
            var
                TDays: Decimal;
            begin
                dimval.Reset();
                dimval.SetRange(dimval.Code, County);
                dimval.SetRange(dimval."Dimension Code", 'COUNTY');
                if dimval.Find('-') then
                    BookingPeriod := dimval."Transport Booking Period";

                newStartDate := CalcDate(BookingPeriod, Today);

                if newStartDate > "Start Date" then
                    Error('The date must be ' + Format(newStartDate) + ' or later ');

                if ("Days Applied" <> 0) and ("Start Date" <> 0D) then begin
                    TDays := "Days Applied" + "Days Added";
                    "Return Date" := DetermineLeaveReturnDate("Start Date", TDays);
                    // "End Date" := DeterminethisLeaveEndDate("Return Date");
                    Modify();
                end;


            end;
        }
        field(6; "Return Date"; Date)
        {
            Caption = 'Return Date';
            Editable = false;
        }
        field(7; "Application Date"; Date)
        {
            Caption = 'Application Date';
        }
        field(8; Status; Option)
        {
            OptionCaption = 'New,Pending Approval,Rejected,Approved,Released';
            OptionMembers = New,"Pending Approval",Rejected,Approved,Released;
            Caption = 'Status';
            trigger OnValidate()
            var
                myInt: Integer;
                HREmployee: Record "HR Employees";
                TranspotAll: Record "HR Transport Allocations H";
                CompanyVeh: Record "Company Vehicles";
            begin
                if rec.Status = rec.Status::Approved then begin
                    TranspotAll.Reset();
                    TranspotAll.SetRange("Transport Allocation No", Rec."Transport Request No");
                    if TranspotAll.FindFirst() then begin
                        repeat
                            HREmployee.Reset();
                            HREmployee.SetRange("No.", TranspotAll."Assigned Driver");
                            if HREmployee.FindFirst() then begin
                                HREmployee."Vehicle Allocated" := true;
                                HREmployee.Modify();
                            end;
                            CompanyVeh.Reset();
                            CompanyVeh.SetRange("Registration No.", TranspotAll."Vehicle Reg Number");
                            if CompanyVeh.FindFirst() then begin
                                CompanyVeh.Allocated := true;
                                CompanyVeh.Modify();
                            end;
                        until TranspotAll.Next() = 0;
                    end;


                end;
            end;
        }

        field(15; "Applicant Comments"; Text[250])
        {
            Caption = 'Applicant Comments';
        }
        field(17; "No series"; Code[30])
        {
            Caption = 'No series';
        }
        field(28; Selected; Boolean)
        {
            Caption = 'Selected';
        }
        field(3900; "End Date"; Date)
        {
            Editable = false;
            Caption = 'End Date';
        }
        field(3921; "E-mail Address"; Date)
        {
            Editable = false;
            Caption = 'E-mail Address';
        }
        field(3924; "Entry No"; Integer)
        {
            Caption = 'Entry No';
        }
        field(3936; "Cell Phone Number"; Text[50])
        {
            Caption = 'Cell Phone Number';
        }
        field(3937; "Request Leave Allowance"; Boolean)
        {
            Caption = 'Request Leave Allowance';
        }
        field(3940; Names; Text[100])
        {
            Caption = 'Names';
        }
        field(3942; "Leave Allowance Entittlement"; Boolean)
        {
            Caption = 'Leave Allowance Entittlement';
        }
        field(3943; "Leave Allowance Amount"; Decimal)
        {
            Caption = 'Leave Allowance Amount';
        }
        field(3945; "Details of Examination"; Text[200])
        {
            Caption = 'Details of Examination';
        }
        field(3947; "Date of Exam"; Date)
        {
            Caption = 'Date of Exam';
        }
        field(3952; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(3955; "Supervisor Email"; Text[30])
        {
            Caption = 'Supervisor Email';
        }
        field(3958; "Job Tittle"; Text[50])
        {
            Caption = 'Job Tittle';
        }
        field(3959; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }
        field(3961; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
        }
        field(3962; Supervisor; Code[20])
        {
            Caption = 'Supervisor';
        }
        field(3963; "Responsibility Center"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Department';
            CaptionClass = '1,1,2';

            trigger OnValidate()
            var
                myInt: Integer;
                Responsblece: Record "Dimension Value";
            begin
                Responsblece.Reset();
                Responsblece.SetRange(Code, Rec."Responsibility Center");
                if Responsblece.FindFirst() then
                    "Department Name" := Responsblece.Name;

            end;
        }
        field(3964; Comment; Boolean)
        {
            Caption = 'Comment';
        }
        field(3965; "Purpose of Trip"; Text[50])
        {
            Caption = 'Purpose of Trip';
        }
        field(3966; "Transport type"; Code[10])
        {
            Caption = 'Transport type';
        }
        field(3967; "Time of Trip"; Time)
        {
            Caption = 'Time of Trip';
        }
        field(3968; "Time of Return"; Time)
        {
            Caption = 'Time of Return';
        }
        field(3969; "Trip From Destination"; Text[30])
        {
            Caption = 'Trip From Destination';
        }
        field(3970; "Trip To Destination"; Text[30])
        {
            Caption = 'Trip To Destination';
        }
        field(3971; "Trip Return Pickup From"; Text[30])
        {
            Caption = 'Trip Return Pickup From';
        }
        field(3972; "Trip Return Destination"; Text[30])
        {
            Caption = 'Trip Return Destination';
        }
        field(3973; Hotel; Text[50])
        {
            Caption = 'Hotel';
        }
        field(3974; "Reference No."; Code[30])
        {
            Caption = 'Reference No.';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                "Captured by" := UserId;

            end;
        }
        field(3975; "Number of Employees"; Integer)
        {
            Caption = 'Number of Employees';
        }
        field(3976; Allocated; Boolean)
        {
            Caption = 'Allocated';
        }
        field(3977; "Station Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Station Code';
        }
        field(3978; MyRecId; RecordId)
        {
            Caption = 'MyRecId';
        }
        field(3979; County; Code[50])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('COUNTY'));
            Caption = 'County';
            trigger OnValidate()
            begin
                dimval.Reset();
                dimval.SetRange(dimval.Code, County);
                dimval.SetRange(dimval."Dimension Code", 'COUNTY');
                if dimval.Find('-') then begin
                    "County Description" := dimval.Name;
                    "Trip To Destination" := dimval.Name;
                    BookingPeriod := dimval."Transport Booking Period";
                end;
            end;
        }
        field(3980; "County Description"; Text[50])
        {
            Editable = false;
            Caption = 'County Description';
        }
        field(3981; "Vehicle Allocated"; Code[30])
        {
            TableRelation = "Company Vehicles"."Registration No."
            where("Wheelchair Accessible" = field("Wheelchair Accessible"),
                                                    Allocated = filter(false));
            Caption = 'Vehicle Type';
            trigger OnValidate()
            var
                Vehicletype: Record "Company Vehicles";
            begin
                Vehicletype.Reset();
                Vehicletype.SetRange(Vehicletype."Registration No.", Rec."Vehicle Allocated");
                if Vehicletype.FindFirst() then
                    Rec."Vehicle Description" := Vehicletype.Description;
            end;

        }
        field(3982; "Vehicle Description"; Text[80])
        {
            Caption = 'Vehicle Description';

        }
        field(3983; Driver; Code[20])
        {
            TableRelation = "HR Employees" where("Job Title" = filter('*Driver*'));
            Caption = 'Driver';
            trigger OnValidate()
            begin

                if Empl.Get(Driver) then
                    // BEGIN
                    "Driver Name" := Empl."First Name" + ' ' + Empl."Middle Name" + ' ' + Empl."Last Name";

                TestField("Vehicle Allocated");

                /*{
                 IF Status<>Status::Released THEN
               ERROR('You are not allowed to assign a driver when the transport request has not been approved');

               IF Empl.GET(Driver) THEN
              // BEGIN
               "Driver Name":=Empl."First Name"+' '+Empl."Middle Name"+' '+Empl."Last Name";

               TESTFIELD("Vehicle Allocated");

              TravellingEmployees.RESET;
              TravellingEmployees.SETRANGE(TravellingEmployees."Request No.","Request No.");
              IF TravellingEmployees.FIND('-') THEN
              BEGIN
               REPEAT
               UserSetup.RESET;
               UserSetup.SETRANGE(UserSetup."Employee No.",TravellingEmployees."Employee No.");
               IF UserSetup.FIND('-') THEN
               BEGIN
               //  MESSAGE(UserSetup."E-Mail");
                 UserSetup.TESTFIELD(UserSetup."E-Mail");
                Recipients:=UserSetup."E-Mail";

                CompanyInfo.GET();
                SenderName:=COMPANYNAME;
                SenderAddress:=CompanyInfo."HR Support Email";
               // Destination:="Local Destination";

                Subject:='Vehicle Allocation for Transport Request '+"Request No.";
                Body:='This is to inform you that you have been allocated Vehicle No '+"Vehicle Allocated"+', '+"Vehicle Description"+' and Driver '+"Driver Name"+' for the trip to '+Destination;
                SMTPSetup.CreateMessage(SenderName,SenderAddress,Recipients,Subject,Body,TRUE);
                SMTPSetup.Send;
                END;
               UNTIL TravellingEmployees.NEXT=0;
              END;
              }*/

            end;
        }
        field(3984; "Driver Name"; Text[50])
        {
            Caption = 'Driver Name';
        }
        field(3985; "Taxi Company"; Text[50])
        {
            Caption = 'Taxi Company';

        }
        field(3986; Taxi; Boolean)
        {
            Caption = 'Taxi';

        }
        field(3987; "Wheelchair Accessible"; Boolean)
        {
            Caption = 'Wheelchair Accessible';
        }
        field(400; "Department Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(401; Released; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(402; "Captured by"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(403; "Estimated Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if xRec."Estimated Cost" <> rec."Estimated Cost" then begin
                    rec."Last Modified By" := UserId;
                    rec.Modify();
                end;
            end;
        }
        field(404; "Last Modified By"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(405; "Add Days ?"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if rec."Add Days ?" = true then
                    "Days Added By" := UserId
                else
                    Rec."Days Added By" := '';

            end;
        }
        field(406; "Days Added By"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(407; "Days Added"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
                TotalDays: Decimal;
            begin
                TotalDays := 0;
                rec.TestField(rec."Start Date");
                if rec."Days Added" > 0 then
                    if Confirm('Do you want to modify allocated days?') = true then begin
                        if "Start Date" <> 0D then begin
                            TotalDays := "Days Added" + "Days Applied";
                            rec."Return Date" := DetermineLeaveReturnDate("Start Date", TotalDays);
                            rec."Days Added By" := UserId;
                            rec.Modify();
                        end;
                    end;

            end;
        }

    }


    keys
    {
        key(Key1; "Transport Request No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        /*
        IF"Transport Request No" = '' THEN BEGIN
             HRSetup.GET;
             HRSetup.TESTFIELD(HRSetup."Transport Req Nos");
             NoSeriesMgt.InitSeries(HRSetup."Transport Req Nos",xRec."No series",0D,HRSetup."Transport Req Nos",xRec."No series");
        END;
        */


        //No. Series
        if "Transport Request No" = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Transport Req Nos");
            NoSeriesMgt.InitSeries(HRSetup."Transport Req Nos", xRec."No series", 0D, "Transport Request No", "No series");
        end;

        /*
        HREmp.RESET;
        HREmp.SETRANGE(HREmp."User ID",USERID);
        IF HREmp.FIND('-') THEN
        BEGIN
            HREmp.TESTFIELD(HREmp."Responsibility Center");
            "Responsibility Center":=HREmp."Responsibility Center";
        END ELSE
        BEGIN
            ERROR('UserID %1 not linked to a staff in HR Employees table',USERID );
        END;
        */


        MyRecRef.GetTable(Rec);
        MyRecId := MyRecRef.RecordId;

    end;

    trigger OnModify()
    var
        myInt: Integer;
    begin
        //"Captured by" := UserId;

    end;

    var
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        varDaysApplied: Integer;
        HREmp: Record "HR Employees";
        HREmailParameters: Record "HR E-Mail Parameters";
        SMTP: Integer;
        //SMTPMail: Codeunit "SMTP Mail";
        Text003: Label 'UserID [%1] does not exist in [%2]';
        MyRecRef: RecordRef;
        Empl: Record "HR Employees";
        dimval: Record "Dimension Value";
        BookingPeriod: DateFormula;

        newStartDate: Date;


    procedure DetermineLeaveReturnDate(var fBeginDate: Date; var fDays: Decimal) fReturnDate: Date
    begin
        varDaysApplied := fDays;
        fReturnDate := fBeginDate;
        repeat
            fReturnDate := CalcDate('1D', fReturnDate);
            if DetermineIfIsNonWorking(fReturnDate) then
                varDaysApplied := varDaysApplied + 1
            else
                varDaysApplied := varDaysApplied;
            varDaysApplied := varDaysApplied - 1

        until varDaysApplied = 0;
        exit(fReturnDate);

    end;


    procedure DetermineIfIsNonWorking(var bcDate: Date) Isnonworking: Boolean
    var
        Customized: Record "HR Calendar List";
    begin

        Customized.Reset();
        Customized.SetRange(Customized.Date, bcDate);
        if Customized.Find('-') then
            if Customized."Non Working" = true then
                exit(true)
            else
                exit(false);
    end;


    procedure DetermineIfIncludesNonWorking(var fLeaveCode: Code[10]): Boolean
    begin
        /*IF HRLeaveTypes.GET(fLeaveCode) THEN BEGIN
        IF HRLeaveTypes."Inclusive of Non Working Days" = TRUE THEN
        EXIT(TRUE);
        END;
          */

    end;


    procedure CreateLeaveLedgerEntries()
    begin
        /*
      //GET OPEN LEAVE PERIOD
      HRLeavePeriods.RESET;
      HRLeavePeriods.SETRANGE(HRLeavePeriods.Closed,FALSE);
      HRLeavePeriods.FIND('-');

      HRJournalBatch.RESET;
      HRSetup.GET;
      HRJournalBatch.GET(HRSetup."Default Leave Posting Template",HRSetup."Negative Leave Posting Batch");

      //POPULATE JOURNAL LINES
      HRJournalLine.RESET;
      HRJournalLine.SETRANGE(HRJournalLine."Journal Template Name",HRSetup."Default Leave Posting Template");
      HRJournalLine.SETRANGE(HRJournalLine."Journal Batch Name",HRSetup."Negative Leave Posting Batch");
      IF NOT HRJournalLine.FIND('-') THEN
        HRJournalLine."Line No." := 1000
      ELSE
        HRJournalLine.DELETEALL;
        HRJournalLine."Line No." := HRJournalLine."Line No." + 1000;

      "LineNo.":= HRJournalLine."Line No.";

      HRJournalLine.INIT;
      HRJournalLine."Journal Template Name":=HRSetup."Default Leave Posting Template";
      HRJournalLine."Journal Batch Name":=HRSetup."Negative Leave Posting Batch";
      HRJournalLine."Line No.":="LineNo.";
      HRJournalLine."Leave Period":=HRLeavePeriods."Period Code";
      HRJournalLine."Document No.":="Application Code";
      HRJournalLine."Staff No.":="Employee No";
      HRJournalLine.VALIDATE(HRJournalLine."Staff No.");
      HRJournalLine."Posting Date":=TODAY;
      HRJournalLine."Leave Entry Type":=HRJournalLine."Leave Entry Type"::Negative;
      HRJournalLine."Leave Approval Date":=TODAY;
      HRJournalLine.Description:=HRJournalBatch."Posting Description";
      HRJournalLine."Leave Type":="Leave Type";
      //HRJournalLine."Leave Period Start Date":=HRLeavePeriods."Start Date";
      //HRJournalLine."Leave Period End Date":=HRLeavePeriods."End Date";
      HRJournalLine."No. of Days":="Days Applied";

      HRJournalLine.INSERT(TRUE);

      //Post Journal
      HRJournalLine.RESET;
      HRJournalLine.SETRANGE("Journal Template Name",HRSetup."Default Leave Posting Template");
      HRJournalLine.SETRANGE("Journal Batch Name",HRSetup."Negative Leave Posting Batch");
      IF HRJournalLine.FIND('-') THEN BEGIN
          CODEUNIT.RUN(CODEUNIT::"HR Leave Jnl.-Post",HRJournalLine);
          //Notify Leave Applicant
          NotifyApplicant;
      END;
      //Mark document as posted
      Posted:=TRUE;
      "Posted By":=USERID;
      "Date Posted":=TODAY;
      "Time Posted":=TIME;
                   */

    end;


    procedure NotifyApplicant()
    begin
        /*
        HREmp.GET("Employee No");
        HREmp.TESTFIELD(HREmp."Company E-Mail");

        HREmailParameters.RESET;
        HREmailParameters.GET(HREmailParameters."Associate With"::"Leave Notifications");
        SMTP.CreateMessage(HREmailParameters."Sender Name",HREmailParameters."Sender Address",HREmp."Company E-Mail",
        HREmailParameters.Subject,'Dear'+' '+ HREmp."First Name" +' '+
        HREmailParameters.Body+' '+"Application Code"+' '+ HREmailParameters."Body 2",TRUE);
        SMTP.Send();
        //MESSAGE('Leave applicant has been notified successfully');
                     */

    end;

    local procedure GetApplicantSupervisor(EmpUserID: Code[50]) SupervisorID: Code[10]
    var
        UserSetup: Record "User Setup";
        UserSetup2: Record "User Setup";
        HREmp2: Record "HR Employees";
    begin
        SupervisorID := '';

        UserSetup.Reset();
        if UserSetup.Get(EmpUserID) then begin
            UserSetup.TestField(UserSetup."Approver ID");

            //Get supervisor e-mail
            UserSetup2.Reset();
            if UserSetup2.Get(UserSetup."Approver ID") then begin
                UserSetup2.TestField(UserSetup2."E-Mail");
                Supervisor := UserSetup."Approver ID";
                "Supervisor Email" := UserSetup2."E-Mail";
            end;

        end else
            Error(Text003, EmpUserID, UserSetup.TableCaption);
    end;
}
