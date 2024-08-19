#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194141 "Company Vehicles Card"
{
    PageType = Card;
    SourceTable = "Company Vehicles";
    ApplicationArea = All;
    Caption = 'Company Vehicles Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Capacity; Rec.Capacity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Capacity field.';
                }
                field("Engine Capacity"; Rec."Engine Capacity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engine Capacity field.';
                }
                field("Year of Manufacture"; Rec."Year of Manufacture")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year of Manufacture field.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field(Colour; Rec.Colour)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Colour field.';
                }

                field("Wheelchair Accessible"; Rec."Wheelchair Accessible")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Wheelchair Accessible field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
            }
            // part(Control6; "Company Vehicle list")
            // {
            //     SubPageLink = "Registration No" = field("Registration No.");
            // }
        }
    }

    actions { }
}
