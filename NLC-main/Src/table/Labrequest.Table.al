#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193725 "Lab request"
{
    DrillDownPageId = "HR Employee Grievance Card";
    LookupPageId = "HR Employee Grievance Card";
    Caption = 'Lab request';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Proposal No."; Code[50])
        {
            TableRelation = Jobs."No.";
            Caption = 'Proposal No.';
        }
        field(3; "Study Purpose/Use"; Text[100])
        {
            Caption = 'Study Purpose/Use';
        }
        field(4; "Study Synopsis Attached"; Boolean)
        {
            Caption = 'Study Synopsis Attached';
        }
        field(5; "Lab Testing Algorithm Known"; Boolean)
        {
            Caption = 'Lab Testing Algorithm Known';
        }
        field(6; "Test schedule/Vol./Repertoire"; Text[100])
        {
            Caption = 'Test schedule/Vol./Repertoire';
        }
        field(7; "All Test Covered by Test List"; Boolean)
        {
            Caption = 'All Test Covered by Test List';
        }
        field(8; "Test List Description"; Text[100])
        {
            Description = 'l';
            Caption = 'Test List Description';
        }
        field(9; "Specimen/Isolates Processing"; Boolean)
        {
            Caption = 'Specimen/Isolates Processing';
        }
        field(10; "Specimen/Isolates Process Desc"; Text[100])
        {
            Caption = 'Specimen/Isolates Process Desc';
        }
        field(11; "Special Storage Required"; Boolean)
        {
            Caption = 'Special Storage Required';
        }
        field(12; "Destroy Samples Per Protocol"; Boolean)
        {
            Caption = 'Destroy Samples Per Protocol';
        }
        field(13; "Samples need to be Shipped"; Boolean)
        {
            Caption = 'Samples need to be Shipped';
        }
        field(14; "Samples Shipped Desc"; Text[100])
        {
            Caption = 'Samples Shipped Desc';
        }
        field(15; "Special Data/H.copy Storage"; Boolean)
        {
            Caption = 'Special Data/H.copy Storage';
        }
        field(16; "Special Data/H.copy Desc."; Text[100])
        {
            Caption = 'Special Data/H.copy Desc.';
        }
        field(17; "Special Staff/working hrs Req."; Boolean)
        {
            Caption = 'Special Staff/working hrs Req.';
        }
        field(18; "Special Staff/working hrs Desc"; Text[100])
        {
            Caption = 'Special Staff/working hrs Desc';
        }
        field(19; "Exp/Imp Permits Required"; Option)
        {
            OptionCaption = 'Yes,No,Pending';
            OptionMembers = Yes,No,Pending;
            Caption = 'Exp/Imp Permits Required';
        }
        field(20; "IREC Approval"; Option)
        {
            OptionCaption = 'Yes,No,Pending';
            OptionMembers = Yes,No,Pending;
            Caption = 'IREC Approval';
        }
        field(21; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved';
            OptionMembers = Open,"Pending Approval",Approved;
            Caption = 'Approval Status';
        }
        field(22; "Responsibility Center"; Code[20])
        {
            Caption = 'Responsibility Center';
            //TableRelation = Table39005929;
        }
    }

    keys
    {
        key(Key1; "Proposal No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        "Proposal/Projects Areas setup": Record "Proposal/Projects Areas setup";
}
