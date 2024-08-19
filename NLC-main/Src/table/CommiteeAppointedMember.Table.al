#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69639 "Commitee Appointed Member"
{
    Caption = 'Commitee Appointed Member';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document No."; Code[30])
        {
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
            TableRelation = Resource."No." where(Type = const(Person));
            Caption = 'Member No.';
            trigger OnValidate()
            begin
                Resource.Reset();
                Resource.SetRange("No.", "Member No.");
                if Resource.FindSet() then begin
                    Employee.Reset();
                    Employee.SetRange("No.", Resource."No.");
                    if Employee.Find('-') then begin
                        "Member Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        "Member Email" := Employee."E-Mail";
                        "Telephone No." := Employee."Phone No.";
                        "Staff No." := Employee."No.";
                        //"ID/Passport No" := Employee."ID Number";
                        // Employee.CalcFields("Job Title");
                        Designation := Employee."Job Title";
                        //"Tax Registration (PIN) No." := Employee."PIN Number";

                    end;
                end;
            end;
        }
        field(5; Role; Option)
        {
            OptionCaption = 'Member,Chairperson,Secretary,Consultant,Joint Secretary,Secretariat Support,Secretariat,In Attendace,Alternate Chairperson,Alternate Secretary';
            OptionMembers = Member,Chairperson,Secretary,Consultant,"Joint Secretary","Secretariat Support",Secretariat,"In Attendace","Alternate Chairperson","Alternate Secretary";
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
        field(9; Designation; Text[250])
        {
            Caption = 'Designation';
        }
        field(10; "Staff No."; Code[30])
        {
            TableRelation = Employee;
            Caption = 'Staff No.';
            trigger OnValidate()
            begin
                Employee.Reset();
                Employee.SetRange("No.", "Staff No.");
                if Employee.FindFirst() then begin
                    //"ID/Passport No" := Employee."ID Number";
                    "Member Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Member Email" := Employee."E-Mail";
                end
            end;
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
        field(15; "Effective Date"; Date)
        {
            Caption = 'Effective Date';
        }
        field(16; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No", "Member No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Employee: Record Employee;
        Resource: Record Resource;
}

