#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193679 "FA Budget Entries"
{
    Caption = 'FA Budget Entries';
    DataCaptionExpression = Rec.GetCaption();
    DelayedInsert = true;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "FA Budget Entry";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Budget Name"; Rec."Budget Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Budget Name field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("FA No."; Rec."FA No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA No. field.';
                }
                field("FA Posting Type"; Rec."FA Posting Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA Posting Type field.';
                }
                field("Depreciation Book Code"; Rec."Depreciation Book Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Depreciation Book Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Source Type field.';
                }
                field("Source No."; Rec."Source No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Source No. field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Enabled = "Global Dimension 1 CodeEnable";
                    Visible = "Global Dimension 1 CodeVisible";
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Enabled = "Global Dimension 2 CodeEnable";
                    Visible = "Global Dimension 2 CodeVisible";
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Budget Dimension 1 Code"; Rec."Budget Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Enabled = "Budget Dimension 1 CodeEnable";
                    Visible = "Budget Dimension 1 CodeVisible";
                    ToolTip = 'Specifies the value of the Budget Dimension 1 Code field.';
                }
                field("Budget Dimension 2 Code"; Rec."Budget Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Enabled = "Budget Dimension 2 CodeEnable";
                    Visible = "Budget Dimension 2 CodeVisible";
                    ToolTip = 'Specifies the value of the Budget Dimension 2 Code field.';
                }
                field("Budget Dimension 3 Code"; Rec."Budget Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Enabled = "Budget Dimension 3 CodeEnable";
                    Visible = "Budget Dimension 3 CodeVisible";
                    ToolTip = 'Specifies the value of the Budget Dimension 3 Code field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Cost Amount"; Rec."Cost Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cost Amount field.';
                }
                field("Sales Amount"; Rec."Sales Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Sales Amount field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("<Action23>")
            {
                Caption = 'Ent&ry';
                Image = Entry;
                action("<Action24>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        Rec.ShowDimensions();
                        CurrPage.SaveRecord();
                    end;
                }
                action("Update Global Budget")
                {
                    ApplicationArea = Basic;
                    Caption = 'Update Global Budget';
                    Image = CopyLedgerToBudget;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;
                    ToolTip = 'Executes the Update Global Budget action.';
                    trigger OnAction()
                    var
                        FixedAssetsDet: Record "Fixed Asset";
                        FAPostingGRP: Record "FA Posting Group";
                        BudgetGl: Code[20];
                        FixedAssetsDep: Record "FA Depreciation Book";
                    begin
                        if Rec."Transferred to budget" <> false then
                            Error('Budget Line already transferred to budget');
                        BudgetEntry.Init();
                        BudgetEntry."Entry No." := 0;
                        BudgetEntry."Budget Name" := Rec."Budget Name";
                        BudgetEntry.Date := Rec.Date;
                        FixedAssetsDet.Reset();
                        FixedAssetsDet.SetRange(FixedAssetsDet."No.", Rec."FA No.");
                        FixedAssetsDet.FindSet();
                        begin
                            FixedAssetsDep.Reset();
                            FixedAssetsDep.SetRange(FixedAssetsDep."FA No.", Rec."FA No.");
                            FixedAssetsDep.FindSet();
                            FAPostingGRP.Reset();
                            FAPostingGRP.SetRange(FAPostingGRP.Code, FixedAssetsDep."FA Posting Group");
                            FAPostingGRP.FindSet();
                            if Rec."FA Posting Type" = Rec."FA Posting Type"::Maintenance then begin
                                BudgetGl := FAPostingGRP."Maintenance Expense Account";
                                if BudgetGl = '' then
                                    Error('Ensure Fixed Asset No %1 has the Maintenance G/L Account', Rec."FA No.");
                            end
                            else
                                if Rec."FA Posting Type" = Rec."FA Posting Type"::"Acquisition Cost" then begin
                                    BudgetGl := FAPostingGRP."Acquisition Cost Account";
                                    if BudgetGl = '' then
                                        Error('Ensure Fixed Asset No %1 has the Acquisition G/L Account', Rec."FA No.");
                                end
                            /*  //To Accomodate any Additional Item under Custom 1 and Custom 2
                           else if Rec."FA Posting Type"=Rec."fa posting type"::" " then begin
                               BudgetGl:=FAPostingGRP."Custom 2 Account";
                                  if BudgetGl ='' then
                                     Error('Ensure Fixed Asset No %1 has the %2 G/L Account',Rec."FA No.",
                                    FAPostingGRP."Custom 1 Account");
                           end
                           else if Rec."FA Posting Type"=Rec."fa posting type"::"4" then begin
                               BudgetGl:=FAPostingGRP."Custom 2 Account";
                                  if BudgetGl ='' then
                                     Error('Ensure Fixed Asset No %1 has the %2 G/L Account',Rec."FA No.",
                                     FAPostingGRP."Custom 1 Account");
                           end; */
                        end;

                        BudgetEntry."G/L Account No." := BudgetGl;
                        BudgetEntry.Amount := Rec."Cost Amount";
                        BudgetEntry."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                        BudgetEntry."Global Dimension 2 Code" := Rec."Global Dimension 2 Code";
                        BudgetEntry.Insert(true);

                        Message('G/L budget updated successfully');
                        Rec."Transferred to budget" := true;
                        Rec.Modify();
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Rec."Entry No." <> 0 then
            if Rec."Dimension Set ID" <> xRec."Dimension Set ID" then
                LowestModifiedEntryNo := Rec."Entry No.";
    end;

    trigger OnClosePage()
    var
        UpdateItemAnalysisView: Codeunit "Update Item Analysis View";
    begin
        if LowestModifiedEntryNo < 2147483647 then
            UpdateItemAnalysisView.SetLastBudgetEntryNo(LowestModifiedEntryNo - 1);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if Rec."Entry No." < LowestModifiedEntryNo then
            LowestModifiedEntryNo := Rec."Entry No.";
        exit(true);
    end;

    trigger OnInit()
    begin
        "Budget Dimension 3 CodeEnable" := true;
        "Budget Dimension 2 CodeEnable" := true;
        "Budget Dimension 1 CodeEnable" := true;
        "Global Dimension 2 CodeEnable" := true;
        "Global Dimension 1 CodeEnable" := true;
        "Budget Dimension 3 CodeVisible" := true;
        "Budget Dimension 2 CodeVisible" := true;
        "Budget Dimension 1 CodeVisible" := true;
        "Global Dimension 2 CodeVisible" := true;
        "Global Dimension 1 CodeVisible" := true;
        LowestModifiedEntryNo := 2147483647;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."Entry No." < LowestModifiedEntryNo then
            LowestModifiedEntryNo := Rec."Entry No.";
        exit(true);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Budget Name" := GETRANGEMIN("Budget Name");
        if BudgetaryControl.Get() then
            Rec."Budget Name" := BudgetaryControl."Current Budget Code";
        //"Analysis Area" := GETRANGEMIN("Analysis Area");
        //IF (faBudgetName.Name <> "Budget Name") THEN
        //  faBudgetName.GET("Analysis Area","Budget Name");

        if Rec.GetFilter(Rec."FA No.") <> '' then
            Rec."FA No." := GetFirstItem(Rec.GetFilter(Rec."FA No."));
        Rec.Date := GetFirstDate(Rec.GetFilter(Rec.Date));
        Rec."User ID" := UserId;

        if Rec.GetFilter(Rec."Global Dimension 1 Code") <> '' then
            Rec."Global Dimension 1 Code" :=
              GetFirstDimValue(GLSetup."Global Dimension 1 Code", Rec.GetFilter(Rec."Global Dimension 1 Code"));

        if Rec.GetFilter(Rec."Global Dimension 2 Code") <> '' then
            Rec."Global Dimension 2 Code" :=
              GetFirstDimValue(GLSetup."Global Dimension 2 Code", Rec.GetFilter(Rec."Global Dimension 2 Code"));

        if Rec.GetFilter(Rec."Budget Dimension 1 Code") <> '' then
            Rec."Budget Dimension 1 Code" :=
              GetFirstDimValue(faBudgetName."Budget Dimension 1 Code", Rec.GetFilter(Rec."Budget Dimension 1 Code"));

        if Rec.GetFilter(Rec."Budget Dimension 2 Code") <> '' then
            Rec."Budget Dimension 2 Code" :=
              GetFirstDimValue(faBudgetName."Budget Dimension 2 Code", Rec.GetFilter(Rec."Budget Dimension 2 Code"));

        if Rec.GetFilter(Rec."Budget Dimension 3 Code") <> '' then
            Rec."Budget Dimension 3 Code" :=
              GetFirstDimValue(faBudgetName."Budget Dimension 3 Code", Rec.GetFilter(Rec."Budget Dimension 3 Code"));

        if Rec.GetFilter(Rec."Location Code") <> '' then
            Rec."Location Code" := GetFirstLocationCode(Rec.GetFilter(Rec."Location Code"));
    end;

    trigger OnOpenPage()
    begin
        if Rec.GetFilter(Rec."Budget Name") = '' then
            faBudgetName.Init()
        else begin
            //  COPYFILTER("Analysis Area",fabudgetName."Analysis Area");
            Rec.CopyFilter(Rec."Budget Name", faBudgetName.Name);
            faBudgetName.FindFirst();
        end;

        CurrPage.Editable := not faBudgetName.Blocked;
        GLSetup.Get();
        "Global Dimension 1 CodeEnable" := GLSetup."Global Dimension 1 Code" <> '';
        "Global Dimension 2 CodeEnable" := GLSetup."Global Dimension 2 Code" <> '';
        "Budget Dimension 1 CodeEnable" := faBudgetName."Budget Dimension 1 Code" <> '';
        "Budget Dimension 2 CodeEnable" := faBudgetName."Budget Dimension 2 Code" <> '';
        "Budget Dimension 3 CodeEnable" := faBudgetName."Budget Dimension 3 Code" <> '';
        "Global Dimension 1 CodeVisible" := GLSetup."Global Dimension 1 Code" <> '';
        "Global Dimension 2 CodeVisible" := GLSetup."Global Dimension 2 Code" <> '';
        "Budget Dimension 1 CodeVisible" := faBudgetName."Budget Dimension 1 Code" <> '';
        "Budget Dimension 2 CodeVisible" := faBudgetName."Budget Dimension 2 Code" <> '';
        "Budget Dimension 3 CodeVisible" := faBudgetName."Budget Dimension 3 Code" <> '';
    end;

    var
        GLSetup: Record "General Ledger Setup";
        faBudgetName: Record "G/L Budget Name";
        LowestModifiedEntryNo: Integer;
        [InDataSet]
        "Global Dimension 1 CodeVisible": Boolean;
        [InDataSet]
        "Global Dimension 2 CodeVisible": Boolean;
        [InDataSet]
        "Budget Dimension 1 CodeVisible": Boolean;
        [InDataSet]
        "Budget Dimension 2 CodeVisible": Boolean;
        [InDataSet]
        "Budget Dimension 3 CodeVisible": Boolean;
        [InDataSet]
        "Global Dimension 1 CodeEnable": Boolean;
        [InDataSet]
        "Global Dimension 2 CodeEnable": Boolean;
        [InDataSet]
        "Budget Dimension 1 CodeEnable": Boolean;
        [InDataSet]
        "Budget Dimension 2 CodeEnable": Boolean;
        [InDataSet]
        "Budget Dimension 3 CodeEnable": Boolean;
        BudgetaryControl: Record "Budgetary Control Setup";
        BudgetEntry: Record "G/L Budget Entry";

    local procedure GetFirstItem(faFilter: Text[250]): Code[20]
    var
        FA: Record "Fixed Asset";
    begin
        begin
            FA.SetFilter(FA."No.", faFilter);
            if FA.FindFirst() then
                exit(FA."No.");

            exit('');
        end;
    end;

    local procedure GetFirstDate(DateFilter: Text[250]): Date
    var
        Period: Record Date;
    begin
        if DateFilter = '' then
            exit(0D);
        begin
            Period.SetRange(Period."Period Type", Period."Period Type"::Date);
            Period.SetFilter(Period."Period Start", DateFilter);
            if Period.FindFirst() then
                exit(Period."Period Start");

            exit(0D);
        end;
    end;

    local procedure GetFirstDimValue(DimCode: Code[20]; DimValFilter: Text[250]): Code[20]
    var
        DimVal: Record "Dimension Value";
    begin
        if (DimCode = '') or (DimValFilter = '') then
            exit('');
        begin
            DimVal.SetRange(DimVal."Dimension Code", DimCode);
            DimVal.SetFilter(DimVal.Code, DimValFilter);
            if DimVal.FindFirst() then
                exit(DimVal.Code);

            exit('');
        end;
    end;

    local procedure GetFirstLocationCode(LocationCodetFilter: Text[250]): Code[10]
    var
        Location: Record Location;
    begin
        begin
            Location.SetFilter(Location.Code, LocationCodetFilter);
            if Location.FindFirst() then
                exit(Location.Code);

            exit('');
        end;
    end;
}
