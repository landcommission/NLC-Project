page 52193823 "Grant Ledger Entries"
{
    Caption = 'Grant Ledger Entries';
    DataCaptionFields = "Job No.";
    Editable = false;
    PageType = Card;
    SourceTable = "Job-Ledger Entry";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Entry Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
                field(Type; Rec.Type)
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Posting Group field.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Variant Code field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    Editable = false;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Work Type Code"; Rec."Work Type Code")
                {
                    ToolTip = 'Specifies the value of the Work Type Code field.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Direct Unit Cost (LCY)"; Rec."Direct Unit Cost (LCY)")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Direct Unit Cost (LCY) field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ToolTip = 'Specifies the value of the Unit Cost (LCY) field.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Cost field.';
                }
                field("Total Cost (LCY)"; Rec."Total Cost (LCY)")
                {
                    ToolTip = 'Specifies the value of the Total Cost (LCY) field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Unit Price (LCY)"; Rec."Unit Price (LCY)")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Unit Price (LCY) field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    ToolTip = 'Specifies the value of the Line Discount Amount field.';
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                    ToolTip = 'Specifies the value of the Line Discount % field.';
                }
                field("Total Price"; Rec."Total Price")
                {
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Price field.';
                }
                field("Total Price (LCY)"; Rec."Total Price (LCY)")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Price (LCY) field.';
                }
                field("Line Amount (LCY)"; Rec."Line Amount (LCY)")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line Amount (LCY) field.';
                }
                field("Original Unit Cost"; Rec."Original Unit Cost")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Original Unit Cost field.';
                }
                field("Original Unit Cost (LCY)"; Rec."Original Unit Cost (LCY)")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Original Unit Cost (LCY) field.';
                }
                field("Original Total Cost"; Rec."Original Total Cost")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Original Total Cost field.';
                }
                field("Original Total Cost (LCY)"; Rec."Original Total Cost (LCY)")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Original Total Cost (LCY) field.';
                }
                field("Original Total Cost (ACY)"; Rec."Original Total Cost (ACY)")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Original Total Cost (ACY) field.';
                }
                field("User ID"; Rec."User ID")
                {
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Source Code"; Rec."Source Code")
                {
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Source Code field.';
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Reason Code field.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
                field("Lot No."; Rec."Lot No.")
                {
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Lot No. field.';
                }
                field("Ledger Entry Type"; Rec."Ledger Entry Type")
                {
                    ToolTip = 'Specifies the value of the Ledger Entry Type field.';
                }
                field("Ledger Entry No."; Rec."Ledger Entry No.")
                {
                    ToolTip = 'Specifies the value of the Ledger Entry No. field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field(Adjusted; Rec.Adjusted)
                {
                    ToolTip = 'Specifies the value of the Adjusted field.';
                }
                field("DateTime Adjusted"; Rec."DateTime Adjusted")
                {
                    ToolTip = 'Specifies the value of the DateTime Adjusted field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("Ent&ry")
            {
                Caption = 'Ent&ry';
                action("<Page Ledger Entry Dimensions>")
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = page "Ledger Entry Dimensions";
                    RunPageLink = "Table ID" = const(39004331),
                                  "Entry No." = field("Entry No.");
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                }
            }
        }
        area(Processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Transfer To Planning Lines")
                {
                    Caption = 'Transfer To Planning Lines';
                    Ellipsis = true;
                    ToolTip = 'Executes the Transfer To Planning Lines action.';

                }
            }
            action("&Navigate")
            {
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the &Navigate action.';
                trigger OnAction()
                begin
                    Navigate.SetDoc(Rec."Posting Date", Rec."Document No.");
                    Navigate.Run();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if ActiveField = 1 then;
        if ActiveField = 2 then;
        if ActiveField = 3 then;
        if ActiveField = 4 then;
    end;

    var
        Navigate: Page Navigate;
        ActiveField: Option " ",Cost,CostLCY,PriceLCY,Price;

    [Scope('OnPrem')]
    procedure SetActiveField(ActiveField2: Integer)
    begin
        ActiveField := ActiveField2;
    end;
}

