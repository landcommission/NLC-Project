#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50060 "Pending Disposal Asset Lines"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "Disposal plan table line";
    SourceTableView = where("Line Status" = const(Posted),
                            "Line Disposal Status" = const("Disposal implementation"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Select; Select)
                {
                    ApplicationArea = Basic;
                }
                field("Ref. No."; "Ref. No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field("Item description"; "Item description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Asset Description';
                }
                field("Date Of Acquisition"; "Date Of Acquisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Of Acquisition';
                }
                field("Value Of Purchase"; "Value Of Purchase")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Amount';
                    Editable = false;
                }
                field("Planned Date"; "Planned Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Department; Department)
                {
                    ApplicationArea = Basic;
                }
                field(County; County)
                {
                    ApplicationArea = Basic;
                }
                field(Approved; Approved)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Serial No"; "Serial No")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Period"; "Disposal Period")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Status"; "Disposal Status")
                {
                    ApplicationArea = Basic;
                }
                field("Reason for Disposal"; "Reason for Disposal")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Method Description"; "Disposal Method Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disposal Method';
                }
                field("Salvage Value"; "Salvage Value")
                {
                    ApplicationArea = Basic;
                }
                field("Estimated Shelf Life"; "Estimated Shelf Life")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Amount"; "Disposal Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("<Action1102755026>")
            {
                Caption = '&Functions';
                action("<Action1102755028>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approve Selected Disposal Lines';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin

                        if Confirm('Approve Disposal for the Selected Lines?', true) = false then exit;
                        Rec.Reset;
                        Rec.SetRange(Rec.Select, true);
                        Rec.SetRange(Rec.Status, Rec.Status::Approved);
                        if Rec.Find('-') then begin
                            repeat
                                Rec.Status := Rec.Status::Posted;
                                "Disposal Status" := "disposal status"::"Disposal implementation";
                                Modify;
                            until Rec.Next = 0;
                        end;
                    end;
                }
                separator(Action29)
                {
                }
                action("<Action1102755032>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reject  Selected Disposal Lines';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        /*
                         IF CONFIRM('Disposal this Items / Assets contained in this Application?',TRUE)=FALSE THEN EXIT;
                           ReqLine.RESET;
                           ReqLine.SETRANGE(ReqLine."Ref. No.","No.");
                           IF ReqLine.FIND('-') THEN BEGIN
                           REPEAT
                           //Update Item as Disposed
                               IF ReqLine.Type=ReqLine.Type::Item THEN
                                  BEGIN
                                  ItemRec.RESET;
                                  ItemRec.SETRANGE(ItemRec."No.",ReqLine."No.");
                                  IF ItemRec.FIND('-') THEN
                                     ItemRec.Disposed:=TRUE;
                                     ItemRec."Disposed By":=USERID;
                                     ItemRec."Disposal Date":=TODAY;
                                     ItemRec."Disposal Reason":=ReqLine."Reason for Disposal";
                                     ItemRec.MODIFY;
                                  END;
                           //Update Fixed Asset as Disposed
                               IF ReqLine.Type=ReqLine.Type::"Fixed Asset" THEN
                                  BEGIN
                                  AssetRec.RESET;
                                  AssetRec.SETRANGE(AssetRec."No.",ReqLine."No.");
                                  IF AssetRec.FIND('-') THEN
                                     AssetRec.Disposed:=TRUE;
                                     AssetRec."Disposed By":=USERID;
                                     AssetRec."Disposal Date":=TODAY;
                                     AssetRec."Disposal Reason":=ReqLine."Reason for Disposal";
                                     AssetRec."Asset Movement Status":=AssetRec."Asset Movement Status"::Disposed;
                                     AssetRec.MODIFY;
                                  END;
                          UNTIL ReqLine.NEXT=0;
                          Status:=Status::Posted;
                          MODIFY
                          END;
                          */

                    end;
                }
                separator(Action25)
                {
                }
                action("<Action1102755033>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mark as Disposed';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = true;

                    trigger OnAction()
                    begin

                        if Confirm('Mark this Assets as Disposed?', true) = false then exit;
                        Rec.Reset;
                        Rec.SetRange(Rec.Select, true);
                        Rec.SetRange("Line Disposal Status", "line disposal status"::"Disposal implementation");
                        if Rec.Find('-') then begin
                            repeat
                                //Update Item as Disposed
                                if Rec.Type = Rec.Type::Item then begin
                                    ItemRec.Reset;
                                    ItemRec.SetRange(ItemRec."No.", Rec."No.");
                                    if ItemRec.Find('-') then begin
                                        // ItemRec.Disposed := true;
                                        // ItemRec."Disposed By" := UserId;
                                        ItemRec."Disposal Date" := Today;
                                        ItemRec."Disposal Reason" := Rec."Reason for Disposal";
                                        ItemRec.Modify;
                                    end;
                                end;
                                //Update Fixed Asset as Disposed
                                if Rec.Type = Rec.Type::"Fixed Asset" then begin
                                    AssetRec.Reset;
                                    AssetRec.SetRange(AssetRec."No.", Rec."No.");
                                    if AssetRec.Find('-') then begin
                                        // AssetRec.Disposed := true;
                                        // AssetRec."Disposed By" := UserId;
                                        // AssetRec."Disposal Date" := Today;
                                        // AssetRec."Disposal Reason" := Rec."Reason for Disposal";
                                        // AssetRec."Asset Movement Status" := AssetRec."asset movement status"::Disposed;
                                        // AssetRec.Modify;
                                    end;
                                end;
                            until Rec.Next = 0;
                            Rec."Line Status" := Rec."line status"::Posted;
                            "Line Disposal Status" := "line disposal status"::Disposed;
                            Rec.Modify;
                        end;
                    end;
                }
            }
            group("Document Management")
            {
                Caption = 'Document Management';
                Description = 'Document Management';
                action("DMS Link")
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Documents';
                    Image = Web;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if CompanyInfo.Get then begin
                            Link := CompanyInfo."Documents Attachment Link";
                            Hyperlink(Link);
                        end;
                    end;
                }
                action("View Attached Documents")
                {
                    ApplicationArea = Basic;
                    Caption = 'View Attached Documents';
                    Image = Web;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page Attachment;
                    // RunPageLink = IFMIS_No = field("Ref. No.");
                    RunPageMode = View;
                }
            }
        }
    }

    trigger OnClosePage()
    begin
        Rec.SetRange(Select, true);
        if Rec.Find('-') then
            repeat
                Rec.Select := false;
                Rec.Modify;
            until Rec.Next = 0;
    end;

    var
        HREmp: Record 52193433;
        ItemRec: Record Item;
        AssetRec: Record "Fixed Asset";
        CompanyInfo: Record "Company Information";
        Link: Text;
}

