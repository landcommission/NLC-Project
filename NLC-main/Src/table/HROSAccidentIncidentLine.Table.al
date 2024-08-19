#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193476 "HR OSAccident Incident Line"
{
    Caption = 'HR OSAccident Incident Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No';
        }
        field(2; "Incident No"; Code[10])
        {
            Caption = 'Incident No';
        }
        field(3; "Accident No."; Code[10])
        {
            TableRelation = "HR OSAccident"."Accident No";
            Caption = 'Accident No.';
            trigger OnValidate()
            begin
                SafetyC.Reset();
                OAcc.Reset();
                OAcc.SetRange(OAcc."Accident No", "Accident No.");
                if OAcc.Find('-') then
                    Incident := OAcc.Description;
                //get all safety rules from safety setup

                SafetyC.Reset();
                SafetyC.SetRange(SafetyC."Accident No", "Accident No.");
                SafetyC.SetRange(SafetyC."Incident No", "Incident No");
                if SafetyC.Find('-') then
                    SafetyC.DeleteAll();

                SafetyR.Reset();
                SafetyR.SetRange(SafetyR."Accident No.", "Accident No.");
                if SafetyR.Find('-') then
                    repeat
                        SafetyC.Init();
                        SafetyC.SafetyNo := SafetyR."Safety No";
                        SafetyC."Safety Rules" := SafetyR."Safety Rules";
                        SafetyC."Accident No" := SafetyR."Accident No.";
                        SafetyC."Incident No" := "Incident No";
                        SafetyC.Insert();
                    until SafetyR.Next() = 0;
            end;
        }
        field(4; Cause; Text[100])
        {
            Caption = 'Cause';
        }
        field(5; "Cause No"; Code[10])
        {
            TableRelation = "HR OSAccident Line".Code where("Accident No" = field("Accident No."));
            Caption = 'Cause No';
            trigger OnValidate()
            begin
                OAccsub.Reset();
                OAccsub.SetRange(OAccsub.Code, "Cause No");
                if OAccsub.Find('-') then
                    Cause := OAccsub.Description;
            end;
        }
        field(6; "Resolution/Recommendation"; Text[200])
        {
            Caption = 'Resolution/Recommendation';
        }
        field(7; Incident; Text[100])
        {
            Caption = 'Incident';
        }
    }

    keys
    {
        key(Key1; "Line No", "Incident No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        OAcc: Record "HR OSAccident";
        OAccsub: Record "HR OSAccident Line";
        SafetyC: Record "HR OSSafety Checklist";
        SafetyR: Record "HR OSSafety Rules";
        LineNo: Integer;
}
