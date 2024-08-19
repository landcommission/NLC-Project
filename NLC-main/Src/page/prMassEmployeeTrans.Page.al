#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193534 "prMassEmployee Trans"
{
    CardPageId = "prMassList Transactions";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "PR Transaction Codes";
    SourceTableView = sorting("Transaction Code")
                      order(ascending)
                      where("Transaction Type" = filter(Deduction));
    ApplicationArea = All;
    Caption = 'prMassEmployee Trans';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Code field.';
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Name field.';
                }
            }
        }
    }

    actions { }
}
