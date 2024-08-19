#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50175 "Asset Repair List"
{
    ApplicationArea = Basic;
    CardPageID = "Asset Repair Card Vehicles";
    Editable = false;
    PageType = List;
    SourceTable = "Asset Repair Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(RequestNo; Rec."Request No.")
                {
                    ApplicationArea = Basic;
                }
                field("Asset Type";"Asset Type")
                {
                    ApplicationArea=all;
                }
                field(RequestDate; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control5; Outlook)
            {
            }
        }
    }

    actions
    {
    }
}
