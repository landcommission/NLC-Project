#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193832 "Project Study areas new"
{
    Caption = 'Project Study areas new';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(2; "Inv. code"; Code[10])
        {
            Caption = 'Inv. code';
        }
        field(3; "Area of Focus"; Option)
        {
            OptionCaption = ' ,Adult Medicine,Basic Science,Behavioural & Social Science,Bioethics,Cardiovascular & Metabolic Disease,Informatics,Laboratory,Nutrition,Oncology,Pharmacy,PMTCT,Public Health & Primary Care,Reproductive Health,Tuberculosis,Other';
            OptionMembers = " ","Adult Medicine","Basic Science","Behavioural & Social Science",Bioethics,"Cardiovascular & Metabolic Disease",Informatics,Laboratory,Nutrition,Oncology,Pharmacy,PMTCT,"Public Health & Primary Care","Reproductive Health",Tuberculosis,Other;
            Caption = 'Area of Focus';
        }
    }

    keys
    {
        key(Key1; "Line No.", "Inv. code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
