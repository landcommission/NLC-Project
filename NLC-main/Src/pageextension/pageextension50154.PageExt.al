#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50154 pageextension50154 extends "Fixed Asset Card"
{
    layout
    {

        //Unsupported feature: Property Modification (SourceExpr) on ""Responsible Employee"(Control 63)".


        //Unsupported feature: Property Modification (Name) on ""Responsible Employee"(Control 63)".

        modify("Vendor No.")
        {

            //Unsupported feature: Property Modification (Name) on ""Vendor No."(Control 10)".

            Caption = 'Maintenance Vendor No';
        }
        modify("Main Asset/Component")
        {
            Visible = false;
        }
        modify("Component of Main Asset")
        {
            Visible = false;
        }
        addafter("Serial No.")
        {
            field("Financed By"; Rec."Financed By")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Financed By field.';
            }
            field("Tag No"; Rec."Tag No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Tag No field.';
            }
            field("Make/Model"; Rec."Make/Model")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Make/Model field.';
            }
            field("Date of Delivery/Installation"; Rec."Date of Delivery/Installation")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Date of Delivery/Installation field.';
            }
            field(Condition; Rec.Condition)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Condition field.';
            }
            field("Supplier Name"; Rec."Supplier Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Supplier Name field.';
            }
            field("County Name"; Rec."County Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the County Name field.';
            }
            field("Location Name"; Rec."Location Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Location Name field.';
            }
            field("Responsible Office/Officer"; Rec."Responsible Office/Officer")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Responsible Office/Officer field.';
            }
            field("Notes/Remarks"; Rec."Notes/Remarks")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Notes/Remarks field.';
            }
        }
        addafter(Blocked)
        {
            field(Supplier; Rec."Vendor No.")
            {
                ApplicationArea = Basic;
                Caption = 'Supplier';
                ToolTip = 'Specifies the number of the vendor from which you purchased this fixed asset.';
            }
        }
        addafter("Responsible Employee")
        {
            field("Responsible Office"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = Basic;
                Caption = 'Responsible Office';
                ToolTip = 'Specifies the value of the Responsible Office field.';
            }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
            }
            field("Location Code"; Rec."Location Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Location Code field.';
            }
            field("Asset Type"; Rec."Asset Type")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Asset Type field.';
            }
        }
        moveafter(Description; "Search Description")
        moveafter("Serial No."; Inactive)
    }
}
