#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193946 "Internal Return Header new"
{
    PageType = Card;
    SourceTable = "Internal Return Header";
    SourceTableView = where("Document type" = filter("Internal Return Order"),
                            Status = filter(<> Posted));
    ApplicationArea = All;
    Caption = 'Internal Return Header new';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(Fund; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field(Donor; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field(Activity; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field(Department; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field("Return to Store"; Rec."Return to Store")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return to Store field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Store Requisition No."; Rec."Store Requisition No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Store Requisition No. field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group(Lines)
            {
                part(Control13; "Internal Return lines new")
                {
                    SubPageLink = "Document No." = field("No.");
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(ActionGroup16)
            {
                action("Post Internal Return")
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Post Internal Return action.';
                    trigger OnAction()
                    begin
                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        if Rec.Status = Rec.Status::Posted then
                            Error('The Document Has Already been Posted');

                        if Rec.Status <> Rec.Status::Released then
                            Error('The Document Has not yet been Approved');

                        if InventorySetup.Get() then begin
                            InventorySetup.TestField(InventorySetup."Item Jnl Template");
                            InventorySetup.TestField(InventorySetup."Item Jnl Batch");

                            GenJnline.Reset();
                            GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                            GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                            if GenJnline.Find('-') then
                                GenJnline.DeleteAll();
                            Message(Format(InventorySetup."Item Jnl Template" + InventorySetup."Item Jnl Batch"));

                            Rec.TestField(Rec."Return to Store");
                            RetLine.Reset();
                            RetLine.SetRange(RetLine."Document No.", Rec."No.");
                            Rec.TestField(Rec."Return to Store");
                            if RetLine.Find('-') then begin
                                repeat
                                    //Issue
                                    LineNo := LineNo + 1000;
                                    GenJnline.Init();
                                    GenJnline."Journal Template Name" := InventorySetup."Item Jnl Template";
                                    GenJnline."Journal Batch Name" := InventorySetup."Item Jnl Batch";
                                    GenJnline."Line No." := LineNo;
                                    GenJnline."Entry Type" := GenJnline."Entry Type"::"Positive Adjmt.";
                                    GenJnline."Document No." := Rec."No.";
                                    GenJnline."Item No." := RetLine."Item No.";
                                    GenJnline.Validate("Item No.");
                                    GenJnline."Location Code" := Rec."Return to Store";
                                    GenJnline."Posting Date" := Today;
                                    //GenJnline.Description:=RetLine.Description;
                                    //Control to prevent over withdrawing from stores
                                    /*
                                    ItemLedger.RESET;
                                    ItemLedger.SETRANGE(ItemLedger."Item No.",ReqLine."No.");
                                    ItemLedger.SETRANGE(ItemLedger."Location Code",ReqLine."Issuing Store");
                                    ItemLedger.CALCSUMS(Quantity);
                                   IF ItemLedger.Quantity<=0 THEN ERROR('Item %1 is out of stock in store %2',ReqLine.Description,ReqLine."Issuing Store");

                                 */
                                    GenJnline."Shortcut Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";
                                    GenJnline.Validate("Shortcut Dimension 1 Code");
                                    GenJnline."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                                    GenJnline.Validate("Shortcut Dimension 2 Code");

                                    //GenJnline.ValidateShortcutDimCode(3,ReqLine."Shortcut Dimension 3 Code");
                                    //GenJnline.ValidateShortcutDimCode(4,ReqLine."Shortcut Dimension 4 Code");
                                    GenJnline.Quantity := RetLine.Quantity;
                                    GenJnline.Validate(Quantity);
                                    GenJnline.Validate("Unit Amount");
                                    GenJnline."Reason Code" := '221';
                                    GenJnline.Validate("Reason Code");
                                    //GenJnline."Gen. Prod. Posting Group":= RetLine."Gen. Prod. Posting Group";
                                    //GenJnline."Gen. Bus. Posting Group":=RetLine."Gen. Bus. Posting Group";
                                    GenJnline.Insert(true);

                                    RetLine."Request Status" := RetLine."Request Status"::Closed;

                                until RetLine.Next() = 0;
                                // END;END;{
                                //Post Entries
                                GenJnline.Reset();
                                GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                                GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                                Codeunit.Run(Codeunit::"Item Jnl.-Post", GenJnline);
                                //End Post entries

                                //Modify All
                                Post := false;
                                Post := JournlPosted.PostedSuccessfully();
                                if Post then begin
                                    RetLine.ModifyAll(RetLine."Request Status", RetLine."Request Status"::Closed);
                                    Rec.Status := Rec.Status::Posted;
                                    Rec.Modify();
                                end
                            end;
                        end;

                        Rec.Status := Rec.Status::Posted;
                        Rec.Modify();

                    end;
                }
            }
        }
    }

    var
        InventorySetup: Record "Inventory Setup";
        RetLine: Record "Internal Return Lines";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        RetHeader: Record "Internal Return Header";
        Post: Boolean;
        JournlPosted: Codeunit "Journal Post Successful";


    procedure LinesExists() HasLines: Boolean
    var
        RetLines: Record "Internal Return Lines";
    begin

        RetLines.Reset();
        RetLines.SetRange(RetLines."Document No.", Rec."No.");
        if RetLines.Find('-') then
            exit(true)
        else
            exit(false);
    end;
}
