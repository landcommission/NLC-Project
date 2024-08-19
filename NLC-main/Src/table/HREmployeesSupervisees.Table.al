#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193445 "HR Employees Supervisees"
{
    Caption = 'HR Employees Supervisees';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Supervisor No."; Code[30])
        {
            NotBlank = false;
            TableRelation = "HR Employees"."No.";
            Caption = 'Supervisor No.';
        }
        field(2; "Supervisee No."; Code[30])
        {
            NotBlank = false;
            TableRelation = "HR Employees"."No.";
            Caption = 'Supervisee No.';
        }
        field(3; Department; Code[40])
        {
            NotBlank = false;
            TableRelation = "Responsibility Center BR NEW".Code;
            Caption = 'Responsibility Center';
            trigger OnValidate()
            var
                myInt: Integer;
                Responsblece: Record "Responsibility Center BR NEW";
            begin
                Responsblece.Reset();
                Responsblece.SetRange(Code, Rec.Department);
                if Responsblece.FindFirst() then
                    "Department Name" := Responsblece.Name;

            end;
        }
        field(4; From; Date)
        {
            NotBlank = false;
            Caption = 'From';
        }
        field(5; "To"; Date)
        {
            Caption = 'To';
        }
        field(7; "Job Title"; Text[150])
        {
            TableRelation = "HR Jobs"."Job Description";
            Caption = 'Job Title';
        }
        field(8; "Key Experience"; Text[150])
        {
            Caption = 'Key Experience';
        }
        field(16; Comment; Text[200])
        {
            Editable = true;
            FieldClass = Normal;
            Caption = 'Comment';
        }
        field(50000; "Number of Supervisees"; Integer)
        {
            CalcFormula = count("HR Employees Supervisees" where("Supervisor No." = field("Supervisor No.")));
            FieldClass = FlowField;
            Caption = 'Number of Supervisees';
            Editable = false;
        }
        field(17; "Department Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Supervisor No.", From)
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Employee: Record "HR Employees";
        OK: Boolean;
}
