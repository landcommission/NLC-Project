#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193489 "Clearance Certificate"
{
    Caption = 'Clearance Certificate';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Name; Text[150])
        {
            Editable = false;
            Caption = 'Name';
        }
        field(2; "P/No"; Code[50])
        {
            Caption = 'P/No';
        }
        field(3; Date; Date)
        {
            Editable = false;
            Caption = 'Date';
        }
        field(4; Designation; Code[50])
        {
            Caption = 'Designation';
        }
        field(5; Directorate; Code[50])
        {
            Caption = 'Directorate';
        }
        field(6; "Salary Advance"; Boolean)
        {
            Caption = 'Salary Advance';
        }
        field(7; Imprest; Boolean)
        {
            Caption = 'Imprest';
        }
        field(8; "Petty Cash"; Boolean)
        {
            Caption = 'Petty Cash';
        }
        field(9; "Car Loan"; Boolean)
        {
            Caption = 'Car Loan';
        }
        field(10; Mortgage; Boolean)
        {
            Caption = 'Mortgage';
        }
        field(11; "Working Tools"; Boolean)
        {
            Caption = 'Working Tools';
        }
        field(12; "Office & Desk Keys"; Boolean)
        {
            Caption = 'Office & Desk Keys';
        }
        field(13; "Car Keys"; Boolean)
        {
            Caption = 'Car Keys';
        }
        field(14; "Other Fin"; Boolean)
        {
            Caption = 'Other Fin';
        }
        field(16; "NLC ID Card"; Boolean)
        {
            Caption = 'NLC ID Card';
        }
        field(17; "Medical Card"; Boolean)
        {
            Caption = 'Medical Card';
        }
        field(18; "Leave Balance"; Boolean)
        {
            Caption = 'Leave Balance';
        }
        field(19; "Other HR"; Boolean)
        {
            Caption = 'Other HR';
        }
        field(20; "Specify HR"; Boolean)
        {
            Caption = 'Specify HR';
        }
        field(22; Laptop; Boolean)
        {
            Caption = 'Laptop';
        }
        field(23; "Ipad/Tablet"; Boolean)
        {
            Caption = 'Ipad/Tablet';
        }
        field(24; "Mobile Phone"; Boolean)
        {
            Caption = 'Mobile Phone';
        }
        field(25; "ICT & Security Clearance"; Boolean)
        {
            Caption = 'ICT & Security Clearance';
        }
        field(26; "Others ICT"; Text[150])
        {
            Caption = 'Others ICT';
        }
        field(27; Store; Boolean)
        {
            Caption = 'Store';
        }
        field(28; "Other SCM"; Text[150])
        {
            Caption = 'Other SCM';
        }
        field(29; Library; Boolean)
        {
            Caption = 'Library';
        }
        field(30; "Other Comm"; Text[100])
        {
            Caption = 'Other Comm';
        }
        field(31; LAdm; Text[100])
        {
            Caption = 'LAdm';
        }
        field(32; NLIMS; Text[100])
        {
            Caption = 'NLIMS';
        }
        field(33; Legal; Text[100])
        {
            Caption = 'Legal';
        }
        field(34; "Research & Advocacy"; Text[100])
        {
            Caption = 'Research & Advocacy';
        }
        field(35; "Natural Resource"; Text[100])
        {
            Caption = 'Natural Resource';
        }
        field(36; "Valuation & Taxation"; Text[100])
        {
            Caption = 'Valuation & Taxation';
        }
        field(37; Survey; Text[100])
        {
            Caption = 'Survey';
        }
        field(38; CLMB; Text[100])
        {
            Caption = 'CLMB';
        }
        field(39; Audit; Text[100])
        {
            Caption = 'Audit';
        }
        field(40; "Comments Finance"; Text[100])
        {
            Caption = 'Comments Finance';
        }
        field(41; "Comments HR"; Text[100])
        {
            Caption = 'Comments HR';
        }
        field(42; "Comments ICT"; Text[100])
        {
            Caption = 'Comments ICT';
        }
        field(43; "Comments Comm"; Text[100])
        {
            Caption = 'Comments Comm';
        }
        field(44; "Comments LA"; Text[100])
        {
            Caption = 'Comments LA';
        }
        field(45; "Comments NLIMS"; Text[100])
        {
            Caption = 'Comments NLIMS';
        }
        field(46; Status; Option)
        {
            Editable = false;
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
            Caption = 'Status';
            trigger OnValidate()
            var
                myInt: Integer;
                Separation: Record "Employee Separation Header";
                ExitQuasio: Record "Exit Interview Questionnaire";
                DocNo: Code[40];
                Created: Boolean;

            begin
                Created := false;
                if rec.Status = rec.Status::Approved then begin
                    Separation.Reset();
                    Separation.SetRange("Separation No.", Rec."Separation No");
                    if Separation.FindFirst() then begin
                        Separation.Cleared := true;
                        Separation.Modify();
                    end;
                    ExitQuasio.Reset();
                    ExitQuasio.Init();
                    HRSetup.Get;
                    HRSetup.TestField("Exit Questionnaire Nos.");
                    DocNo := NoSeriesMgt.GetNextNo(HRSetup."Exit Questionnaire Nos.", 0D, True);
                    ExitQuasio."Interview No." := DocNo;
                    ExitQuasio."Employee No" := Rec."Employee No";
                    ExitQuasio.Validate(ExitQuasio."Employee No");
                    Created := true;
                    ExitQuasio.Insert();
                    if Created = true then
                        Message('Employee Questionnaires created successfully');
                end;

            end;
        }
        field(47; "Responsibility Center"; Code[50])
        {
            TableRelation = "Responsibility Center BR NEW".Code;
            Caption = 'Responsibility Center';
        }
        field(48; "Clearance No."; Code[50])
        {
            Editable = false;
            Caption = 'Clearance No.';
        }
        field(49; "USER ID"; Code[50])
        {
            Caption = 'Captured By';
            Editable = false;
        }
        field(50; "No. Series"; Code[50])
        {
            Caption = 'No. Series';
        }
        field(51; "Employee No"; Code[50])
        {
            TableRelation = "Employee Separation Header"."Staff Code" where(cleared = const(false));
            Caption = 'Employee No';
            trigger OnValidate()
            var
                EmpployySep: Record "Employee Separation Header";

            begin
                EmpployySep.Reset();
                EmpployySep.SetRange("Staff Code", rec."Employee No");
                if EmpployySep.FindFirst() then begin
                    HREmp.Reset();
                    HREmp.SetRange(HREmp."No.", "Employee No");
                    if HREmp.Find('-') then begin
                        rec.Name := HREmp."Full Name";
                        rec.Designation := HREmp."Job Title";
                        rec."Separation No" := EmpployySep."Separation No.";
                        rec."Date Of Leaving" := EmpployySep."Date of Leaving";
                        rec.Grade := HREmp.Grade;
                        rec.Gender := HREmp.Gender;
                        rec."Reasons Of Leaving" := EmpployySep."Reason for Separation";
                        rec."Responsibility Center" := HREmp."Responsibility Center";
                    end;
                end;
            end;
        }
        field(52; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(53; "ICT Computer"; Boolean)
        {
            Caption = 'ICT Computer';
        }
        field(54; "Check CLMB"; Boolean)
        {
            Caption = 'Check CLMB';
        }
        field(55; "Check SCM"; Boolean)
        {
            Caption = 'Check SCM';
        }
        field(56; "Check Research & Advocacy"; Boolean)
        {
            Caption = 'Check Research & Advocacy';
        }
        field(57; "Check Natural Resource"; Boolean)
        {
            Caption = 'Check Natural Resource';
        }
        field(58; "Check Survey"; Boolean)
        {
            Caption = 'Check Survey';
        }
        field(59; "Check Valuation & Taxation"; Boolean)
        {
            Caption = 'Check Valuation & Taxation';
        }
        field(60; Details; Text[100])
        {
            Caption = 'Details';
        }
        field(61; MyRecId; RecordId)
        {
            Caption = 'MyRecId';
        }
        field(62; "Separation No"; Code[50])
        {
            Caption = 'Separation No';
        }
        field(63; OthersCLMB; Boolean)
        {
            Caption = 'OthersCLMB';
        }
        field(64; Grade; Code[20])
        {
            Caption = 'Grade';
        }
        field(65; Gender; Option)
        {
            OptionCaption = ',Male,Female';
            OptionMembers = ,Male,Female;
            Caption = 'Gender';
        }
        field(66; "Date Of Leaving"; Date)
        {
            Caption = 'Date Of Leaving';
        }
        field(67; "Reasons Of Leaving"; Option)
        {
            OptionMembers = " ",Resignation,Death,Retirement,Termination,Sickness;
            Caption = 'Reason for Separation';
        }
        field(68; "Cleared By"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(69; "Clearance Cleared"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Clearance No.", "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Dropdown; "Clearance No.", "Employee No", Name, Designation)
        {

        }
    }

    trigger OnInsert()
    begin
        if "Clearance No." = '' then begin
            hrsetup.Get();
            hrsetup.TestField(hrsetup."Clearance Nos");
            NoSeriesMgt.InitSeries(hrsetup."Clearance Nos", xRec."No. Series", 0D, "Clearance No.", "No. Series");
            Date := Today;
        end;

        MyRecRef.GetTable(Rec);
        MyRecId := MyRecRef.RecordId;
    end;

    var
        hrsetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HREmp: Record "HR Employees";
        MyRecRef: RecordRef;
}
