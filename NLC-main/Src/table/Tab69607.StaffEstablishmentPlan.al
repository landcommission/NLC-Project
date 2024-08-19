#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69607 "Staff Establishment Plan"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Effective Date"; Date)
        {
        }
        field(4; "External Document No."; Code[30])
        {
        }
        field(5; "Total Staff Establishment"; Integer)
        {
            Editable = false;
        }
        field(6; "No. of Recruitment Plans"; Integer)
        {
            CalcFormula = count("Recruitment Plan" where("Staff Establishement" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Created By"; Code[30])
        {
            Editable = false;
        }
        field(8; "Created On"; Date)
        {
            Editable = false;
        }
        field(9; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Establishment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Global,Functional;
        }
        Field(11; "Duty Station"; Code[20])
        {
            TableRelation = "Duty Station";
            trigger OnValidate()
            var
                Dstation: Record "Duty Station";
            begin
                if Dstation.Get("Duty Station") then
                    "Station Name" := Dstation.Description;

            end;
        }
        Field(12; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved,Cancelled,"Under Review";
        }
        Field(13; "Station Name"; Text[250])
        {

        }

    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HrSetup.Get();
        HrSetup.TestField("Staff Establishment No.s");
        "Created By" := UserId;
        "Created On" := Today;
        "Created Time" := Time;
        If Code = '' Then
            Code := Noseries.GetNextNo(HrSetup."Staff Establishment No.s", 0D, true);
    end;

    var
        QualificationSetUp: Record Qualification;
        HrSetup: Record "Human Resources Setup";
        Noseries: Codeunit NoSeriesManagement;

}

