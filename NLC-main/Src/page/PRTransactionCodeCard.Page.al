#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193535 "PR Transaction Code Card"
{
    PageType = Card;
    SourceTable = "PR Transaction Codes";
    ApplicationArea = All;
    Caption = 'PR Transaction Code Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Code field.';
                    trigger OnAssistEdit()
                    begin

                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Is Special Muster"; Rec."Is Special Muster")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is Special Muster field.';
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Name field.';
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Type field.';
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = Basic;
                    ValuesAllowed = Fixed, Varied;
                    ToolTip = 'Specifies the value of the Frequency field.';
                }
                field("Balance Type"; Rec."Balance Type")
                {
                    ApplicationArea = Basic;
                    ValuesAllowed = None, Increasing, Reducing;
                    ToolTip = 'Specifies the value of the Balance Type field.';
                }
                field("Is Cash"; Rec."Is Cash")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is Cash field.';
                }
                field(Taxable; Rec.Taxable)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taxable field.';
                }
                field("Is Formula"; Rec."Is Formula")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is Formula field.';
                }
                field(Formula; Rec.Formula)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Formula field.';
                }
                field("coop parameters"; Rec."coop parameters")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Other Categorization field.';
                }
                label(Control17)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19025872;
                }
                field("Include Employer Deduction"; Rec."Include Employer Deduction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Include Employer Deduction field.';
                }
                field("Employer Deduction"; Rec."Employer Deduction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employer Deduction field.';
                }
                field("Is Formula for employer"; Rec."Is Formula for employer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is Formula for employer field.';
                }
                label(Control13)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19080001;
                }
                field("GL Account"; Rec."GL Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the GL Account field.';
                }
                field(Subledger; Rec.Subledger)
                {
                    ApplicationArea = Basic;
                    Caption = 'Posting to Subledger';
                    ToolTip = 'Specifies the value of the Posting to Subledger field.';
                }
                field(CustomerPostingGroup; Rec.CustomerPostingGroup)
                {
                    ApplicationArea = Basic;
                    Caption = 'Debtor Posting Group';
                    ToolTip = 'Specifies the value of the Debtor Posting Group field.';
                }
                field("Deduct Mortgage"; Rec."Deduct Mortgage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Deduct Mortgage field.';
                }
                field("Deduct Premium"; Rec."Deduct Premium")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Deduct Premium field.';
                }
            }
            group("Special Transactions")
            {
                Caption = 'Special Transactions';
                field("Special Transactions3"; Rec."Special Transactions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Special Transactions Type';
                    ToolTip = 'Specifies the value of the Special Transactions Type field.';
                }
                field("Repayment Method"; Rec."Repayment Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Repayment Method field.';
                }
                field("Exclude Proration?"; Rec."Exclude Proration?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exclude Proration? field.';
                }
                field("Interest Rate"; Rec."Interest Rate")
                {
                    ApplicationArea = Basic;
                    Caption = 'Interest Rate';
                    ToolTip = 'Specifies the value of the Interest Rate field.';
                }
                field(Amount; Amount)
                {
                    ApplicationArea = all;
                }
                field("Repayment Period"; Rec."Repayment Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Repayment Period field.';
                }
            }
            group(Grouping)
            {
                Caption = 'Grouping';
                field("Group Code"; Rec."Group Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Group Code field.';
                }
                field("Group Description"; Rec."Group Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Group Description field.';
                }
                field("itax Grouping"; Rec."itax Grouping")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the itax Grouping field.';
                }
            }
        }
    }

    actions { }

    var
        Text19025872: Label 'E.g ([005]+[020]*[24])/2268';
        Text19080001: Label 'E.g ([005]+[020]*[24])/2268';
}
