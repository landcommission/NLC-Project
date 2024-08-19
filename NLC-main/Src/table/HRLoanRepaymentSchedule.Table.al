#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193882 "HR Loan Repayment Schedule"
{
    Caption = 'HR Loan Repayment Schedule';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Loan No."; Code[20])
        {
            Caption = 'Loan No.';
        }
        field(2; "Staff No."; Code[20])
        {
            Caption = 'Staff No.';
        }
        field(3; "Loan Category"; Code[20])
        {
            Caption = 'Loan Category';
        }
        field(8; "Closed Date"; Date)
        {
            Caption = 'Closed Date';
        }
        field(9; "Loan Amount"; Decimal)
        {
            Caption = 'Loan Amount';
        }
        field(14; "Interest Rate"; Decimal)
        {
            Caption = 'Interest Rate';
        }
        field(15; "Monthly Repayment"; Decimal)
        {
            Caption = 'Monthly Repayment';
        }
        field(17; "Member Name"; Text[30])
        {
            Caption = 'Member Name';
        }
        field(21; "Monthly Interest"; Decimal)
        {
            Caption = 'Monthly Interest';
        }
        field(25; "Amount Repayed"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Amount Repayed';
        }
        field(26; "Repayment Date"; Date)
        {
            Caption = 'Repayment Date';
        }
        field(27; "Principal Repayment"; Decimal)
        {
            Caption = 'Principal Repayment';
        }
        field(28; Paid; Boolean)
        {
            Caption = 'Paid';
        }
        field(29; "Remaining Debt"; Decimal)
        {
            Editable = false;
            Caption = 'Remaining Debt';
        }
        field(30; "Instalment No"; Integer)
        {
            Caption = 'Instalment No';
        }
        field(45; "Actual Loan Repayment Date"; Date)
        {
            Caption = 'Actual Loan Repayment Date';
        }
        field(46; "Repayment Code"; Code[20])
        {
            Caption = 'Repayment Code';
        }
        field(47; "Group Code"; Code[20])
        {
            Caption = 'Group Code';
        }
        field(48; "Loan Application No"; Code[20])
        {
            Caption = 'Loan Application No';
        }
        field(49; "Actual Principal Paid"; Decimal)
        {
            Caption = 'Actual Principal Paid';
        }
        field(50; "Actual Interest Paid"; Decimal)
        {
            Caption = 'Actual Interest Paid';
        }
        field(51; "Actual Installment Paid"; Decimal)
        {
            Caption = 'Actual Installment Paid';
        }
    }

    keys
    {
        key(Key1; "Loan No.", "Staff No.", "Repayment Date")
        {
            Clustered = true;
            SumIndexFields = "Monthly Interest", "Principal Repayment", "Monthly Repayment";
        }
        key(Key2; "Staff No.") { }
        key(Key3; Paid) { }
        key(Key4; "Loan No.", "Staff No.", Paid) { }
        key(Key5; "Loan Category") { }
        key(Key6; "Loan No.", "Staff No.", Paid, "Loan Category") { }
    }

    fieldgroups { }

    var
        //NoSeriesMngnt: Codeunit NoSeriesManagement;
        SACCOMember: Record "HR Employees";
        LoanCategory: Record "HR Staff Loan Types";
}
