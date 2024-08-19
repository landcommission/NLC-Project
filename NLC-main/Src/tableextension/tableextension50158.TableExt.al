#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50158 tableextension50158 extends "Misc. Article Information"
{
    fields
    {
        modify("Employee No.")
        {
            TableRelation = "FA Budget Entry";
        }

        //Unsupported feature: Property Modification (Data type) on ""Misc. Article Code"(Field 2)".

        field(39003900; Returned; Boolean)
        {
            Caption = 'Returned';
            DataClassification = CustomerContent;
        }
        field(39003901; "Status On Return"; Option)
        {
            OptionMembers = Ok," Needs Repair"," Needs Maintenance";
            Caption = 'Status On Return';
            DataClassification = CustomerContent;
        }
        field(39003902; "Date Returned"; Date)
        {
            Caption = 'Date Returned';
            DataClassification = CustomerContent;
        }
        field(39003903; Recommendations; Text[150])
        {
            Caption = 'Recommendations';
            DataClassification = CustomerContent;
        }
        field(39003904; "Received By"; Code[30])
        {
            Editable = false;
            Caption = 'Received By';
            DataClassification = CustomerContent;
        }
    }
}
