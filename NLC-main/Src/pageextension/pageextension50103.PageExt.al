#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50103 pageextension50103 extends "G/L Account Card"
{

    //Unsupported feature: Property Insertion (InsertAllowed) on ""G/L Account Card"(Page 17)".

    layout
    {
        addafter("Direct Posting")
        {
            field("Expense Code"; Rec."Expense Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Expense Code field.';
            }
            field("Budget Controlled"; Rec."Budget Controlled")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Budget Controlled field.';
            }
            field("Budget Control Account"; Rec."Budget Control Account")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Budget Control Account field.';
            }
            field("Grant Expense"; Rec."Grant Expense")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Grant Expense field.';
            }
        }
        addafter("Last Date Modified")
        {
            field("Donor defined Account"; Rec."Donor defined Account")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Donor defined Account field.';
            }
        }
    }
}
