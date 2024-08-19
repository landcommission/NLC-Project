#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193982 "New Tender Items List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "New Tender Items";
    UsageCategory = Lists;
    Caption = 'New Tender Items List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Starting Date field.';
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Direct Unit Cost field.';
                }
                field("Questionaire No"; Rec."Questionaire No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Questionaire No field.';
                }
                field("Tender No."; Rec."Tender No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender No. field.';
                }
                field("PIN No."; Rec."PIN No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PIN No. field.';
                }
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt No. field.';
                }
                field("Minimum Quantity"; Rec."Minimum Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Quantity field.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ending Date field.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field(Brand; Rec.Brand)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Brand field.';
                }
                field(Formulation; Rec.Formulation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Formulation field.';
                }
                field("Unit Size"; Rec."Unit Size")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Size field.';
                }
                field("Unit Trade/ W/Sale Price"; Rec."Unit Trade/ W/Sale Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Trade/ W/Sale Price field.';
                }
                field(Discount; Rec.Discount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Discount field.';
                }
                field(VAT; Rec.VAT)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT field.';
                }
                field("Final Tender"; Rec."Final Tender")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Tender field.';
                }
                field("Recommended Unit Retail Price"; Rec."Recommended Unit Retail Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommended Unit Retail Price field.';
                }
                field(Supplier; Rec.Supplier)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier field.';
                }
                field(Manufacturer; Rec.Manufacturer)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Manufacturer field.';
                }
                field("Pack Size"; Rec."Pack Size")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pack Size field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Tender Result"; Rec."Tender Result")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Result field.';
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country field.';
                }
                field("Sample Required"; Rec."Sample Required")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sample Required field.';
                }
                field("Sample Size"; Rec."Sample Size")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sample Size field.';
                }
                field(Company; Rec.Company)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company field.';
                }
                field("Current Price"; Rec."Current Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Price field.';
                }
                field(Variance; Rec.Variance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Variance field.';
                }
                field(Prefered; Rec.Prefered)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prefered field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
            }
        }
    }

    actions { }
}
