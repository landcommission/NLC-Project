#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69640 "Commitee Terminated Member"
{
    Caption = 'Commitee Terminated Member';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document No."; Code[30])
        {
            TableRelation = "Commitee Appointment Voucher";
            Caption = 'Document No.';
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = 'Appointment,Termination';
            OptionMembers = Appointment,Termination;
            Caption = 'Document Type';
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No';
        }
        field(4; "Member No."; Code[30])
        {
            Caption = 'Member No.';
        }
        field(5; Role; Option)
        {
            OptionCaption = 'Member,Chairperson,Secretary,Consultant';
            OptionMembers = Member,Chairperson,Secretary,Consultant;
            Caption = 'Role';
        }
        field(6; "Member Name"; Text[50])
        {
            Caption = 'Member Name';
        }
        field(7; "Member Email"; Text[50])
        {
            ExtendedDatatype = EMail;
            Caption = 'Member Email';
        }
        field(8; "Telephone No."; Text[30])
        {
            ExtendedDatatype = PhoneNo;
            Caption = 'Telephone No.';
        }
        field(9; Designation; Text[30])
        {
            Caption = 'Designation';
        }
        field(10; "Staff No."; Code[30])
        {
            Caption = 'Staff No.';
        }
        field(11; "ID/Passport No"; Code[15])
        {
            Caption = 'ID/Passport No';
        }
        field(12; "Tax Registration (PIN) No."; Code[15])
        {
            Caption = 'Tax Registration (PIN) No.';
        }
        field(13; "Notified on Email"; Boolean)
        {
            Caption = 'Notified on Email';
        }
        field(14; "Date/Time Notified"; DateTime)
        {
            Caption = 'Date/Time Notified';
        }
        field(15; "Termination Date"; Date)
        {
            Caption = 'Termination Date';
        }
        field(16; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
        }
        field(17; "Original Appointment No."; Code[30])
        {
            TableRelation = "Commitee Appointment Voucher";
            Caption = 'Original Appointment No.';
        }
        field(18; "No. Series"; Code[30])
        {
            Caption = 'No. Series';
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

