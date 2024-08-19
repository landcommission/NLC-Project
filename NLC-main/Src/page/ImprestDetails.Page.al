#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193656 "Imprest Details"
{
    PageType = ListPart;
    SourceTable = "Imprest Lines";
    ApplicationArea = All;
    Caption = 'Imprest Details';
    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field("Advance Type"; Rec."Advance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance Type field.';
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Account No:"; Rec."Account No:")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Account No: field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Destination Code"; Rec."Destination Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Code field.';
                }
                field("No of Days"; Rec."No of Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Days field.';
                }
                field("Daily Rate(Amount)"; Rec."Daily Rate(Amount)")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Daily Rate(Amount) field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Amount field.';

                }
                field("Imprest Holder"; Rec."Imprest Holder")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Holder field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Date Issued"; Rec."Date Issued")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Issued field.';
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
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,3';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[3] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(3, ShortcutDimCode[3]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                    end;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,4';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[4] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(4, ShortcutDimCode[4]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                    end;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,5';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[5] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(5, ShortcutDimCode[5]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                    end;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,6';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[6] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(6, ShortcutDimCode[6]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                    end;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,7';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[7] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(7, ShortcutDimCode[7]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                    end;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,8';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[8] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(8, ShortcutDimCode[8]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                    end;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    var
        PayHeader: Record "Pending Vch. Surr. Line";
        PayLine: Record "Receipt Line";
        Bal: Decimal;
        ShortcutDimCode: array[8] of Code[20];
}
