#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 60000 "Permission Set For Roles"
{
    // SauravNavRP.NAVW17.01 #Saurav Dhyani #07-05-2015
    //   # Copy of Standard Table 2000000004

    Caption = 'Permission Set For Roles';
    DataCaptionFields = "Role ID", Name;
    DataPerCompany = false;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Role ID"; Code[20])
        {
            Caption = 'Role ID';
        }
        field(2; Name; Text[30])
        {
            Caption = 'Name';
        }
    }

    keys
    {
        key(Key1; "Role ID")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
