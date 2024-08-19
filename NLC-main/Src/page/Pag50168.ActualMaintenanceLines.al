#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50168 "Actual Maintenance Lines"
{
    PageType = ListPart;
    SourceTable = "Actual Maintenance Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(FixedAssetNo; Rec."Fixed Asset No.")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(SerialNo; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Dimension1Code; Rec."Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Dimension2Code; Rec."Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(ActualServiceDate; Rec."Actual Service Date")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceProvider; Rec."Service Provider")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.Update;
    end;
}
