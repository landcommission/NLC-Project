#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193773 "Proposal Check List"
{
    DrillDownPageId = "Staff Advance Lines";
    LookupPageId = "Staff Advance Lines";
    Caption = 'Proposal Check List';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Proposal Code"; Code[20])
        {
            TableRelation = Jobs."No.";
            Caption = 'Proposal Code';
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(3; Task; Text[250])
        {
            Caption = 'Task';
        }
        field(4; Proposal; Boolean)
        {
            Caption = 'Proposal';
        }
        field(5; User; Code[50])
        {
            TableRelation = User."User Name";
            Caption = 'User';
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(7; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(8; "Responsible Office"; Code[50])
        {
            Caption = 'Responsible Office';
        }
        field(9; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(10; Status; Option)
        {
            OptionCaption = ' ,Completed,On Going,Submitted';
            OptionMembers = " ",Completed,"On Going",Submitted;
            Caption = 'Status';
        }
    }

    keys
    {
        key(Key1; "Proposal Code", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
