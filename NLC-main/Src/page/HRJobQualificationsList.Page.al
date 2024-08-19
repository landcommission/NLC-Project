#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194002 "HR Job Qualifications List"
{
    PageType = List;
    SourceTable = "HR Job Qualifications";
    ApplicationArea = All;
    Caption = 'HR Job Qualifications List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Type field.';
                }
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
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field("Order"; Rec.Order)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Order field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field(Professional; Rec.Professional)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Professional field.';
                }
            }
        }
    }

    actions { }
}
