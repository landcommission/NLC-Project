#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193881 "HR File Movement Tracker"
{
    Caption = 'HR File Movement Tracker';
    DataClassification = CustomerContent;
    //DrillDownPageID = UnknownPage39004274;
    //LookupPageID = UnknownPage39004274;

    fields
    {
        field(1; "File Number"; Code[20])
        {
            TableRelation = Customer."No.";
            Caption = 'File Number';
        }
        field(2; "File Type"; Option)
        {
            OptionCaption = ' ,Loans,Refunds,Withdrawals - Resignation,Dividends,Examination';
            OptionMembers = " ",Loans,Refunds,"Withdrawals - Resignation",Dividends,Examination;
            Caption = 'File Type';
        }
        field(3; "File Name"; Code[50])
        {
            Caption = 'File Name';
        }
        field(4; Remarks; Text[50])
        {
            Caption = 'Remarks';
        }
        field(5; Status; Option)
        {
            OptionCaption = 'Being Processed,Approved,Dispatched';
            OptionMembers = "Being Processed",Approved,Dispatched;
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
        field(9; "Sent By"; Code[20])
        {
            Caption = 'Sent By';
        }
        field(10; "Entry No."; Integer)
        {
            AutoIncrement = true;
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
        field(13; "Received By"; Code[30])
        {
            Caption = 'Received By';
        }
    }

    keys
    {
        key(Key1; "Entry No.") { }
        key(Key2; "File Number", "File Type", "Entry No.", "File Name")
        {
            Clustered = true;
        }
        key(Key3; "File Number", "Current Location") { }
    }

    fieldgroups { }
}
