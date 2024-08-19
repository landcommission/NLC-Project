#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193745 "Staff Grant Subform"
{
    PageType = ListPart;
    SourceTable = "Store Requistion Lines";
    ApplicationArea = All;
    Caption = 'Staff Grant Subform';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Quantity Requested"; Rec."Quantity Requested")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Quantity Requested field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Issuing Store"; Rec."Issuing Store")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuing Store field.';
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Bin Code field.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    begin
        UpdateControls();
        //CurrPage.UPDATE;
    end;

    var
        StatusEditable: Boolean;


    procedure UpdateControls()
    begin
        Rec.CalcFields(Rec."Request Status");
        if Rec."Request Status" = Rec."Request Status"::Open then
            StatusEditable := true
        else
            StatusEditable := false;
    end;


    procedure CurrPageUpdate()
    begin
        //xRec:=Rec;
        UpdateControls();
        CurrPage.Update();
    end;
}
