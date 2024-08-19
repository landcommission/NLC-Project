#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50164 tableextension50164 extends "Transfer Header"
{
    fields
    {
        field(50013; "Quantity Shipped"; Option)
        {
            OptionCaption = '1,2,3';
            OptionMembers = "1","2","3";
            Caption = 'Quantity Shipped';
            DataClassification = CustomerContent;
        }
    }
}
