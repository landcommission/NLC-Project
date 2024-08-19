#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194028 "Contract Milestone Entrie List"
{
    PageType = List;
    SourceTable = Contracts;
    ApplicationArea = All;
    Caption = 'Contract Milestone Entrie List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Contract No"; Rec."Contract No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract No field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Tel No."; Rec."Tel No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tel No. field.';
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact Person field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
                field("Contract Line"; Rec."Contract Line")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Line field.';
                }
                field("Contract Value"; Rec."Contract Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Value field.';
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance field.';
                }
                field("Asset/Service No"; Rec."Asset/Service No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Asset/Service No field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Contract Cycle"; Rec."Contract Cycle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Cycle field.';
                }
                field("Renewal No"; Rec."Renewal No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewal No field.';
                }
                field("Line Type"; Rec."Line Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Type field.';
                }
                field("Review Date"; Rec."Review Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Review Date field.';
                }
                field("Contract Line Type"; Rec."Contract Line Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Line Type field.';
                }
                field("Payment Terms"; Rec."Payment Terms")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Terms field.';
                }
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned To field.';
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Paid field.';
                }
                field("Amount Sales"; Rec."Amount Sales")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Sales field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field(Reasons; Rec.Reasons)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons field.';
                }
                field(Advocates; Rec.Advocates)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advocates field.';
                }
                field("Quantum of Claim"; Rec."Quantum of Claim")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantum of Claim field.';
                }
                field("Review Interval"; Rec."Review Interval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Review Interval field.';
                }
                field("Next Review Date"; Rec."Next Review Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Review Date field.';
                }
                field("Advocate Name"; Rec."Advocate Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advocate Name field.';
                }
                field("Last Review Date"; Rec."Last Review Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Review Date field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
            }
        }
    }

    actions { }
}
