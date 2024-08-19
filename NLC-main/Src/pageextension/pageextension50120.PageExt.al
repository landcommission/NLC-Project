#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50120 pageextension50120 extends "General Ledger Setup"
{
    layout
    {
        addafter("Bank Account Nos.")
        {
            field("Journal Approval Nos"; Rec."Journal Approval Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Journal Approval Nos field.';
            }
            field("Payroll Posting Group"; Rec."Payroll Posting Group")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Payroll Posting Group field.';
            }
            field("Interbank Transfer Nos"; Rec."Interbank Transfer Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Interbank Transfer Nos field.';
            }
        }
        addafter("Bank Account Nos.")
        {
            field("Vote Transfer"; Rec."Vote Transfer")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Vote Transfer field.';
            }
            field("Incident Nos."; Rec."Incident Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Incident Nos. field.';
            }
            field("Accident Nos"; Rec."Accident Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Accident Nos field.';
            }
            field("Master Record Form Nos"; Rec."Master Record Form Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Master Record Form Nos field.';
            }
        }
    }
}
