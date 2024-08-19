#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193883 "HR Overtime Header"
{
    DrillDownPageId = "Store Requisitions Lists";
    LookupPageId = "Store Requisitions Lists";
    Caption = 'HR Overtime Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Staff No."; Code[10])
        {
            Editable = false;
            Caption = 'Staff No.';
        }
        field(2; "Staff Name"; Text[50])
        {
            Editable = false;
            Caption = 'Staff Name';
        }
        field(3; "Convert To?"; Option)
        {
            OptionCaption = ' ,Convert to Pay,Convert to Leave';
            OptionMembers = " ","Convert to Pay","Convert to Leave";
            Caption = 'Convert To?';
        }
        field(4; "Posted to Payroll"; Boolean)
        {
            Editable = false;
            Caption = 'Posted to Payroll';
        }
        field(5; "Application Code"; Code[10])
        {
            Editable = false;
            Caption = 'Application Code';
        }
        field(6; Status; Option)
        {
            Editable = true;
            OptionMembers = New,"Pending Approval",Approved,Cancelled,Rejected;
            Caption = 'Status';
        }
        field(7; "No. series"; Code[10])
        {
            Caption = 'No. series';
        }
        field(8; "Weekend Hours 2"; Decimal)
        {
            Caption = 'Weekend Hours 2';
        }
        field(9; "Application Date"; Date)
        {
            Editable = false;
            Caption = 'Application Date';
        }
        field(10; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center BR 2";
            Caption = 'Responsibility Center';
        }
        field(11; "Global Dimension 1 Code"; Code[10])
        {
            CaptionClass = '1,1,1';
            Editable = false;
            Caption = 'Global Dimension 1 Code';
        }
        field(12; "Global Dimension 2 Code"; Code[10])
        {
            CaptionClass = '1,1,2';
            Editable = false;
            Caption = 'Global Dimension 2 Code';
        }
        field(13; "Weekend Hours"; Decimal)
        {
            CalcFormula = sum("HR Overtime Lines"."Overtime Hours" where("Application Code" = field("Application Code"),
                                                                          "Overtime Type" = filter(Weekend)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Weekend Hours';
        }
        field(14; "Total Overtime Hours"; Decimal)
        {
            CalcFormula = sum("HR Overtime Lines"."Overtime Hours" where("Application Code" = field("Application Code")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Total Overtime Hours';
        }
        field(15; Converted; Boolean)
        {
            Editable = false;
            Caption = 'Converted';
        }
        field(16; "Date Posted"; Date)
        {
            Caption = 'Date Posted';
        }
        field(17; "Time Posted"; Time)
        {
            Caption = 'Time Posted';
        }
        field(18; "Posted By"; Code[10])
        {
            Caption = 'Posted By';
        }
        field(19; "Holiday Hours"; Decimal)
        {
            CalcFormula = sum("HR Overtime Lines"."Overtime Hours" where("Application Code" = field("Application Code"),
                                                                          "Overtime Type" = const(Holiday)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Holiday Hours';
        }
        field(20; "Extra Hours"; Decimal)
        {
            CalcFormula = sum("HR Overtime Lines"."Overtime Hours" where("Application Code" = field("Application Code"),
                                                                          "Overtime Type" = const("Extra Hours")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Extra Hours';
        }
    }

    keys
    {
        key(Key1; "Application Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin

        if "Application Code" = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Overtime Req Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Overtime Req Nos.", xRec."No. series", 0D, "Application Code", "No. series");
        end;

        HREmp.Reset();
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            "Staff No." := HREmp."No.";
            "Application Date" := Today;
            "Staff Name" := HREmp."Full Name";
            "Responsibility Center" := HREmp."Responsibility Center";
            "Global Dimension 1 Code" := HREmp."Global Dimension 1 Code";
            "Global Dimension 2 Code" := HREmp."Global Dimension 2 Code";
        end else
            Error('User id' + ' ' + '[' + UserId + ']' + ' has not been assigned to any HREmp. Please consult the HR officer for assistance');
    end;

    var
        HREmp: Record "HR Employees";
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        OT: Record "HR Overtime Header";
        usersetup: Record "User Setup";
        HrLeavePeriods: Record "HR Leave Periods";
        LeaveGjline: Record "HR Leave Journal Line";
        "LineNo.": Integer;
        "Days Applied": Decimal;
        "Hours Earned": Decimal;
        "Amount Earned": Decimal;
        EmpTrans: Record "PR Employee Transactions";


    procedure "Convert Overtime"()
    begin
    end;


    procedure "Convert Payroll"()
    begin
    end;
}
