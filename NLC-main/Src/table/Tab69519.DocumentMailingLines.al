#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69519 "Document Mailing Lines"
{

    fields
    {
        field(1;"Report No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Employee No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Employee.Get("Employee No") then begin
                  "Employee Name":=Employee.FullName;
                  "E-Mail Address":=Employee."E-Mail";
                end;
            end;
        }
        field(3;"Employee Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"E-Mail Address";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Mailing Format";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'PDF,Word,Excel';
            OptionMembers = PDF,Word,Excel;
        }
    }

    keys
    {
        key(Key1;"Report No.","Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
}

