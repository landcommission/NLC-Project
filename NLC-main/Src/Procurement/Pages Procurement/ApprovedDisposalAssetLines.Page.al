#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50058 "Approved Disposal Asset Lines"
{
    Caption = 'Approved Disposal Asset Lines';
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "Disposal plan table line";
    SourceTableView = where(Status = const(Approved),
                            "Line Status" = const(Open));

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
                    Caption = 'Estimated Current  Life';
                }
                field("Disposal Amount"; "Disposal Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Rejection Comments"; "Rejection Comments")
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
                action("Approve Selected Disposal Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approve Selected Disposal Lines';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = true;

                    trigger OnAction()
                    begin

                        if Confirm('Approve Disposal for the Selected Lines?', true) = false then exit;
                        //Rec.RESET;
                        Rec.SetCurrentkey("Ref. No.", "Line No.");
                        CalcFields(Rec.Status);
                        Rec.SetRange(Rec.Select, true);
                        Rec.SetRange(Rec.Status, Rec.Status::Approved);
                        if Rec.Find('-') then begin
                            repeat
                                Rec."Line Status" := Rec."line status"::Posted;
                                Rec."Line Disposal Status" := Rec."line disposal status"::"Disposal implementation";
                                Rec.Modify;
                            //MESSAGE('%1%2%3',"Ref. No.","Line No.",Rec."Line Status");
                            until Rec.Next = 0;
                        end;
                    end;
                }
                separator(Action29)
                {
                }
                action("Reject  Selected Disposal Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reject  Selected Disposal Lines';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        if Confirm('Reject Disposal for the Selected Lines?', true) = false then exit;
                        Rec.Reset;
                        //Rec.SETCURRENTKEY("Ref. No.","Line No.");
                        Rec.SetRange(Rec.Select, true);
                        Rec.SetRange(Rec.Status, Rec.Status::Approved);
                        if Rec.Find('-') then begin
                            repeat

                                CalcFields(Rec.Status);
                                //CALCFIELDS(Rec."Line Status");
                                TestField("Rejection Comments");
                                Rec."Line Status" := Rec."line status"::Rejected;
                                Rec.Status := Rec.Status::Rejected;
                            //  MESSAGE('%1%2%3',"Ref. No.",Rec.Status,Rec."Line Status");
                            until Rec.Next = 0;
                            Rec.Modify;
                        end;
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
                    Visible = false;

                    trigger OnAction()
                    begin

                        if Confirm('Mark this Assets as Disposed?', true) = false then exit;
                        Rec.Reset;
                        Rec.SetRange(Rec.Select, true);
                        Rec.SetRange("Disposal Status", "disposal status"::"Disposal implementation");
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
                                    // if AssetRec.Find('-') then begin
                                    //     AssetRec.Disposed := true;
                                    //     AssetRec."Disposed By" := UserId;
                                    //     AssetRec."Disposal Date" := Today;
                                    //     AssetRec."Disposal Reason" := Rec."Reason for Disposal";
                                    //     AssetRec."Asset Movement Status" := AssetRec."asset movement status"::Allocated;
                                    //     AssetRec.Modify;
                                    // end;
                                end;
                            until Rec.Next = 0;
                            Rec.Status := Rec.Status::Posted;
                            "Disposal Status" := "disposal status"::Disposed;
                            Modify
                        end;
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Reset;
                        SetFilter("No.", "No.");
                        Report.Run(50010, true, true, Rec);
                        Reset;
                    end;
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
}

