#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 60001 "Permission For Roles"
{
    // SauravNavRP.NAVW17.01 #Saurav Dhyani #07-05-2015
    //   # Copy of Standard Table 2000000005
    //   # Changed Lookup Forumla For Role Name
    //   # New Field Added User Role Name

    Caption = 'Permission For Roles';
    DataPerCompany = false;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Role ID"; Code[20])
        {
            Caption = 'Role ID';
            TableRelation = "Permission Set"."Role ID";
        }
        field(2; "Role Name"; Text[30])
        {
            CalcFormula = lookup("Permission Set For Roles".Name where("Role ID" = field("Role ID")));
            Caption = 'Role Name';
            Description = 'SauravNavRP.NAVW17.01';
            FieldClass = FlowField;
            Editable = false;
        }
        field(3; "Object Type"; Option)
        {
            Caption = 'Object Type';
            OptionCaption = 'Table Data,Table,,Report,,Codeunit,XMLport,MenuSuite,Page,Query,System';
            OptionMembers = "Table Data","Table",,"Report",,"Codeunit","XMLport",MenuSuite,"Page","Query",System;
        }
        field(4; "Object ID"; Integer)
        {
            Caption = 'Object ID';
            TableRelation = if ("Object Type" = const("Table Data")) AllObj."Object ID" where("Object Type" = const(Table))
            else
            if ("Object Type" = const(Table)) AllObj."Object ID" where("Object Type" = const(Table))
            else
            if ("Object Type" = const(Report)) AllObj."Object ID" where("Object Type" = const(Report))
            else
            if ("Object Type" = const(Codeunit)) AllObj."Object ID" where("Object Type" = const(Codeunit))
            else
            if ("Object Type" = const(XMLport)) AllObj."Object ID" where("Object Type" = const(XMLport))
            else
            if ("Object Type" = const(MenuSuite)) AllObj."Object ID" where("Object Type" = const(MenuSuite))
            else
            if ("Object Type" = const(Page)) AllObj."Object ID" where("Object Type" = const(Page))
            else
            if ("Object Type" = const(Query)) AllObj."Object ID" where("Object Type" = const(Query))
            else
            if ("Object Type" = const(System)) AllObj."Object ID" where("Object Type" = const(System));
        }
        field(5; "Object Name"; Text[249])
        {
            CalcFormula = lookup(AllObjWithCaption."Object Caption" where("Object Type" = field("Object Type"),
                                                                           "Object ID" = field("Object ID")));
            Caption = 'Object Name';
            FieldClass = FlowField;
            Editable = false;
        }
        field(6; "Read Permission"; Option)
        {
            Caption = 'Read Permission';
            InitValue = Yes;
            OptionCaption = ' ,Yes,Indirect';
            OptionMembers = " ",Yes,Indirect;
        }
        field(7; "Insert Permission"; Option)
        {
            Caption = 'Insert Permission';
            InitValue = Yes;
            OptionCaption = ' ,Yes,Indirect';
            OptionMembers = " ",Yes,Indirect;
        }
        field(8; "Modify Permission"; Option)
        {
            Caption = 'Modify Permission';
            InitValue = Yes;
            OptionCaption = ' ,Yes,Indirect';
            OptionMembers = " ",Yes,Indirect;
        }
        field(9; "Delete Permission"; Option)
        {
            Caption = 'Delete Permission';
            InitValue = Yes;
            OptionCaption = ' ,Yes,Indirect';
            OptionMembers = " ",Yes,Indirect;
        }
        field(10; "Execute Permission"; Option)
        {
            Caption = 'Execute Permission';
            InitValue = Yes;
            OptionCaption = ' ,Yes,Indirect';
            OptionMembers = " ",Yes,Indirect;
        }
        field(11; "Security Filter"; TableFilter)
        {
            Caption = 'Security Filter';
        }
        field(50000; "User Role Name"; Text[30])
        {
            Description = 'SauravNavRP.NAVW17.01';
            Caption = 'User Role Name';
        }
    }

    keys
    {
        key(Key1; "Role ID", "Object Type", "Object ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Role ID", "Role Name") { }
    }
}
