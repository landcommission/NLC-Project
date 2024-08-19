#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193884 "HR Overtime Lines"
{
    Caption = 'HR Overtime Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Staff No."; Code[10])
        {
            Caption = 'Staff No.';
        }
        field(2; Date; Date)
        {
            Caption = 'Date';
        }
        field(3; "Start Time"; Time)
        {
            Caption = 'Start Time';
            trigger OnValidate()
            begin
                if "End Time" <> 0T then
                    fnCalculateEndTime();
            end;
        }
        field(4; "End Time"; Time)
        {
            Caption = 'End Time';
            trigger OnValidate()
            begin
                if "Start Time" <> 0T then
                    fnCalculateEndTime();
            end;
        }
        field(5; "Work Done"; Text[150])
        {
            Caption = 'Work Done';
        }
        field(6; "Application Code"; Code[10])
        {
            Caption = 'Application Code';
        }
        field(13; "Overtime Type"; Option)
        {
            OptionCaption = ' ,Weekend,Holiday,Extra Hours';
            OptionMembers = " ",Weekend,Holiday,"Extra Hours";
            Caption = 'Overtime Type';
        }
        field(14; "Overtime Hours"; Decimal)
        {
            Caption = 'Overtime Hours';
        }
        field(15; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
    }

    keys
    {
        key(Key1; "Line No.", "Application Code")
        {
            Clustered = true;
        }
        key(Key2; "Overtime Type", "Line No.")
        {
            SumIndexFields = "Overtime Hours";
        }
    }

    fieldgroups { }

    var
        HROvertimeDetails: Record "HR Overtime Lines";
        HROvertime: Record "HR Overtime Header";
        Text0001: Label '[End Time %1 ] CANNOT be less than the [Start Time %2]';

    local procedure fnCalculateEndTime()
    begin

        if "End Time" < "Start Time" then
            Error(Text0001, "End Time", "Start Time")
        else
            "Overtime Hours" := ("End Time" - "Start Time") / 3600000;
    end;
}
