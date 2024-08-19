#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193788 "Workplan Entry"
{
    Caption = 'Workplan Entry';
    DrillDownPageId = "Workplan Entries";
    LookupPageId = "Workplan Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Workplan Code"; Code[20])
        {
            TableRelation = Workplan;
            Caption = 'Workplan Code';
        }
        field(3; "Activity Code"; Code[20])
        {
            TableRelation = "Workplan Activities";
            Caption = 'Activity Code';
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
            ClosingDates = true;

            trigger OnValidate()
            begin
                WorkPlanAct.Reset();
                WorkPlanAct.SetRange(WorkPlanAct."Activity Code", "Activity Code"); //Activity Code
                WorkPlanAct.SetRange(WorkPlanAct."Workplan Code", "Workplan Code"); //Workplan Plan Code
                if WorkPlanAct.Find('-') then begin
                    //message('found');
                    "Global Dimension 1 Code" := WorkPlanAct."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := WorkPlanAct."Shortcut Dimension 2 Code";
                    "Expense Code" := WorkPlanAct."Expense Code";
                    "Account Type" := WorkPlanAct.Type;
                    "G/L Account No." := WorkPlanAct."No.";
                    Description := WorkPlanAct."Activity Description";
                    Validate("Global Dimension 1 Code");
                    Validate("Global Dimension 2 Code");
                    Validate("G/L Account No.");
                end;
            end;
        }
        field(5; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                if "Global Dimension 1 Code" = '' then
                    exit;
                GetGLSetup();
                ValidateDimValue(GLSetup."Global Dimension 1 Code", "Global Dimension 1 Code");
            end;
        }
        field(6; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                if "Global Dimension 2 Code" = '' then
                    exit;
                GetGLSetup();
                ValidateDimValue(GLSetup."Global Dimension 2 Code", "Global Dimension 2 Code");
            end;
        }
        field(7; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(9; Description; Text[200])
        {
            Caption = 'Description';
        }
        field(10; "Business Unit Code"; Code[10])
        {
            Caption = 'Business Unit Code';
            TableRelation = "Business Unit";
        }
        field(11; "User ID"; Code[20])
        {
            Caption = 'User ID';
            Editable = false;
            TableRelation = User;

        }
        field(12; "Budget Dimension 1 Code"; Code[20])
        {
            CaptionClass = GetCaptionClass(1);
            Caption = 'Budget Dimension 1 Code';

            trigger OnLookup()
            begin
                "Budget Dimension 1 Code" := OnLookupDimCode(2, "Budget Dimension 1 Code");
            end;

            trigger OnValidate()
            begin
                if "Budget Dimension 1 Code" = '' then
                    exit;
                if GLBudgetName."Workplan Code" <> "Workplan Code" then
                    GLBudgetName.Get("Workplan Code");
                ValidateDimValue(GLBudgetName."Budget Dimension 1 Code", "Budget Dimension 1 Code");
            end;
        }
        field(13; "Budget Dimension 2 Code"; Code[20])
        {
            CaptionClass = GetCaptionClass(2);
            Caption = 'Budget Dimension 2 Code';

            trigger OnLookup()
            begin
                "Budget Dimension 2 Code" := OnLookupDimCode(3, "Budget Dimension 2 Code");
            end;

            trigger OnValidate()
            begin
                if "Budget Dimension 2 Code" = '' then
                    exit;
                if GLBudgetName."Workplan Code" <> "Workplan Code" then
                    GLBudgetName.Get("Workplan Code");
                ValidateDimValue(GLBudgetName."Budget Dimension 2 Code", "Budget Dimension 2 Code");
            end;
        }
        field(14; "Budget Dimension 3 Code"; Code[20])
        {
            CaptionClass = GetCaptionClass(3);
            Caption = 'Budget Dimension 3 Code';

            trigger OnLookup()
            begin
                "Budget Dimension 3 Code" := OnLookupDimCode(4, "Budget Dimension 3 Code");
            end;

            trigger OnValidate()
            begin
                if "Budget Dimension 3 Code" = '' then
                    exit;
                if GLBudgetName."Workplan Code" <> "Workplan Code" then
                    GLBudgetName.Get("Workplan Code");
                ValidateDimValue(GLBudgetName."Budget Dimension 3 Code", "Budget Dimension 3 Code");
            end;
        }
        field(15; "Budget Dimension 4 Code"; Code[20])
        {
            CaptionClass = GetCaptionClass(4);
            Caption = 'Budget Dimension 4 Code';

            trigger OnLookup()
            begin
                "Budget Dimension 4 Code" := OnLookupDimCode(5, "Budget Dimension 4 Code");
            end;

            trigger OnValidate()
            begin
                if "Budget Dimension 4 Code" = '' then
                    exit;
                if GLBudgetName."Workplan Code" <> "Workplan Code" then
                    GLBudgetName.Get("Workplan Code");
                ValidateDimValue(GLBudgetName."Budget Dimension 4 Code", "Budget Dimension 4 Code");
            end;
        }
        field(16; "Budget Dimension 5 Code"; Code[10])
        {
            Caption = 'Budget Dimension 5 Code';

        }
        field(17; "Budget Dimension 6 Code"; Code[20])
        {
            Caption = 'Budget Dimension 4 Code';
            TableRelation = Dimension;

        }
        field(18; Units; Code[40])
        {
            Caption = 'Units';
        }
        field(19; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            trigger OnValidate()
            begin
                Amount := Quantity * "Unit Cost";
            end;
        }
        field(20; Quantity; Decimal)
        {
            Caption = 'Quantity';
            trigger OnValidate()
            begin
                Amount := Quantity * "Unit Cost";
            end;
        }
        field(21; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = ' ,G/L Account,Item';
            OptionMembers = " ","G/L Account",Item;
        }
        field(22; "G/L Account No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if ("Account Type" = const(Item)) Item."No." where(Blocked = const(false))
            else
            if ("Account Type" = const("G/L Account")) "G/L Account"."No." where(Blocked = const(false),
                                                                                                     "Expense Code" = field("Expense Code"));

            trigger OnValidate()
            var
                GLAcc: Record "G/L Account";
                Item: Record Item;
            begin
                case "Account Type" of
                    "Account Type"::"G/L Account":
                        begin
                            GLAcc.Get("G/L Account No.");
                            GLAcc.TestField(Blocked, false);
                            Description := GLAcc.Name;
                        end;
                    "Account Type"::Item:
                        begin
                            Item.Get("G/L Account No.");
                            Item.TestField(Blocked, false);
                            Item.TestField("Inventory Posting Group");
                            Item.TestField("Gen. Prod. Posting Group");
                            Description := Item.Description;
                        end;
                end;
            end;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions();
            end;
        }
        field(50000; "Expense Code"; Code[30])
        {
            TableRelation = "Expense Code";
            Caption = 'Expense Code';
        }
        field(50001; "Created By:"; Code[30])
        {
            Caption = 'Created By:';
        }
        field(50002; "Last Modified By:"; DateTime)
        {
            Caption = 'Last Modified By:';
        }
        field(50003; "Processed to Budget"; Boolean)
        {
            Caption = 'Processed to Budget';
            trigger OnValidate()
            begin
                WorkPlanAct.Reset();
                WorkPlanAct.SetRange(WorkPlanAct."Activity Code", "Activity Code");
                WorkPlanAct.SetRange(WorkPlanAct."Workplan Code", "Workplan Code");
                if WorkPlanAct.Find('-') then begin
                    WorkPlanAct."Converted to Budget" := true;
                    WorkPlanAct."Converted to Budget by:" := UserId + ' ' + Format(CreateDateTime(Today, Time));
                    WorkPlanAct.Modify();
                end;
            end;
        }
        field(50004; "Entry Type"; Option)
        {
            Editable = false;
            OptionCaption = ' ,Reversal';
            OptionMembers = " ",Reversal;
            Caption = 'Entry Type';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Workplan Code", "Activity Code", Date)
        {
            SumIndexFields = Amount, Quantity;
        }
        key(Key3; "Workplan Code", "Activity Code", "Business Unit Code", "Global Dimension 1 Code", "Global Dimension 2 Code", "Budget Dimension 1 Code", "Budget Dimension 2 Code", "Budget Dimension 3 Code", "Budget Dimension 4 Code", Date, "G/L Account No.")
        {
            SumIndexFields = Amount, Quantity;
        }
        key(Key4; "Workplan Code", "Activity Code", Description, Date) { }
        key(Key5; "G/L Account No.", "Global Dimension 2 Code")
        {
            SumIndexFields = Amount, Quantity;
        }
        key(Key6; "G/L Account No.") { }
        key(Key7; "Workplan Code", "G/L Account No.", "Business Unit Code", "Global Dimension 1 Code") { }
        key(Key8; "Workplan Code", "Activity Code", "Business Unit Code", "Global Dimension 1 Code", "Global Dimension 2 Code", "Budget Dimension 1 Code", "Budget Dimension 2 Code", "Budget Dimension 3 Code", "Budget Dimension 4 Code", Date)
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups { }

    trigger OnDelete()
    var
        GLBudgetDim: Record "Workplan Dimension";
    begin
        CheckIfBlocked();
        //Was Checking for GL Dimensions
        GLBudgetDim.SetRange("Entry No.", "Entry No.");
        GLBudgetDim.DeleteAll();
    end;

    trigger OnInsert()
    begin
        CheckIfBlocked();
        TestField(Date);
        TestField("Activity Code");
        TestField("Workplan Code");
        //Ensure cannot post to Totalling fields
        if not GetGLAccount("Activity Code") then
            Error('Account No %1 does not allow Budgetting', "Activity Code");

        LockTable();
        "User ID" := UserId;
        if "Entry No." = 0 then
            "Entry No." := GetNextEntryNo();

        GetGLSetup();
        UpdateDim(GLSetup."Global Dimension 1 Code", "Global Dimension 1 Code");
        UpdateDim(GLSetup."Global Dimension 2 Code", "Global Dimension 2 Code");
        UpdateDim(GLBudgetName."Budget Dimension 1 Code", "Budget Dimension 1 Code");
        UpdateDim(GLBudgetName."Budget Dimension 2 Code", "Budget Dimension 2 Code");
        UpdateDim(GLBudgetName."Budget Dimension 3 Code", "Budget Dimension 3 Code");
        UpdateDim(GLBudgetName."Budget Dimension 4 Code", "Budget Dimension 4 Code");

        //***************************************************************************
        "Created By:" := UserId + ' on ' + Format(CreateDateTime(Today, Time));
    end;

    trigger OnModify()
    begin
        CheckIfBlocked();
        "User ID" := UserId;
        GetGLSetup();
        if "Global Dimension 1 Code" <> xRec."Global Dimension 1 Code" then
            UpdateDim(GLSetup."Global Dimension 1 Code", "Global Dimension 1 Code");
        if "Global Dimension 2 Code" <> xRec."Global Dimension 2 Code" then
            UpdateDim(GLSetup."Global Dimension 2 Code", "Global Dimension 2 Code");
        if "Budget Dimension 1 Code" <> xRec."Budget Dimension 1 Code" then
            UpdateDim(GLBudgetName."Budget Dimension 1 Code", "Budget Dimension 1 Code");
        if "Budget Dimension 2 Code" <> xRec."Budget Dimension 2 Code" then
            UpdateDim(GLBudgetName."Budget Dimension 2 Code", "Budget Dimension 2 Code");
        if "Budget Dimension 3 Code" <> xRec."Budget Dimension 3 Code" then
            UpdateDim(GLBudgetName."Budget Dimension 3 Code", "Budget Dimension 3 Code");
        if "Budget Dimension 4 Code" <> xRec."Budget Dimension 4 Code" then
            UpdateDim(GLBudgetName."Budget Dimension 4 Code", "Budget Dimension 4 Code");

        //***************************************************************************
        "Last Modified By:" := CreateDateTime(Today, Time);
    end;

    var
        Text000: Label 'The dimension value %1 has not been set up for dimension %2.';
        Text001: Label '1,5,,Budget Dimension 1 Code';
        Text002: Label '1,5,,Budget Dimension 2 Code';
        Text003: Label '1,5,,Budget Dimension 3 Code';
        Text004: Label '1,5,,Budget Dimension 4 Code';
        GLBudgetName: Record Workplan;
        GLSetup: Record "General Ledger Setup";
        GLSetupRetrieved: Boolean;
        WorkPlanAct: Record "Workplan Activities";


    procedure CheckIfBlocked()
    begin
        if "Workplan Code" = GLBudgetName."Workplan Code" then
            exit;
        if GLBudgetName."Workplan Code" <> "Workplan Code" then
            GLBudgetName.Get("Workplan Code");
        GLBudgetName.TestField(Blocked, false);
    end;

    local procedure ValidateDimValue(DimCode: Code[20]; var DimValueCode: Code[20]): Boolean
    var
        DimValue: Record "Dimension Value";
    begin
        DimValue."Dimension Code" := DimCode;
        DimValue.Code := DimValueCode;
        DimValue.Find('=><');
        if DimValueCode <> CopyStr(DimValue.Code, 1, StrLen(DimValueCode)) then
            Error(Text000, DimValueCode, DimCode);
        DimValueCode := DimValue.Code;
    end;


    procedure GetGLSetup()
    begin
        if not GLSetupRetrieved then begin
            GLSetup.Get();
            GLSetupRetrieved := true;
        end;
    end;


    procedure OnLookupDimCode(DimOption: Option "Global Dimension 1","Global Dimension 2","Budget Dimension 1","Budget Dimension 2","Budget Dimension 3","Budget Dimension 4"; DefaultValue: Code[20]): Code[20]
    var
        DimValue: Record "Dimension Value";
        DimValueList: Page "Dimension Value List";
    begin
        if DimOption in [DimOption::"Global Dimension 1", DimOption::"Global Dimension 2"] then
            GetGLSetup()
        else
            if GLBudgetName."Workplan Code" <> "Workplan Code" then
                GLBudgetName.Get("Workplan Code");
        case DimOption of
            DimOption::"Global Dimension 1":
                DimValue."Dimension Code" := GLSetup."Global Dimension 1 Code";
            DimOption::"Global Dimension 2":
                DimValue."Dimension Code" := GLSetup."Global Dimension 2 Code";
            DimOption::"Budget Dimension 1":
                DimValue."Dimension Code" := GLBudgetName."Budget Dimension 1 Code";
            DimOption::"Budget Dimension 2":
                DimValue."Dimension Code" := GLBudgetName."Budget Dimension 2 Code";
            DimOption::"Budget Dimension 3":
                DimValue."Dimension Code" := GLBudgetName."Budget Dimension 3 Code";
            DimOption::"Budget Dimension 4":
                DimValue."Dimension Code" := GLBudgetName."Budget Dimension 4 Code";
        end;
        DimValue.SetRange("Dimension Code", DimValue."Dimension Code");
        if DimValue.Get(DimValue."Dimension Code", DefaultValue) then;
        DimValueList.SetTableView(DimValue);
        DimValueList.SetRecord(DimValue);
        DimValueList.LookupMode := true;
        if DimValueList.RunModal() = Action::LookupOK then begin
            DimValueList.GetRecord(DimValue);
            exit(DimValue.Code);
        end else
            exit(DefaultValue);
    end;


    procedure UpdateDim(DimCode: Code[20]; DimValueCode: Code[20])
    var
        GLBudgetDim: Record "Workplan Dimension";
    begin

        //Workplan Dimensions
        if DimCode = '' then
            exit;
        begin
            if GLBudgetDim.Get(Rec."Entry No.", DimCode) then
                GLBudgetDim.Delete();
            if DimValueCode <> '' then begin
                GLBudgetDim.Init();
                GLBudgetDim."Entry No." := Rec."Entry No.";
                GLBudgetDim."Dimension Code" := DimCode;
                GLBudgetDim."Dimension Value Code" := DimValueCode;
                GLBudgetDim.Insert();
            end;
        end;
    end;

    local procedure GetNextEntryNo(): Integer
    var
        GLBudgetEntry: Record "Workplan Entry";
    begin
        GLBudgetEntry.SetCurrentKey("Entry No.");
        if GLBudgetEntry.Find('+') then
            exit(GLBudgetEntry."Entry No." + 1)
        else
            exit(1);
    end;


    procedure GetCaptionClass(BudgetDimType: Integer): Text[250]
    begin
        if GLBudgetName."Workplan Code" <> "Workplan Code" then
            if not GLBudgetName.Get("Workplan Code") then
                exit('');
        case BudgetDimType of
            1:

                if GLBudgetName."Budget Dimension 1 Code" <> '' then
                    exit('1,5,' + GLBudgetName."Budget Dimension 1 Code")
                else
                    exit(Text001);
            2:

                if GLBudgetName."Budget Dimension 2 Code" <> '' then
                    exit('1,5,' + GLBudgetName."Budget Dimension 2 Code")
                else
                    exit(Text002);
            3:

                if GLBudgetName."Budget Dimension 3 Code" <> '' then
                    exit('1,5,' + GLBudgetName."Budget Dimension 3 Code")
                else
                    exit(Text003);
            4:

                if GLBudgetName."Budget Dimension 4 Code" <> '' then
                    exit('1,5,' + GLBudgetName."Budget Dimension 4 Code")
                else
                    exit(Text004);
        end;
    end;


    procedure GetGLAccount(GLCode: Code[20]) AllowPosting: Boolean
    var
        GLAccount: Record "Workplan Activities";
    begin
        AllowPosting := false;
        if GLAccount.Get(GLCode) then
            if GLAccount."Account Type" = GLAccount."Account Type"::Posting then
                AllowPosting := true
            else
                AllowPosting := false;
    end;


    procedure ShowDimensions()
    var
        DimSetEntry: Record "Dimension Set Entry";
        OldDimSetID: Integer;
    begin
        /*
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID",STRSUBSTNO('%1 %2 %3',"Budget Name","G/L Account No.","Entry No."));

        IF OldDimSetID = "Dimension Set ID" THEN
          EXIT;

        GetGLSetup;
        GLBudgetName.GET("Budget Name");

        "Global Dimension 1 Code" := '';
        "Global Dimension 2 Code" := '';
        "Budget Dimension 1 Code" := '';
        "Budget Dimension 2 Code" := '';
        "Budget Dimension 3 Code" := '';
        "Budget Dimension 4 Code" := '';

        IF DimSetEntry.GET("Dimension Set ID",GLSetup."Global Dimension 1 Code") THEN
          "Global Dimension 1 Code" := DimSetEntry."Dimension Value Code";
        IF DimSetEntry.GET("Dimension Set ID",GLSetup."Global Dimension 2 Code") THEN
          "Global Dimension 2 Code" := DimSetEntry."Dimension Value Code";
        IF DimSetEntry.GET("Dimension Set ID",GLBudgetName."Budget Dimension 1 Code") THEN
          "Budget Dimension 1 Code" := DimSetEntry."Dimension Value Code";
        IF DimSetEntry.GET("Dimension Set ID",GLBudgetName."Budget Dimension 2 Code") THEN
          "Budget Dimension 2 Code" := DimSetEntry."Dimension Value Code";
        IF DimSetEntry.GET("Dimension Set ID",GLBudgetName."Budget Dimension 3 Code") THEN
          "Budget Dimension 3 Code" := DimSetEntry."Dimension Value Code";
        IF DimSetEntry.GET("Dimension Set ID",GLBudgetName."Budget Dimension 4 Code") THEN
          "Budget Dimension 4 Code" := DimSetEntry."Dimension Value Code";
         */

    end;
}
