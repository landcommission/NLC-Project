#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193597 "HR Leave Relievers"
{
    Caption = 'HR Leave Relievers';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line no"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line no';
        }
        field(2; "Document No"; Code[20])
        {
            Editable = false;
            Caption = 'Document No';
        }
        field(3; "Pending Assignment"; Text[250])
        {
            Caption = 'Pending Assignment';
        }
        field(4; "Reliever No"; Text[30])
        {
            TableRelation = "HR Employees"."No." where(Status = const(Active));
            Caption = 'Reliever No';
            trigger OnValidate()
            begin
                "Reliever Name" := '';
                HREmp.Get("Reliever No");
                "Reliever Name" := UpperCase(HREmp."Full Name");

                //PortalWebService.fn_CheckReliever("Applicant No",0D,0D,"Reliever No");
            end;
        }
        field(5; "Reliever Name"; Text[150])
        {
            Editable = false;
            Caption = 'Reliever Name';
        }
        field(6; "Applicant No"; Text[30])
        {
            Editable = false;
            TableRelation = "HR Employees"."No.";
            Caption = 'Applicant No';
        }
        field(7; Status; Option)
        {
            OptionCaption = 'Pending,Approved,Rejected';
            OptionMembers = Pending,Approved,Rejected;
            Caption = 'Status';
        }
    }

    keys
    {
        key(Key1; "Line no", "Document No", "Applicant No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        HREmp: Record "HR Employees";
        PortalWebService: Codeunit PortalWebService;
}
