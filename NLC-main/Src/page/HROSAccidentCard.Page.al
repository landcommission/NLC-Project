#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193517 "HR OSAccident Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "HR OSAccident";
    ApplicationArea = All;
    Caption = 'HR OSAccident Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Accident No"; Rec."Accident No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accident No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
            part(Control5; "HR OSAccident Line")
            {
                SubPageLink = "Accident No" = field("Accident No");
            }
            part(Control6; "Transfer Schedule List")
            {
                SubPageLink = Description = field("Accident No");
            }
        }
    }

    actions { }
}
