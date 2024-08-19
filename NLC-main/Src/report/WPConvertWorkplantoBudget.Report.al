#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193714 "W/P Convert Workplan to Budget"
{
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'W/P Convert Workplan to Budget';
    dataset
    {
        dataitem("Workplan Activities"; "Workplan Activities")
        {
            RequestFilterFields = "Workplan Code", "Activity Code";
            column(ReportForNavId_1000000000; 1000000000) { }

            trigger OnAfterGetRecord()
            begin
                //Dann
                if Direction = Direction::"Upload Workplan Budget Entries" then begin
                    "Workplan Activities".TestField("Workplan Activities"."No.");
                    "Workplan Activities".TestField("Workplan Activities"."Workplan Code");
                    "Workplan Activities".TestField("Workplan Activities"."Amount to Transfer");
                    "Workplan Activities".TestField("Workplan Activities"."Account Type", "Workplan Activities"."Account Type"::Posting);
                    "Workplan Activities".TestField("Workplan Activities"."Date to Transfer");
                    "Workplan Activities".TestField("Workplan Activities".Type);

                    WorkplanEntry.Reset();
                    WorkplanEntry.SetRange(WorkplanEntry."Activity Code", "Workplan Activities"."Activity Code");
                    if WorkplanEntry.Find('-') then begin
                        //Update

                        InsertWorkplanEntries();

                        CounterVar += 1;

                        "Workplan Activities"."Uploaded to Procurement Workpl" := true;

                        "Workplan Activities".Modify();

                        WorkplanEntry.Insert();
                    end else begin
                        //Insert
                        WorkplanEntry.Init();

                        InsertWorkplanEntries();

                        CounterVar += 1;

                        "Workplan Activities"."Uploaded to Procurement Workpl" := true;

                        "Workplan Activities".Modify();

                        WorkplanEntry.Insert();
                    end;

                end else begin
                    //If Direction is Reversal
                    WorkplanEntry.SetRange(WorkplanEntry."Activity Code", "Workplan Activities"."Activity Code");
                    WorkplanEntry.SetRange(WorkplanEntry."Workplan Code", "Workplan Activities"."Workplan Code");
                    WorkplanEntry.SetRange(WorkplanEntry.Date, "Workplan Activities"."Date to Transfer");
                    WorkplanEntry.SetRange(WorkplanEntry."Account Type", "Workplan Activities".Type);
                    WorkplanEntry.SetRange(WorkplanEntry."G/L Account No.", "Workplan Activities"."No.");
                    WorkplanEntry.SetRange(WorkplanEntry."Expense Code", "Workplan Activities"."Expense Code");
                    WorkplanEntry.SetRange(WorkplanEntry.Amount, "Workplan Activities"."Amount to Transfer");
                    WorkplanEntry.SetRange(WorkplanEntry."Processed to Budget", false);
                    if WorkplanEntry.Find('-') then begin
                        WorkplanEntry.Init();

                        ReversalWorkplanEntries();

                        CounterVar += 1;

                        WorkplanEntry.Insert();

                        "Workplan Activities"."Uploaded to Procurement Workpl" := false;

                        "Workplan Activities".Modify();
                    end;
                end;
            end;

            trigger OnPreDataItem()
            begin
                //SETRANGE("Workplan Code",WorkplanFilter);
                "Workplan Activities".SetRange("Workplan Activities"."Account Type", "Workplan Activities"."Account Type"::Posting);
                "Workplan Activities".SetRange("Workplan Activities"."Converted to Budget", false);

                if Direction = Direction::"Upload Workplan Budget Entries" then
                    "Workplan Activities".SetRange("Workplan Activities"."Uploaded to Procurement Workpl", false)
                else
                    "Workplan Activities".SetRange("Workplan Activities"."Uploaded to Procurement Workpl", true);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                field(Direction; Direction)
                {
                    ApplicationArea = Basic;
                    Caption = 'Direction';
                    ToolTip = 'Specifies the value of the Direction field.';
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPostReport()
    begin
        if Direction = Direction::"Upload Workplan Budget Entries" then
            Message(Text0001, CounterVar)
        else
            Message(Text0002, CounterVar);
    end;

    trigger OnPreReport()
    begin
        /*
        //Required Filters
        WorkplanFilter:="Workplan Activities".GETFILTER("Workplan Code");
        IF WorkplanFilter = '' THEN ERROR('Workplan code must be filled in on request page');
        */
        //Default Direction to Uploading
        if Direction = Direction::" " then
            Direction := Direction::"Upload Workplan Budget Entries";

        CounterVar := 0;

    end;

    var
        WorkplanFilter: Text;
        WorkplanEntry: Record "Workplan Entry";
        CounterVar: Integer;
        Direction: Option " ","Upload Workplan Budget Entries","Reverse Workplan Budget Entries";
        Text0001: Label 'Process Complete [%1] entries have been transfered to Procurement Workplan Budget Entries';
        Text0002: Label 'Process Complete [%1] entries have been reversed from Procurement Workplan Budget Entries';

    local procedure GetNextEntryNo(): Integer
    var
        WorkplanEntry: Record "Workplan Entry";
        EntryNum: Integer;
    begin
        WorkplanEntry.SetCurrentKey("Entry No.");
        if WorkplanEntry.Find('+') then
            exit(WorkplanEntry."Entry No." + 1)
        else
            exit(1);
    end;


    procedure InsertWorkplanEntries()
    begin

        WorkplanEntry."Entry No." := GetNextEntryNo();
        WorkplanEntry."Workplan Code" := "Workplan Activities"."Workplan Code";
        WorkplanEntry."Activity Code" := "Workplan Activities"."Activity Code";
        WorkplanEntry.Date := "Workplan Activities"."Date to Transfer";
        WorkplanEntry."Global Dimension 1 Code" := "Workplan Activities"."Global Dimension 1 Code";
        WorkplanEntry.Amount := "Workplan Activities"."Amount to Transfer";
        WorkplanEntry.Description := "Workplan Activities"."Activity Description";
        WorkplanEntry."User ID" := UserId;
        WorkplanEntry."Account Type" := "Workplan Activities".Type;
        WorkplanEntry."G/L Account No." := "Workplan Activities"."No.";
        WorkplanEntry."Expense Code" := "Workplan Activities"."Expense Code";
        WorkplanEntry."Created By:" := UserId;
        WorkplanEntry."Last Modified By:" := CreateDateTime(Today, Time);
        WorkplanEntry.Validate(WorkplanEntry."G/L Account No.");
        WorkplanEntry.Validate(WorkplanEntry."Expense Code");
        WorkplanEntry.Validate(WorkplanEntry."Global Dimension 1 Code");
        WorkplanEntry.Validate(WorkplanEntry."Activity Code");
        WorkplanEntry.Validate(WorkplanEntry."Workplan Code");
        WorkplanEntry.Validate(WorkplanEntry."Account Type");
    end;


    procedure ReversalWorkplanEntries()
    begin

        WorkplanEntry."Entry No." := GetNextEntryNo();
        WorkplanEntry."Workplan Code" := "Workplan Activities"."Workplan Code";
        WorkplanEntry."Activity Code" := "Workplan Activities"."Activity Code";
        WorkplanEntry.Date := "Workplan Activities"."Date to Transfer";
        WorkplanEntry."Global Dimension 1 Code" := "Workplan Activities"."Global Dimension 1 Code";
        WorkplanEntry.Amount := -("Workplan Activities"."Amount to Transfer"); //For Reversal Insert - ve
        WorkplanEntry.Description := "Workplan Activities"."Activity Description";
        WorkplanEntry."User ID" := UserId;
        WorkplanEntry."Account Type" := "Workplan Activities".Type;
        WorkplanEntry."G/L Account No." := "Workplan Activities"."No.";
        WorkplanEntry."Expense Code" := "Workplan Activities"."Expense Code";
        WorkplanEntry."Created By:" := UserId;
        WorkplanEntry."Last Modified By:" := CreateDateTime(Today, Time);
        WorkplanEntry."Entry Type" := WorkplanEntry."Entry Type"::Reversal;
        WorkplanEntry.Validate(WorkplanEntry."G/L Account No.");
        WorkplanEntry.Validate(WorkplanEntry."Expense Code");
        WorkplanEntry.Validate(WorkplanEntry."Global Dimension 1 Code");
        WorkplanEntry.Validate(WorkplanEntry."Activity Code");
        WorkplanEntry.Validate(WorkplanEntry."Workplan Code");
        WorkplanEntry.Validate(WorkplanEntry."Account Type");
    end;
}
