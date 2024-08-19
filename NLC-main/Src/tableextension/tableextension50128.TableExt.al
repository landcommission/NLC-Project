#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50128 tableextension50128 extends Resource
{
    fields
    {
        field(39003900; "Employee No"; Code[20])
        {
            TableRelation = "FA Budget Entry"."Entry No.";
            Caption = 'Employee No';
            DataClassification = CustomerContent;
        }
        field(39003901; Email; Text[30])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
        }
        field(39003902; Telephone; Text[30])
        {
            Caption = 'Telephone';
            DataClassification = CustomerContent;
        }
        field(39003903; Institution; Option)
        {
            OptionCaption = ' ,MTRH,MU,Others';
            OptionMembers = " ",MTRH,MU,Others;
            Caption = 'Institution';
            DataClassification = CustomerContent;
        }
    }
}
