#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193603 "Payroll Changes"
{
    DrillDownPageId = "Payroll Change Lists Existing";
    LookupPageId = "Payroll Change Lists Existing";
    Caption = 'Payroll Changes';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Payroll Change No"; Code[10])
        {
            Editable = false;
            Caption = 'Payroll Change No';
        }
        field(2; "Employee No"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No';
            trigger OnValidate()
            begin
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "Employee No");
                if HREmp.Find('-') then begin
                    "Employee Name" := HREmp."Full Name";
                    Department := HREmp."Global Dimension 1 Code";
                    Region := HREmp."Global Dimension 2 Code";
                end
            end;
        }
        field(3; "Employee Name"; Text[100])
        {
            Editable = false;
            Caption = 'Employee Name';
        }
        field(4; Department; Code[20])
        {
            Editable = false;
            TableRelation = "HR Employees"."Global Dimension 2 Code";
            Caption = 'Department';
        }
        field(5; Region; Code[20])
        {
            Editable = false;
            TableRelation = "HR Employees"."Global Dimension 1 Code";
            Caption = 'Region';
        }
        field(6; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center BR NEW".Code;
            Caption = 'Responsibility Center';
        }
        field(7; Status; Option)
        {
            Editable = true;
            OptionMembers = New,"Pending Approval",Approved;
            Caption = 'Status';
            trigger OnValidate()
            var
                Prperiod: Record "PR Payroll Periods";
            begin
                ///*{
                if rec.Status = rec.Status::Approved then begin
                    Prperiod.Reset();
                    Prperiod.SetRange("Date Opened", rec."Payroll Period");
                    Prperiod.SetRange(Closed, false);
                    if not Prperiod.FindFirst() then
                        Error('Payroll period must be open');
                    if Type = Type::"Existing Staff" then begin
                        RequestLines.Reset();
                        RequestLines.SetRange(RequestLines."Payroll Change No", "Payroll Change No");
                        if RequestLines.Find('-') then
                            repeat
                                PRSalary.Reset();
                                PRSalary.SetRange(PRSalary."Employee Code", RequestLines."Employee Code");
                                PRSalary.SetRange(PRSalary."Transaction Code", RequestLines."Existing Transaction Code");
                                PRSalary.SetRange(PRSalary."Payroll Period", "Payroll Period");
                                if PRSalary.Find('-') then
                                    if RequestLines."New Value" <> 0 then
                                        PRSalary.Amount := RequestLines."New Value";
                                if RequestLines."New Balance" <> 0 then
                                    PRSalary.Balance := RequestLines."New Balance";
                                if RequestLines."New Original Amount" <> 0 then
                                    PRSalary."Original Amount" := RequestLines."New Original Amount";
                                if RequestLines."New Stop for Next Period" <> false then
                                    PRSalary."Stop for Next Period" := RequestLines."New Stop for Next Period";
                                if RequestLines."New Stopped" <> false then
                                    PRSalary.Stopped := RequestLines."New Stopped";
                                PRSalary.Modify();
                            until RequestLines.Next() = 0;

                        if Rec.Get(RequestLines."Payroll Change No") then
                            Rec."Payroll Updated" := true;
                        //Rec.Modify()
                    end;

                    if Type = Type::"New Staff" then begin
                        RequestLines.Reset();
                        RequestLines.SetRange(RequestLines."Payroll Change No", "Payroll Change No");
                        RequestLines.SetFilter(RequestLines."Transaction Code", '<>%1', 'BPAY');
                        if RequestLines.Find('-') then
                            repeat
                                PRSalary.Reset();
                                PRSalary.SetRange(PRSalary."Employee Code", RequestLines."Employee Code");
                                if PRSalary.Find('-') then
                                    PRSalary."Employee Code" := RequestLines."Employee Code";
                                PRSalary."Payroll Period" := "Payroll Period";
                                PRSalary."Transaction Code" := RequestLines."Transaction Code";
                                PRSalary."Transaction Name" := RequestLines."Transaction Name";
                                PRSalary."Period Month" := "Period Month";
                                PRSalary."Period Year" := "Period Year";

                                if RequestLines."New Value" <> 0 then
                                    PRSalary.Amount := RequestLines."New Value";
                                if RequestLines."New Balance" <> 0 then
                                    PRSalary.Balance := RequestLines."New Balance";
                                if RequestLines."New Original Amount" <> 0 then
                                    PRSalary."Original Amount" := RequestLines."New Original Amount";
                                if RequestLines."New Stop for Next Period" <> false then
                                    PRSalary."Stop for Next Period" := RequestLines."New Stop for Next Period";
                                if RequestLines."New Stopped" <> false then
                                    PRSalary.Stopped := RequestLines."New Stopped";
                                PRSalary.Insert()
                          until RequestLines.Next() = 0;
                        if Rec.Get(RequestLines."Payroll Change No") then
                            Rec."Payroll Updated" := true;
                        // Rec.Modify()
                    end;

                    if Type = Type::"New Staff" then begin
                        RequestLines.Reset();
                        RequestLines.SetRange(RequestLines."Payroll Change No", "Payroll Change No");
                        RequestLines.SetFilter(RequestLines."Transaction Code", '=%1', 'BPAY');
                        RequestLines.SetFilter(RequestLines."Old Value", '>0');
                        RequestLines.SetFilter(RequestLines."New Value", '<>0');
                        if RequestLines.Find('-') then begin
                            repeat
                                PRBasic.Reset();
                                PRBasic.SetRange(PRBasic."Employee Code", RequestLines."Employee Code");
                                if PRBasic.Find('-') then
                                    PRBasic."Basic Pay" := RequestLines."New Value";
                                PRBasic.Modify();
                            until RequestLines.Next() = 0;
                            if Rec.Get(RequestLines."Payroll Change No") then
                                Rec."Payroll Updated" := true;
                            Rec.Modify()
                        end;
                    end;

                    if Type = Type::"Staff Status" then begin
                        RequestLines.Reset();
                        RequestLines.SetRange(RequestLines."Payroll Change No", "Payroll Change No");
                        if RequestLines.Find('-') then
                            repeat
                                HREmp.Reset();
                                HREmp.SetRange(HREmp."No.", RequestLines."Employee Code");
                                if HREmp.Find('-') then
                                    repeat
                                        HREmp.Status := RequestLines."New Status";
                                        HREmp."Date Of Leaving" := RequestLines."Date Of Leaving";
                                        HREmp."Termination Grounds" := RequestLines.Reason;
                                        HREmp.Modify();
                                        HREmp.Validate(HREmp.Status);
                                    until HREmp.Next() = 0;
                            until RequestLines.Next() = 0;
                        if Rec.Get(RequestLines."Payroll Change No") then
                            Rec."Payroll Updated" := true;
                        //Rec.Modify();
                    end;
                    Message('Payroll Changes Updated');
                end;
            end;
        }
        field(8; "No Series"; Code[10])
        {
            Caption = 'No Series';
        }
        field(9; "Date Requested"; Date)
        {
            Caption = 'Date Requested';
        }
        field(10; "User ID"; Code[100])
        {
            Editable = false;
            Caption = 'User ID';
        }
        field(11; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened" where(Closed = const(false));
            Caption = 'Payroll Period';
            trigger OnValidate()
            begin
                PayrollRec.Reset();
                PayrollRec.SetRange(PayrollRec."Date Opened", "Payroll Period");
                if PayrollRec.Find('-') then begin
                    "Period Month" := PayrollRec."Period Month";
                    "Period Year" := PayrollRec."Period Year";
                end;
            end;
        }
        field(12; Type; Option)
        {
            Editable = false;
            OptionCaption = 'New Staff,Existing Staff,Staff Status';
            OptionMembers = "New Staff","Existing Staff","Staff Status";
            Caption = 'Type';
        }
        field(13; "Payroll Updated"; Boolean)
        {
            Editable = false;
            Caption = 'Payroll Updated';
        }
        field(14; "Period Month"; Integer)
        {
            Caption = 'Period Month';
        }
        field(15; "Period Year"; Integer)
        {
            Caption = 'Period Year';
        }
        field(16; Narration; Text[150])
        {
            Caption = 'Narration';
        }
        field(17; Narrations; Text[150])
        {
            Caption = 'Narrations';
        }
    }

    keys
    {
        key(Key1; "Payroll Change No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin

        //IF Status<>Status::New THEN
        Error('You are not allowed to delete at this level');
    end;

    trigger OnInsert()
    begin


        if "Payroll Change No" = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Payroll Change Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Payroll Change Nos.", xRec."No Series", 0D, "Payroll Change No", "No Series");
        end;

        "Date Requested" := Today;
        "User ID" := UserId;
        "Responsibility Center" := 'HRM';

        //"Created by":='Created by ' + UserId + ' on ' + FORMAT(CREATEDATETIME(TODAY,TIME));

        Narration := 'This is for modifying the already Existing Employee Earnings and Deductions in the System';
        Narrations := 'This is for Inserting New Employee Earnings and Deductions in the System'
    end;

    var
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HREmp: Record "HR Employees";
        PRSalary: Record "PR Employee Transactions";
        RequestLines: Record "Payroll Change Request Line";
        PayrollRec: Record "PR Payroll Periods";
        PRBasic: Record "PR Salary Card";
}
