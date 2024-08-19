#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194077 "HR Medical Claims List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "HR Medical Claims";
    UsageCategory = Lists;
    Caption = 'HR Medical Claims List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Member No"; Rec."Member No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member No field.';
                }
                field("Claim No"; Rec."Claim No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Claim No field.';
                }
                field("Claim Type"; Rec."Claim Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Claim Type field.';
                }
                field("Claim Date"; Rec."Claim Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Claim Date field.';
                }
                field(Dependants; Rec.Dependants)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dependants field.';
                }
                field("Patient Name"; Rec."Patient Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Patient Name field.';
                }
                field("Document Ref"; Rec."Document Ref")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Ref field.';
                }
                field("Date of Service"; Rec."Date of Service")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Service field.';
                }
                field("Attended By"; Rec."Attended By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attended By field.';
                }
                field("Amount Charged"; Rec."Amount Charged")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Charged field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
        }
    }

    actions { }

    var
        Dependants: Record "HR Employee Kin";
}
