#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 56093 "Case Hearing"
{
    Caption = 'Case Hearing';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Case Entry"; Code[50])
        {
            TableRelation = "Case Register"."No.";
            Caption = 'Case Entry';
        }
        field(2; "Last Hearing Date"; Date)
        {
            Caption = 'Last Hearing Date';
        }
        field(3; Progress; Text[100])
        {
            Caption = 'Progress';
        }
        field(4; "Next Hearing Date"; Date)
        {
            Caption = 'Next Hearing Date';
            trigger OnValidate()
            begin
                if "Next Hearing Date" <= "Last Hearing Date" then
                    Error('Next hearing date should be a future date.');
            end;
        }
        field(5; Day; Integer)
        {
            Caption = 'Day';
            trigger OnValidate()
            begin
                CaseReg.Reset();
                CaseReg.SetRange("No.", "Case Entry");
                if CaseReg.Find('-') then begin
                    CaseReg.CalcFields("Next Hearing Date");
                    "Last Hearing Date" := CaseReg."Next Hearing Date";
                    "Advocate On Record" := CaseReg."Advocate on Record";
                end;
            end;
        }
        field(6; "Advocate On Record"; Code[255])
        {
            FieldClass = Normal;
            Caption = 'Advocate On Record';
        }
        field(7; Decision; Text[250])
        {
            Caption = 'Decision';
        }
        field(8; "Bring Up Date"; Date)
        {
            Caption = 'Bring Up Date';
        }
        field(9; "Entry Type"; Option)
        {
            OptionCaption = 'Hearing,Mention';
            OptionMembers = Hearing,Mention;
            Caption = 'Entry Type';
        }
    }

    keys
    {
        key(Key1; "Case Entry", Day, "Entry Type")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        CaseReg: Record "Case Register";
}

