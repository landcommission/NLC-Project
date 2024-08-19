#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193706 "Investment Firms"
{
    Caption = 'Investment Companies';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Firm Code"; Code[10])
        {
            Caption = 'Firm Code';
        }
        field(2; "Firm Name"; Text[100])
        {
            Caption = 'Firm Name';
        }
        field(3; "Firm Branch Code"; Code[10])
        {
            Caption = 'Firm Branch Code';
        }
        field(4; "Firm Branch Name"; Text[30])
        {
            Caption = 'Firm Branch Name';
        }
        field(5; Address; Code[30])
        {
            Caption = 'Address';
        }
        field(6; City; Text[30])
        {
            Caption = 'City';
        }
        field(7; Telephone; Code[20])
        {
            Caption = 'Telephone';
        }
        field(8; "E-Mail"; Text[30])
        {
            Caption = 'E-Mail';
        }
        field(9; "Post Code"; Code[10])
        {
            Caption = 'Post Code';
        }
    }

    keys
    {
        key(Key1; "Firm Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
