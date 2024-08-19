#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193662 "Payroll Change"
{
    DrillDownPageId = "Payroll Change List Existing";
    LookupPageId = "Payroll Change List Existing";
    Caption = 'Payroll Change';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Payroll Change No"; Code[10])
        {
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
            begin

                if Type = Type::"Existing Staff" then begin
                    RequestLines.Reset();
                    RequestLines.SetRange(RequestLines."Payroll Change No", "Payroll Change No");
                    RequestLines.SetFilter(RequestLines."Transaction Code", '<>%1', 'BPAY');
                    if RequestLines.Find('-') then
                        repeat
                            PRSalary.Reset();
                            PRSalary.SetRange(PRSalary."Employee Code", RequestLines."Employee Code");
                            PRSalary.SetRange(PRSalary."Transaction Code", RequestLines."Transaction Code");
                            PRSalary.SetRange(PRSalary."Payroll Period", "Payroll Period");
                            if PRSalary.Find('-') then
                                PRSalary.Amount := RequestLines."New Value";
                            PRSalary.Modify();
                        until RequestLines.Next() = 0;

                    if Rec.Get(RequestLines."Payroll Change No") then
                        Rec."Payroll Updated" := true;
                    Rec.Modify()
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
                            PRSalary.Amount := RequestLines."New Value";
                            PRSalary."Period Month" := "Period Month";
                            PRSalary."Period Year" := "Period Year";
                            PRSalary.Insert()
                      until RequestLines.Next() = 0;
                    if Rec.Get(RequestLines."Payroll Change No") then
                        Rec."Payroll Updated" := true;
                    Rec.Modify()
                end;


                RequestLines.Reset();
                RequestLines.SetRange(RequestLines."Payroll Change No", "Payroll Change No");
                RequestLines.SetFilter(RequestLines."Transaction Code", '=%1', 'BPAY');
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
            OptionCaption = 'New Staff,Existing Staff';
            OptionMembers = "New Staff","Existing Staff";
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
    }

    keys
    {
        key(Key1; "Payroll Change No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin


        if "Payroll Change No" = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Payroll Change Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Payroll Change Nos.", xRec."No Series", 0D, "Payroll Change No", "No Series");
        end;

        "Date Requested" := Today;
        "User ID" := UserId;
        //"Created by":='Created by ' + UserId + ' on ' + FORMAT(CREATEDATETIME(TODAY,TIME));
    end;

    var
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HREmp: Record "HR Employees";
        PRSalary: Record "PR Employee Transactions";
        RequestLines: Record "Payroll Change Request Lines";
        PayrollRec: Record "PR Payroll Periods";
        PRBasic: Record "PR Salary Card";
}
