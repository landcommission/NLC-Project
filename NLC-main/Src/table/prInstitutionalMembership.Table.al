#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193550 "prInstitutional Membership"
{
    LookupPageId = "Imprest Request";
    Caption = 'prInstitutional Membership';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Group No"; Code[10])
        {
            TableRelation = "prMembership Groups"."Group No";
            Caption = 'Group No';
        }
        field(2; "Institution No"; Code[10])
        {
            Caption = 'Institution No';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; Address; Text[200])
        {
            Caption = 'Address';
        }
        field(10; "Current Month Filter"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Current Month Filter';
        }
        field(11; "Location/Division Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('LOC/DIV'));
            Caption = 'Location/Division Filter';
        }
        field(12; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPARTMENT'));
            Caption = 'Department Filter';
        }
        field(13; "Cost Centre Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('COSTCENTRE'));
            Caption = 'Cost Centre Filter';
        }
        field(14; "Salary Grade Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "PR Basic Pay"."Employee No";
            Caption = 'Salary Grade Filter';
        }
        field(15; "Salary Notch Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            Caption = 'Salary Notch Filter';
            //TableRelation = "prSalary Review Lines".test where ("Line No."=field("Salary Grade Filter"));
        }
    }

    keys
    {
        key(Key1; "Group No", "Institution No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
