#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193545 "prBasic pay PCA"
{
    Caption = 'prBasic pay PCA';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Code[50])
        {
            TableRelation = "PR Salary Arrears22"."Payroll Period";
            Caption = 'Employee Code';

        }
        field(2; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
        }
        field(3; "Basic Pay"; Decimal)
        {
            Caption = 'Basic Pay';
        }
        field(4; Comments; Text[200])
        {
            Caption = 'Comments';
        }
        field(5; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved;
            Caption = 'Status';
        }
        field(6; "Period Month"; Integer)
        {
            Caption = 'Period Month';
        }
        field(7; "Period Year"; Integer)
        {
            Caption = 'Period Year';
        }
        field(8; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened" where(Closed = const(false));
            Caption = 'Payroll Period';
        }
        field(9; "Change Advice Serial No."; Code[50])
        {
            Caption = 'Change Advice Serial No.';

        }
        field(10; "No. Series"; Code[10])
        {
            Editable = false;
            TableRelation = "No. Series";
            Caption = 'No. Series';
        }
        field(11; Effected; Boolean)
        {
            Caption = 'Effected';
        }
        field(20; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
        }
        field(21; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }
        field(22; "Pays NSSF"; Boolean)
        {
            Caption = 'Pays NSSF';
        }
        field(23; "Pays NHIF"; Boolean)
        {
            Caption = 'Pays NHIF';
        }
        field(24; "Pays PAYE"; Boolean)
        {
            Caption = 'Pays PAYE';
        }
        field(25; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            //TableRelation = Table39005929.Field1;
        }
        field(35; "Source Document"; Enum "PayChange Source Document")
        {
            Caption = 'Source Document';
        }
    }

    keys
    {
        key(Key1; "Change Advice Serial No.", "Payroll Period")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if "Change Advice Serial No." = '' then
            HrSetup.Get();
        // HrSetup.TESTFIELD("Pay-change No.");
        //NoSeriesMgt.InitSeries(HrSetup."Pay-change No.",xRec."No. Series",0D,"Change Advice Serial No.","No. Series");
        "User ID" := UserId;
    end;

    var
        HrSetup: Record "Company Vehicles";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        objEmp: Record "PR Salary Arrears22";
        objSalCard: Record "PR Salary Card";
        empTrans: Record "PR Employee Transactions";
        empTransPCA: Record "prEmployee Trans PCA";
        objPayrollPeriod: Record "PR Payroll Periods";
}
