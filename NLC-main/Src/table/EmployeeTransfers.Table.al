#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69055 "Employee Transfers"
{
    LookupPageId = "Employee Transfer List";
    DrillDownPageId = "Employee Transfer List";

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Employees"."No.";
            trigger OnValidate()
            begin
                rec."Created By" := UserId;
                "New Sattion Name" := '';
                "New Station" := '';
                Employee.Reset();
                Employee.SetRange("No.", "Employee No");
                if Employee.FindFirst() then begin
                    rec."Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    rec."Job Title" := Employee."Job Title";
                    if Employee.Disabled = Employee.Disabled::Yes then
                        Rec.PLWD := true
                    else
                        Rec.PLWD := false;

                    //Employee.TestField("Current Duty Station");
                    rec."Original Station" := Employee."Current Duty Station";
                    rec."PREV Transfer Date" := Employee."EMP Transfer Date";
                    rec."PREV Reporting Date" := Employee."EMP Reporting Date";
                    rec."PREV Actual Reporting Date" := Employee."EMP Actual Reporting Date";
                    if (Rec.Type = Rec.Type::"Self initiated") and (Employee."EMP Actual Reporting Date" <> 0D) then begin
                        Hrsetup.get;
                        ExpectedDate := CalcDate(Hrsetup."Minimum Station Yrs of Service", Employee."EMP Actual Reporting Date");
                        if ExpectedDate > TODAY THEN BEGIN
                            ERROR('ERROR! You must have served for atleast %1 on the current station', Hrsetup."Minimum Station Yrs of Service");
                        END;
                    end;
                    Employee2.reset();
                    Employee2.SetRange("Current Duty Station", Employee."Current Duty Station");
                    Employee2.SetRange("Head of Station", true);
                    if employee2.FINDFIRST() then BEGIN
                        Rec."HOS PJ No" := employee2."No.";
                    END;
                    rec.Email := Employee."Company E-Mail";
                    rec.PLWD := Employee.Disabled = Employee.Disabled::Yes;
                    rec.Gender := Employee.Gender;
                    rec.Designation := Employee."Job Title";
                    REC."Original Station Name" := Employee."County Name";
                    rec."Job Grade" := Employee."Salary Grade";
                    //rec."Requesting Station" := Employee."Current Duty Station";
                    rec.Age := Employee.Age;
                    // Rec.Validate("Original Station");
                end;
            end;
        }
        field(3; "Employee Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Original Station"; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Current Station Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Editable = false;
            // DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;
                DimesonsionVA: Record "Dimension Value";
            begin
                DimesonsionVA.Reset();
                DimesonsionVA.SetRange(Code, Rec."Original Station");
                if DimesonsionVA.FindFirst() then
                    Rec."Original Station Name" := DimesonsionVA.Name;
            end;
        }
        field(5; "New Station"; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'New Station Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            trigger OnValidate()
            var
                myInt: Integer;
                Dimensi: Record "Dimension Value";
            begin
                Dimensi.Reset();
                Dimensi.SetRange(Code, rec."New Station");
                if Dimensi.FindFirst() then begin
                    rec."New Sattion Name" := Dimensi.Name;
                    rec."To Hardship Area?" := Dimensi."Hardship Area";
                end;
                EMPTRANS.Reset();
                EMPTRANS.SetRange("Employee No", Rec."Employee No");
                EMPTRANS.SetRange(Posted, true);
                EMPTRANS.SetRange("Original Station", Rec."New Station");
                if EMPTRANS.FindFirst() then begin
                    ERROR('ERROR! No staff goes back to the station where he/she has served');
                end;
                IF DutyStation."Hardship Area" = TRUE THEN BEGIN
                    EMPTRANS.Reset();
                    EMPTRANS.SetRange("Employee No", Rec."Employee No");
                    EMPTRANS.SetRange(Posted, true);

                    EMPTRANS.SetRange("To Hardship Area?", true);
                    if EMPTRANS.FindFirst() then begin
                        ERROR('ERROR! No staff goes back to another hardship area after serving there');
                    end;
                END;
                IF Rec."New Station" = Rec."Original Station" THEN begin
                    ERROR('ERROR! This is the Current Station that the staff is stationed at');
                end;

            end;
        }
        field(6; "Original Station Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Current Station Name';
            Editable = false;


        }
        field(7; "New Sattion Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'New Station Name';
            Editable = false;
        }
        field(8; "Transfer Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Transfered By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "To Hardship Area?"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released,Rejected,Awaiting HOS,HOS Confirmed,Pending HOD Reccomendation,Pending Mobility Officer,Pending Head of Mobility,Pending HR Approval';
            OptionMembers = Open,"Pending Approval",Released,Rejected,"Awaiting HOS","HOS Confirmed","Pending HOD Reccomendation","Pending Mobility Officer","Pending Head of Mobility","Pending HR Approval";
            trigger OnValidate()
            var
                HRRec: Record "HR Employees";
                TransferLines: Record "Employee Transfers";
                PRSalary: Record "PR Employee Transactions";
                LinesRec: Record "HR Employee Transfer Lines";
                InsrtLines: Record "HR Employee Transfer Lines";
                LineNo: Integer;
                JobHistory: Record "HR Employee Info Change";
                PayrolChanges: Record "Payroll Changes";
                SetHrp: Record "HR Setup";
                PayReqLine: Record "Payroll Change Request Line";
                DocNo: Code[30];
                PayrollRec: Record "PR Payroll Periods";
                Emp: Record "HR Employees";
            begin
                // if Status = Status::"Pending Approval" then begin
                //     InsrtLines.Reset();
                //     if InsrtLines.FindLast() then
                //         LineNo := InsrtLines."Line No" + 1;
                //     InsrtLines.Reset();
                //     InsrtLines.Init();
                //     InsrtLines."Request No" := "Document No";
                //     InsrtLines."Line No" := LineNo;
                //     InsrtLines."Employee No" := rec."Employee No";
                //     InsrtLines.Validate(InsrtLines."Employee No");
                //     // InsrtLines."New Designation" := Rec."New Station";
                //     // InsrtLines.Validate(InsrtLines."New Designation");
                //     InsrtLines."New Global Dimension 1 Code" := Rec."New Station";
                //     InsrtLines.Validate(InsrtLines."New Global Dimension 1 Code");
                //     InsrtLines.Insert();
                // end;
                DocNo := '';
                if Status = Status::Released then begin
                    TransferLines.Reset();
                    TransferLines.SetRange("Document No", rec."Document No");
                    if TransferLines.FindFirst() then begin
                        HRRec.Reset();
                        HRRec.SetRange("No.", TransferLines."Employee No");
                        if HRRec.FindFirst() then begin

                            // if TransferLines."Job Title" <> '' then begin
                            //     HRRec."Job Title" := TransferLines."Job Title";
                            //     HRRec.Validate("Job ID");
                            // end;
                            // HRRec."Job Title" := TransferLines."New Job ID Name";
                            HRRec."Current Duty Station" := TransferLines."New Sattion Name";
                            HRRec.County := TransferLines."New Station";
                            HRRec."County Name" := TransferLines."New Sattion Name";
                            HRRec."EMP Transfer Date" := TransferLines."Request Date";
                            HRRec."Salary Grade" := TransferLines."Job Grade";
                            HRRec."Last Date Modified" := Today;
                            LinesRec.Reset();
                            LinesRec.SetRange("Employee No", TransferLines."Employee No");
                            if LinesRec.FindFirst() then begin
                                if LinesRec."From payroll Period" = 0D then
                                    Error('Payroll Period must have  a value');
                                PayrolChanges.Reset();
                                if PayrolChanges.FindLast() then begin
                                    SetHrp.Get;
                                    SetHrp.TestField(SetHrp."Payroll Change Nos.");
                                    DocNo := NoSeriesMgt.GetNextNo(SetHrp."Payroll Change Nos.", 0D, True);
                                    PayrolChanges.Init();
                                    PayrolChanges."Payroll Change No" := DocNo;
                                    PayrolChanges."Payroll Period" := LinesRec."From payroll Period";
                                    PayrollRec.Reset();
                                    PayrollRec.SetRange(PayrollRec."Date Opened", LinesRec."From payroll Period");
                                    if PayrollRec.Find('-') then begin
                                        PayrolChanges."Period Month" := PayrollRec."Period Month";
                                        PayrolChanges."Period Year" := PayrollRec."Period Year";
                                    end;
                                    PayrolChanges."Date Requested" := Today;
                                    PayrolChanges.Type := PayrolChanges.Type::"New Staff";
                                    PayrolChanges.Narration := 'This is for Inserting New Employee Earnings and Deductions in the System';
                                    PayrolChanges.Narrations := 'This is for Inserting New Employee Earnings and Deductions in the System';
                                    PayrolChanges."User ID" := UserId;
                                    PayReqLine.Reset();
                                    if PayReqLine.FindLast() then begin
                                        PayReqLine.Init();
                                        PayReqLine."Payroll Change No" := DocNo;
                                        PayReqLine."Employee Code" := LinesRec."Employee No";
                                        if Emp.Get(LinesRec."Employee No") then begin
                                            PayReqLine.Status := Emp.Status;
                                            PayReqLine."Employee Name" := Emp."Full Name";
                                            PayReqLine."New Status" := PayReqLine."New Status"::Inactive;
                                        end;
                                        PayReqLine."Change Type" := PayReqLine."Change Type"::Income;
                                        PayReqLine."Effective Payroll Period" := LinesRec."From payroll Period";
                                        PayReqLine."New Value" := LinesRec.Amount;
                                        PayReqLine.Insert();
                                    end;
                                    PayrolChanges.Insert();

                                end;

                                //PRSalary.SetRange(PRSalary."Payroll Period", LinesRec."From payroll Period");
                                // if not PRSalary.Find('-') then begin
                                //     PRSalary.Init();
                                //     PRSalary."Employee Code" := LinesRec."Employee No";
                                //     PRSalary."Payroll Period" := LinesRec."From payroll Period";
                                //     PRSalary."Transaction Code" := LinesRec."Transaction Code";
                                //     PRSalary."Transaction Name" := LinesRec."Transaction Name";
                                //     PRSalary.Amount := LinesRec.Amount;
                                //     PRSalary."Period Month" := LinesRec."Period Month";
                                //     PRSalary."Period Year" := LinesRec."Period Year";
                                //     PRSalary.Insert();
                                // end else begin
                                //     if PRSalary.Find('-') then begin
                                //         PRSalary."Employee Code" := LinesRec."Employee No";
                                //         PRSalary."Payroll Period" := LinesRec."From payroll Period";
                                //         PRSalary."Transaction Code" := LinesRec."Transaction Code";
                                //         PRSalary."Transaction Name" := LinesRec."Transaction Name";
                                //         PRSalary.Amount := LinesRec.Amount;
                                //         PRSalary."Period Month" := LinesRec."Period Month";
                                //         PRSalary."Period Year" := LinesRec."Period Year";
                                //         PRSalary.Modify();
                                //     end;
                                // end;
                            end;
                            HRRec.Modify();
                        end;
                    end;
                    Message('Staff Transfferred successfully');
                end;
            end;
        }
        field(12; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Created By"; Code[80])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Date Created"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "Time Created"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; Distance; Decimal)
        {
            DataClassification = ToBeClassified;
            caption = 'Baggage Allowance Distance(KMs)';
        }
        field(18; Type; Option)
        {
            OptionCaption = 'Self initiated, Management initiated,...';
            OptionMembers = "Self initiated","Management initiated","...";
            Editable = false;
        }
        //Self initiated, Management initiated
        field(19; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Posted On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Remarks"; Text[1000])
        {
            DataClassification = ToBeClassified;
            caption = 'Transfer Reason';
            //TableRelation = "Transfer Reasons";
        }
        field(28; "Request Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Job Title"; Text[250])
        {
            Caption = 'Designation';
            Editable = false;
        }
        field(30; "Document Type"; Option)
        {
            OptionCaption = 'Application,Professional Opinion,Employee Requisition';
            OptionMembers = Application,"Professional Opinion","Employee Requisition";
            Editable = false;
        }
        field(31; "Requesting Station  Name"; Text[1000])
        {
            DataClassification = ToBeClassified;
            caption = 'Requesting station Name';
        }
        field(32; "Requesting Station"; Code[30])
        {
            DataClassification = ToBeClassified;
            caption = 'Requesting station code';
            TableRelation = "Duty Station".Code;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                DutyStation.Reset();
                DutyStation.SetRange(Code, "Requesting Station");
                if DutyStation.FindFirst() then
                    "Requesting Station  Name" := DutyStation.Description;


            end;
        }
        field(33; "Transfer No"; Code[30])
        {
            DataClassification = ToBeClassified;


        }
        field(34; "Professional Opinion"; Text[1000])
        {
            DataClassification = ToBeClassified;
            caption = 'HOD Recommendation';
        }
        field(35; "Transfer Reason Code"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type" = const(Application)) "Transfer Reasons"."Reason Code" where("Applicable Area" = filter(Application))
            else
            if ("Document Type" = const("Employee Requisition")) "Transfer Reasons"."Reason Code" where("Applicable Area" = filter("Employee Requisition"));
            trigger OnValidate()
            var
                myInt: Integer;
                Reason: Record "Transfer Reasons";
            begin
                Reason.Reset();
                Reason.SetRange("Reason Code", Rec."Transfer Reason Code");
                if Reason.FindFirst() then
                    Remarks := Reason.Description;
            end;
        }
        field(36; "Reporting Date"; Date)
        {
            DataClassification = ToBeClassified;
            //  Editable = false;
        }
        field(37; "Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(38; "Actual Reporting Date"; Date)
        {
            DataClassification = ToBeClassified;
            //  Editable = false;
        }
        field(70025; "PLWD"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(50115; Age; Text[80])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70027; "Transfer Appeal"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(70028; "Reason(s) for Appeal"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(70029; "Original Transfer No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70030; "Job Cadre"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Cadre Groups Setup".Code;
        }
        field(70031; "Gender"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,Female,Male,Others;
        }
        field(70032; "Designation"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(70033; "Job Grade"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Scales";
        }
        field(70034; "Job Description"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(70035; "No of Employee Requested"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(70095; "PREV Transfer Date"; date)
        {
            DataClassification = ToBeClassified;
            caption = 'Previous Station  Transfer Request Date';
        }
        field(70096; "PREV Reporting Date"; date)
        {
            DataClassification = ToBeClassified;
            caption = 'Previous Station  Reporting Date';
        }
        field(70097; "PREV Actual Reporting Date"; date)
        {
            DataClassification = ToBeClassified;
            caption = 'Previous Station Actual Reporting Date';
        }
        field(70098; "HOS PJ No"; Code[10])
        {
            DataClassification = ToBeClassified;
            caption = 'Head of Station';
            Editable = FALSE;
            TableRelation = Employee."No.";
            trigger OnValidate()
            var
                myInt: Integer;

            begin
                Employee.Reset();
                Employee.SetRange("No.", "Employee No");
                if Employee.FindFirst() then
                    "HOS Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                "HOS Job Title" := Employee."Job Title2";

            end;
        }
        field(70099; "HOS Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = FALSE;
        }
        field(70100; "HOS Job Title"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = FALSE;
        }
        field(70101; "Mobility Recommendation"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(70102; "HOD Mobility Recommendation"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(70103; "HOD HR Recommendation"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }



    }

    keys
    {
        key(Key1; "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Document No", "Employee No", "Entry No")
        {

        }
    }
    trigger OnInsert()
    begin
        if "Document No" = '' then begin
            IF Rec."Document Type" = Rec."Document Type"::"Professional Opinion" then begin

                HRSetup.Get;
                HRSetup.TestField("Transfer Opinion Nos");
                NoSeriesMgt.InitSeries(HRSetup."Transfer Opinion Nos", xRec."Document No", 0D, "Document No", "No. Series");
                //   end;
            end else begin
                // if "Document No" = '' then begin
                HRSetup.Get;
                HRSetup.TestField("Employee Transfer Nos");
                NoSeriesMgt.InitSeries(HRSetup."Employee Transfer Nos", xRec."Document No", 0D, "Document No", "No. Series");


            end;
        end;
        "Created By" := UserId;
        "Time Created" := Time;
        "Date Created" := Today;
        if type <> type::"Management initiated" then begin
            usersetup.Reset();
            usersetup.SetRange("User ID", UserId);
            if usersetup.FindFirst() then
                Employee.Reset();
            Employee.SetRange("No.", usersetup."Employee No.");
            if Employee.FindFirst() then
                "Employee No" := usersetup."Employee No.";
            "Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
            "Job Title" := Employee."Job Title2";
            Email := Employee."Company E-Mail";
            PLWD := Employee.Disabled = Employee.Disabled::Yes;
            Age := Employee.Age;
            Gender := Employee.Gender;
            Designation := Employee."Job Title";
            "Job Grade" := Employee."Salary Grade";
            "Requesting Station" := Employee."Current Duty Station";
            Employee2.reset();
            Employee2.SetRange("Current Duty Station", Employee."Current Duty Station");
            Employee2.SetRange("Head of Station", true);
            if employee2.FINDFIRST() then begin
                Rec."HOS PJ No" := employee2."No.";
            end;
            Employee.TestField("Current Duty Station");
            "Original Station" := Employee."Current Duty Station";
            "PREV Transfer Date" := Employee."EMP Transfer Date";
            "PREV Reporting Date" := Employee."EMP Reporting Date";
            "PREV Actual Reporting Date" := Employee."EMP Actual Reporting Date";
            if (Rec.Type = Rec.Type::"Self initiated") and (Employee."EMP Actual Reporting Date" <> 0D) then begin
                Hrsetup.get;
                ExpectedDate := CalcDate(Hrsetup."Minimum Station Yrs of Service", Employee."EMP Actual Reporting Date");
                if ExpectedDate > TODAY then begin
                    ERROR('ERROR! You must have served for atleast %1 on the current station', Hrsetup."Minimum Station Yrs of Service");
                end;
            end;
            //Rec.Validate("Original Station");
        end;
    end;

    trigger OnModify()
    var
        myInt: Integer;
    begin
        // if Status = Status::Rejected then begin
        //     SendRejection()
        // end;
        // if Status = Status::"Awaiting HOS" then begin
        //     SendApproved()
        // end;

    end;

    var
        HRSetup: Record "Human Resources Setup";
        ExpectedDate: Date;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DutyStation: Record "Duty Station";
        financialYear: Record "Financial Year Code";
        Employee: record "HR Employees";
        employee2: record "HR Employees";
        usersetup: record "User Setup";
        EMPTRANS: Record "Employee Transfers";


    procedure SendRejection()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        EmailMessage.Create(Rec.Email, 'Employee Transfer Rejection', 'Dear ' + "Employee Name"
        + '<BR></BR>This is to notify you that your application for Station Transfer No ' + "Document No"
        + ' has been declined because of <B>' + Remarks + '</B><BR></BR>' +
        'Kindly Log into the system and check', true);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    procedure SendApproved()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Employee: Record "HR Employees";
        SendToList: List of [Text];
        SendToList2: List of [Text];
        SendToList3: List of [Text];
        OutStr: OutStream;
        InStr: InStream;
        OutStr2: OutStream;
        InStr2: InStream;
        BodyTxt: Text;
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
        BulkProcessingHead: Record "Employee Transfers";
    begin
        Rec."Reporting Date" := CalcDate('30D', TODAY);
        BulkProcessingHead.SetRange("Document No", Rec."Document No");
        RecRef.GetTable(BulkProcessingHead);
        TempBlob.CreateOutStream(OutStr);
        Report.SaveAs(Report::"Employee Transfer Letter", '', ReportFormat::Pdf, OutStr, RecRef);
        TempBlob.CreateInStream(InStr);
        InStr.ReadText(BodyTxt);


        TempBlob.CreateOutStream(OutStr2);
        Report.SaveAs(Report::"Employee Transfer Letter", '', ReportFormat::Pdf, OutStr, RecRef);
        TempBlob.CreateInStream(InStr2);
        Employee.reset();
        Employee.SetRange("Current Duty Station", Rec."New Station");
        Employee.SetRange("Head of Station", true);
        if employee.FindFirst() then
            SendToList.Add(Rec.Email);
        SendToList2.Add(Employee."Company E-Mail");
        SendToList3.Add(Employee."Company E-Mail");
        EmailMessage.Create(SendToList, 'Employee Transfer Approval', 'Dear ' + "Employee Name"
        + '<BR></BR>This is to notify you that your application for Station Transfer No ' + "Document No"
        + ' has been Approved. You are required to report to This station <B>' + "New Sattion Name" + '</B><BR></BR>' +
        'Kindly Log into the system and check', true, SendToList2, SendToList3);
        EmailMessage.AddAttachment('attachment.pdf', 'PDF', InStr2);

        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;


}

