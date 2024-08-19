#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50134 tableextension50134 extends "Bank Acc. Reconciliation Line"
{
    fields
    {
        field(50000; Reconciled; Boolean)
        {
            Caption = 'Reconciled';
            DataClassification = CustomerContent;

        }
        field(50004; "Open Type"; Option)
        {
            OptionCaption = ' ,Unpresented Cheques List,Uncredited Cheques List';
            OptionMembers = " ",Unpresented,Uncredited;
            Caption = 'Open Type';
            DataClassification = CustomerContent;
        }
        field(50005; "Bank Ledger Entry Line No"; Integer)
        {
            Caption = 'Bank Ledger Entry Line No';
            DataClassification = CustomerContent;
        }
        field(50006; "Bank Statement Entry Line No"; Integer)
        {
            Caption = 'Bank Statement Entry Line No';
            DataClassification = CustomerContent;
        }
    }

    //Unsupported feature: Property Deletion (Local) on "RemoveApplication(PROCEDURE 1)".

}
