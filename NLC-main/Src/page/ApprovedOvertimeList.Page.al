#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69172 "Approved Overtime List"
{
    CardPageId = "Overtime Header Page";
    PageType = List;
    SourceTable = "Overtime Header";
    SourceTableView = where(Status = const(Approved));
    ApplicationArea = All;
    Caption = 'Approved Overtime List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Code field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                field("EMp No."; Rec."EMp No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EMp No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Weekend Hours"; Rec."Weekend Hours")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Weekend Hours field.';
                }
                field("Total Hours"; Rec."Total Hours")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Hours field.';
                }
                field("Overtime Amount"; Rec."Overtime Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overtime Amount field.';
                }
                field("Convert to pay"; Rec."Convert to pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Convert to pay field.';
                }
                field("Convert to Leave"; Rec."Convert to Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Convert to Leave field.';
                }
                field(Converted; Rec.Converted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Converted field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

