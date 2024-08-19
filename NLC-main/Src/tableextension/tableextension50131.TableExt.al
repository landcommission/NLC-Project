#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50131 tableextension50131 extends "General Posting Setup"
{
    fields
    {
        field(39003900; "Indirect Cost Applied Account"; Code[20])
        {
            TableRelation = "G/L Account";
            Caption = 'Indirect Cost Applied Account';
            DataClassification = CustomerContent;
        }
    }
}
