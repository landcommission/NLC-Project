#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193880 "HR Movement Tracker"
{
    Caption = 'HR Movement Tracker';
    DataClassification = CustomerContent;
    //DrillDownPageID = UnknownPage39004265;
    //LookupPageID = UnknownPage39004265;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Approval Type"; Option)
        {
            OptionCaption = 'Loans,Special Loans,Personal Loans,Refunds,Funeral Expenses,Withdrawals - Resignation,Withdrawals - Death,Branch Loans';
            OptionMembers = Loans,"Special Loans","Personal Loans",Refunds,"Funeral Expenses","Withdrawals - Resignation","Withdrawals - Death","Branch Loans";
            Caption = 'Approval Type';
        }
        field(3; Stage; Integer)
        {
            TableRelation = "HR Approvals Set Up".Stage where("Approval Type" = field("Approval Type"));
            Caption = 'Stage';
        }
        field(4; Remarks; Text[50])
        {
            Caption = 'Remarks';
        }
        field(5; Status; Option)
        {
            OptionCaption = 'Being Processed,Approved,Rejected';
            OptionMembers = "Being Processed",Approved,Rejected;
            Caption = 'Status';
        }
        field(6; "Current Location"; Boolean)
        {
            Caption = 'Current Location';
        }
        field(7; "Date/Time In"; DateTime)
        {
            Caption = 'Date/Time In';
        }
        field(8; "Date/Time Out"; DateTime)
        {
            Caption = 'Date/Time Out';
        }
        field(9; "USER ID"; Code[20])
        {
            Caption = 'USER ID';
        }
        field(10; "Entry No."; Code[10])
        {
            Caption = 'Entry No.';
        }
        field(11; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(12; Station; Code[50])
        {
            Caption = 'Station';
        }
    }

    keys
    {
        key(Key1; "Entry No.") { }
        key(Key2; "Document No.", "Approval Type", "Entry No.", Stage)
        {
            Clustered = true;
        }
        key(Key3; "Document No.", "Current Location") { }
    }

    fieldgroups { }
}
