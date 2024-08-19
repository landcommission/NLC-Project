#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193986 "Tender Card"
{
    PageType = Document;
    SourceTable = Tender;
    ApplicationArea = All;
    Caption = 'Tender Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Tender ID"; Rec."Tender ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field("Valid From"; Rec."Valid From")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Valid From field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Tender Type"; Rec."Tender Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Type field.';
                }
                field(Open; Rec.Open)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Open field.';
                }
                field("Valid To"; Rec."Valid To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Valid To field.';
                }
            }
            part("Tender Product List"; "Tender Product List")
            {
                Caption = 'Item';
                SubPageLink = "Tender No" = field("Tender ID");
            }
            part(Specifications; "Tender Specification List")
            {
                Caption = 'Specifications';
                SubPageLink = "Tender No" = field("Tender ID");
            }
        }
    }

    actions { }
}
