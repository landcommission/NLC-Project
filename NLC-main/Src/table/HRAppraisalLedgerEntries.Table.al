#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193430 "HR Appraisal Ledger Entries"
{
    Caption = 'HR Appraisal Ledger Entries';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Appraisal Period"; Code[20])
        {
            Caption = 'Appraisal Period';
            TableRelation = "HR Appraisal Period"."Appraisal Period";
        }
        field(3; Closed; Boolean)
        {
            Caption = 'Closed';
        }
        field(4; "Staff No."; Code[20])
        {
            Caption = 'Staff No.';
        }
        field(5; "Staff Name"; Text[70])
        {
            Caption = 'Staff Name';
        }
        field(6; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(7; "Appraisal Entry Type"; Option)
        {
            Caption = 'Appraisal Entry Type';
            OptionCaption = 'Target Setting,Achievement';
            OptionMembers = "Target Setting",Achievement;
        }
        field(8; "Appraisal Approval Date"; Date)
        {
            Caption = 'Appraisal Approval Date';
        }
        field(9; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(10; "External Document No."; Code[20])
        {
            Caption = 'External Document No.';
        }
        field(11; "Job ID"; Code[20])
        {
            Caption = 'Job ID';
            //TableRelation = Table0.Field4;
        }
        field(12; "Job Group"; Code[20])
        {
            Caption = 'Job Group';
        }
        field(13; "Contract Type"; Code[20])
        {
            Caption = 'Contract Type';
        }
        field(14; Score; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'score';
        }
        field(15; "Appraisal Date"; Date)
        {
            Caption = 'Appraisal Date';
        }
        field(16; "Appraisal Posting Description"; Text[50])
        {
            Caption = 'Appraisal Posting Description';
        }
        field(20; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(21; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(23; "User ID"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = User;

        }
        field(24; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(25; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }
        field(26; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(27; "Index Entry"; Boolean)
        {
            Caption = 'Index Entry';
        }
        field(28; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(30; "Appraisal Type"; Option)
        {
            Editable = true;
            OptionCaption = ' ,Service Delivery,Financial Stewardship,Training and Development,Customer and Sales';
            OptionMembers = " ","Service Delivery","Financial Stewardship","Training and Development","Customer and Sales";
            Caption = 'Appraisal Type';

        }
        field(31; "Self Appraisal"; Decimal)
        {
            Caption = 'Self Appraisal';
        }
        field(32; "Supervisor Appraisal"; Decimal)
        {
            Caption = 'Supervisor Appraisal';
        }
        field(33; "Agreed Appraisal"; Decimal)
        {
            Caption = 'Agreed Appraisal';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Appraisal Period", "Posting Date")
        {
            SumIndexFields = Score;
        }
        key(Key3; "Appraisal Period", Closed, "Posting Date")
        {
            SumIndexFields = Score;
        }
        key(Key4; "Staff No.", "Appraisal Period", Closed, "Posting Date")
        {
            SumIndexFields = Score;
        }
        key(Key5; "Staff No.", Closed, "Posting Date") { }
        key(Key6; "Posting Date", "Appraisal Entry Type", "Staff No.")
        {
            SumIndexFields = Score;
        }
        key(Key7; "Staff No.")
        {
            SumIndexFields = Score;
        }
        key(Key8; "Appraisal Entry Type", "Staff No.", Closed)
        {
            SumIndexFields = Score;
        }
        /*  key(Key9; "Appraisal Entry Type", "Staff No.", Closed)
         {
             Enabled = false;
             SumIndexFields = Score;
         } */
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", "Appraisal Period", "Staff No.", "Staff Name", "Posting Date") { }
    }
}
