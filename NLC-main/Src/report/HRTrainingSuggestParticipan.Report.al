#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193455 "HR Training Suggest Participan"
{
    ProcessingOnly = true;
    ApplicationArea = All;
    Caption = 'HR Training Suggest Participan';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            DataItemTableView = where(Status = const(Active));
            RequestFilterFields = "No.", Gender, Age, "Global Dimension 1 Code", "Global Dimension 2 Code", "Responsibility Center";
            column(ReportForNavId_2; 2) { }

            trigger OnAfterGetRecord()
            begin
                HRTrainingAppLines.Reset();
                HRTrainingAppLines.SetRange(HRTrainingAppLines."Application No.", ApplicationNoFilter);
                if HRTrainingAppLines.Find('-') then begin
                    fn_InsertEntries();
                    Counter += 1;
                end else begin
                    fn_InsertEntries();
                    Counter += 1;
                end;
            end;
        }
        dataitem("HR Training App Lines"; "HR Training App Lines")
        {
            DataItemTableView = sorting("Line No.", "Application No.") order(ascending);
            column(ReportForNavId_1; 1) { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPostReport()
    begin
        Message('%1 Participants Suggested', Counter);
    end;

    trigger OnPreReport()
    begin
        //
        ApplicationNoFilter := "HR Training App Lines".GetFilter("Application No.");
        if ApplicationNoFilter = '' then
            Error(Text2000);

        //
        Counter := 0;
    end;

    var
        ApplicationNoFilter: Code[10];
        Text2000: Label 'Please enter training application no.';
        HRTrainingAppLines: Record "HR Training App Lines";
        Counter: Integer;

    local procedure fn_InsertEntries()
    begin
        HRTrainingAppLines.Init();

        HRTrainingAppLines."Line No." := fn_GetLastEntryNo();
        HRTrainingAppLines."Application No." := ApplicationNoFilter;
        HRTrainingAppLines."Employee No." := "HR Employees"."No.";
        HRTrainingAppLines.Validate(HRTrainingAppLines."Employee No.");
        HRTrainingAppLines.Suggested := true;

        HRTrainingAppLines.Insert();
    end;

    local procedure fn_GetLastEntryNo() LastEntryNo: Integer
    var
        HRTrainingAppLines_2: Record "HR Training App Lines";
    begin
        HRTrainingAppLines_2.Reset();
        if HRTrainingAppLines_2.FindLast() then
            LastEntryNo := HRTrainingAppLines_2."Line No." + 1
        else
            LastEntryNo := 1;
    end;
}
