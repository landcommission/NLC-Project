#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193870 "HR Disciplinary Cases NCA"
{
    Caption = 'HR Disciplinary Cases NCA';
    DataClassification = CustomerContent;
    //LookupPageID = UnknownPage39005654;

    fields
    {
        field(1; "Case Number"; Code[20])
        {
            Caption = 'Case Number';
        }
        field(3; "Date of Complaint"; Date)
        {
            Caption = 'Date of Complaint';
            trigger OnValidate()
            begin

                if "Date of Complaint" <> 0D then
                    Year := Date2DMY("Date of Complaint", 3);
            end;
        }
        field(4; "Type Complaint"; Code[20])
        {
            NotBlank = true;
            TableRelation = "HR Lookup Values".Code where(Type = const("Disciplinary Case"));
            Caption = 'Type Complaint';
        }
        field(5; "Recommended Action"; Code[30])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const("Disciplinary Action"));
            Caption = 'Recommended Action';
        }
        field(6; "Description of Complaint"; Text[250])
        {
            Caption = 'Description of Complaint';
        }
        field(7; Accuser; Code[30])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Accuser';
            trigger OnValidate()
            begin
                rec.TestField("Case Number");
                if "Accused Employee" = Accuser then
                    Error('An employee cannot accuse his/her self');

                Emp.Reset();
                Emp.SetRange(Emp."No.", Accuser);
                if Emp.Find('-') then begin
                    "Accuser Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                end;


            end;
        }
        field(10; "Action Taken"; Code[30])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const("Disciplinary Action"));
            Caption = 'Action Taken';
        }
        field(11; "Date To Discuss Case"; Date)
        {
            Caption = 'Date To Discuss Case';
            trigger OnValidate()
            begin
                if "Date To Discuss Case" < Today then
                    Error('Date to discuss case cannot be earlier than today')
            end;
        }
        field(12; "Document Link"; Text[200])
        {
            Caption = 'Document Link';
        }
        field(13; "Disciplinary Remarks"; Code[50])
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
        field(16; "Body Handling The Complaint"; Code[100])
        {
            TableRelation = "HR Committees".Code;
            Caption = 'Body Handling The Complaint';
        }
        field(17; Recomendations; Code[10])
        {
            Caption = 'Recomendations';
        }
        field(18; "HR/Payroll Implications"; Integer)
        {
            Caption = 'HR/Payroll Implications';
        }
        field(19; "Support Documents"; Option)
        {
            OptionMembers = Yes,No;
            Caption = 'Support Documents';
        }
        field(20; "Policy Guidlines In Effect"; Code[10])
        {
            TableRelation = "HR Policies".Code;
            Caption = 'Policy Guidlines In Effect';
        }
        field(22; "Mode of Lodging the Complaint"; Text[30])
        {
            Caption = 'Mode of Lodging the Complaint';
        }
        field(23; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(24; "Accused Employee"; Code[30])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Accused Employee';
            trigger OnValidate()
            begin
                rec."Description of Complaint" := '';
                rec.Accuser := '';
                Rec."Accuser Name" := '';
                rec.Response := '';
                rec."Case Number" := '';
                rec."Disciplinary Stage Status" := rec."Disciplinary Stage Status"::Reported;
                Emp.Reset();
                Emp.SetRange(Emp."No.", "Accused Employee");
                if Emp.Find('-') then begin
                    "Accused Employee Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                    rec."Responsibility Center" := Emp."Responsibility Center";
                    Rec."Accussed Email" := Emp."E-Mail";
                    Validate("Date of Complaint")
                end;
            end;
        }
        field(25; Selected; Boolean)
        {
            Caption = 'Selected';
        }
        field(26; "Closed By"; Code[80])
        {
            Caption = 'Closed By';
        }
        field(3963; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center BR NEW";
            Caption = 'Responsibility Center';
        }
        field(3964; "Accuser Name"; Text[40])
        {
            Caption = 'Accuser Name';
        }
        field(3967; "Disciplinary Stage Status"; Option)
        {
            Editable = false;
            OptionCaption = ' ,Reported,Under Review,Inprogress,Closed,Appealled';
            OptionMembers = " ",Reported,"Under Review",Inprogress,Closed,Appealled;
            Caption = 'Disciplinary Stage Status';
        }
        field(3969; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }
        field(3970; "Accused Employee Name"; Text[100])
        {
            Caption = 'Accused Employee Name';
        }
        field(3971; "Accussed By"; Option)
        {
            OptionMembers = Employee,"Non-Employee";
            Caption = 'Accussed By';
        }
        field(3973; Appealed; Boolean)
        {
            Caption = 'Appealed';
        }
        field(50000; "Date of Complaint was Reported"; Date)
        {
            Caption = 'Date of Complaint was Reported';
        }
        field(50002; "Review Findings"; Text[250])
        {
            Caption = 'Review Findings';
        }
        field(50005; "Preliminary Action"; Code[30])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const("Disciplinary Action"));
            Caption = 'Preliminary Action';
        }
        field(50006; "Preliminary Action Date"; Date)
        {
            Caption = 'Preliminary Action Date';
        }
        field(50007; "Employee Defence"; Text[250])
        {
            Caption = 'Employee Defence';
        }
        field(50008; Year; Integer)
        {
            Editable = false;
            Caption = 'Year';
        }
        field(50011; "Date Of Appeal"; Date)
        {
            Caption = 'Date Of Appeal';
        }
        field(50016; "Response"; Text[100])
        {
            Caption = 'Response';
        }
        field(400; "Date Closed"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(401; "Document No."; Code[40])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            trigger OnValidate()
            var
                myInt: Integer;
                SeriesSetup: Record "HR Setup";
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                if "Document No." <> xRec."Document No." then begin
                    SeriesSetup.Get;
                    NoSeriesMgt.TestManual(SeriesSetup."Disciplinary Cases Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(402; "Accussed Email"; Text[90])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin
        if "Disciplinary Stage Status" <> "Disciplinary Stage Status"::" " then
            Error('You cannot delete a Case in Process');
    end;

    trigger OnInsert()
    begin
        //GENERATE NEW NUMBER FOR THE DOCUMENT
        if "Document No." = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Disciplinary Cases Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Disciplinary Cases Nos.", xRec."No. Series", 0D, rec."Document No.", "No. Series");
        end;
        rec."User ID" := UserId;
        rec."Date of Complaint" := Today;
    end;

    trigger OnModify()
    begin
        /*IF Status=Status::"" THEN
        ERROR('You cannot modify a case Under Investigation');
         */


        // if rec."Disciplinary Stage Status" = re."Disciplinary Stage Status"::Closed then
        //     Error('You cannot modify a closed Case');

    end;

    var
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Emp: Record "HR Employees";
        CommRec: Record "HR Commitee Members";
        HRDisciplinary: Record "HR Disciplinary Cases NCA";
        Comm: Record "HR Committees";
}
