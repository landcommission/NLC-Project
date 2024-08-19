#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193588 "Applicant Profiles"
{
    Caption = 'Applicant Profiles';
    DataClassification = CustomerContent;
    fields
    {
        field(10; No; Integer)
        {
            AutoIncrement = true;
            Caption = 'No';
        }
        field(20; FirstName; Text[100])
        {
            Caption = 'FirstName';
        }
        field(30; MiddleName; Text[100])
        {
            Caption = 'MiddleName';
        }
        field(40; LastName; Text[100])
        {
            Caption = 'LastName';
        }
        field(50; MaritalStatus; Option)
        {
            Caption = 'MaritalS tatus';
            OptionCaption = ' ,Single,Married,Divorced,Others,Widow(er),Separated';
            OptionMembers = " ",Single,Married,Divorced,Others,Widowed,Separated;
        }
        field(52; SpouseName; Text[100])
        {
            Caption = 'SpouseName';
        }
        field(53; NoofChildren; Text[200])
        {
            Caption = 'NoofChildren';
        }
        field(54; DOB; Date)
        {
            Caption = 'DOB';
        }
        field(55; TelNo; Text[30])
        {
            Caption = 'TelNo';
        }
        field(56; MobileNo; Text[30])
        {
            Caption = 'MobileNo';
        }
        field(57; Email; Text[250])
        {
            Caption = 'Email';
        }
        field(58; MedicalCondition; Text[200])
        {
            Caption = 'MedicalCondition';
        }
        field(59; IdNo; Integer)
        {
            Caption = 'IdNo';
        }
        field(60; Gender; Option)
        {
            Caption = 'Gender';
            OptionMembers = ,Male,Female;
        }
        field(61; CitizenShip; Text[100])
        {
            Caption = 'CitizenShip';
        }
        field(62; "Postal Address"; Text[250])
        {
            Caption = 'Postal Address';
        }
        field(63; "Physical Address"; Text[250])
        {
            Caption = 'Physical Address';
        }
        field(64; FLanguageCode; Code[10])
        {
            Caption = 'FLanguageCode';
        }
        field(65; FLanguageDesc; Text[30])
        {
            Caption = 'FLanguageDesc';
        }
        field(66; SLanguageCode; Code[10])
        {
            Caption = 'SLanguageCode';
        }
        field(67; SLanguageDesc; Text[30])
        {
            Caption = 'SLanguageDesc';
        }
        field(68; ALanguage; Text[100])
        {
            Caption = 'ALanguage';
        }
        field(69; FRead; Boolean)
        {
            Caption = 'FRead';
        }
        field(70; FWrite; Boolean)
        {
            Caption = 'FWrite';
        }
        field(71; FSpeak; Boolean)
        {
            Caption = 'FSpeak';
        }
        field(72; SRead; Boolean)
        {
            Caption = 'SRead';
        }
        field(73; SWrite; Boolean)
        {
            Caption = 'SWrite';
        }
        field(74; Speak; Boolean)
        {
            Caption = 'Speak';
        }
        field(75; ARead; Boolean)
        {
            Caption = 'ARead';
        }
        field(76; AWrite; Boolean)
        {
            Caption = 'AWrite';
        }
        field(77; ASpeak; Boolean)
        {
            Caption = 'ASpeak';
        }
        field(78; FinancialCommitments; Integer)
        {
            Caption = 'FinancialCommitments';
        }
        field(79; NatureofFinacialCommitments; Text[200])
        {
            Caption = 'NatureofFinacialCommitments';
        }
        field(80; NOK; Text[200])
        {
            Caption = 'NOK';
        }
        field(81; NOKRelationship; Text[100])
        {
            Caption = 'NOKRelationship';
        }
        field(82; CitamRelative; Text[50])
        {
            Caption = 'CitamRelative';
        }
        field(83; RelativeRelationship; Text[100])
        {
            Caption = 'RelativeRelationship';
        }
        field(84; "County Of Birth"; Code[100])
        {
            Caption = 'County Of Birth';
        }
        field(85; "County Of Residence"; Code[100])
        {
            Caption = 'County Of Residence';
        }
        field(86; Tribe; Code[100])
        {
            Caption = 'Tribe';
        }
        field(87; "Physical impairement"; Text[100])
        {
            Caption = 'Physical impairement';
        }
        field(89; "CitizenShip For Non-Kenyan"; Text[100])
        {
            Caption = 'CitizenShip For Non-Kenyan';
        }
        field(90; NextOfKinAddress; Text[100])
        {
            Caption = 'NextOfKinAddress';
        }
        field(91; "Alternative Contacts"; Text[100])
        {
            Caption = 'Alternative Contacts';
        }
        field(92; Religion; Text[100])
        {
            Caption = 'Religion';
        }
        field(93; MaritalSatusCode; Code[50])
        {
            Caption = 'MaritalSatusCode';
        }
        field(94; GenderCode; Code[50])
        {
            Caption = 'GenderCode';
        }
        field(95; CitizenshipCode; Code[50])
        {
            TableRelation = "Country/Region".Code;
            Caption = 'CitizenshipCode';
        }
        field(96; CountyOfBirthCode; Code[50])
        {
            Caption = 'CountyOfBirthCode';
        }
        field(97; CountyOfResidenceCode; Code[50])
        {
            Caption = 'CountyOfResidenceCode';
        }
        field(98; RelationshipCode; Code[50])
        {
            Caption = 'RelationshipCode';
        }
        field(99; HasRelative; Boolean)
        {
            Caption = 'HasRelative';
        }
        field(100; PostalCode; Text[30])
        {
            Caption = 'PostalCode';
        }
        field(101; DisabilityCertNo; Text[50])
        {
            Caption = 'DisabilityCertNo';
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
