#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50102 tableextension50102 extends "G/L Account"
{
    fields
    {

        //Unsupported feature: Property Modification (CalcFormula) on ""Net Change"(Field 32)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Budgeted Amount"(Field 33)".


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
        IF ("Search Name" = UPPERCASE(xRec.Name)) OR ("Search Name" = '') THEN
          "Search Name" := Name;

        //Prevent Changing once entries exist
        TestNoEntriesExist(FIELDCAPTION(Name));
        */
        //end;


        //Unsupported feature: Code Modification on ""Income/Balance"(Field 9).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ("Income/Balance" = "Income/Balance"::"Balance Sheet") AND ("Cost Type No." <> '') THEN BEGIN
          IF CostType.GET("No.") THEN BEGIN
            CostType."G/L Account Range" := '';
            CostType.MODIFY;
          END;
          "Cost Type No." := '';
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..7
        //Prevent Changing once entries exist
        TestNoEntriesExist(FIELDCAPTION("Income/Balance"));
        */
        //end;


        //Unsupported feature: Code Insertion on ""Debit/Credit"(Field 10)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        //Prevent Changing once entries exist
        TestNoEntriesExist(FIELDCAPTION("Debit/Credit"));
        */
        //end;


        //Unsupported feature: Code Insertion on ""Direct Posting"(Field 14)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        //Prevent Changing once entries exist
        TestNoEntriesExist(FIELDCAPTION("Direct Posting"));
        */
        //end;
        field(50000; "Budget Controlled"; Boolean)
        {
            Caption = 'Budget Controlled';
            DataClassification = CustomerContent;
        }
        field(50001; "Account Category 2"; Option)
        {
            OptionMembers = " ","Capital Fund","Revaluation Reserve","Revenue Reserve","Year PL ","Prior year","Long Term Liability","Current Liability","Fixed Asset","Current Asset",Revenue,"Direct Costs",Expense;
            Caption = 'Account Category 2';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                //Prevent Changing once entries exist
                Rec.TestNoEntriesExist(Rec.FieldCaption(Rec."Account Category"));
            end;
        }
        field(50002; "Global Dimension 3 Filter"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(50003; "Global Dimension 4 Filter"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Global Dimension 4 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(50004; "Expense Code"; Code[10])
        {
            TableRelation = "Expense Code";
            Caption = 'Expense Code';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                //Expense code only applicable if account type is posting and Budgetary control is applicable
                Rec.TestField(Rec."Account Type", Rec."Account Type"::Posting);
                Rec.TestField(Rec."Budget Controlled", true);
            end;
        }
        field(50005; "Donor defined Account"; Boolean)
        {
            Description = 'Select if the Account is donor Defined';
            Caption = 'Donor defined Account';
            DataClassification = CustomerContent;
        }
        field(50006; "Budget Control Account"; Code[20])
        {
            TableRelation = "G/L Account";
            Caption = 'Budget Control Account';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                GLAcc: Record "G/L Account";
            begin
                if GLAcc.Get(Rec."Budget Control Account") then
                    if GLAcc."Account Type" <> GLAcc."Account Type"::Total then
                        Error('The Budget Control Account can only be of Account Type Total');
            end;
        }
        field(39004244; test; Code[20])
        {
            Caption = 'test';
            DataClassification = CustomerContent;
        }
        field(39004245; "Grant Expense"; Boolean)
        {
            Caption = 'Grant Expense';
            DataClassification = CustomerContent;
        }
        field(39004246; Status; Option)
        {
            Editable = true;
            OptionMembers = New,"Pending Approval",Approved,Rejected;
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(39004247; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center BR 2".Code;
            Caption = 'Responsibility Center';
            DataClassification = CustomerContent;
        }
        /*  field(39004248;"Dimension Set ID Filter";Integer)
         {
             Editable = false;
             FieldClass = FlowFilter;
             TableRelation = "Dimension Set Entry"."Dimension Set ID";
         } */
    }
    var
        Text000: Label 'You cannot change %1 because there are one or more ledger entries associated with this account.';


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.UpdateDefaultDim(DATABASE::"G/L Account","No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");

    IF CostAccSetup.GET THEN
      CostAccMgt.UpdateCostTypeFromGLAcc(Rec,xRec,0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    ///IF CostAccSetup.GET THEN
      ////CostAccMgt.UpdateCostTypeFromGLAcc(Rec,xRec,0);
    */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Last Date Modified" := TODAY;

    IF CostAccSetup.GET THEN
      CostAccMgt.UpdateCostTypeFromGLAcc(Rec,xRec,1);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Last Date Modified" := TODAY;

    ////IF CostAccSetup.GET THEN
     ///// CostAccMgt.UpdateCostTypeFromGLAcc(Rec,xRec,1);
    */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Last Date Modified" := TODAY;

    IF CostAccSetup.READPERMISSION THEN
      CostAccMgt.UpdateCostTypeFromGLAcc(Rec,xRec,3);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Last Date Modified" := TODAY;

    ////IF CostAccSetup.READPERMISSION THEN
    ////  CostAccMgt.UpdateCostTypeFromGLAcc(Rec,xRec,3);
    */
    //end;

    procedure TestNoEntriesExist(CurrentFieldName: Text[100])
    var
        GLLedgEntry: Record "G/L Entry";
    begin
        //To prevent change of field
        GLLedgEntry.SetCurrentKey(GLLedgEntry."G/L Account No.");
        GLLedgEntry.SetRange("G/L Account No.", Rec."No.");
        if GLLedgEntry.Find('-') then
            Error(
              Text000,
              CurrentFieldName);
    end;

}
