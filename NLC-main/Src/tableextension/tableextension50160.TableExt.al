#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50160 tableextension50160 extends "Fixed Asset"
{
    fields
    {
        modify("Responsible Employee")
        {

            //Unsupported feature: Property Modification (Name) on ""Responsible Employee"(Field 16)".

            TableRelation = "HR Employees";
            Caption = 'Responsible Officer';
        }

        //Unsupported feature: Property Modification (Data type) on ""Serial No."(Field 17)".


        //Unsupported feature: Code Modification on "Description(Field 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ("Search Description" = UPPERCASE(xRec.Description)) OR ("Search Description" = '') THEN
          "Search Description" := Description;
        IF Description <> xRec.Description THEN BEGIN
          FADeprBook.SETCURRENTKEY("FA No.");
          FADeprBook.SETRANGE("FA No.","No.");
          FADeprBook.MODIFYALL(Description,Description);
        END;
        MODIFY(TRUE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
         FALedEntry.RESET;
         FALedEntry.SETRANGE(FALedEntry."FA No.","No.");
         IF FALedEntry.FINDFIRST THEN BEGIN
            IF (Description)<>(xRec.Description) THEN
               ERROR('There are already entries for Fixed Asset '+"No."+', Cannot change the Description');
         END;

        IF ("Search Description" = UPPERCASE(xRec.Description)) OR ("Search Description" = '') THEN
          "Search Description" := Description;

        #3..7
        //MODIFY(TRUE);
        */
        //end;


        //Unsupported feature: Code Insertion on ""FA Posting Group"(Field 29)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
         FALedEntry.RESET;
         FALedEntry.SETRANGE(FALedEntry."FA No.","No.");
         IF FALedEntry.FINDFIRST THEN BEGIN
            IF ("FA Posting Group")<>(xRec."FA Posting Group") THEN
               ERROR('There are already entries for Fixed Asset '+"No."+', Cannot change the Posting Group');
         END;
        */
        //end;
        field(50000; "Budget Controlled"; Boolean)
        {
            Caption = 'Budget Controlled';
            DataClassification = CustomerContent;
        }
        field(50001; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(50002; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            Caption = 'Global Dimension 1 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(50003; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            Caption = 'Global Dimension 2 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(50004; "Location Filter"; Code[10])
        {
            Caption = 'Location Filter';
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(50005; "Budget Name"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "G/L Budget Name";
            Caption = 'Budget Name';
        }
        field(50006; "Budget Qty"; Decimal)
        {
            CalcFormula = sum("FA Budget Entry"."Cost Amount" where("FA No." = field("No."),
                                                                     "Budget Name" = field("Budget Name"),
                                                                     Date = field("Date Filter")));
            FieldClass = FlowField;
            Caption = 'Budget Qty';
            Editable = false;
        }
        field(50007; No2; Code[20])
        {
            Caption = 'No2';
            DataClassification = CustomerContent;
        }
        field(50008; Donated; Boolean)
        {
            Caption = 'Donated';
            DataClassification = CustomerContent;
        }
        field(50050; "Asset Type"; Option)
        {
            OptionMembers = " ",Truck,Trailer,"Other Vehicle",Machinery;
            Caption = 'Asset Type';
            DataClassification = CustomerContent;
        }
        field(50051; "WIP No."; Code[20])
        {
            TableRelation = Job;
            Caption = 'WIP No.';
            DataClassification = CustomerContent;
        }
        field(50052; Vehicle; Boolean)
        {
            Caption = 'Vehicle';
            DataClassification = CustomerContent;
        }
        field(50054; Station; Boolean)
        {
            Caption = 'Station';
            DataClassification = CustomerContent;
        }
        field(50055; "Financed By"; Text[50])
        {
            Caption = 'Financed By';
            DataClassification = CustomerContent;
        }
        field(50056; "Tag No"; Text[100])
        {
            Caption = 'Tag No';
            DataClassification = CustomerContent;
        }
        field(50057; "Make/Model"; Text[100])
        {
            Caption = 'Make/Model';
            DataClassification = CustomerContent;
        }
        field(50058; "Date of Delivery/Installation"; Date)
        {
            Caption = 'Date of Delivery/Installation';
            DataClassification = CustomerContent;
        }
        field(50059; Condition; Text[100])
        {
            Caption = 'Condition';
            DataClassification = CustomerContent;
        }
        field(50060; "Supplier Name"; Text[50])
        {
            Caption = 'Supplier Name';
            DataClassification = CustomerContent;
        }
        field(50061; "County Name"; Text[100])
        {
            Caption = 'County Name';
            DataClassification = CustomerContent;
        }
        field(50062; "Location Name"; Text[150])
        {
            Caption = 'Location Name';
            DataClassification = CustomerContent;
        }
        field(50063; "Responsible Office/Officer"; Text[100])
        {
            Caption = 'Responsible Office/Officer';
            DataClassification = CustomerContent;
        }
        field(50064; "Notes/Remarks"; Text[150])
        {
            Caption = 'Notes/Remarks';
            DataClassification = CustomerContent;
        }
        field(50066; "Asset Movement Status"; Option)
        {
            Caption = '';
            OptionMembers = ,Issued,Allocated,Requested,Available,Disposed;
            DataClassification = ToBeClassified;
        }
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    LOCKTABLE;
    FADeprBook.LOCKTABLE;
    MainAssetComp.LOCKTABLE;
    #4..35
    CommentLine.DELETEALL;

    DimMgt.DeleteDefaultDim(DATABASE::"Fixed Asset","No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..38

    //ERROR('You are not allowed to delete')
    */
    //end;


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "No." = '' THEN BEGIN
      FASetup.GET;
      FASetup.TESTFIELD("Fixed Asset Nos.");
    #4..6
    "Main Asset/Component" := "Main Asset/Component"::" ";
    "Component of Main Asset" := '';

    DimMgt.UpdateDefaultDim(
      DATABASE::"Fixed Asset","No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9

    //DimMgt.UpdateDefaultDim(
      //DATABASE::"Fixed Asset","No.",
      //"Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;

    var
        FALedEntry: Record "FA Ledger Entry";
}
