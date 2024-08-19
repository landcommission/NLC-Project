#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193865 "HR Company Activities"
{
    LookupPageId = "Payment Vouchers List";
    Caption = 'HR Company Activities';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            trigger OnValidate()
            begin
                if Code <> xRec.Code then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(HRSetup."Company Activities");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Description; Text[200])
        {
            Caption = 'Description';
        }
        field(3; Date; DateTime)
        {
            Caption = 'Date';
        }
        field(4; Venue; Text[200])
        {
            Caption = 'Venue';
        }
        field(5; "Employee Responsible"; Code[20])
        {
            TableRelation = "HR Employees"."No." where(Status = const(Active));
            Caption = 'Employee Responsible';
            trigger OnValidate()
            begin
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "Employee Responsible");
                if HREmp.Find('-') then begin
                    EmpName := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                    "Employee Name" := EmpName;
                end;
            end;
        }
        field(6; Costs; Decimal)
        {
            Caption = 'Costs';
        }
        field(7; "G/L Account No"; Code[20])
        {
            NotBlank = true;
            TableRelation = "G/L Account"."No.";
            Caption = 'G/L Account No';
            trigger OnValidate()
            begin
                GLAccts.Reset();
                GLAccts.SetRange(GLAccts."No.", "G/L Account No");
                if GLAccts.Find('-') then
                    "G/L Account Name" := GLAccts.Name;
            end;
        }
        field(8; "Bal. Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
            Caption = 'Bal. Account Type';

        }
        field(9; "Bal. Account No"; Code[20])
        {
            NotBlank = true;
            TableRelation = if ("Bal. Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Bal. Account Type" = const(Customer)) Customer
            else
            if ("Bal. Account Type" = const(Vendor)) Vendor
            else
            if ("Bal. Account Type" = const("Bank Account")) "Bank Account"
            else
            if ("Bal. Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Bal. Account Type" = const("IC Partner")) "IC Partner";
            Caption = 'Bal. Account No';
        }
        field(11; Posted; Boolean)
        {
            Editable = false;
            Caption = 'Posted';
        }
        field(16; "Email Message"; Text[250])
        {
            Caption = 'Email Message';
        }
        field(17; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
        }
        field(18; Closed; Boolean)
        {
            Editable = false;
            Caption = 'Closed';
        }
        field(19; "Contribution Amount (If Any)"; Decimal)
        {
            Caption = 'Contribution Amount (If Any)';
        }
        field(20; "Activity Status"; Option)
        {
            OptionCaption = 'Planning,On going,Complete';
            OptionMembers = Planning,"On going",Complete;
            Caption = 'Activity Status';
        }
        field(21; "G/L Account Name"; Text[50])
        {
            Caption = 'G/L Account Name';
        }
        field(22; "Employee Name"; Text[50])
        {
            Caption = 'Employee Name';
        }
        field(23; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center BR 2".Code;
            Caption = 'Responsibility Center';
        }
        field(24; Status; Option)
        {
            Editable = false;
            OptionMembers = New,"Pending Approval",Approved,Rejected;
            Caption = 'Status';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }

    }

    fieldgroups { }

    trigger OnInsert()
    begin

        if Code = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Company Activities");
            NoSeriesMgt.InitSeries(HRSetup."Company Activities", xRec."No. Series", 0D, Code, "No. Series");
        end;
    end;

    var
        GLAccts: Record "G/L Account";
        Banks: Record "Bank Account";
        Text000: Label 'You have canceled the create process.';
        Text001: Label 'Replace existing attachment?';
        Text002: Label 'You have canceled the import process.';
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HREmp: Record "HR Employees";
        EmpName: Text;
}

