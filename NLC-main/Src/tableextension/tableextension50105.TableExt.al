#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50105 tableextension50105 extends Vendor
{
    fields
    {

        //Unsupported feature: Code Modification on "Name(Field 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ("Search Name" = UPPERCASE(xRec.Name)) OR ("Search Name" = '') THEN
          "Search Name" := Name;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
         VendLedEntry.RESET;
         VendLedEntry.SETRANGE(VendLedEntry."Vendor No.","No.");
         IF VendLedEntry.FINDFIRST THEN BEGIN
            IF (Name)<>(xRec.Name) THEN
               ERROR('There are already entries for Vendor '+"No."+', Cannot change the Name');
         END;

        IF ("Search Name" = UPPERCASE(xRec.Name)) OR ("Search Name" = '') THEN
          "Search Name" := Name;
        */
        //end;


        //Unsupported feature: Code Insertion on ""Vendor Posting Group"(Field 21)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
         VendLedEntry.RESET;
         VendLedEntry.SETRANGE(VendLedEntry."Vendor No.","No.");
         IF VendLedEntry.FINDFIRST THEN BEGIN
            IF ("Vendor Posting Group")<>(xRec."Vendor Posting Group") THEN
               ERROR('There are already entries for Vendor '+"No."+', Cannot change the Posting Group');
         END;
        */
        //end;
        field(50145; "Vendor Credit Limit(LCY)"; Decimal)
        {
            Caption = 'Vendor Credit Limit(LCY)';
            DataClassification = CustomerContent;
        }
        field(50146; "Requisition Default Vendor"; Boolean)
        {
            Caption = 'Requisition Default Vendor';
            DataClassification = CustomerContent;
        }
        field(50147; "Vendor Retention Account"; Code[20])
        {
            TableRelation = Vendor."No." where(Retention = const(true));
            Caption = 'Vendor Retention Account';
            DataClassification = CustomerContent;
        }
        field(50148; Retention; Boolean)
        {
            Caption = 'Retention';
            DataClassification = CustomerContent;
        }
        field(50149; "PIN No."; Code[20])
        {
            Caption = 'PIN No.';
            DataClassification = CustomerContent;
        }
        field(50150; "Vendor Bank Account"; Code[20])
        {
            Caption = 'Vendor Bank Account';
            DataClassification = CustomerContent;
        }
        field(50151; "Vendor Bank Branch Code"; Code[20])
        {
            Caption = 'Vendor Bank Branch Code';
            DataClassification = CustomerContent;
        }
        field(39005580; "Vendor Type"; Option)
        {
            OptionCaption = ' ,Implementing Partner,Goods,Services,Contract,Goods & Services';
            OptionMembers = " ","Implementing Partner",Goods,Services,Contract,"Goods & Services";
            Caption = 'Vendor Type';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin

                //Prevent Changing once entries exist
                Rec.TestNoEntriesExist(Rec.FieldCaption(Rec."Vendor Type"));
            end;
        }
        field(39005581; "Property Code"; Code[30])
        {
            TableRelation = "Investment Setup"."Primary Key";
            Caption = 'Property Code';
            DataClassification = CustomerContent;
        }
        field(39005582; "Transaction Code"; Code[30])
        {
            Caption = 'Transaction Code';
            DataClassification = CustomerContent;
            //TableRelation = Table39005598.Field1;
        }
        field(39005583; "Employee Responsible"; Code[30])
        {
            Caption = 'Employee Responsible';
            DataClassification = CustomerContent;
        }
        field(39005584; "Landlord No."; Code[10])
        {
            Caption = 'Landlord No.';
            DataClassification = CustomerContent;

        }
        field(39005585; No2; Code[20])
        {
            Caption = 'No2';
            DataClassification = CustomerContent;
        }
        /* field(39005586; "No. of Vendor Cateories"; Integer)
        {
            CalcFormula = count("HR Disciplinary Cases" where(Field2 = field("No.")));
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "User Document Cancellation";
        } */
        field(39005587; "Main Sub/Sub"; Option)
        {
            Caption = 'Main Sub/Sub';
            Editable = false;
            OptionCaption = ' ,Main Sub,Sub';
            OptionMembers = " ","Main Sub",Sub;
            DataClassification = CustomerContent;
        }
        field(39005588; Sub; Code[20])
        {
            Caption = 'Sub Of Sub';
            Editable = false;
            TableRelation = Vendor;
            DataClassification = CustomerContent;
        }
        field(39005589; "Compliance Passed"; Boolean)
        {
            Caption = 'Compliance Passed';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(Key1; "Vendor Type") { }
    }

    procedure TestNoEntriesExist(CurrentFieldName: Text[100])
    var
        ItemLedgEntry: Record "Vendor Ledger Entry";
    begin
        ItemLedgEntry.SetCurrentKey("Vendor No.");
        ItemLedgEntry.SetRange("Vendor No.", Rec."No.");
        if ItemLedgEntry.Find('-') then
            Error(
              Text012,
              CurrentFieldName);
    end;

    var
        Text012: Label 'You cannot change the contents of the %1 field because this %2 has one or more posted ledger entries.';
        VendLedEntry: Record "Vendor Ledger Entry";
}
