#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193475 "HR OSIncident"
{
    DataCaptionFields = "Incident No", "Incident Description";
    DrillDownPageId = "HR OSIncident List";
    LookupPageId = "HR OSIncident List";
    Caption = 'HR OSIncident';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Incident No"; Code[10])
        {
            Caption = 'Incident No';
        }
        field(2; "Incident Description"; Text[100])
        {
            Caption = 'Incident Description';
        }
        field(3; Address; Code[10])
        {
            Caption = 'Address';
        }
        field(4; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
        }
        field(5; "Job Title"; Code[30])
        {
            Caption = 'Job Title';
        }
        field(6; "Home Phone No."; Code[10])
        {
            Caption = 'Home Phone No.';
        }
        field(7; Section; Option)
        {
            OptionCaption = ' ,Contractor,Trainee,Pupil/Student,Member of Public';
            OptionMembers = " ",Contractor,Trainee,"Pupil/Student","Member of Public";
            Caption = 'Section';
        }
        field(8; "Type of Incident"; Option)
        {
            OptionCaption = ' ,Fatality,Dangerous Occurence,Specified Mjor Injury,Disease,Minor Injury';
            OptionMembers = " ",Fatality,"Dangerous Occurence","Specified Mjor Injury",Disease,"Minor Injury";
            Caption = 'Type of Incident';
        }
        field(9; "Location Name"; Text[100])
        {
            Caption = 'Location Name';
        }
        field(10; "Part of Body Affected"; Code[10])
        {
            Caption = 'Part of Body Affected';
        }
        field(11; "Date of Incident"; Date)
        {
            Caption = 'Date of Incident';
        }
        field(12; Time; DateTime)
        {
            Caption = 'Time';
        }
        field(13; "Date Notification Received"; Date)
        {
            Caption = 'Date Notification Received';
        }
        field(14; "First Witness Name"; Text[100])
        {
            Caption = 'First Witness Name';
        }
        field(15; "First Witness Address"; Code[10])
        {
            Caption = 'First Witness Address';
        }
        field(16; "Second Witness Name"; Text[100])
        {
            Caption = 'Second Witness Name';
        }
        field(17; "Second Witness Address"; Code[10])
        {
            Caption = 'Second Witness Address';
        }
        field(18; "First Aid Given"; Boolean)
        {
            Caption = 'First Aid Given';
        }
        field(19; "Taken Home"; Boolean)
        {
            Caption = 'Taken Home';
        }
        field(20; "Return to Work on same day"; Boolean)
        {
            Caption = 'Return to Work on same day';
        }
        field(21; "Went Absent"; Boolean)
        {
            Caption = 'Went Absent';
        }
        field(22; "Taken to Hospital"; Boolean)
        {
            Caption = 'Taken to Hospital';
        }
        field(23; Admitted; Boolean)
        {
            Caption = 'Admitted';
        }
        field(24; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
        }
        field(25; "Employee No"; Code[10])
        {
            TableRelation = "FA Budget Entry"."Entry No.";
            Caption = 'Employee No';

        }
        field(26; Status; Option)
        {
            OptionCaption = 'Open,Reported Investigation,Inspection,Cancelled, Closed';
            OptionMembers = Open,"Reported Investigation",Inspection,Cancelled," Closed";
            Caption = 'Status';
        }
        field(27; "User ID"; Code[200])
        {
            Caption = 'User ID';
        }
    }

    keys
    {
        key(Key1; "Incident No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Incident No", "Incident Description") { }
    }

    trigger OnInsert()
    begin

        if "Incident No" = '' then begin
            GenSetup.Get();
            GenSetup.TestField(GenSetup."Incident Nos.");
            NoSeriesMgt.InitSeries(GenSetup."Incident Nos.", xRec."No. Series", Today, "Incident No", "No. Series");
        end;
        "User ID" := UserId;
    end;

    var
        GenSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HREmp: Record "FA Budget Entry";
}
