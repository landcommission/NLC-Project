#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193761 "Project Personnel Cost Alloc"
{
    Caption = 'Project Personnel Cost Alloc';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Project; Code[50])
        {
            TableRelation = Jobs;
            Caption = 'Project';
        }
        field(2; "Employee No"; Code[50])
        {
            TableRelation = Resource;
            Caption = 'Employee No';
            trigger OnValidate()
            begin
                Res.Get("Employee No");
                "Employee Name" := Res.Name;
            end;
        }
        field(3; "Employee Name"; Text[30])
        {
            Caption = 'Employee Name';
        }
        field(4; "Project Role"; Code[30])
        {
            TableRelation = "Project Roles";
            Caption = 'Project Role';
            trigger OnValidate()
            begin
                Projects.Get(Project);
                "Start Date" := Projects."Starting Date";
                "End Date" := Projects."Ending Date";
            end;
        }
        field(5; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(6; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(7; "% Allocation Value"; Integer)
        {
            Caption = '% Allocation Value';
        }
        field(8; comment; Text[200])
        {
            Caption = 'comment';
        }
    }

    keys
    {
        key(Key1; Project, "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Res: Record Resource;
        Projects: Record Jobs;
}
