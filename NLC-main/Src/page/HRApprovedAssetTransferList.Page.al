#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194056 "HR ApprovedAsset Transfer List"
{
    ApplicationArea = Basic;
    CardPageId = "HR Approved Asset Transfer";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "HR Asset Transfer Header";
    SourceTableView = where(Status = const(Approved));
    UsageCategory = Lists;
    Caption = 'HR ApprovedAsset Transfer List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Transfered; Rec.Transfered)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfered field.';
                }
                field("Date Transfered"; Rec."Date Transfered")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Transfered field.';
                }
                field("Transfered By"; Rec."Transfered By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfered By field.';
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Posted field.';
                }
            }
        }
    }

    actions { }
}
