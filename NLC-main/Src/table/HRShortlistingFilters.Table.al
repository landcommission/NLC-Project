#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193491 "HR Shortlisting Filters"
{
    Caption = 'HR Shortlisting Filters';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Qualification Type"; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const("Qualification Type"));
            Caption = 'Qualification Type';
        }
        field(2; "Qualification Code"; Code[10])
        {
            TableRelation = "HR Job Qualifications".Code where("Qualification Type" = field("Qualification Type"));
            Caption = 'Qualification Code';
        }
        field(3; Description; Text[250])
        {
            CalcFormula = lookup("HR Job Requirements"."Qualification Description" where("Qualification Code" = field("Qualification Code")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Description';
        }
        field(4; "Job ID"; Code[20])
        {
            Editable = false;
            Caption = 'Job ID';
        }
        field(5; "Requisition No."; Code[20])
        {
            Editable = false;
            Caption = 'Requisition No.';
        }
    }

    keys
    {
        key(Key1; "Qualification Type", "Qualification Code", "Job ID", "Requisition No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        HRSetup: Record "HR Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        HREmployee: Record "HR Employees";
}
