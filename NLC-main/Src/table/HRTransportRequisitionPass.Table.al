#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193488 "HR Transport Requisition Pass"
{
    Caption = 'HR Transport Requisition Pass';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Req No"; Code[20])
        {
            Caption = 'Req No';
        }
        field(2; "Employee No"; Code[20])
        {
            TableRelation = "FA Budget Entry"."Entry No.";
            Caption = 'Employee No';
            trigger OnValidate()
            begin
                if HREmp.Get("Employee No") then begin
                    "Passenger/s Full Name/s" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                    Dept := HREmp."Global Dimension 2 Code";
                end;
            end;
        }
        field(3; "Passenger/s Full Name/s"; Text[70])
        {
            Caption = 'Passenger/s Full Name/s';
        }
        field(4; Dept; Text[70])
        {
            Caption = 'Dept';
        }
        field(5; "Daily Work Ticket"; Code[20])
        {
            Caption = 'Daily Work Ticket';
        }
        field(6; EntryNo; Integer)
        {
            AutoIncrement = true;
            Caption = 'EntryNo';
        }
    }

    keys
    {
        key(Key1; "Req No", EntryNo)
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        HREmp: Record "HR Employees";
}
