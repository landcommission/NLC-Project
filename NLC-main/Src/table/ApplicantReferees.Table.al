#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193590 "Applicant Referees"
{
    Caption = 'Applicant Referees';
    DataClassification = CustomerContent;
    fields
    {
        field(10; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
        }
        field(20; ApplicantNo; Integer)
        {
            Caption = 'ApplicantNo';
        }
        field(30; FullName; Text[200])
        {
            Caption = 'FullName';
        }
        field(40; Address; Text[200])
        {
            Caption = 'Address';
        }
        field(50; Email; Text[200])
        {
            Caption = 'Email';
        }
        field(60; MobileNo; Text[30])
        {
            Caption = 'MobileNo';
        }
        field(70; Occupation; Text[200])
        {
            Caption = 'Occupation';
        }
        field(80; ReferenceType; Text[50])
        {
            Caption = 'ReferenceType';
        }
        field(90; Company; Text[150])
        {
            Caption = 'Company';
        }
        field(91; Designation; Text[150])
        {
            Caption = 'Designation';
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
