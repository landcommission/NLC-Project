#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193441 "HR Employee Grievance"
{
    Caption = 'HR Employee Grievance';
    DataClassification = CustomerContent;
    //DrillDownPageID = UnknownPage39003920;
    //LookupPageID = UnknownPage39003920;

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No.';
            trigger OnValidate()
            begin
                OK := Employee.Get("Employee No.");
                if OK then begin
                    "Employee First Name" := Employee."First Name";
                    "Employee Last Name" := Employee."Last Name";
                end;
            end;
        }
        field(2; "Follow Up Completed"; Boolean)
        {
            Caption = 'Follow Up Completed';
        }
        field(3; "Follow Up Date (Actual Date)"; Date)
        {
            Caption = 'Follow Up Date (Actual Date)';
        }
        field(4; "Release Date"; Date)
        {
            Caption = 'Release Date';
        }
        field(5; "Follow Up Date"; Date)
        {
            Caption = 'Follow Up Date';

        }
        field(6; "Letter Sent To Employee"; Boolean)
        {
            Caption = 'Letter Sent To Employee';
        }
        field(7; "Letter Sent By Whom"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Letter Sent By Whom';
        }
        field(8; "Cause Of Grievance"; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const("Grievance Cause"));
            Caption = 'Cause Of Grievance';
        }
        field(9; "Outcome Of Grievance"; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const("Grievance Outcome"));
            Caption = 'Outcome Of Grievance';
        }
        field(10; "Employee First Name"; Text[30])
        {
            CalcFormula = lookup("HR Employees"."First Name" where("No." = field("Employee No.")));
            FieldClass = FlowField;
            Caption = 'Employee First Name';
            Editable = false;
        }
        field(11; "Employee Last Name"; Text[30])
        {
            CalcFormula = lookup("HR Employees"."Last Name" where("No." = field("Employee No.")));
            FieldClass = FlowField;
            Caption = 'Employee Last Name';
            Editable = false;
        }
        field(12; "Date Of Grievance"; Date)
        {
            Caption = 'Date Of Grievance';

        }
        field(13; Comment; Boolean)
        {
            Editable = false;
            FieldClass = Normal;
            Caption = 'Comment';
        }
    }

    keys
    {
        key(Key1; "Employee No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        CareerEvent: Page "Posted Petty Cash Vouchers";
        OK: Boolean;
        Employee: Record "HR Employees";
}
