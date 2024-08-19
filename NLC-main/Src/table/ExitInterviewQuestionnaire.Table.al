#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193527 "Exit Interview Questionnaire"
{
    Caption = 'Exit Interview Questionnaire';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Interview No."; Code[20])
        {
            Caption = 'Interview No.';
        }
        field(2; "Employee No"; Code[20])
        {
            //Editable = false;
            TableRelation = "Clearance Certificate"."Employee No"; //where("Clearance Cleared" = const(false));
            Caption = 'Employee No';
            trigger OnValidate()
            var
                myInt: Integer;
                Clearance: Record "Clearance Certificate";
            begin
                Clearance.Reset();
                Clearance.SetRange("Employee No", Rec."Employee No");
                if Clearance.FindFirst() then begin

                    HREmp.Reset();
                    HREmp.SetRange(HREmp."No.", Rec."Employee No");
                    if HREmp.Find('-') then begin
                        "Employee No" := HREmp."No.";
                        "Employee Name" := HREmp."Full Name";
                        "Job Title" := HREmp."Job Title";
                        Directorate := HREmp."Department Name";
                        "Separation Date" := Clearance."Date Of Leaving";
                        "Date of Employement" := HREmp."Date Of Joining the Company";
                        //"Start Date in Position":=
                        "Responsibility Centre" := HREmp."Responsibility Center";
                        Grade := HREmp.Grade;
                        Gender := HREmp.Gender;
                    end
                end;
            end;
        }
        field(3; "Employee Name"; Text[50])
        {
            Editable = false;
            Caption = 'Employee Name';
        }
        field(4; "Job Title"; Text[50])
        {
            Editable = false;
            TableRelation = "HR Employees"."Job Title";
            Caption = 'Job Title';
        }
        field(5; Directorate; Code[20])
        {
            Editable = false;
            Caption = 'Directorate';
        }
        field(6; "Date of Employement"; Date)
        {
            Editable = false;
            Caption = 'Date of Employement';
        }
        field(7; "Start Date in Position"; Date)
        {
            Caption = 'Start Date in Position';
        }
        field(8; "Separation Date"; Date)
        {
            Caption = 'Separation Date';
            Editable = false;
        }
        field(9; "Total Length of Service"; Text[100])
        {
            Caption = 'Total Length of Service';
        }
        field(10; "Other Positions Held in the Co"; Text[250])
        {
            Caption = 'Other Positions Held in the Co';
        }
        field(11; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved;
            Caption = 'Status';
        }
        field(12; "Responsibility Centre"; Code[20])
        {
            Editable = false;
            TableRelation = "Responsibility Center BR NEW".Code;
            Caption = 'Responsibility Centre';
        }
        field(13; "No Series"; Code[20])
        {
            Caption = 'No Series';
        }
        field(14; "Text 1"; Text[250])
        {
            Caption = 'Text 1';
        }
        field(15; "Text 2"; Text[250])
        {
            Caption = 'Text 2';
        }
        field(16; Dissatisfaction; Boolean)
        {
            Caption = 'Dissatisfaction';
        }
        field(17; Relocation; Boolean)
        {
            Caption = 'Relocation';
        }
        field(18; "Text 5"; Boolean)
        {
            Caption = 'Text 5';
        }
        field(19; "Text 6"; Boolean)
        {
            Caption = 'Text 6';
        }
        field(20; "Text 7"; Boolean)
        {
            Caption = 'Text 7';
        }
        field(21; "Text 8"; Boolean)
        {
            Caption = 'Text 8';
        }
        field(22; "Text 9"; Boolean)
        {
            Caption = 'Text 9';
        }
        field(23; "Text 10"; Boolean)
        {
            Caption = 'Text 10';
        }
        field(24; "Text 11"; Boolean)
        {
            Caption = 'Text 11';
        }
        field(25; "Text 12"; Boolean)
        {
            Caption = 'Text 12';
        }
        field(26; "Text 13"; Boolean)
        {
            Caption = 'Text 13';
        }
        field(27; "Text 14"; Boolean)
        {
            Caption = 'Text 14';
        }
        field(28; "Text 15"; Boolean)
        {
            Caption = 'Text 15';
        }
        field(29; "Text 16"; Boolean)
        {
            Caption = 'Text 16';
        }
        field(30; "Text 17"; Option)
        {
            OptionMembers = "Strongly Disagree",Disagree,Neutral,Agree,"Strongly Agree";
            Caption = 'Text 17';
        }
        field(31; "Text 18"; Option)
        {
            OptionMembers = " ","Strongly Disagree",Disagree,Neutral,Agree,"Strongly Agree";
            Caption = 'Text 18';
        }
        field(32; "Text 19"; Option)
        {
            OptionMembers = " ","Strongly Disagree",Disagree,Neutral,Agree,"Strongly Agree";
            Caption = 'Text 19';
        }
        field(33; "Text 20"; Option)
        {
            OptionMembers = " ","Strongly Disagree",Disagree,Neutral,Agree,"Strongly Agree";
            Caption = 'Text 20';
        }
        field(34; "Text 21"; Option)
        {
            OptionMembers = " ","Strongly Disagree",Disagree,Neutral,Agree,"Strongly Agree";
            Caption = 'Text 21';
        }
        field(35; "Text 22"; Option)
        {
            OptionMembers = " ","Strongly Disagree",Disagree,Neutral,Agree,"Strongly Agree";
            Caption = 'Text 22';
        }
        field(36; "Text 23"; Option)
        {
            OptionMembers = " ","Strongly Disagree",Disagree,Neutral,Agree,"Strongly Agree";
            Caption = 'Text 23';
        }
        field(37; "Text 24"; Option)
        {
            OptionMembers = " ","Strongly Disagree",Disagree,Neutral,Agree,"Strongly Agree";
            Caption = 'Text 24';
        }
        field(38; "Text 25"; Option)
        {
            OptionMembers = " ","Strongly Disagree",Disagree,Neutral,Agree,"Strongly Agree";
            Caption = 'Text 25';
        }
        field(39; "Text 26"; Option)
        {
            OptionMembers = " ","Strongly Disagree",Disagree,Neutral,Agree,"Strongly Agree";
            Caption = 'Text 26';
        }
        field(40; "Text 27"; Option)
        {
            OptionMembers = " ","Strongly Disagree",Disagree,Neutral,Agree,"Strongly Agree";
            Caption = 'Text 27';
        }
        field(41; "Text 28"; Option)
        {
            OptionMembers = " ","Strongly Disagree",Disagree,Neutral,Agree,"Strongly Agree";
            Caption = 'Text 28';
        }
        field(42; "Text 29"; Option)
        {
            OptionMembers = " ","Strongly Disagree",Disagree,Neutral,Agree,"Strongly Agree";
            Caption = 'Text 29';
        }
        field(43; "Text 30"; Option)
        {
            OptionMembers = " ","Strongly Disagree",Disagree,Neutral,Agree,"Strongly Agree";
            Caption = 'Text 30';
        }
        field(44; "Text 31"; Option)
        {
            OptionMembers = " ","Strongly Disagree",Disagree,Neutral,Agree,"Strongly Agree";
            Caption = 'Text 31';
        }
        field(45; Grade; Code[20])
        {
            Caption = 'Grade';
        }
        field(46; Gender; Option)
        {
            OptionCaption = ' ,Male,Female';
            OptionMembers = " ",Male,Female;
            Caption = 'Gender';
        }
        field(47; "Seperation No"; Code[50])
        {
            CalcFormula = lookup("Employee Separation Header"."Separation No." where("Staff Code" = field("Employee No"),
                                                                                      Status = filter(Approved)));
            FieldClass = FlowField;
            Caption = 'Seperation No';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Interview No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        //No. Series
        if "Interview No." = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Exit Questionnaire Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Exit Questionnaire Nos.", xRec."No Series", 0D, "Interview No.", "No Series");
        end;


        // HREmp.Reset();
        // HREmp.SetRange(HREmp."User ID", UserId);
        // if HREmp.Find('-') then begin
        //     "Employee No" := HREmp."No.";
        //     "Employee Name" := HREmp."Full Name";
        //     "Job Title" := HREmp."Job Title";
        //     Directorate := HREmp."Department Name";
        //     "Date of Employement" := HREmp."Date Of Joining the Company";
        //     //"Start Date in Position":=
        //     "Responsibility Centre" := HREmp."Responsibility Center";
        //     Grade := HREmp.Grade;
        //     Gender := HREmp.Gender;

        // end
    end;

    var
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HREmp: Record "HR Employees";
}
