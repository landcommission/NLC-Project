#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193483 "HR OSInvestigation"
{
    DrillDownPageId = "PR Bank Accounts";
    LookupPageId = "PR Bank Accounts";
    Caption = 'HR OSInvestigation';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Investigation No"; Code[10])
        {
            Caption = 'Investigation No';
        }
        field(2; "Incident No"; Code[10])
        {
            TableRelation = "HR OSIncident"."Incident No" where(Status = filter("Reported Investigation"));
            Caption = 'Incident No';
            trigger OnValidate()
            begin
                OSIncident.Reset();
                OSIncident.SetRange(OSIncident."Incident No", "Incident No");
                if OSIncident.Find('-') then begin
                    "Incident Description" := OSIncident."Incident Description";
                    "Date of Incident" := OSIncident."Date of Incident";
                    "Location Name" := OSIncident."Location Name";
                    // Status:=OSIncident.Status;
                end;
            end;
        }
        field(3; "Incident Description"; Text[100])
        {
            Caption = 'Incident Description';
        }
        field(4; "Date of Incident"; Date)
        {
            Caption = 'Date of Incident';
        }
        field(5; "Location Name"; Text[100])
        {
            Caption = 'Location Name';
        }
        field(6; Status; Option)
        {
            OptionCaption = 'Reported Investigation,Assigned Investigation,Investigation,Inspection,Closed';
            OptionMembers = "Reported Investigation","Assigned Investigation",Investigation,Inspection,Closed;
            Caption = 'Status';
        }
        field(7; "Person Investigating"; Text[100])
        {
            Caption = 'Person Investigating';
            trigger OnValidate()
            begin
                if Confirm('Are you sure you have assigned the person responsible for investigating?', true, false) then begin
                    Status := Status::"Assigned Investigation";
                    Modify();
                    "Date of Assigning" := Today;
                end
            end;
        }
        field(8; "Date of Assigning"; Date)
        {
            Caption = 'Date of Assigning';
        }
    }

    keys
    {
        key(Key1; "Investigation No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        OSIncident: Record "HR OSIncident";
}
