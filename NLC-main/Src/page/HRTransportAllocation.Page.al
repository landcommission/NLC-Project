#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194039 "HR Transport Allocation"
{
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Functions';
    SourceTable = "HR Transport Allocations H";
    ApplicationArea = All;
    Caption = 'HR Transport Allocation';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Transport Allocation No"; Rec."Transport Allocation No")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Transport Allocation No field.';
                }
                field("Destination(s)"; Rec."Destination(s)")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Destination(s) field.';
                }
                field("Vehicle Reg Number"; Rec."Vehicle Reg Number")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Vehicle Reg Number field.';
                }
                field("Passenger Capacity"; Rec."Passenger Capacity")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Passenger Capacity field.';
                }
                field("Assigned Driver"; Rec."Assigned Driver")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Driver field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Date of Allocation"; Rec."Date of Allocation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Date of Allocation field.';
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Date of Trip field.';
                }
                field("Time of Trip"; Rec."Time of Trip")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Time of Trip field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Linked to Invoice No"; Rec."Linked to Invoice No")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Linked to Invoice No field.';
                }
                field("<Invoice Posting Description>"; Rec."Invoice Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoice Posting Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoice Posting Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part("Passenger List"; "HR Transport Requisition Pass")
            {
                Caption = 'Passenger List';
                SubPageLink = "Allocation No" = field("Transport Allocation No");
            }
            part("HR Transport Allocations List"; "HR Transport Allocations List")
            {
                Caption = 'Hr Transport Allocations';
                SubPageLink = "Transport Allocation No" = field("Transport Allocation No");

            }
            group("Closing Remarks")
            {
                Caption = 'Closing Remarks';
                Visible = false;
                field("Opening Odometer Reading"; Rec."Opening Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Opening Odometer Reading field.';
                }
                field("Closing Odometer Reading"; Rec."Closing Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Closing Odometer Reading field.';
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Journey Route field.';
                }
                field("Time out"; Rec."Time out")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Time out field.';
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Time In field.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1102755002; "HR Transport Alloc. Factbox")
            {
                Caption = 'HR Transport Allocations Factbox';
                SubPageLink = "Transport Allocation No" = field("Transport Allocation No");
            }
            systempart(Control1102755006; Outlook) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        HRTransportAllocationsH.Reset();
                        HRTransportAllocationsH.SetRange(HRTransportAllocationsH."Transport Allocation No", Rec."Transport Allocation No");
                        if HRTransportAllocationsH.Find('-') then
                            Report.Run(39003927, true, true, HRTransportAllocationsH);
                    end;
                }
                action("<Action1102755035>p")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-Open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Re-Open action.';
                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify();
                        Message('Transport Allocation No :: :: has been Re-Opened', Rec."Transport Allocation No");
                    end;
                }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Caption = 'Release';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Release action.';
                    trigger OnAction()
                    begin
                        Question := Text001;
                        if Confirm(Question) then begin
                            Rec.Status := Rec.Status::Released;
                            Rec.Modify();
                            Message('Transport Allocation No :: :: has been released', Rec."Transport Allocation No");
                        end else
                            Message('You selected :: NO :: Release Cancelled');
                    end;
                }
            }
        }
    }


    var
        HRTransportAllocationsH: Record "HR Transport Allocations H";
        Text19021002: Label 'Passenger List';
        Text001: Label 'Are you sure you want to Release this Document?';
        Question: Text;
}
