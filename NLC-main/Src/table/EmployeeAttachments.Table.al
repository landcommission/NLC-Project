#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 50003 "Employee Attachments"
{
    Caption = 'Employee Attachments';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee No"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No';
        }
        field(2; "Attachment Code"; Code[20])
        {
            TableRelation = "Attachment Types".Code;
            Caption = 'Attachment Code';
        }
        field(3; URL; Text[250])
        {
            Caption = 'URL';
        }
    }

    keys
    {
        key(Key1; "Employee No", "Attachment Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
