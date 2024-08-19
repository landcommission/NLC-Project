#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 50014 "Store Requisition List"
{
    PageType = List;
    SourceTable = "Store Requistion Headers";
    ApplicationArea = All;
    Caption = 'Store Requisition List';
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
                field("Request date"; Rec."Request date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request date field.';
                }
                field("Required Date"; Rec."Required Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Required Date field.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field("Request Description"; Rec."Request Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Description field.';
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
                field(Supplier; Rec.Supplier)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier field.';
                }
                field("Action Type"; Rec."Action Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Type field.';
                }
                field(Justification; Rec.Justification)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Justification field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Function Name"; Rec."Function Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Function Name field.';
                }
                field("Budget Center Name"; Rec."Budget Center Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Center Name field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field(Dim3; Rec.Dim3)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dim3 field.';
                }
                field(Dim4; Rec.Dim4)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dim4 field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(TotalAmount; Rec.TotalAmount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TotalAmount field.';
                }
                field("Issuing Store"; Rec."Issuing Store")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuing Store field.';
                }
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Printed field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Received; Rec.Received)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received field.';
                }
                field("Received By"; Rec."Received By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received By field.';
                }
                field("Received Date"; Rec."Received Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received Date field.';
                }
                field("Invoice No"; Rec."Invoice No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoice No field.';
                }
                field("Order No"; Rec."Order No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Order No field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Purchasing Store"; Rec."Purchasing Store")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchasing Store field.';
                }
                field("Date Received"; Rec."Date Received")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Received field.';
                }
                field(Rejected; Rec.Rejected)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rejected field.';
                }
                field("Rejected By"; Rec."Rejected By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rejected By field.';
                }
                field("Rejected Date"; Rec."Rejected Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rejected Date field.';
                }
            }
        }
    }

    actions { }
}
