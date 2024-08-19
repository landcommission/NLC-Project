#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193801 "Master Record Creation Lines"
{
    PageType = ListPart;
    SourceTable = "Master Record Creation Lines";
    ApplicationArea = All;
    Caption = 'Master Record Creation Lines';
    layout
    {
        area(Content)
        {
            group(Control3)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Master Type field.';
                    trigger OnValidate()
                    begin
                        UpdateControls();
                    end;
                }
                repeater(Group)
                {
                    Caption = 'G/L Account';
                    Visible = "G/LAccountVisible";
                    field("Suggested No."; Rec."Suggested No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Suggested No. field.';
                    }
                    field("G/L Account Name"; Rec.Name)
                    {
                        ApplicationArea = Basic;
                        Caption = 'G/L Account Name';
                        ToolTip = 'Specifies the value of the G/L Account Name field.';
                    }
                    field("Debit/Credit"; Rec."Debit/Credit")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Debit/Credit field.';
                    }
                    field("Account Type"; Rec."Account Type")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Account Type field.';
                    }
                    field(Blocked; Rec.Blocked)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Blocked field.';
                    }
                    field("General Posting Type"; Rec."General Posting Type")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the General Posting Type field.';
                    }
                    field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
                    }
                    field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                    }
                    field("VAT. Bus. Posting Group"; Rec."VAT. Bus. Posting Group")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the VAT. Bus. Posting Group field.';
                    }
                    field("VAT. Prod. Posting Group"; Rec."VAT. Prod. Posting Group")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the VAT. Prod. Posting Group field.';
                    }
                    field("Income/Balance Sheet A/C"; Rec."Income/Balance Sheet A/C")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Income/Balance Sheet A/C field.';
                    }
                    field(Reason; Rec.Reason)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Reason field.';
                    }
                    field("Created Document No."; Rec."Created Document No.")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Created Document No. field.';
                    }
                    field("Created Document Name"; Rec."Created Document Name")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Created Document Name field.';
                    }
                }
                repeater(Bank)
                {
                    Caption = 'Bank';
                    Visible = BankVisible;
                    field("Bank Name"; Rec.Name)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Name';
                        ToolTip = 'Specifies the value of the Name field.';
                    }
                    field("Bank Address"; Rec.Address)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Address field.';
                    }
                    field("Bank Post Code"; Rec."Post Code")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Post Code';
                        ToolTip = 'Specifies the value of the Post Code field.';
                    }
                    field("Bank City"; Rec.City)
                    {
                        ApplicationArea = Basic;
                        Caption = 'City';
                        ToolTip = 'Specifies the value of the City field.';
                    }
                    field("Bank Country/Region Code"; Rec."Country/Region Code")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Country/Region Code';
                        ToolTip = 'Specifies the value of the Country/Region Code field.';
                    }
                    field("BankPhone No."; Rec."Phone No.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Phone No.';
                        ToolTip = 'Specifies the value of the Phone No. field.';
                    }
                    field("Bank Branch No."; Rec."Bank Branch No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Branch No. field.';
                    }
                    field("Bank Type"; Rec."Bank Type")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Type field.';
                    }
                    field("BankFax No."; Rec."Fax No.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fax No.';
                        ToolTip = 'Specifies the value of the Fax No. field.';
                    }
                    field("Bank Email"; Rec.Email)
                    {
                        ApplicationArea = Basic;
                        Caption = ' Email';
                        ToolTip = 'Specifies the value of the  Email field.';
                    }
                    field("Bank Home Page"; Rec."Home Page")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Home Page';
                        ToolTip = 'Specifies the value of the Home Page field.';
                    }
                    field("Bakn Currency Code"; Rec."Currency Code")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Currency Code';
                        ToolTip = 'Specifies the value of the Currency Code field.';
                    }
                    field("Bank Account Posting Groups"; Rec."Bank Account Posting Groups")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Account Posting Groups field.';
                    }
                    field("Bank Created Document No."; Rec."Created Document No.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Created Document No.';
                        ToolTip = 'Specifies the value of the Created Document No. field.';
                    }
                    field("Bank Created Document Name"; Rec."Created Document Name")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Created Document Name';
                        ToolTip = 'Specifies the value of the Created Document Name field.';
                    }
                }
                repeater("Customer/Vendor")
                {
                    Caption = 'Customer/Vendor';
                    Visible = "Customer/VendorVisible";
                    field(Name; Rec.Name)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Name';
                        ToolTip = 'Specifies the value of the Name field.';
                    }
                    field(Address; Rec.Address)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Address';
                        ToolTip = 'Specifies the value of the Address field.';
                    }
                    field("Post Code"; Rec."Post Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Post Code field.';
                    }
                    field(City; Rec.City)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the City field.';
                    }
                    field("Country/Region Code"; Rec."Country/Region Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Country/Region Code field.';
                    }
                    field("Phone No."; Rec."Phone No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Phone No. field.';
                    }
                    field(Email; Rec.Email)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Email field.';
                    }
                    field("Fax No."; Rec."Fax No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Fax No. field.';
                    }
                    field("Vendor/Customer Posting Group"; Rec."Vendor/Customer Posting Group")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Vendor/Customer Posting Group field.';
                    }
                    field("Cust VAT. Bus. Posting Group"; Rec."VAT. Bus. Posting Group")
                    {
                        ApplicationArea = Basic;
                        Caption = 'VAT. Bus. Posting Group';
                        ToolTip = 'Specifies the value of the VAT. Bus. Posting Group field.';
                    }
                    field("Cust Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Gen. Bus. Posting Group';
                        ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
                    }
                    field("Home Page"; Rec."Home Page")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Home Page field.';
                    }
                    field("Cust Created Document No."; Rec."Created Document No.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Created Document No.';
                        ToolTip = 'Specifies the value of the Created Document No. field.';
                    }
                    field("Cust Created Document Name"; Rec."Created Document Name")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Created Document Name';
                        ToolTip = 'Specifies the value of the Created Document Name field.';
                    }
                }
                repeater(Item)
                {
                    Caption = 'Item';
                    Visible = ItemVisible;
                    field("ItemName "; Rec.Name)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Description';
                        ToolTip = 'Specifies the value of the Description field.';
                    }
                    field("Base Unit of Measure"; Rec."Base Unit of Measure")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Base Unit of Measure field.';
                    }
                    field("Item G/L Budget Account"; Rec."Item G/L Budget Account")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Item G/L Budget Account field.';
                    }
                    field("<Item VAT. Prod. Posting Group>"; Rec."VAT. Prod. Posting Group")
                    {
                        ApplicationArea = Basic;
                        Caption = 'VAT. Prod. Posting Group';
                        ToolTip = 'Specifies the value of the VAT. Prod. Posting Group field.';
                    }
                    field("Item Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Gen. Prod. Posting Group';
                        ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                    }
                    field("Inventory Posting Group"; Rec."Inventory Posting Group")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Inventory Posting Group field.';
                    }
                    field("Item Created Document No."; Rec."Created Document No.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Created Document No.';
                        ToolTip = 'Specifies the value of the Created Document No. field.';
                    }
                    field("Item Created Document Name"; Rec."Created Document Name")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Created Document Name';
                        ToolTip = 'Specifies the value of the Created Document Name field.';
                    }
                }
                repeater("Fixed Asset")
                {
                    Caption = 'Fixed Asset';
                    Visible = FixedAssetVisible;
                    field("FA Name"; Rec.Name)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Description';
                        ToolTip = 'Specifies the value of the Description field.';
                    }
                    field("Depreciation Book"; Rec."Depreciation Book")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Depreciation Book field.';
                    }
                    field("FA Posting Group"; Rec."FA Posting Group")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the FA Posting Group field.';
                    }
                    field("Depreciation Method"; Rec."Depreciation Method")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Depreciation Method field.';
                    }
                    field("FA Class Code"; Rec."FA Class Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the FA Class Code field.';
                    }
                    field("FA Subclass Code"; Rec."FA Subclass Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the FA Subclass Code field.';
                    }
                    field("FA Location Code"; Rec."FA Location Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the FA Location Code field.';
                    }
                    field("<FA Created Document No.>"; Rec."Created Document No.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Created Document No.';
                        ToolTip = 'Specifies the value of the Created Document No. field.';
                    }
                    field("<FA Created Document Name>"; Rec."Created Document Name")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Created Document Name';
                        ToolTip = 'Specifies the value of the Created Document Name field.';
                    }
                }
                repeater("Dimensions Value")
                {
                    Caption = 'Dimensions Value';
                    Visible = DimensionValueVisible;
                    field("Dimension Code"; Rec."Dimension Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Dimension Code field.';
                    }
                    field("Dimension Name"; Rec."Dimension Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Dimension Name field.';
                    }
                    field("Dimension Value Code"; Rec."Dimension Value Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Dimension Value Code field.';
                    }
                    field("Dimension Value Name"; Rec."Dimension Value Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Dimension Value Name field.';
                    }
                    field("<DimValCreated Document No.>"; Rec."Created Document No.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Created Document No.';
                        ToolTip = 'Specifies the value of the Created Document No. field.';
                    }
                    field("<DimValCreated Document Name>"; Rec."Created Document Name")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Created Document Name';
                        ToolTip = 'Specifies the value of the Created Document Name field.';
                    }
                }
                repeater(Dimension)
                {
                    Caption = 'Dimension';
                    Visible = DimensionsVisible;
                    field("Dimension Code Insert"; Rec."Dimension Code Insert")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimension Code';
                        ToolTip = 'Specifies the value of the Dimension Code field.';
                    }
                    field("Dimension Name Insert"; Rec."Dimension Name Insert")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimension Name';
                        ToolTip = 'Specifies the value of the Dimension Name field.';
                    }
                    field("<Dim Created Document No.>"; Rec."Created Document No.")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Created Document No.';
                        ToolTip = 'Specifies the value of the Created Document No. field.';
                    }
                    field("<Dim Created Document Name>"; Rec."Created Document Name")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Created Document Name';
                        ToolTip = 'Specifies the value of the Created Document Name field.';
                    }
                }
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    begin
        UpdateControls();
    end;

    trigger OnOpenPage()
    begin
        CurrPage.Update();
        UpdateControls();
    end;

    var
        "G/LAccountVisible": Boolean;
        BankVisible: Boolean;
        "Customer/VendorVisible": Boolean;
        ItemVisible: Boolean;
        FixedAssetVisible: Boolean;
        DimensionsVisible: Boolean;
        DimensionValueVisible: Boolean;

    local procedure UpdateControls()
    begin
        case Rec.Type of
            Rec.Type::"G/L Account":
                begin
                    "G/LAccountVisible" := true;
                    BankVisible := false;
                    "Customer/VendorVisible" := false;
                    ItemVisible := false;
                    FixedAssetVisible := false;
                    DimensionsVisible := false;
                    DimensionValueVisible := false;
                end;
            Rec.Type::Customer, Rec.Type::Vendor:
                begin
                    "G/LAccountVisible" := false;
                    BankVisible := false;
                    "Customer/VendorVisible" := true;
                    ItemVisible := false;
                    FixedAssetVisible := false;
                    DimensionsVisible := false;
                    DimensionValueVisible := false;
                end;
            Rec.Type::Bank:
                begin
                    "G/LAccountVisible" := false;
                    BankVisible := true;
                    "Customer/VendorVisible" := false;
                    ItemVisible := false;
                    FixedAssetVisible := false;
                    DimensionsVisible := false;
                    DimensionValueVisible := false;
                end;
            Rec.Type::Item:
                begin
                    "G/LAccountVisible" := false;
                    BankVisible := false;
                    "Customer/VendorVisible" := false;
                    ItemVisible := true;
                    FixedAssetVisible := false;
                    DimensionsVisible := false;
                    DimensionValueVisible := false;
                end;
            Rec.Type::"Fixed Asset":
                begin
                    "G/LAccountVisible" := false;
                    BankVisible := false;
                    "Customer/VendorVisible" := false;
                    ItemVisible := false;
                    FixedAssetVisible := true;
                    DimensionsVisible := false;
                    DimensionValueVisible := false;
                end;
            Rec.Type::Dimension:
                begin
                    "G/LAccountVisible" := false;
                    BankVisible := false;
                    "Customer/VendorVisible" := false;
                    ItemVisible := false;
                    FixedAssetVisible := false;
                    DimensionsVisible := true;
                    DimensionValueVisible := false;
                end;
            Rec.Type::"Dimension Value":
                begin
                    "G/LAccountVisible" := false;
                    BankVisible := false;
                    "Customer/VendorVisible" := false;
                    ItemVisible := false;
                    FixedAssetVisible := false;
                    DimensionsVisible := false;
                    DimensionValueVisible := true;
                end;


            Rec.Type::" ":  //This will be the default when the page is opened
                begin
                    "G/LAccountVisible" := true;
                    BankVisible := false;
                    "Customer/VendorVisible" := false;
                    ItemVisible := false;
                    FixedAssetVisible := false;
                    DimensionsVisible := false;
                end;






        end; //end of cases
    end;
}
