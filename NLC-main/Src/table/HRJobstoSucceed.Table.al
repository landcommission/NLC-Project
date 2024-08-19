#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193506 "HR Jobs to Succeed"
{
    Caption = 'HR Jobs to Succeed';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Job ID"; Code[20])
        {
            TableRelation = "HR Jobs"."Job ID" where("Job ID" = field("Job ID"));
            Caption = 'Job ID';
            trigger OnValidate()
            begin
                Jobs.Reset();
                Jobs.SetRange(Jobs."Job ID", "Job ID");
                if Jobs.Find('-') then begin
                    Description := Jobs."Job Description";
                    "Position Reporting to" := Jobs."Position Reporting to";

                    "Occupied Position" := Jobs."Occupied Positions";
                    "Vacant Positions" := Jobs."Vacant Positions";
                    "No of Posts" := Jobs."No of Posts";

                end;
            end;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        // field(3; Department; Text[50])
        // {
        //     Caption = 'Department';
        // }
        field(4; "Shortcut Dimension 1"; Code[50])
        {
            Caption = 'Shortcut Dimension 1';
        }
        field(5; "Shortcut Demension 2"; Code[50])
        {
            Caption = 'Shortcut Demension 2';
        }
        field(6; Availability; Boolean)
        {
            Caption = 'Availability';
        }
        field(7; Comment; Text[250])
        {
            Caption = 'Comment';
        }
        field(8; "No of Posts"; Decimal)
        {
            Caption = 'No of Posts';
        }
        field(9; "Position Reporting to"; Code[50])
        {
            Caption = 'Position Reporting to';
        }
        field(10; "Occupied Position"; Integer)
        {
            Caption = 'Occupied Position';
        }
        field(11; "Vacant Positions"; Integer)
        {
            Caption = 'Vacant Positions';
        }
        field(12; Dimension3; Code[20])
        {
            Caption = 'Dimension3';
        }
        field(13; Dimension4; Code[20])
        {
            Caption = 'Dimension4';
        }
        field(14; Dimension5; Code[20])
        {
            Caption = 'Dimension5';
        }
        field(15; Dimension6; Code[20])
        {
            Caption = 'Dimension6';
        }
        field(16; Dimension7; Code[20])
        {
            Caption = 'Dimension7';
        }
        field(17; Dimension8; Code[20])
        {
            Caption = 'Dimension8';
        }
        field(18; "Dimension Filter 1"; Code[20])
        {
            Caption = 'Dimension Filter 1';
        }
        field(19; "Dimension Filter 2"; Code[20])
        {
            Caption = 'Dimension Filter 2';
        }
        field(20; "Dimension Filter 3"; Code[20])
        {
            Caption = 'Dimension Filter 3';
        }
        field(21; "Dimension Filter 4"; Code[20])
        {
            Caption = 'Dimension Filter 4';
        }
        field(22; "Dimension Filter 5"; Code[20])
        {
            Caption = 'Dimension Filter 5';
        }
        field(23; "Dimension Filter 6"; Code[20])
        {
            Caption = 'Dimension Filter 6';
        }
        field(24; "Dimension Filter 7"; Code[20])
        {
            Caption = 'Dimension Filter 7';
        }
        field(25; "Dimension Filter 8"; Code[20])
        {
            Caption = 'Dimension Filter 8';
        }
        field(26; Grade; Code[20])
        {
            Caption = 'Grade';
        }
        field(27; "Show Only Existing"; Boolean)
        {
            Caption = 'Show Only Existing';
        }
        field(28; "Act Job ID"; Code[20])
        {
            Caption = 'Act Job ID';
        }
        field(30; Source; Option)
        {
            OptionMembers = " ",Dismissal,"New Post","Organisation Change";
            Caption = 'Source';
        }
        field(31; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center BR NEW".Code;
            Caption = 'Department';

            trigger OnValidate()
            var
                myInt: Integer;
                Responsblece: Record "Responsibility Center BR NEW";
            begin
                Responsblece.Reset();
                Responsblece.SetRange(Code, Rec."Responsibility Center");
                if Responsblece.FindFirst() then
                    "Department Name" := Responsblece.Name;

            end;
        }
        field(32; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved;
            Caption = 'Status';
        }
        field(33; "Succession Experience"; Decimal)
        {
            Caption = 'Succession Experience';
        }
        field(34; "Incumbent No"; Code[30])
        {
            TableRelation = "HR Employees"."No." where(Status = const(Active));
            Caption = 'Incumbent No';
            trigger OnValidate()
            begin
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "Incumbent No");
                if HREmp.Find('-') then begin
                    "Incumbent Name" := HREmp."Full Name";
                    "Retirement Date" := HREmp."Retirement date";
                end
            end;
        }
        field(35; "Incumbent Name"; Text[100])
        {
            Editable = false;
            Caption = 'Incumbent Name';
        }
        field(36; "Retirement Date"; Date)
        {
            Caption = 'Retirement Date';
        }
        field(37; "Retirement Status"; Option)
        {
            OptionMembers = " ",A,B,C;
            Caption = 'Retirement Status';
        }
        field(38; Criticality; Option)
        {
            OptionMembers = Critical,"Very Important";
            Caption = 'Criticality';
        }
        field(39; "Number of Staff ready"; Integer)
        {
            Caption = 'Number of Staff ready';
        }
        field(40; "Number of Staff Ready in 1-2"; Integer)
        {
            Caption = 'Number of Staff Ready in 1-2';
        }
        field(41; "Succession Planning prorities"; Text[30])
        {
            Caption = 'Succession Planning prorities';
        }
        field(42; "Department Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Job ID")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Jobs: Record "HR Jobs";
        HREmp: Record "HR Employees";
}
