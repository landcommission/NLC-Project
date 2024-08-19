#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193953 "Posted Vote Transfer List."
{
    CardPageId = "Released Store Requisitions Li";
    DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    SourceTable = "Transfer Schedule 1";
    ApplicationArea = All;
    Caption = 'Posted Vote Transfer List.';
    layout
    {
        area(Content)
        {
            repeater(Control1102760000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Curent Branch"; Rec."Curent Branch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Curent Branch field.';
                }
                field("New Branch"; Rec."New Branch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Branch field.';
                }
                field("Pay Change"; Rec."Pay Change")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Change field.';
                }
                field("Transfer Status"; Rec."Transfer Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Current Location"; Rec."Current Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Location field.';
                }
                field("Approvals Remarks"; Rec."Approvals Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approvals Remarks field.';
                }
                field("New Job Title"; Rec."New Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Job Title field.';
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved By field.';
                }
            }
        }
    }

    actions { }
}
