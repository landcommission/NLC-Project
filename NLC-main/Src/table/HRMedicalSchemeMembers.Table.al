#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193504 "HR Medical Scheme Members"
{
    DrillDownPageId = "AssetPurchase Requisition Lin";
    LookupPageId = "AssetPurchase Requisition Lin";
    Caption = 'HR Medical Scheme Members';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Scheme No"; Code[10])
        {
            TableRelation = "HR Medical Schemes"."Scheme No";
            Caption = 'Scheme No';
            trigger OnValidate()
            begin

                Medscheme.Reset();
                Medscheme.SetRange(Medscheme."Scheme No", "Scheme No");
                if Medscheme.Find('-') then begin
                    "Out-Patient Limit" := Medscheme."Out-patient limit";
                    "In-patient Limit" := Medscheme."In-patient limit";
                    "Balance In- Patient" := "In-patient Limit" - "Cumm.Amount Spent";
                    "Balance Out- Patient" := "Out-Patient Limit" - "Cumm.Amount Spent Out";
                end;
            end;
        }
        field(2; "Employee No"; Code[30])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No';
            trigger OnValidate()
            begin
                Emp.Reset();
                Emp.SetRange(Emp."No.", "Employee No");
                if Emp.Find('-') then begin
                    "First Name" := Emp."First Name" + ' ' + Emp."Middle Name";
                    "Last Name" := Emp."Last Name";
                    Designation := Emp."Job Title";
                    Department := Emp."Department Name";
                    "Scheme Join Date" := Emp."Medical Scheme Join Date";

                    //"In-patient Limit":=Medscheme."In-patient limit";
                end;
            end;
        }
        field(3; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(4; "Last Name"; Text[30])
        {
            Caption = 'Last Name';
        }
        field(5; Designation; Text[50])
        {
            Caption = 'Designation';
        }
        field(6; Department; Text[100])
        {
            Caption = 'Department';
        }
        field(7; "Scheme Join Date"; Date)
        {
            Caption = 'Scheme Join Date';
        }
        field(8; "Scheme Anniversary"; Date)
        {
            Caption = 'Scheme Anniversary';
        }
        field(9; "Cumm.Amount Spent"; Decimal)
        {
            CalcFormula = sum("HR Medical Claims"."Amount Charged" where("Member No" = field("Employee No"),
                                                                          "Claim Type" = const(Inpatient)));
            FieldClass = FlowField;
            Caption = 'Cumm.Amount Spent';
            Editable = false;
        }
        field(10; "Out-Patient Limit"; Decimal)
        {
            Caption = 'Out-Patient Limit';
        }
        field(11; "In-patient Limit"; Decimal)
        {
            Caption = 'In-patient Limit';
        }
        field(12; "Maximum Cover"; Decimal)
        {
            Caption = 'Maximum Cover';
        }
        field(13; "Cumm.Amount Spent Out"; Decimal)
        {
            CalcFormula = sum("HR Medical Claims"."Amount Charged" where("Member No" = field("Employee No"),
                                                                          "Claim Type" = const(Outpatient)));
            FieldClass = FlowField;
            Caption = 'Cumm.Amount Spent Out';
            Editable = false;
        }
        field(14; "Balance Out- Patient"; Decimal)
        {
            Caption = 'Balance Out- Patient';
        }
        field(15; "Balance In- Patient"; Decimal)
        {
            Caption = 'Balance In- Patient';
        }
    }

    keys
    {
        key(Key1; "Scheme No", "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Medscheme: Record "HR Medical Schemes";
        Emp: Record "HR Employees";
}
