#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193636 "Bank Pay In Slip List"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = "Bank Slip";
    ApplicationArea = All;
    Caption = 'Bank Pay In Slip List';
    layout
    {
        area(Content)
        {
            repeater(Control1102758000)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Source Dimension 1 Name"; Rec."Source Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Source Depot';
                    ToolTip = 'Specifies the value of the Source Depot field.';
                }
                field("Source Dimension 2 Name"; Rec."Source Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Source Department';
                    ToolTip = 'Specifies the value of the Source Department field.';
                }
                field("From Account Name"; Rec."From Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From Account Name field.';
                }
                field("Destination Dimension 1 Name"; Rec."Destination Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Depot Name';
                    ToolTip = 'Specifies the value of the Destination Depot Name field.';
                }
                field("Destination Dimension 2 Name"; Rec."Destination Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Department Name';
                    ToolTip = 'Specifies the value of the Destination Department Name field.';
                }
                field("To Account Name"; Rec."To Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Account Name field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
    }

    actions { }

    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
    end;
}
