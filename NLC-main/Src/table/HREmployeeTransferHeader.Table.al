#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193492 "HR Employee Transfer Header"
{
    Caption = 'HR Employee Transfer Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Request No"; Code[50])
        {
            Caption = 'Request No';
            trigger OnValidate()
            begin
                if "Request No" <> xRec."Request No" then begin
                    hrsetup.Get();
                    NoSeriesMgt.TestManual(hrsetup."Employee Transfer Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Date Requested"; Date)
        {
            Caption = 'Date Requested';
        }
        field(3; "Date Approved"; Date)
        {
            Caption = 'Date Approved';
        }
        field(4; Status; Option)
        {
            Editable = false;
            OptionCaption = 'New,Pending Approval,Approved,Rejected,Cancelled';
            OptionMembers = New,"Pending Approval",Approved,Rejected,Cancelled;
            Caption = 'Status';
            trigger OnValidate()
            var
                HRRec: Record "HR Employees";
                TransferLines: Record "HR Employee Transfer Lines";
                TranferSingle: Record "Employee Transfers";
                DocNo: code[30];
            begin

                if Status = Status::Approved then begin
                    "Date Approved" := Today;
                    TransferLines.Reset();
                    TransferLines.SetRange("Request No", rec."Request No");
                    if TransferLines.FindFirst() then begin
                        repeat
                            TranferSingle.Reset();
                            TranferSingle.SetRange("Employee No", TransferLines."Employee No");
                            TranferSingle.SetRange(TranferSingle."Request Date", TransferLines."Date Of Transfer");
                            if not TranferSingle.FindFirst() then begin
                                TranferSingle.Init();
                                HRSetup.Get;
                                HRSetup.TestField("Employee Transfer Nos.");
                                HRSetup.TestField("Transfer Allowance");
                                // DocNo := NoSeriesMgt.GetNextNo(HRSetup."Employee Transfer Nos.", 0D, True);
                                TranferSingle."Employee No" := TransferLines."Employee No";
                                TranferSingle.Validate(TranferSingle."Employee No");
                                TranferSingle."Document No" := TransferLines."Request No";

                                TranferSingle.Status := TranferSingle.Status::Released;
                                TranferSingle."Request Date" := TransferLines."Date Of Transfer";
                                TranferSingle."Transfer Date" := TransferLines."Date Of Transfer";
                                TranferSingle."New Station" := TransferLines."New Global Dimension 1 Code";
                                TranferSingle."New Sattion Name" := TransferLines."New Region Name";
                                TranferSingle.Insert();
                            end;
                            HRRec.Reset();
                            HRRec.SetRange("No.", TransferLines."Employee No");
                            if HRRec.FindFirst() then begin
                                HRRec.Grade := TransferLines."Current Grade";
                                if TransferLines."New Designation" <> '' then begin
                                    HRRec."Job ID" := TransferLines."New Designation";
                                    HRRec.Validate("Job ID");
                                end;
                                // HRRec."Job Title" := TransferLines."New Job ID Name";
                                HRRec."Current Duty Station" := TransferLines."New Region Name";
                                HRRec.County := TransferLines."New Global Dimension 1 Code";
                                HRRec."County Name" := TransferLines."New Region Name";
                                //HRRec."Global Dimension 1 Code" := TransferLines."New Global Dimension 2 Code";
                                HRRec."Department Name" := TransferLines."New Department Name";
                                HRRec."Salary Grade" := TransferLines."New Grade";
                                HRRec."EMP Transfer Date" := TransferLines."Date Of Transfer";
                                HRRec."Last Date Modified" := Today;
                                PRSalary.Reset();
                                PRSalary.SetRange(PRSalary."Employee Code", TransferLines."Employee No");
                                PRSalary.SetRange(PRSalary."Transaction Code", TransferLines."Transaction Code");
                                PRSalary.SetRange(PRSalary."Payroll Period", TransferLines."From payroll Period");
                                if not PRSalary.Find('-') then begin
                                    PRSalary.Init();
                                    PRSalary."Employee Code" := TransferLines."Employee No";
                                    PRSalary."Payroll Period" := TransferLines."From payroll Period";
                                    PRSalary."Transaction Code" := TransferLines."Transaction Code";
                                    PRSalary."Transaction Name" := TransferLines."Transaction Name";
                                    PRSalary.Amount := TransferLines.Amount;
                                    PRSalary."Period Month" := TransferLines."Period Month";
                                    PRSalary."Period Year" := TransferLines."Period Year";
                                    PRSalary.Insert();
                                end else begin
                                    if PRSalary.Find('-') then begin
                                        PRSalary."Employee Code" := TransferLines."Employee No";
                                        PRSalary."Payroll Period" := TransferLines."From payroll Period";
                                        PRSalary."Transaction Code" := TransferLines."Transaction Code";
                                        PRSalary."Transaction Name" := TransferLines."Transaction Name";
                                        PRSalary.Amount := TransferLines.Amount;
                                        PRSalary."Period Month" := TransferLines."Period Month";
                                        PRSalary."Period Year" := TransferLines."Period Year";
                                        PRSalary.Modify();
                                    end;
                                end;
                                HRRec.Modify();
                            end;
                        until TransferLines.Next() = 0;
                    end;
                end;
            end;
        }
        field(5; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
        }
        field(6; "Responsibility Center"; Code[20])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center BR NEW".Code;
        }
        field(7; "Transfer details Updated"; Boolean)
        {
            Editable = false;
            Caption = 'Transfer details Updated';
        }
        field(8; Details; Text[250])
        {
            Caption = 'Details';
        }
        field(9; Reason; Option)
        {
            OptionCaption = '  ,Acting Position,On Transfer,Re-Deployment,On Promotion,Disciplinary,Medical';
            OptionMembers = "  ","Acting Position","On Transfer","Re-Deployment","On Promotion",Disciplinary,Medical;
            Caption = 'Reason';
        }
        field(10; "Captured By"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Request No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin

        if Status <> Status::New then
            Error('You are not allowed to delete at this level')
    end;

    trigger OnInsert()
    begin
        "Captured By" := UserId;
        "Date Requested" := Today;
        if "Request No" = '' then begin
            hrsetup.Get();
            hrsetup.TestField(hrsetup."Employee Transfer Nos.");
            NoSeriesMgt.InitSeries(hrsetup."Employee Transfer Nos.", xRec."No. Series", 0D, "Request No", "No. Series");

        end;
    end;

    trigger OnModify()
    var
        myInt: Integer;
    begin
        "Date Requested" := Today;
        "Captured By" := UserId;
    end;

    var
        hrsetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employees: Record "HR Employees";
        HRTransferLines: Record "HR Employee Transfer Lines";
        HREmployeeInfo: Record "HR Employees";
        PRSalary: Record "PR Employee Transactions";

    local procedure GetLastEntryNo() LastLineNum: Integer
    var
        HRBankInfo: Record "HR Employees Info Changes";
    begin
        HRBankInfo.Reset();
        if HRBankInfo.Find('+') then
            LastLineNum := HRBankInfo."Line No." + 1
        else
            LastLineNum := 1000;
    end;
}
