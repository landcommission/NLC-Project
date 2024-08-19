page 50031 "FA Setup"
{
    ApplicationArea = All;
    Caption = 'FA Setup';
    PageType = List;
    SourceTable = "FA Setup";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Allow FA Posting From"; Rec."Allow FA Posting From")
                {
                    Caption = 'Allow FA Posting From';
                    ToolTip = 'Specifies the earliest date when posting to the fixed assets is allowed.';
                }
                field("Allow FA Posting To"; Rec."Allow FA Posting To")
                {
                    ToolTip = 'Specifies the latest date when posting to the fixed assets is allowed.';
                }
                field("Allow Posting to Main Assets"; Rec."Allow Posting to Main Assets")
                {
                    ToolTip = 'Specifies whether you have split your fixed assets into main assets and components, and you want to be able to post directly to main assets.';
                }
                field("Asset Incident Nos."; Rec."Asset Incident Nos.")
                {
                    ToolTip = 'Specifies the value of the Asset Incident Nos. field.';
                }
                field("Asset Transfer Nos."; Rec."Asset Transfer Nos.")
                {
                    ToolTip = 'Specifies the value of the Asset Transfer Nos. field.';
                }
                field("Automatic Insurance Posting"; Rec."Automatic Insurance Posting")
                {
                    ToolTip = 'Specifies you want to post insurance coverage ledger entries when you post acquisition cost entries with the Insurance No. field filled in.';
                }
                field("Default Depr. Book"; Rec."Default Depr. Book")
                {
                    ToolTip = 'Specifies the default depreciation book on journal lines and purchase lines and when you run batch jobs and reports.';
                }
                field("Fixed Asset Nos."; Rec."Fixed Asset Nos.")
                {
                    ToolTip = 'Specifies the code for the number series that will be used to assign numbers to fixed assets.';
                }
                field("Insurance Depr. Book"; Rec."Insurance Depr. Book")
                {
                    ToolTip = 'Specifies a depreciation book code. If you use the insurance facilities, you must enter a code to post insurance coverage ledger entries.';
                }
                field("Insurance Nos."; Rec."Insurance Nos.")
                {
                    ToolTip = 'Specifies the number series code that will be used to assign numbers to insurance policies.';
                }
                field("Maintenance Nos."; Rec."Maintenance Nos.")
                {
                    ToolTip = 'Specifies the value of the Maintenance Nos. field.';
                }
                field("Maintenance Plan Nos."; Rec."Maintenance Plan Nos.")
                {
                    ToolTip = 'Specifies the value of the Maintenance Plan Nos. field.';
                }
                field("Motor Vehicle Maintenance Nos."; Rec."Motor Vehicle Maintenance Nos.")
                {
                    ToolTip = 'Specifies the value of the Motor Vehicle Maintenance Nos. field.';
                }
                field("Primary Key"; Rec."Primary Key")
                {
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
                field("Repair Request Nos."; Rec."Repair Request Nos.")
                {
                    ToolTip = 'Specifies the value of the Repair Request Nos. field.';
                }
                field("Asset Issue"; "Asset Issue")
                {
                    ApplicationArea = all;
                }
                field("Asset Allocation Nos"; "Asset Allocation Nos")
                {
                    ApplicationArea = all;
                }
                field("Asset Incidence Nos"; "Asset Incidence Nos")
                {
                    ApplicationArea = all;
                }
                field("Asset Return Nos."; "Asset Return Nos.")
                {
                    ApplicationArea = all;
                }

            }
        }
    }
}
