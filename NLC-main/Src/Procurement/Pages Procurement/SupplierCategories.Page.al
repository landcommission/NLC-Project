#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50117 "Supplier Categories"
{
    PageType = List;
    SourceTable = "Supplier Categories";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Category Code"; "Category Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. Prequalified"; "No. Prequalified")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Posting Group"; "Vendor Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Bus. Posting Group"; "VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

