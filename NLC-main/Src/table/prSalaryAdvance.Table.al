#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193571 "prSalary Advance"
{
    DataCaptionFields = "Requisition No.", "Employee Names";
    Caption = 'prSalary Advance';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Requisition No."; Code[20])
        {
            Caption = 'Requisition No.';
        }
        field(5; "Application Date"; Date)
        {
            Caption = 'Application Date';
        }
        field(10; "Loan Type"; Option)
        {
            OptionCaption = ' ,Salary Advance,Mortgage,Car Loan';
            OptionMembers = " ","Salary Advance",Mortgage,"Car Loan";
            Caption = 'Loan Type';

        }
        field(15; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
        }
        field(20; "Employee Names"; Text[100])
        {
            Caption = 'Employee Names';
        }
        field(25; "ID No."; Code[8])
        {
            Caption = 'ID No.';
        }
        field(30; Designation; Text[100])
        {
            Caption = 'Designation';
        }
        field(35; "Advance Amount Requested"; Decimal)
        {
            Caption = 'Advance Amount Requested';
        }
        field(40; "Reasons for Advance Amount"; Text[250])
        {
            Caption = 'Reasons for Advance Amount';
        }
        field(45; Status; Option)
        {
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
            Caption = 'Status';
        }
        field(50; Eligible; Boolean)
        {
            Caption = 'Eligible';
        }
        field(55; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(56; "Payroll Deduction Month"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'Payroll Deduction Month';
        }
    }

    keys
    {
        key(Key1; "Requisition No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin

        if "Requisition No." = '' then begin
            prSetup.Get();
            prSetup.TestField("Salary Advance Nos.");
            NoSeriesMgt.InitSeries(prSetup."Salary Advance Nos.", xRec."No. Series", 0D, "Requisition No.", "No. Series");
        end;



        //Get applicant details from Hr Employees
        HREmp.Reset();
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            "Employee No" := HREmp."No.";
            "Employee Names" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
            "ID No." := HREmp."ID Number";
            Designation := HREmp."Job Title";
            "Application Date" := Today;
        end else
            Error(Txt001);
    end;

    var
        HREmp: Record "HR Employees";
        Txt001: Label 'User must be Setup as an employee first. Consult the HR Officer so as to be setup as an employee';
        prSetup: Record "prPayroll Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;


    procedure AssistEdit(): Boolean
    begin

        prSetup.Get();
        prSetup.TestField("Salary Advance Nos.");
        if NoSeriesMgt.SelectSeries(prSetup."Salary Advance Nos.", xRec."No. Series", "No. Series") then begin
            NoSeriesMgt.SetSeries("Requisition No.");
            exit(true);
        end;
    end;
}
