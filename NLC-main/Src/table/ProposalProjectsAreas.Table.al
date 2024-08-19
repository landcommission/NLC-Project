#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193727 "Proposal/Projects Areas"
{
    DrillDownPageId = "HR Employee Grievance Card";
    LookupPageId = "HR Employee Grievance Card";
    Caption = 'Proposal/Projects Areas';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Proposal No."; Code[50])
        {
            TableRelation = Jobs."No.";
            Caption = 'Proposal No.';
        }
        field(2; "Proposal Area Code"; Code[20])
        {
            TableRelation = "Proposal/Projects Areas setup".Code;
            Caption = 'Proposal Area Code';
            trigger OnValidate()
            begin
                "Proposal/Projects Areas setup".Reset();
                "Proposal/Projects Areas setup".SetRange("Proposal/Projects Areas setup".Code, "Proposal Area Code");
                if "Proposal/Projects Areas setup".Find('-') then
                    "Proposal Area Description" := "Proposal/Projects Areas setup"."Area Description";
            end;
        }
        field(3; "Proposal Area Description"; Text[100])
        {
            Caption = 'Proposal Area Description';
        }
        field(4; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved';
            OptionMembers = Open,"Pending Approval",Approved;
            Caption = 'Status';
        }
        field(5; "Responsibility Center"; Code[20])
        {
            Caption = 'Responsibility Center';
            //TableRelation = Table39005929;
        }
    }

    keys
    {
        key(Key1; "Proposal No.", "Proposal Area Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        "Proposal/Projects Areas setup": Record "Proposal/Projects Areas setup";
}
