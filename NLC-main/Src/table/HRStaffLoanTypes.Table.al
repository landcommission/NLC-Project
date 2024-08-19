#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193875 "HR Staff Loan Types"
{
    Caption = 'HR Staff Loan Types';
    DataClassification = CustomerContent;
    //DrillDownPageID = UnknownPage39005747;
    //LookupPageID = UnknownPage39005747;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            trigger OnValidate()
            begin
                if Code <> xRec.Code then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(HRSetup."HR Loan Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Product Description"; Text[30])
        {
            Caption = 'Product Description';
        }
        field(3; "Source of Financing"; Code[10])
        {
            Caption = 'Source of Financing';
        }
        field(4; "Interest rate"; Decimal)
        {
            Caption = 'Interest rate';
        }
        field(9; "Interest Calculation Method"; Option)
        {
            OptionMembers = ,"No Interest","Flat Rate","Reducing Balances";
            Caption = 'Interest Calculation Method';
        }
        field(11; "Insurance %"; Decimal)
        {
            Caption = 'Insurance %';
        }
        field(17; "No. Series"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'No. Series';
        }
        field(24; "Grace Period"; DateFormula)
        {
            Caption = 'Grace Period';
        }
        field(26; "Name of Source of Funding"; Text[30])
        {
            Editable = false;
            Caption = 'Name of Source of Funding';
        }
        field(27; Rounding; Option)
        {
            OptionMembers = Nearest,Down,Up;
            Caption = 'Rounding';
        }
        field(28; "Rounding Precision"; Decimal)
        {
            InitValue = 1;
            MaxValue = 1;
            MinValue = 0.01;
            Caption = 'Rounding Precision';
        }
        field(30; "No of Installment"; Integer)
        {
            Caption = 'No of Installment';
        }
        field(31; "Loan No Series"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Loan No Series';
        }
        field(32; "New Numbers"; Code[10])
        {
            Caption = 'New Numbers';
        }
        field(33; "Instalment Period"; DateFormula)
        {
            Caption = 'Instalment Period';
        }
        field(40; "Max. Loan Amount"; Decimal)
        {
            Caption = 'Max. Loan Amount';
        }
        field(44; "Repayment Method"; Option)
        {
            OptionMembers = Amortised,"Reducing Balance","Straight Line",Constants;
            Caption = 'Repayment Method';
        }
        field(45; "Grace Period - Principle (M)"; Integer)
        {
            Caption = 'Grace Period - Principle (M)';
        }
        field(46; "Grace Period - Interest (M)"; Integer)
        {
            Caption = 'Grace Period - Interest (M)';
        }
        field(47; "Min. Loan Amount"; Decimal)
        {
            Caption = 'Min. Loan Amount';
        }
        field(50; "Loan Account"; Code[20])
        {
            TableRelation = "G/L Account";
            Caption = 'Loan Account';
            trigger OnValidate()
            begin
                TestNoEntriesExist(FieldCaption(Code), Code);
                TestNoEntriesExist(FieldCaption("Loan Account"), "Loan Account")
            end;
        }
        field(51; "Loan Interest Account"; Code[20])
        {
            TableRelation = "G/L Account";
            Caption = 'Loan Interest Account';
            trigger OnValidate()
            begin
                TestNoEntriesExist(FieldCaption(Code), Code);
                TestNoEntriesExist(FieldCaption("Loan Interest Account"), "Loan Interest Account")
            end;
        }
        field(52; "Receivable Interest Account"; Code[20])
        {
            TableRelation = "G/L Account";
            Caption = 'Receivable Interest Account';
            trigger OnValidate()
            begin
                TestNoEntriesExist(FieldCaption(Code), Code);
                TestNoEntriesExist(FieldCaption("Receivable Interest Account"), "Receivable Interest Account")
            end;
        }
        field(54; "Action"; Option)
        {
            OptionCaption = ' ,Off Set Commitments,Discounting';
            OptionMembers = " ","Off Set Commitments",Discounting;
            Caption = 'Action';
        }
        field(56; "Top Up Commision Account"; Code[20])
        {
            TableRelation = "G/L Account";
            Caption = 'Top Up Commision Account';
        }
        field(57; "Top Up Commision"; Decimal)
        {
            Caption = 'Top Up Commision';
        }
        field(58; Source; Option)
        {
            OptionCaption = 'BOSA,FOSA,Investment,MICRO,HR';
            OptionMembers = BOSA,FOSA,Investment,MICRO,HR;
            Caption = 'Source';
        }
        field(59; "Recovery Priority"; Integer)
        {
            Caption = 'Recovery Priority';
        }
        field(60; "Check Off Recovery"; Boolean)
        {
            Caption = 'Check Off Recovery';
        }
        field(61; "SMS Description"; Text[50])
        {
            Caption = 'SMS Description';
        }
        field(62; "Default Installements"; Integer)
        {
            Caption = 'Default Installements';
        }
        field(63; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Date Filter';
        }
        field(64; Applications; Decimal)
        {
            Caption = 'Applications';
        }
        field(65; "Issued Amount"; Decimal)
        {
            Caption = 'Issued Amount';
        }
        field(66; "Min No. Of Guarantors"; Integer)
        {
            Caption = 'Min No. Of Guarantors';
        }
        field(67; "Min Re-application Period"; DateFormula)
        {
            Caption = 'Min Re-application Period';
        }
        field(68; "Check Off Loan No."; Integer)
        {
            Caption = 'Check Off Loan No.';
        }
        field(72; "Mode of Qualification"; Option)
        {
            OptionCaption = 'Normal Sacco,Fosa,Security';
            OptionMembers = "Normal Sacco",Fosa,Security;
            Caption = 'Mode of Qualification';
        }
        field(73; "Product Currency Code"; Code[10])
        {
            Editable = false;
            TableRelation = Currency.Code;
            Caption = 'Product Currency Code';
        }
        field(76; "Repayment Frequency"; Option)
        {
            OptionCaption = 'Daily,Weekly,Monthly,Quaterly,Yearly';
            OptionMembers = Daily,Weekly,Monthly,Quaterly,Yearly;
            Caption = 'Repayment Frequency';
        }
        field(82; "Recovery Mode"; Option)
        {
            OptionCaption = 'Checkoff,Standing Order,Salary';
            OptionMembers = Checkoff,"Standing Order",Salary;
            Caption = 'Recovery Mode';
        }
        field(83; "Deposit Multiplier"; Decimal)
        {
            Caption = 'Deposit Multiplier';
        }
        field(84; "Car Loan"; Boolean)
        {
            Caption = 'Car Loan';
        }
        field(85; "Min Application Period"; DateFormula)
        {
            Caption = 'Min Application Period';
        }
        field(86; "Salary Multiplier"; Decimal)
        {
            Caption = 'Salary Multiplier';
        }
        field(87; "Payroll Code"; Code[10])
        {
            Caption = 'Payroll Code';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Recovery Priority") { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", "Product Description") { }
    }

    trigger OnDelete()
    begin
        TestNoEntriesExist(FieldCaption("Loan Account"), "Loan Account");
        TestNoEntriesExist(FieldCaption("Loan Interest Account"), "Loan Interest Account");
        TestNoEntriesExist(FieldCaption("Receivable Interest Account"), "Receivable Interest Account");
    end;

    trigger OnInsert()
    begin
        //IF Source=Source::BOSA THEN BEGIN
        if Code = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."HR Loan Nos.");
            NoSeriesMgt.InitSeries(HRSetup."HR Loan Nos.", xRec."No. Series", 0D, Code, "No. Series");
        end;
    end;

    trigger OnModify()
    begin

        TestNoEntriesExist(FieldCaption("Loan Account"), "Loan Account");
        TestNoEntriesExist(FieldCaption("Loan Interest Account"), "Loan Interest Account");
        TestNoEntriesExist(FieldCaption("Receivable Interest Account"), "Receivable Interest Account");
    end;

    trigger OnRename()
    begin
        TestNoEntriesExist(FieldCaption("Loan Account"), "Loan Account");
        TestNoEntriesExist(FieldCaption("Loan Interest Account"), "Loan Interest Account");
        TestNoEntriesExist(FieldCaption("Receivable Interest Account"), "Receivable Interest Account");
    end;

    var
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Text000: Label 'You cannot change %1 because there are one or more ledger entries associated with this account.';


    procedure TestNoEntriesExist(CurrentFieldName: Text[100]; GLNO: Code[20])
    var
        GLLedgEntry: Record "G/L Entry";
    begin
        /*

         //To prevent change of field
        GLLedgEntry.SETCURRENTKEY(GLLedgEntry."G/L Account No.");
        GLLedgEntry.SETRANGE("G/L Account No.",GLNO);
       IF GLLedgEntry.FIND('-') THEN
         ERROR(
         Text000,
          CurrentFieldName)
          */

    end;
}
