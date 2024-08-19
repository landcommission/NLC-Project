#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194023 "IBT Lines"
{
    PageType = ListPart;
    SourceTable = "Clearance Certificate";
    ApplicationArea = All;
    Caption = 'IBT Lines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Working Tools"; Rec."Working Tools")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Working Tools field.';
                }
                field("Office & Desk Keys"; Rec."Office & Desk Keys")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Office & Desk Keys field.';
                }
                field("Car Keys"; Rec."Car Keys")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Car Keys field.';
                }
                field("Other Fin"; Rec."Other Fin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Other Fin field.';
                }
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Salary Advance field.';
                }
                field(Imprest; Rec.Imprest)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest field.';
                }
                field("Petty Cash"; Rec."Petty Cash")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash field.';
                }
                field("Car Loan"; Rec."Car Loan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Car Loan field.';
                }
            }
        }
    }

    actions { }
}
