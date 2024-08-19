#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193633 "Cash Office Setup"
{
    Caption = 'Cash Office Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(50001; "Normal Payments No"; Code[10])
        {
            Caption = 'Receipts No';
            TableRelation = "No. Series";
        }
        field(50002; "Cheque Reject Period"; DateFormula)
        {
            Caption = 'Cheque Reject Period';
        }
        field(50003; "Petty Cash Payments No"; Code[10])
        {
            Caption = 'Petty Cash Payments No';
            TableRelation = "No. Series";
        }
        field(50004; "Current Budget"; Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
            Caption = 'Current Budget';
        }
        field(50005; "Current Budget Start Date"; Date)
        {
            Caption = 'Current Budget Start Date';
        }
        field(50006; "Current Budget End Date"; Date)
        {
            Caption = 'Current Budget End Date';
        }
        field(50009; "Surrender Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
            Caption = 'Surrender Template';
        }
        field(50010; "Surrender  Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Surrender Template"));
            Caption = 'Surrender  Batch';
        }
        field(50011; "Payroll Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
            Caption = 'Payroll Template';
        }
        field(50012; "Payroll  Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name;
            Caption = 'Payroll  Batch';
        }
        field(50013; "Payroll Control A/C"; Code[20])
        {
            TableRelation = "G/L Account";
            Caption = 'Payroll Control A/C';
        }
        field(50014; "PV Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
            Caption = 'PV Template';
        }
        field(50015; "PV  Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name;
            Caption = 'PV  Batch';
        }
        field(50016; "Contract No"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Contract No';
        }
        field(50017; "Receipts No"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Receipts No';
        }
        field(50018; "Petty Cash Voucher  Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
            Caption = 'Petty Cash Voucher  Template';
        }
        field(50019; "Petty Cash Voucher Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name;
            Caption = 'Petty Cash Voucher Batch';
        }
        field(50020; "Max. Petty Cash Request"; Decimal)
        {
            Caption = 'Max. Petty Cash Request';
        }
        field(50022; "Imprest Req No"; Code[20])
        {
            Caption = 'Receipts No';
            TableRelation = "No. Series";
        }
        field(50023; "Quotation Request No"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Quotation Request No';
        }
        field(50024; "Tender Request No"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Tender Request No';
        }
        field(50025; "Transport Pay Type"; Code[20])
        {
            TableRelation = Attachments;
            Caption = 'Transport Pay Type';
        }
        field(50026; "Minimum Chargeable Weight"; Decimal)
        {
            Caption = 'Minimum Chargeable Weight';
        }
        field(50027; "Imprest Surrender No"; Code[20])
        {
            Caption = 'Imprest Surrender No';
            TableRelation = "No. Series";
        }
        field(50028; "Bank Deposit No."; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Bank Deposit No.';
        }
        field(50029; "InterBank Transfer No."; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'InterBank Transfer No.';
        }
        field(50030; "PA Payment Vouchers Nos"; Code[20])
        {
            Caption = 'Farmers Payment Vouchers Nos.';
            TableRelation = "No. Series".Code;
        }
        field(50031; "Cash Request Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Cash Request Nos';
        }
        field(50032; "Cash Issue Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Cash Issue Nos';
        }
        field(50033; "Cash Receipt Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Cash Receipt Nos';
        }
        field(50034; "Cash Transfer Template"; Code[10])
        {
            TableRelation = "Gen. Journal Template".Name;
            Caption = 'Cash Transfer Template';
        }
        field(50035; "Cash Transfer Batch"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Cash Transfer Template"));
            Caption = 'Cash Transfer Batch';
        }
        field(50036; "Enable AutoTeller Monitor"; Boolean)
        {
            Caption = 'Enable AutoTeller Monitor';
        }
        field(50037; "Alert After ?(Mins)"; Integer)
        {
            Caption = 'Alert After ?(Mins)';
        }
        field(50038; "Transporter Depot"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Transporter Depot';
        }
        field(50039; "Transporter Department"; Code[20])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Transporter Department';
        }
        field(50040; "Transporter Cashier"; Code[20])
        {
            TableRelation = "Cash Office User Template";
            Caption = 'Transporter Cashier';
        }
        field(50041; "Transporter PayType"; Code[20])
        {
            TableRelation = "Receipts and Payment Types".Code where(Type = filter(Payment));
            Caption = 'Transporter PayType';
        }
        field(50042; "Cashier Transfer Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Cashier Transfer Nos';
        }
        field(50043; "Interim Transfer Account"; Code[20])
        {
            TableRelation = "Bank Account" where("Bank Type" = const(Cash));
            Caption = 'Interim Transfer Account';
        }
        field(50044; "Default Bank Deposit Slip A/C"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
            Caption = 'Default Bank Deposit Slip A/C';
        }
        field(50045; "Apply Cash Expenditure Limit"; Boolean)
        {
            Caption = 'Apply Cash Expenditure Limit';
        }
        field(50046; "Expenditure Limit Amount(LCY)"; Decimal)
        {
            Caption = 'Expenditure Limit Amount(LCY)';
        }
        field(50050; "Staff Claim No."; Code[20])
        {
            Caption = 'Staff Claim No';
            TableRelation = "No. Series";
        }
        field(50051; "Other Staff Advance No."; Code[20])
        {
            Caption = 'Other Staff Advance No';
            TableRelation = "No. Series";
        }
        field(50052; "Staff Advance Surrender No."; Code[20])
        {
            Caption = 'Staff Adv. Surrender No';
            TableRelation = "No. Series";
        }
        field(50053; "Prompt Cash Reimbursement"; Boolean)
        {
            Caption = 'Prompt Cash Reimbursement';
        }
        field(50054; "Use Central Payment System"; Boolean)
        {
            Caption = 'Use Central Payment System';
        }
        field(50060; "Payment Request Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Payment Request Nos';
        }
        field(50061; "Journal Voucher Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Journal Voucher Nos';
        }
        field(50070; "Minimum Cheque Creation Amount"; Decimal)
        {
            Description = 'Starting Amount to create a check';
            Caption = 'Minimum Cheque Creation Amount';
        }
        field(50071; "Grant Surrender Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Grant Surrender Nos';
        }
        field(50072; "Cash Purchases"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Cash Purchases';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
