#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193691 "Temp Reports Approval"
{
    Caption = 'Temp Reports Approval';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'No.';
        }
        field(2; "Report No."; Integer)
        {
            TableRelation = Object.ID where(Type = const(Report));
            Caption = 'Report No.';
            trigger OnValidate()
            begin
                NavObject.Reset();
                NavObject.SetRange(NavObject.Type, NavObject.Type::Report);
                NavObject.SetRange(NavObject.ID, "Report No.");
                if NavObject.FindFirst() then
                    "Report Name" := NavObject.Name;
            end;
        }
        field(3; "Report Name"; Text[250])
        {
            Caption = 'Report Name';
        }
        field(4; "Rec No."; Code[20])
        {
            Caption = 'Rec No.';
        }
        field(5; Name; Text[250])
        {
            Caption = 'Name';
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(7; "Sender Id."; Code[20])
        {
            Caption = 'Sender Id.';
        }
        field(8; Status; Option)
        {
            OptionCaption = 'Pending,Pending Approval,Approved';
            OptionMembers = Pending,"Pending Approval",Approved;
            Caption = 'Status';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        NavObject: Record Object;
}
