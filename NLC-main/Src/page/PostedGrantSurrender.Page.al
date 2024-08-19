#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193844 "Posted Grant Surrender"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Grant Surrender Header";
    SourceTableView = where(Posted = const(true));
    ApplicationArea = All;
    Caption = 'Posted Grant Surrender';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Surrender Date"; Rec."Surrender Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surrender Date field.';
                }
                field(Grant; Rec.Grant)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No. field.';

                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Grant Phase"; Rec."Grant Phase")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Phase field.';

                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';

                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';

                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Date Posted"; Rec."Date Posted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Posted field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cashier field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Surrender Posting Date"; Rec."Surrender Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surrender Posting Date field.';
                }
                field("Allow Overexpenditure"; Rec."Allow Overexpenditure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow Overexpenditure field.';
                }
                field("Open for Overexpenditure by"; Rec."Open for Overexpenditure by")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Open for Overexpenditure by field.';
                }
                field("Date opened for OvExpenditure"; Rec."Date opened for OvExpenditure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date opened for OvExpenditure field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
            }
            group(Statistics)
            {
                Caption = 'Statistics';
                field("Disbursed Cost"; Rec."Disbursed Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disbursed Cost field.';
                }
                field("Actual Spent"; Rec."Actual Spent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Spent field.';
                }
                field("Questioned Cost"; Rec."Questioned Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Questioned Cost field.';
                }
            }
        }
    }

    actions { }

    var
        Text000: Label 'You have not specified the Actual Amount Spent. This document will only reverse the committment and you will have to receipt the total amount returned.';
        Text001: Label 'Document Not Posted';
        Text002: Label 'Are you sure you want to Cancel this Document?';
}
