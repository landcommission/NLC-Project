#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50155 pageextension50155 extends "Fixed Asset List"
{
    layout
    {
        modify("Vendor No.")
        {
            Visible = false;
        }
        modify("Maintenance Vendor No.")
        {
            Visible = false;
        }
        modify("Responsible Employee")
        {
            Visible = false;
        }
        modify("FA Location Code")
        {
            Visible = false;
        }
        modify("Budgeted Asset")
        {
            Visible = false;
        }
        addafter(Description)
        {
            field("Supplier Name"; Rec."Supplier Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Supplier Name field.';
            }
            field("Responsible Office/Officer"; Rec."Responsible Office/Officer")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Responsible Office/Officer field.';
            }
            field("Location Name"; Rec."Location Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Location Name field.';
            }
        }
        moveafter(Description; "Search Description")
    }
}
