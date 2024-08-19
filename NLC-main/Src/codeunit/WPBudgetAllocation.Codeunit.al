#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 52193454 "WP Budget Allocation"
{


    var
        GLBudgetName: Record "G/L Budget Name";
        GLSetup: Record "General Ledger Setup";
        ItemBudgetName: Record "Item Budget Name";
        WorkplanAct: Record "Workplan Activities";


    procedure AutoAllocatePurch(var Rec: Record "Temp Budget Alloc Purch")
    var
        Budget: Record "Item Budget Name";
        DimVal: Record "Dimension Value";
        GLBudgetEntry: Record "Item Budget Entry";
        IntC: Integer;
        NewDate: Date;
        Period: Text[30];
        Amnt: Decimal;
        EntryNo: Integer;
        GL: Record Item;
    begin
        begin

            //check if the date inserted as the start date is greater than the end date
            if (Rec."Start Date" > Rec."End Date") then
                Error('Ending Date must BE greater than or equal to start date');
            /*Get the new date selected by the user first*/
            NewDate := Rec."Start Date";
            /*Get the period*/
            if Rec."Period Type" = Rec."Period Type"::Daily then
                Period := 'D'
            else
                if Rec."Period Type" = Rec."Period Type"::Weekly then
                    Period := 'W'
                else
                    if Rec."Period Type" = Rec."Period Type"::Monthly then
                        Period := 'M'
                    else
                        if Rec."Period Type" = Rec."Period Type"::Quarterly then
                            Period := 'Q'
                        else
                            Period := 'Y';
            /*Initiate the loop*/
            while NewDate <= Rec."End Date"
              do begin
                IntC := IntC + 1;
                NewDate := CalcDate('1' + Period, NewDate);
            end;
            /*Number of times to divide amount has been identified*/
            /*Get the amount and get the amount per period identified*/

            Amnt := Rec.Amount / IntC;

            /*Get the entry number*/
            GLBudgetEntry.Reset();
            if GLBudgetEntry.Find('+') then
                EntryNo := GLBudgetEntry."Entry No."
            else
                EntryNo := 0;
            EntryNo := EntryNo + 1;
            /*Check if the user wishes to overwrite the details already in the system*/
            if Rec.Overwrite = true then begin
                GLBudgetEntry.Reset();
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Name", Rec.Name);
                GLBudgetEntry.SetRange(GLBudgetEntry."Item No.", Rec."Item No");
                GLBudgetEntry.SetRange(GLBudgetEntry."Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Global Dimension 2 Code", Rec."Global Dimension 2 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 1 Code", Rec."Budget Dimension 1 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 2 Code", Rec."Budget Dimension 2 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 3 Code", Rec."Budget Dimension 3 Code");
                if GLBudgetEntry.Find('-') then
                    GLBudgetEntry.DeleteAll();
            end;
            /*Reset the new date*/
            NewDate := Rec."Start Date";
            /*Initiate the loop to save the details into the table*/
            while NewDate <= Rec."End Date"
              do begin
                GLBudgetEntry.Init();
                GLBudgetEntry."Entry No." := EntryNo;

                GLBudgetEntry."Analysis Area" := GLBudgetEntry."Analysis Area"::Purchase;

                GLBudgetEntry."Budget Name" := Rec.Name;
                GLBudgetEntry.Validate(GLBudgetEntry."Budget Name");

                GLBudgetEntry."Item No." := Rec."Item No";
                GLBudgetEntry.Validate(GLBudgetEntry."Item No.");
                GL.Reset();
                GL.Get(Rec."Item No");
                /*
                      Forced to comment out by TChibo
                //    GLBudgetEntry."Item G/L Sales Account":=GL."Item G/L Sales Account";
                //    GLBudgetEntry."Item G/L Cost Account":=GLBudgetEntry."Item G/L Cost Account";
                */
                GLBudgetEntry."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Global Dimension 1 Code");

                GLBudgetEntry."Global Dimension 2 Code" := Rec."Global Dimension 2 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Global Dimension 2 Code");

                GLBudgetEntry."Budget Dimension 1 Code" := Rec."Budget Dimension 1 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 1 Code");

                GLBudgetEntry."Budget Dimension 2 Code" := Rec."Budget Dimension 2 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 2 Code");

                GLBudgetEntry."Budget Dimension 3 Code" := Rec."Budget Dimension 3 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 3 Code");

                GLBudgetEntry.Date := NewDate;


                if Rec."Show As" = Rec."Show As"::Quantity then
                    GLBudgetEntry."Sales Amount" := Amnt
                else
                    if Rec."Show As" = Rec."Show As"::"Cost Amount" then
                        GLBudgetEntry.Quantity := Amnt;

                GLBudgetEntry."User ID" := UserId;

                GLBudgetEntry.Insert(true);
                NewDate := CalcDate('1' + Period, NewDate);
                EntryNo := EntryNo + 1;
            end;
            Rec.Processed := true;
            Rec."User ID" := UserId;
            Rec.Modify();
            Message('Budgetary Allocation Complete');

        end;
        Rec.Delete();

    end;


    procedure AutoAllocateSale(var Rec: Record "Temp Budget Alloc Sale")
    var
        Budget: Record "Item Budget Name";
        DimVal: Record "Dimension Value";
        GLBudgetEntry: Record "Item Budget Entry";
        IntC: Integer;
        NewDate: Date;
        Period: Text[30];
        Amnt: Decimal;
        EntryNo: Integer;
        GL: Record Item;
    begin
        begin

            //check if the date inserted as the start date is greater than the end date
            if (Rec."Start Date" > Rec."End Date") then
                Error('Ending Date must BE greater than or equal to start date');

            /*Get the new date selected by the user first*/
            NewDate := Rec."Start Date";
            /*Get the period*/
            if Rec."Period Type" = Rec."Period Type"::Daily then
                Period := 'D'
            else
                if Rec."Period Type" = Rec."Period Type"::Weekly then
                    Period := 'W'
                else
                    if Rec."Period Type" = Rec."Period Type"::Monthly then
                        Period := 'M'
                    else
                        if Rec."Period Type" = Rec."Period Type"::Quarterly then
                            Period := 'Q'
                        else
                            Period := 'Y';
            /*Initiate the loop*/
            while NewDate <= Rec."End Date"
              do begin
                IntC := IntC + 1;
                NewDate := CalcDate('1' + Period, NewDate);
            end;
            /*Number of times to divide amount has been identified*/
            /*Get the amount and get the amount per period identified*/

            Amnt := Rec.Amount / IntC;

            /*Get the entry number*/
            GLBudgetEntry.Reset();
            if GLBudgetEntry.Find('+') then
                EntryNo := GLBudgetEntry."Entry No."
            else
                EntryNo := 0;
            EntryNo := EntryNo + 1;
            /*Check if the user wishes to overwrite the details already in the system*/
            if Rec.Overwrite = true then begin
                GLBudgetEntry.Reset();
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Name", Rec.Name);
                GLBudgetEntry.SetRange(GLBudgetEntry."Item No.", Rec."Item No");
                GLBudgetEntry.SetRange(GLBudgetEntry."Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Global Dimension 2 Code", Rec."Global Dimension 2 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 1 Code", Rec."Budget Dimension 1 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 2 Code", Rec."Budget Dimension 2 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 3 Code", Rec."Budget Dimension 3 Code");
                if GLBudgetEntry.Find('-') then
                    GLBudgetEntry.DeleteAll();
            end;
            /*Reset the new date*/
            NewDate := Rec."Start Date";
            /*Initiate the loop to save the details into the table*/
            while NewDate <= Rec."End Date"
              do begin
                GLBudgetEntry.Init();
                GLBudgetEntry."Entry No." := EntryNo;

                GLBudgetEntry."Analysis Area" := Rec."Analysis Area"::Sales;

                GLBudgetEntry."Budget Name" := Rec.Name;
                GLBudgetEntry.Validate(GLBudgetEntry."Budget Name");

                GLBudgetEntry."Item No." := Rec."Item No";
                GLBudgetEntry.Validate(GLBudgetEntry."Item No.");
                GL.Reset();
                GL.Get(Rec."Item No");
                /*
                      Forced to comment out by TChibo
                //    GLBudgetEntry."Item G/L Sales Account":=GL."Item G/L Sales Account";
                //    GLBudgetEntry."Item G/L Cost Account":=GLBudgetEntry."Item G/L Cost Account";
                */
                GLBudgetEntry."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Global Dimension 1 Code");

                GLBudgetEntry."Global Dimension 2 Code" := Rec."Global Dimension 2 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Global Dimension 2 Code");

                GLBudgetEntry."Budget Dimension 1 Code" := Rec."Budget Dimension 1 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 1 Code");

                GLBudgetEntry."Budget Dimension 2 Code" := Rec."Budget Dimension 2 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 2 Code");

                GLBudgetEntry."Budget Dimension 3 Code" := Rec."Budget Dimension 3 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 3 Code");

                GLBudgetEntry.Date := NewDate;


                if Rec."Show As" = Rec."Show As"::"Sales Amount" then
                    GLBudgetEntry."Sales Amount" := Amnt
                else
                    if Rec."Show As" = Rec."Show As"::Quantity then
                        GLBudgetEntry.Quantity := Amnt
                    else
                        if Rec."Show As" = Rec."Show As"::COGS then
                            GLBudgetEntry."Cost Amount" := Amnt;

                GLBudgetEntry."User ID" := UserId;

                GLBudgetEntry.Insert();

                NewDate := CalcDate('1' + Period, NewDate);
                EntryNo := EntryNo + 1;
            end;
            Rec.Processed := true;
            Rec."User ID" := UserId;
            Rec.Modify();
            Message('Budgetary Allocation Complete');

        end;
        Rec.Delete();

    end;


    procedure AutoAllocateGL(var Rec: Record "Temp Budget Alloc G/L")
    var
        Budget: Record "G/L Budget Name";
        DimVal: Record "Dimension Value";
        GLBudgetEntry: Record "G/L Budget Entry";
        IntC: Integer;
        NewDate: Date;
        Period: Text[30];
        Amnt: Decimal;
        EntryNo: Integer;
        GL: Record "G/L Account";
    begin
        begin

            //check if the date inserted as the start date is greater than the end date
            if (Rec."Start Date" > Rec."End Date") then
                Error('Ending Date must BE greater than or equal to start date');

            if Rec."Type of Entry" = Rec."Type of Entry"::" " then
                Error('Type Of Entry must not be blank in Line no.' + Format(Rec."Line No."));
            /*Get the new date selected by the user first*/
            NewDate := Rec."Start Date";
            /*Get the period*/
            if Rec."Period Type" = Rec."Period Type"::Daily then
                Period := 'D'
            else
                if Rec."Period Type" = Rec."Period Type"::Weekly then
                    Period := 'W'
                else
                    if Rec."Period Type" = Rec."Period Type"::Monthly then
                        Period := 'M'
                    else
                        if Rec."Period Type" = Rec."Period Type"::Quarterly then
                            Period := 'Q'
                        else
                            Period := 'Y';
            /*Initiate the loop*/
            while NewDate <= Rec."End Date"
              do begin
                IntC := IntC + 1;
                NewDate := CalcDate('1' + Period, NewDate);
            end;
            /*Number of times to divide amount has been identified*/
            /*Get the amount and get the amount per period identified*/

            Amnt := Rec.Amount / IntC;

            /*Get the entry number*/
            GLBudgetEntry.Reset();
            if GLBudgetEntry.Find('+') then
                EntryNo := GLBudgetEntry."Entry No."
            else
                EntryNo := 0;
            EntryNo := EntryNo + 1;
            /*Check if the user wishes to overwrite the details already in the system*/
            if Rec.Overwrite = true then begin
                GLBudgetEntry.Reset();
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Name", Rec.Name);
                GLBudgetEntry.SetRange(GLBudgetEntry."G/L Account No.", Rec."G/L Account");
                GLBudgetEntry.SetRange(GLBudgetEntry."Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Global Dimension 2 Code", Rec."Global Dimension 2 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Business Unit Code", Rec."Business Unit");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 1 Code", Rec."Budget Dimension 1 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 2 Code", Rec."Budget Dimension 2 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 3 Code", Rec."Budget Dimension 3 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 4 Code", Rec."Budget Dimension 4 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 5 Code", Rec."Budget Dimension 5 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 6 Code", Rec."Budget Dimension 6 Code");
                if GLBudgetEntry.Find('-') then
                    GLBudgetEntry.DeleteAll();
            end;
            /*Reset the new date*/
            NewDate := Rec."Start Date";
            /*Initiate the loop to save the details into the table*/
            while NewDate <= Rec."End Date"
              do begin
                GLBudgetEntry.Init();
                GLBudgetEntry."Entry No." := EntryNo;

                GLBudgetEntry."Budget Name" := Rec.Name;
                GLBudgetEntry.Validate(GLBudgetEntry."Budget Name");

                GLBudgetEntry."G/L Account No." := Rec."G/L Account";
                GLBudgetEntry.Validate(GLBudgetEntry."G/L Account No.");

                GLBudgetEntry."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Global Dimension 1 Code");

                GLBudgetEntry."Global Dimension 2 Code" := Rec."Global Dimension 2 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Global Dimension 2 Code");

                GLBudgetEntry."Business Unit Code" := Rec."Business Unit";
                GLBudgetEntry.Validate(GLBudgetEntry."Business Unit Code");

                GLBudgetEntry."Budget Dimension 1 Code" := Rec."Budget Dimension 1 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 1 Code");

                GLBudgetEntry."Budget Dimension 2 Code" := Rec."Budget Dimension 2 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 2 Code");

                GLBudgetEntry."Budget Dimension 3 Code" := Rec."Budget Dimension 3 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 3 Code");

                GLBudgetEntry."Budget Dimension 4 Code" := Rec."Budget Dimension 4 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 4 Code");

                GLBudgetEntry."Budget Dimension 5 Code" := Rec."Budget Dimension 5 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 5 Code");

                GLBudgetEntry."Budget Dimension 6 Code" := Rec."Budget Dimension 6 Code";
                GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 6 Code");

                GLBudgetEntry.Date := NewDate;
                if Rec."Type of Entry" = Rec."Type of Entry"::Debit then
                    GLBudgetEntry.Amount := Amnt
                else
                    if Rec."Type of Entry" = Rec."Type of Entry"::Credit then
                        GLBudgetEntry.Amount := -Amnt;
                GLBudgetEntry."User ID" := UserId;

                GLBudgetEntry.Insert();

                //Added to Ensure that Respective Dimension is added to the Dimension buffer
                GLSetup.Get();
                GLBudgetName.Get(GLBudgetEntry."Budget Name");
                UpdateDim(GLSetup."Global Dimension 1 Code", Rec."Global Dimension 1 Code", GLBudgetEntry);
                UpdateDim(GLSetup."Global Dimension 2 Code", Rec."Global Dimension 2 Code", GLBudgetEntry);
                UpdateDim(GLBudgetName."Budget Dimension 1 Code", Rec."Budget Dimension 1 Code", GLBudgetEntry);
                UpdateDim(GLBudgetName."Budget Dimension 2 Code", Rec."Budget Dimension 2 Code", GLBudgetEntry);
                UpdateDim(GLBudgetName."Budget Dimension 3 Code", Rec."Budget Dimension 3 Code", GLBudgetEntry);
                UpdateDim(GLBudgetName."Budget Dimension 4 Code", Rec."Budget Dimension 4 Code", GLBudgetEntry);
                //End Added items

                NewDate := CalcDate('1' + Period, NewDate);
                EntryNo := EntryNo + 1;
            end;
            Rec.Processed := true;
            Rec."User ID" := UserId;
            Rec.Modify();

            Message('Budgetary Allocation Complete');

        end;
        Rec.Delete();

    end;


    procedure UpdateDim(DimCode: Code[20]; DimValueCode: Code[20]; Rec: Record "G/L Budget Entry")
    begin
        if DimCode = '' then
            exit;
        /*
        WITH GLBudgetDim DO BEGIN
          IF GET(Rec."Entry No.",DimCode) THEN
            DELETE;
          IF DimValueCode <> '' THEN BEGIN
            INIT;
            "Entry No." := Rec."Entry No.";
            "Dimension Code" := DimCode;
            "Dimension Value Code" := DimValueCode;
            INSERT;
          END;
        END;
        */

    end;


    procedure CreateBudgetFromWorkplan(WorkBugAlloc: Record "Workplan Budget Allocation")
    var
        GLBudgetEntry: Record "G/L Budget Entry";
        ItemBudgetEntry: Record "Item Budget Entry";
        WorkplanEntry: Record "Workplan Entry";
        EntryNo: Integer;
        Items: Record Item;
    begin

        begin

            //Get the entry number
            GLBudgetEntry.Reset();
            if GLBudgetEntry.Find('+') then
                EntryNo := GLBudgetEntry."Entry No."
            else
                EntryNo := 0;

            EntryNo := EntryNo + 1;

            //Check if the user wishes to overwrite the details already in the system}
            if WorkBugAlloc.Overwrite = true then begin
                GLBudgetEntry.Reset();
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Name", WorkBugAlloc."Current G/L Budget");
                //GLBudgetEntry.SETRANGE(GLBudgetEntry."G/L Account No.","G/L Account");
                GLBudgetEntry.SetRange(GLBudgetEntry."Global Dimension 1 Code", WorkBugAlloc."Global Dimension 1 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Global Dimension 2 Code", WorkBugAlloc."Global Dimension 2 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Business Unit Code", WorkBugAlloc."Business Unit");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 1 Code", WorkBugAlloc."Budget Dimension 1 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 2 Code", WorkBugAlloc."Budget Dimension 2 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 3 Code", WorkBugAlloc."Budget Dimension 3 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 4 Code", WorkBugAlloc."Budget Dimension 4 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 5 Code", WorkBugAlloc."Budget Dimension 5 Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Dimension 6 Code", WorkBugAlloc."Budget Dimension 6 Code");
                if GLBudgetEntry.Find('-') then
                    GLBudgetEntry.DeleteAll();
            end;
            //*************************************************************************************************************
            //FOR G/L ACCOUNT
            WorkplanEntry.Reset();
            WorkplanEntry.SetRange(WorkplanEntry."Workplan Code", WorkBugAlloc.Name);
            WorkplanEntry.SetRange(WorkplanEntry."Account Type", WorkplanEntry."Account Type"::"G/L Account");
            WorkplanEntry.SetRange(WorkplanEntry."Processed to Budget", false); //Added DW. not to Re-Transfer Amount already processed
            if (WorkBugAlloc."Start Date" <> 0D) and (WorkBugAlloc."End Date" <> 0D) then
                WorkplanEntry.SetRange(WorkplanEntry.Date, WorkBugAlloc."Start Date", WorkBugAlloc."End Date");
            if WorkplanEntry.Find('-') then
                repeat
                    GLBudgetEntry.Init();
                    GLBudgetEntry."Entry No." := EntryNo;

                    GLBudgetEntry."Budget Name" := WorkBugAlloc."Current G/L Budget";
                    GLBudgetEntry.Validate("Budget Name");

                    GLBudgetEntry."G/L Account No." := WorkplanEntry."G/L Account No.";
                    GLBudgetEntry.TestField("G/L Account No.");
                    GLBudgetEntry.Validate(GLBudgetEntry."G/L Account No.");

                    GLBudgetEntry."Global Dimension 1 Code" := WorkplanEntry."Budget Dimension 2 Code";
                    GLBudgetEntry.Validate(GLBudgetEntry."Global Dimension 1 Code");

                    GLBudgetEntry."Global Dimension 2 Code" := WorkplanEntry."Budget Dimension 3 Code";
                    GLBudgetEntry.Validate(GLBudgetEntry."Global Dimension 2 Code");

                    GLBudgetEntry."Business Unit Code" := WorkplanEntry."Business Unit Code";
                    GLBudgetEntry.Validate(GLBudgetEntry."Business Unit Code");

                    GLBudgetEntry."Budget Dimension 1 Code" := WorkplanEntry."Budget Dimension 1 Code";
                    GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 1 Code");

                    GLBudgetEntry."Budget Dimension 2 Code" := WorkplanEntry."Budget Dimension 2 Code";
                    GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 2 Code");

                    GLBudgetEntry."Budget Dimension 3 Code" := WorkplanEntry."Budget Dimension 3 Code";
                    GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 3 Code");

                    GLBudgetEntry."Budget Dimension 4 Code" := WorkplanEntry."Budget Dimension 4 Code";
                    GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 4 Code");

                    GLBudgetEntry."Budget Dimension 5 Code" := WorkplanEntry."Budget Dimension 5 Code";
                    GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 5 Code");

                    GLBudgetEntry."Budget Dimension 6 Code" := WorkplanEntry."Budget Dimension 6 Code";
                    GLBudgetEntry.Validate(GLBudgetEntry."Budget Dimension 6 Code");

                    //Get Description from Workplan Activities
                    WorkplanAct.Reset();
                    WorkplanAct.SetRange(WorkplanAct."Activity Code", WorkplanEntry."Activity Code");
                    if WorkplanAct.Find('-') then
                        GLBudgetEntry.Description := WorkplanAct."Activity Description"
                    else
                        GLBudgetEntry.Description := WorkplanEntry.Description;

                    GLBudgetEntry.Date := WorkplanEntry.Date;
                    GLBudgetEntry.WorkplanCode := WorkplanEntry."Activity Code";
                    GLBudgetEntry.Amount := WorkplanEntry.Amount;
                    GLBudgetEntry."User ID" := UserId;

                    GLBudgetEntry.Insert();
                    //Added DW: to mark entry as already processed
                    WorkplanEntry."Processed to Budget" := true;
                    WorkplanEntry.Validate(WorkplanEntry."Processed to Budget");

                    //Added to Ensure that Respective Dimension is added to the Dimension buffer
                    GLSetup.Get();
                    GLBudgetName.Get(GLBudgetEntry."Budget Name");
                    UpdateDim(GLSetup."Global Dimension 1 Code", WorkBugAlloc."Global Dimension 1 Code", GLBudgetEntry);
                    UpdateDim(GLSetup."Global Dimension 2 Code", WorkBugAlloc."Global Dimension 2 Code", GLBudgetEntry);
                    UpdateDim(GLBudgetName."Budget Dimension 1 Code", WorkBugAlloc."Budget Dimension 1 Code", GLBudgetEntry);
                    UpdateDim(GLBudgetName."Budget Dimension 2 Code", WorkBugAlloc."Budget Dimension 2 Code", GLBudgetEntry);
                    UpdateDim(GLBudgetName."Budget Dimension 3 Code", WorkBugAlloc."Budget Dimension 3 Code", GLBudgetEntry);
                    UpdateDim(GLBudgetName."Budget Dimension 4 Code", WorkBugAlloc."Budget Dimension 4 Code", GLBudgetEntry);
                    //End Added items

                    EntryNo += 1;
                until WorkplanEntry.Next() = 0;

            //ITEM BUDGETS
            //Get the entry number
            ItemBudgetEntry.Reset();
            if ItemBudgetEntry.Find('+') then
                EntryNo := ItemBudgetEntry."Entry No."
            else
                EntryNo := 0;
            EntryNo := EntryNo + 1;

            //Check if the user wishes to overwrite the details already in the system
            if WorkBugAlloc.Overwrite = true then begin
                ItemBudgetEntry.Reset();
                ItemBudgetEntry.SetRange(ItemBudgetEntry."Budget Name", WorkBugAlloc."Current Item Budget");
                ItemBudgetEntry.SetRange(ItemBudgetEntry."Global Dimension 1 Code", WorkBugAlloc."Global Dimension 1 Code");
                ItemBudgetEntry.SetRange(ItemBudgetEntry."Global Dimension 2 Code", WorkBugAlloc."Global Dimension 2 Code");
                ItemBudgetEntry.SetRange(ItemBudgetEntry."Budget Dimension 1 Code", WorkBugAlloc."Budget Dimension 1 Code");
                ItemBudgetEntry.SetRange(ItemBudgetEntry."Budget Dimension 2 Code", WorkBugAlloc."Budget Dimension 2 Code");
                ItemBudgetEntry.SetRange(ItemBudgetEntry."Budget Dimension 3 Code", WorkBugAlloc."Budget Dimension 3 Code");
                if ItemBudgetEntry.Find('-') then
                    ItemBudgetEntry.DeleteAll();
            end;

            //*******************************************************************************************************************
            //FOR ITEMS
            WorkplanEntry.Reset();
            WorkplanEntry.SetRange(WorkplanEntry."Workplan Code", WorkBugAlloc.Name);
            WorkplanEntry.SetRange(WorkplanEntry."Processed to Budget", false); //Added DW: Not to reprocess amounts already Processed
            WorkplanEntry.SetRange(WorkplanEntry."Account Type", WorkplanEntry."Account Type"::Item);
            if (WorkBugAlloc."Start Date" <> 0D) and (WorkBugAlloc."End Date" <> 0D) then
                WorkplanEntry.SetRange(WorkplanEntry.Date, WorkBugAlloc."Start Date", WorkBugAlloc."End Date");

            if WorkplanEntry.Find('-') then
                repeat

                    ItemBudgetEntry.Init();
                    ItemBudgetEntry."Entry No." := EntryNo;

                    ItemBudgetEntry."Analysis Area" := ItemBudgetEntry."Analysis Area"::Purchase;

                    ItemBudgetEntry."Budget Name" := WorkBugAlloc."Current Item Budget";
                    ItemBudgetEntry.Validate(ItemBudgetEntry."Budget Name");

                    ItemBudgetEntry."Item No." := WorkplanEntry."G/L Account No.";
                    ItemBudgetEntry.Validate(ItemBudgetEntry."Item No.");

                    Items.Reset();
                    Items.Get(ItemBudgetEntry."Item No.");

                    ItemBudgetEntry."Global Dimension 1 Code" := WorkplanEntry."Budget Dimension 2 Code";
                    ItemBudgetEntry.Validate(ItemBudgetEntry."Global Dimension 1 Code");

                    ItemBudgetEntry."Global Dimension 2 Code" := WorkplanEntry."Budget Dimension 3 Code";
                    ItemBudgetEntry.Validate(ItemBudgetEntry."Global Dimension 2 Code");

                    ItemBudgetEntry."Budget Dimension 1 Code" := WorkplanEntry."Budget Dimension 1 Code";
                    ItemBudgetEntry.Validate(ItemBudgetEntry."Budget Dimension 1 Code");

                    ItemBudgetEntry."Budget Dimension 2 Code" := WorkplanEntry."Budget Dimension 2 Code";
                    ItemBudgetEntry.Validate(ItemBudgetEntry."Budget Dimension 2 Code");

                    ItemBudgetEntry."Budget Dimension 3 Code" := WorkplanEntry."Budget Dimension 3 Code";
                    ItemBudgetEntry.Validate(ItemBudgetEntry."Budget Dimension 3 Code");

                    //Get Description from Workplan Activities
                    WorkplanAct.Reset();
                    WorkplanAct.SetRange(WorkplanAct."Activity Code", WorkplanEntry."Activity Code");
                    if WorkplanAct.Find('-') then
                        ItemBudgetEntry.Description := WorkplanAct."Activity Description"
                    else
                        ItemBudgetEntry.Description := WorkplanEntry.Description;

                    ItemBudgetEntry.Date := WorkplanEntry.Date;
                    ItemBudgetEntry.Quantity := WorkplanEntry.Quantity;
                    ItemBudgetEntry."Cost Amount" := WorkplanEntry.Amount;

                    ItemBudgetEntry."User ID" := UserId;

                    ItemBudgetEntry.Insert(true);

                    //Added DW: to mark entry as already processed
                    WorkplanEntry."Processed to Budget" := true;
                    WorkplanEntry.Validate(WorkplanEntry."Processed to Budget");

                    //Added to Ensure that Respective Dimension is added to the Dimension buffer
                    GLSetup.Get();
                    ItemBudgetName.Get(ItemBudgetName."Analysis Area" = ItemBudgetName."Analysis Area"::Purchase, ItemBudgetEntry."Budget Name");
                    UpdateItemDim(GLSetup."Global Dimension 1 Code", WorkBugAlloc."Global Dimension 1 Code", ItemBudgetEntry);
                    UpdateItemDim(GLSetup."Global Dimension 2 Code", WorkBugAlloc."Global Dimension 2 Code", ItemBudgetEntry);
                    UpdateItemDim(GLBudgetName."Budget Dimension 1 Code", WorkBugAlloc."Budget Dimension 1 Code", ItemBudgetEntry);
                    UpdateItemDim(GLBudgetName."Budget Dimension 2 Code", WorkBugAlloc."Budget Dimension 2 Code", ItemBudgetEntry);
                    UpdateItemDim(GLBudgetName."Budget Dimension 3 Code", WorkBugAlloc."Budget Dimension 3 Code", ItemBudgetEntry);
                    UpdateItemDim(GLBudgetName."Budget Dimension 4 Code", WorkBugAlloc."Budget Dimension 4 Code", ItemBudgetEntry);
                    //End Added items

                    EntryNo += 1;

                until WorkplanEntry.Next() = 0;

        end;
        Message('Budget Entries Created Successfully');
    end;


    procedure UpdateItemDim(DimCode: Code[20]; DimValueCode: Code[20]; Rec: Record "Item Budget Entry")
    var
        ItemBudgetDim: Record "Item Budget Dimension";
    begin
        if DimCode = '' then
            exit;
        begin
            if ItemBudgetDim.Get(Rec."Entry No.", DimCode) then
                ItemBudgetDim.Delete();
            if DimValueCode <> '' then begin
                ItemBudgetDim.Init();
                ItemBudgetDim."Entry No." := Rec."Entry No.";
                ItemBudgetDim."Dimension Code" := DimCode;
                ItemBudgetDim."Dimension Value Code" := DimValueCode;
                ItemBudgetDim.Insert();
            end;
        end;
    end;
}
