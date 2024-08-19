#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50141 tableextension50141 extends "Inventory Setup"
{
    fields
    {
        field(50003; "Item Jnl Template"; Code[10])
        {
            TableRelation = "Item Journal Template";
            Caption = 'Item Jnl Template';
            DataClassification = CustomerContent;
        }
        field(50004; "Item Jnl Batch"; Code[10])
        {
            TableRelation = "Item Journal Batch".Name;
            Caption = 'Item Jnl Batch';
            DataClassification = CustomerContent;
        }
        field(50005; "Default Location Stock Limit"; Decimal)
        {
            Caption = 'Default Location Stock Limit';
            DataClassification = CustomerContent;
        }
        field(50006; "Internal Return Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Internal Return Nos';
            DataClassification = CustomerContent;
        }
    }
}
