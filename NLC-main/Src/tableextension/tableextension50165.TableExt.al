#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50165 tableextension50165 extends "Item Budget Entry"
{
    fields
    {
        field(39003900; "Posted to GL Budget"; Boolean)
        {
            Caption = 'Posted to GL Budget';
            DataClassification = CustomerContent;
        }
        field(39003901; "Gen. Bus. Posting Group"; Code[50])
        {
            Caption = 'Gen. Bus. Posting Group';
            DataClassification = CustomerContent;
        }
        field(39003902; "Transferred By"; Code[50])
        {
            Caption = 'Transferred By';
            DataClassification = CustomerContent;
        }
        field(39003903; "Date Transferred"; Date)
        {
            Caption = 'Date Transferred';
            DataClassification = CustomerContent;
        }
    }
}
