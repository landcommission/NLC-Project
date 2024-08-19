#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 56019 "Copyright Setup"
{
    Caption = 'Copyright Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Applicant Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Applicant Nos';
        }
        field(3; "Complains Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Complains Nos';
        }
        field(4; "Case Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Case Nos';
        }
        field(5; "Court Attendance Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Court Attendance Nos';
        }
        field(6; "Case File Movement Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Case File Movement Nos';
        }
        field(7; "Document Registration Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Document Registration Nos';
        }
        field(8; "Copyright Registration Nos."; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Copyright Registration Nos.';
        }
        field(9; "APSD Minimum Quantity"; Decimal)
        {
            Caption = 'APSD Minimum Quantity';
        }
        field(10; "APSD Default Unit Price"; Decimal)
        {
            Caption = 'APSD Default Unit Price';
        }
        field(11; "Default APSD Item"; Code[20])
        {
            TableRelation = Item."No.";
            Caption = 'Default APSD Item';
        }
        field(12; "Authentication Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Authentication Nos';
        }
        field(13; "CMO Registration Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'CMO Registration Nos';
        }
        field(14; "CMO Renewal Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'CMO Renewal Nos';
        }
        field(15; "Visitor Pass Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Visitor Pass Nos';
        }
        field(16; "Internal Memo Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Internal Memo Nos';
        }
        field(17; "Customer FeedBack Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Customer FeedBack Nos';
        }
        field(18; "Copyright Amount"; Decimal)
        {
            Caption = 'Copyright Amount';
        }
        field(19; "Gen. Bus Posting Group"; Code[100])
        {
            TableRelation = "Gen. Business Posting Group".Code;
            Caption = 'Gen. Bus Posting Group';
        }
        field(20; "Customer Posting Group"; Code[100])
        {
            TableRelation = "Customer Posting Group".Code;
            Caption = 'Customer Posting Group';
        }
        field(21; Resource; Code[100])
        {
            TableRelation = Resource."No.";
            Caption = 'Resource';
        }
        field(22; "user id"; Code[20])
        {
            TableRelation = "User Setup"."User ID";
            Caption = 'user id';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

