#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193675 "Funds Mgt Comment List"
{
    Caption = 'Funds Mgt Comment List';
    DataCaptionFields = "Document Type";
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = N;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("User Id"; Rec."User Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Id field.';
                }
            }
        }
    }

    actions { }
}
