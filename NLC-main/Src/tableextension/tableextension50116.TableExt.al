#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50116 tableextension50116 extends "User Setup"
{
    fields
    {
        modify("Sales Resp. Ctr. Filter")
        {
            TableRelation = "Responsibility Center BR 2".Code;
        }
        modify("Purchase Resp. Ctr. Filter")
        {
            TableRelation = "Responsibility Center BR 2";
        }
        modify("Service Resp. Ctr. Filter")
        {
            TableRelation = "Responsibility Center BR 2";
        }

        field(50000; Leave; Boolean)
        {
            Caption = 'Leave';
            DataClassification = CustomerContent;
        }
        field(50009; tetst; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            DataClassification = CustomerContent;
        }
        field(50018; "Post Bank Rec"; Boolean)
        {
            Caption = 'Post Bank Rec';
            DataClassification = CustomerContent;
        }
        field(50027; "Cash Advance Staff Account"; Code[20])
        {
            TableRelation = Customer."No." where("Account Type" = const("Staff Advance"));
            Caption = 'Cash Advance Staff Account';
            DataClassification = CustomerContent;
        }
        field(50030; "ReOpen/Release"; Option)
        {
            OptionMembers = " ",ReOpen,Release;
            Caption = 'ReOpen/Release';
            DataClassification = CustomerContent;
        }
        field(50031; "Location Code"; Code[10])
        {
            TableRelation = Location.Code;
            Caption = 'Location Code';
            DataClassification = CustomerContent;
        }
        field(50100; "Edit Posted Dimensions"; Boolean)
        {
            Caption = 'Edit Posted Dimensions';
            DataClassification = CustomerContent;
        }
        field(50110; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            TableRelation = "Gen. Journal Template";
            DataClassification = CustomerContent;
        }
        field(50111; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Journal Template Name"));
            DataClassification = CustomerContent;
        }
        field(39003900; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Global Dimension 2 Code';
            DataClassification = CustomerContent;
        }
        field(39003901; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center BR NEW".Code;
            Caption = 'Responsibility Center';
            DataClassification = CustomerContent;
        }
        field(39003902; "Global Dimension 1 Code"; Code[20])
        {
            CalcFormula = lookup("HR Employees".County where("User ID" = field("User ID")));
            CaptionClass = '1,1,1';
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Global Dimension 1 Code';
        }
        field(39003903; "Unlimited PV Amount Approval"; Boolean)
        {
            Caption = 'Unlimited PV Amount Approval';
            DataClassification = CustomerContent;
        }
        field(39003904; "PV Amount Approval Limit"; Decimal)
        {
            Caption = 'PV Amount Approval Limit';
            DataClassification = CustomerContent;
        }
        field(39003905; "Unlimited PettyAmount Approval"; Boolean)
        {
            Caption = 'Unlimited PettyAmount Approval';
            DataClassification = CustomerContent;
        }
        field(39003906; "Petty C Amount Approval Limit"; Decimal)
        {
            Caption = 'Petty C Amount Approval Limit';
            DataClassification = CustomerContent;
        }
        field(39003907; "Unlimited Imprest Amt Approval"; Boolean)
        {
            Caption = 'Unlimited Imprest Amt Approval';
            DataClassification = CustomerContent;
        }
        field(39003908; "Imprest Amount Approval Limit"; Decimal)
        {
            Caption = 'Imprest Amount Approval Limit';
            DataClassification = CustomerContent;
        }
        field(39003909; "Unlimited Store RqAmt Approval"; Boolean)
        {
            Caption = 'Unlimited Store RqAmt Approval';
            DataClassification = CustomerContent;
        }
        field(39003910; "Store Req. Amt Approval Limit"; Decimal)
        {
            Caption = 'Store Req. Amt Approval Limit';
            DataClassification = CustomerContent;
        }
        field(39003911; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            DataClassification = CustomerContent;
        }
        field(39003912; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            DataClassification = CustomerContent;
        }
        field(39003913; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            DataClassification = CustomerContent;
        }
        field(39003914; "Unlimited ImprestSurr Amt Appr"; Boolean)
        {
            Caption = 'Unlimited ImprestSurr Amt Appr';
            DataClassification = CustomerContent;
        }
        field(39003915; "ImprestSurr Amt Approval Limit"; Decimal)
        {
            Caption = 'ImprestSurr Amt Approval Limit';
            DataClassification = CustomerContent;
        }
        field(39003916; "Unlimited Interbank Amt Appr"; Boolean)
        {
            Caption = 'Unlimited Interbank Amt Appr';
            DataClassification = CustomerContent;
        }
        field(39003917; "Interbank Amt Approval Limit"; Decimal)
        {
            Caption = 'Interbank Amt Approval Limit';
            DataClassification = CustomerContent;
        }
        field(39003918; "Staff Travel Account"; Code[20])
        {
            TableRelation = Customer."No." where("Account Type" = const("Travel Advance"));
            Caption = 'Staff Travel Account';
            DataClassification = CustomerContent;
        }
        field(39003919; "Post JVs"; Boolean)
        {
            Caption = 'Post JVs';
            DataClassification = CustomerContent;
        }
        field(39003921; "Unlimited Receipt Amt Approval"; Boolean)
        {
            Caption = 'Unlimited Receipt Amt Approval';
            DataClassification = CustomerContent;
        }
        field(39003922; "Receipt Amt Approval Limit"; Decimal)
        {
            Caption = 'Receipt Amt Approval Limit';
            DataClassification = CustomerContent;
        }
        field(39003923; "Unlimited Claim Amt Approval"; Boolean)
        {
            Caption = 'Unlimited Claim Amt Approval';
            DataClassification = CustomerContent;
        }
        field(39003924; "Claim Amt Approval Limit"; Decimal)
        {
            Caption = 'Claim Amt Approval Limit';
            DataClassification = CustomerContent;
        }
        field(39003925; "Unlimited Advance Amt Approval"; Boolean)
        {
            Caption = 'Unlimited Advance Amt Approval';
            DataClassification = CustomerContent;
        }
        field(39003926; "Advance Amt Approval Limit"; Decimal)
        {
            Caption = 'Advance Amt Approval Limit';
            DataClassification = CustomerContent;
        }
        field(39003927; "Unlimited AdvSurr Amt Approval"; Boolean)
        {
            Caption = 'Unlimited AdvSurr Amt Approval';
            DataClassification = CustomerContent;
        }
        field(39003928; "AdvSurr Amt Approval Limit"; Decimal)
        {
            Caption = 'AdvSurr Amt Approval Limit';
            DataClassification = CustomerContent;
        }
        field(39003929; "Other Advance Staff Account"; Code[20])
        {
            TableRelation = Customer."No." where("Account Type" = const("Staff Advance"));
            Caption = 'Other Advance Staff Account';
            DataClassification = CustomerContent;
        }
        field(39003930; "Unlimited Grant Amt Approval"; Boolean)
        {
            Caption = 'Unlimited Grant Amt Approval';
            DataClassification = CustomerContent;
        }
        field(39003931; "Grant Amt Approval Limit"; Decimal)
        {
            Caption = 'Grant Amt Approval Limit';
            DataClassification = CustomerContent;
        }
        field(39003932; "Unlimited GrantSurr Approval"; Boolean)
        {
            Caption = 'Unlimited GrantSurr Approval';
            DataClassification = CustomerContent;
        }
        field(39003933; "GrantSurr Amt Approval Limit"; Decimal)
        {
            Caption = 'GrantSurr Amt Approval Limit';
            DataClassification = CustomerContent;
        }
        field(39003934; "User Signature"; Blob)
        {
            Subtype = Bitmap;
            Caption = 'User Signature';
            DataClassification = CustomerContent;
        }
        field(39003935; "Post Staff Grants"; Boolean)
        {
            Caption = 'Post Staff Grants';
            DataClassification = CustomerContent;
        }
        field(39004278; "ReValidate LPOs"; Boolean)
        {
            Description = 'Can ReOpen Expired LPOs';
            Caption = 'ReValidate LPOs';
            DataClassification = CustomerContent;
        }
        field(39004279; "Procurement Officer"; Boolean)
        {
            Caption = 'Procurement Officer';
            DataClassification = CustomerContent;
        }
        field(39004280; "Compliance/Grants"; Boolean)
        {
            Caption = 'Compliance/Grants';
            DataClassification = CustomerContent;
        }
        field(39004281; "Payroll Code"; Code[20])
        {
            TableRelation = "Imprest Lines";
            Caption = 'Payroll Code';
            DataClassification = CustomerContent;
        }
        field(39004282; test; Text[30])
        {
            Caption = 'test';
            DataClassification = CustomerContent;
        }
        field(39004283; "Archiving User"; Code[20])
        {
            TableRelation = "User Setup"."User ID";
            Caption = 'Archiving User';
            DataClassification = CustomerContent;
        }
        field(39004284; "Max. No. of Active Sessions"; Integer)
        {
            Caption = 'Max. No. of Active Sessions';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if Rec."Max. No. of Active Sessions" <= 0 then
                    Rec."Max. No. of Active Sessions" := 0;
            end;
        }
        field(39004285; "Close Payroll Period"; Boolean)
        {
            Caption = 'Close Payroll Period';
            DataClassification = CustomerContent;
        }
        field(39004286; "Clearance Department"; Option)
        {
            OptionCaption = ' ,Finance,Human Resource,ICT,CLMB Coordination Office,Supply Chain Management,Communication,NLIMS,Legal Affairs & Enforcement,Land Administration,Research & Advocacy, Natural Resource,Valuation & Taxation,Survey Adjudication & Settlement,Audit & Risk Management';
            OptionMembers = " ",Finance,"Human Resource",ICT,"CLMB Coordination Office","Supply Chain Management",Communication,NLIMS,"Legal Affairs & Enforcement","Land Administration","Research & Advocacy"," Natural Resource","Valuation & Taxation","Survey Adjudication & Settlement","Audit & Risk Management";
            Caption = 'Clearance Department';
            DataClassification = CustomerContent;
        }
        field(39004287; "Clearance Officer"; Boolean)
        {
            Caption = 'Clearance Officer';
            DataClassification = CustomerContent;
        }
        field(39004288; "Payroll Access"; Boolean)
        {
            Caption = 'Payroll Access';
            DataClassification = CustomerContent;
        }
        field(39004289; "Adjust Leave Days"; Boolean)
        {
            Caption = 'Adjust Leave Days';
            DataClassification = CustomerContent;
        }
        field(39004290; "Modify Jobs"; Boolean)
        {
            Caption = 'Modify Jobs';
            DataClassification = CustomerContent;
        }

        field(39004291; "Transport Manager"; Boolean)
        {
            Caption = 'Transport Manager';
            DataClassification = CustomerContent;
        }
        field(50120; "Employee No."; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "HR Employees"."No." where(Status = filter(Active));
            Caption = 'Employee No.';
        }
    }
}
