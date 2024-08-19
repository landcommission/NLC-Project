#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69200 "HR Disciplinary Cases"
{
    DrillDownPageId = "Hr Cases Submitted ";
    LookupPageId = "Hr Cases Submitted ";
    Caption = 'HR Disciplinary Cases';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Case Number"; Code[20])
        {
            Editable = false;
            Caption = 'Case Number';
        }
        field(3; "Date of Complaint"; Date)
        {
            Caption = 'Date of Reporting';

        }
        field(4; "Type of Disciplinary Case"; Code[70])
        {
            Caption = 'Nature of the case';
            NotBlank = true;
            TableRelation = if (Type = const(Disciplinary)) "HR Models".Code where(Type = const("Disciplinary Case"))
            else
            if (Type = const(Grievance)) "HR Models".Code where(Type = const("Grievance Cause"));

            trigger OnValidate()
            begin
                HRModels.Reset();
                HRModels.SetRange(Code, "Type of Disciplinary Case");
                if HRModels.FindSet() then
                    "Case Description" := HRModels.Description;
            end;
        }
        field(5; "Recommended Action"; Code[20])
        {
            TableRelation = "HR Models".Code where(Type = const("Disciplinary Action"));
            Caption = 'Recommended Action';
        }
        field(6; "Case Description"; Text[2000])
        {
            Caption = 'Case Description';
        }
        field(7; Accuser; Code[10])
        {
            Caption = 'Originator';
            TableRelation = if ("Accuser Is Staff" = const(true)) "HR Employees"."No.";
        }
        field(8; "Witness #1"; Code[20])
        {
            TableRelation = if ("Witness#1 Staff" = const(true)) "HR Employees"."No.";
            Caption = 'Witness #1';
        }
        field(9; "Witness #2"; Code[20])
        {
            TableRelation = if ("Witness#2 Staff" = const(true)) "HR Employees"."No.";
            Caption = 'Witness #2';
        }
        field(10; "Action Taken"; Code[20])
        {
            TableRelation = if (Type = const(Disciplinary)) "Disciplinary Status Table"."Disciplinary Status"
            else
            if (Type = const(Grievance)) "HR Models".Code where(Type = const("Grievance Outcome"));
            Caption = 'Action Taken';
            trigger OnValidate()
            begin
                DisciplinaryStatusTable.Reset();
                DisciplinaryStatusTable.SetRange("Disciplinary Status", "Action Taken");
                if DisciplinaryStatusTable.FindSet() then
                    "HR/Payroll Implications" := DisciplinaryStatusTable."Deduction Code";
            end;
        }
        field(11; "Date To Discuss Case"; Date)
        {
            Caption = 'Date To Discuss Case';
        }
        field(12; "Document Link"; Text[200])
        {
            Caption = 'Document Link';
        }
        field(13; "Disciplinary Remarks"; Code[2000])
        {
            Caption = 'Disciplinary Remarks';
        }
        field(14; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(15; "Case Discussion"; Boolean)
        {
            Caption = 'Case Discussion';
        }
        field(16; "Body Handling The Complaint"; Code[250])
        {
            Caption = 'Body Handling The Case';
            TableRelation = "HR Discplinary Bodies".Code;
        }
        field(17; Recomendations; Code[250])
        {
            Caption = 'Recomendations';
        }
        field(18; "HR/Payroll Implications"; Code[20])
        {
            Caption = 'HR/Payroll Implications';
        }
        field(19; "Support Documents"; Option)
        {
            OptionMembers = Yes,No;
            Caption = 'Support Documents';
        }
        field(20; "Policy Guidlines In Effect"; Text[2000])
        {
            Caption = 'Policy Guidlines In Effect';
        }
        field(21; Status; Option)
        {
            OptionMembers = Open,Submitted,Closed,Appealed;
            Caption = 'Status';
        }
        field(22; "Mode of Lodging the Complaint"; Code[20])
        {
            Caption = 'Mode of Lodging the Case';
            TableRelation = "Mode of Lodging Case".Code;
        }
        field(23; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(24; "Employee No"; Code[30])
        {
            TableRelation = "HR Employees";
            Caption = 'Employee No';
            trigger OnValidate()
            begin
                Employee.Reset();
                Employee.SetRange("No.", "Employee No");
                if Employee.FindSet() then begin
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    Designation := Employee."Job Title";
                    //if Employee."Job Title2" <> '' then
                    //Designation := Employee."Job Title2";
                end;
            end;
        }
        field(25; Selected; Boolean)
        {
            Caption = 'Selected';
        }
        field(26; "Closed By"; Code[100])
        {
            Caption = 'Closed By';
        }
        field(27; "Case Severity"; Option)
        {
            Caption = 'Category of Discipline Case';
            OptionCaption = ' ,Misconduct,Gross Misconduct';
            OptionMembers = " ",Misconduct,"Gross Misconduct";
        }
        field(28; "Handled By"; Option)
        {
            OptionCaption = ',HCA,HOD/HOU,Committee,Court,Board';
            OptionMembers = ,HCA,"HOD/HOU",Committee,Court,Board;
            Caption = 'Handled By';
        }
        field(29; "Disciplinary Commitee"; Code[30])
        {
            Caption = 'Commitee Membership';
            TableRelation = "Commitee Appointment Voucher"."Document No.";

        }
        field(30; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
        }
        field(31; "Created By"; Code[50])
        {
            Caption = 'Created By';
        }
        field(32; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(33; "Non Staff Witness #1"; Text[250])
        {
            Caption = 'Non Staff Witness #1';
            trigger OnValidate()
            begin
                if "Witness#1 Staff" = true then
                    Error('Witness # 1 must not be a member of staff');
            end;
        }
        field(34; "Non Staff Witness #2"; Text[250])
        {
            Caption = 'Non Staff Witness #2';
            trigger OnValidate()
            begin
                if "Witness#2 Staff" = true then
                    Error('Witness # 2 must not be a member of staff');
            end;
        }
        field(35; "Non Staff Originator"; Text[250])
        {
            Caption = 'Non Staff Originator';
            trigger OnValidate()
            begin
                if "Accuser Is Staff" = true then
                    Error('Originator must not be a member of staff');
            end;
        }
        field(3963; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center".Code;// where("Blocked?" = const(false));
            Caption = 'Implementing Unit';
        }
        field(3964; "Accuser Is Staff"; Boolean)
        {
            Caption = 'Originator Is Staff';
        }
        field(3965; "Witness#1 Staff"; Boolean)
        {
            Caption = 'Witness#1 Staff';
        }
        field(3966; "Witness#2 Staff"; Boolean)
        {
            Caption = 'Witness#2 Staff';
        }
        field(3967; "Disciplinary status"; Code[30])
        {
            TableRelation = "Disciplinary Status Table"."Disciplinary Status";
            Caption = 'Disciplinary status';
        }
        field(3968; "Case Created"; Boolean)
        {
            Caption = 'Case Created';
        }
        field(3969; "Legal Case No."; Code[30])
        {
            TableRelation = "Case Register"."No.";
            Caption = 'Legal Case No.';
        }
        field(3970; "Legal Case Recommendation"; Text[2048])
        {
            CalcFormula = lookup("Case Register"."Verdict Summary" where("No." = field("Legal Case No.")));
            FieldClass = FlowField;
            Caption = 'Legal Case Recommendation';
            Editable = false;
        }
        field(3971; Brief; Text[250])
        {
            Caption = 'Brief';
        }
        field(3972; "Disciplinary Case Type"; Option)
        {
            OptionCaption = ',New,Appeal';
            OptionMembers = ,New,Appeal;
            Caption = 'Disciplinary Case Type';
        }
        field(3973; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(3974; Type; Option)
        {
            OptionCaption = ',Disciplinary,Grievance';
            OptionMembers = ,Disciplinary,Grievance;
            Caption = 'Type';
        }
        field(3975; "Appealed case No"; Code[20])
        {
            Caption = 'Appealed case No';
        }
        field(3976; "Period From"; Date)
        {
            Caption = 'Period From';
        }
        field(3977; "Period To"; Date)
        {
            Caption = 'Period To';
        }
        field(3978; "Previous Interventions"; Text[250])
        {
            Caption = 'Previous Interventions';
        }
        field(3980; Designation; Text[250])
        {
            Editable = false;
            Caption = 'Designation';
        }
        field(3981; "Date Submitted"; Date)
        {
            Editable = false;
            Caption = 'Date Submitted';
        }
        field(3982; "Time Submitted"; Time)
        {
            Editable = false;
            Caption = 'Time Submitted';
        }
        field(3983; "Submitted By"; Code[50])
        {
            Editable = false;
            Caption = 'Submitted By';
        }
        field(3984; "Has Multiple Accused Employees"; Boolean)
        {
            Caption = 'Has Multiple Accused Employees';
        }

        field(3985; "Supervisor Remarks"; Text[250])
        {
            Caption = 'Supervisor Remarks';
        }
        field(3986; "Disciplinary Officer In Charge"; Code[20])
        {
            TableRelation = "HR Employees"; //where("Is Part Of Disciplinary Team" = const(true));
            Caption = 'Disciplinary Officer In Charge';
            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                Emp.Get("Disciplinary Officer In Charge");
                "Disciplinary Officer Name" := Emp.FullName();
            end;
        }
        field(3987; "Disciplinary Officer Name"; Text[100])
        {
            Editable = false;
            Caption = 'Disciplinary Officer In Charge Name';
        }

        field(3988; "Creator Job Title"; Text[100])
        {
            Editable = false;
            Caption = 'Creator Job Title';
        }
        field(3999; "Disciplinary Stage Status"; Option)
        {
            Editable = true;
            OptionCaption = ' ,Reported,Under Investigation ,Inprogress,Closed,Under review';
            OptionMembers = " ",Reported,"Under Investigation ",Inprogress,Closed,"Under review";
            Caption = 'Disciplinary Stage Status';
        }
        field(4000; "Document No"; Code[40])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document No.';
        }


    }

    keys
    {
        key(Key1; "Employee No", "Case Number")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        //GENERATE NEW NUMBER FOR THE DOCUMENT
        if "Case Number" = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Disciplinary Cases Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Disciplinary Cases Nos.", xRec."No. Series", 0D, "Case Number", "No. Series");
            "Case Number" += Format(Today, 0, '.<Month,2>.<Year4>');
        end;
        "Document Date" := Today;
        "Created By" := UserId;

        UserSetup.Get(UserId);

        Employee.Reset();
        //Employee.SetRange(Employee."No.", UserSetup."Employee No.");
        //Employee.SetRange(HOD, True);
        Employee.FindFirst();

        "Creator Job Title" := Employee."Job Title";
        if Employee."Job Title2" <> '' then
            "Creator Job Title" := Employee."Job Title2";

    end;


    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRModels: Record "HR Models";
        UserSetup: Record "User Setup";
        Employee: Record "HR Employees";
        DisciplinaryStatusTable: Record "Disciplinary Status Table";
}

