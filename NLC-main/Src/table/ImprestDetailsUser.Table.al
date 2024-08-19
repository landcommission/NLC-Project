#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193625 "Imprest Details-User"
{
    Caption = 'Imprest Details-User';
    DataClassification = CustomerContent;
    fields
    {
        field(1; No; Code[20])
        {
            NotBlank = true;
            Caption = 'No';

        }
        field(2; "Account No:"; Code[10])
        {
            NotBlank = true;
            TableRelation = "G/L Account"."No.";
            Caption = 'Account No:';
            trigger OnValidate()
            begin
                if GLAcc.Get("Account No:") then
                    "Account Name" := GLAcc.Name;
                /*
                IF Pay.GET(No) THEN BEGIN
                 IF Pay."Account No."<>'' THEN
                  BEGIN
                      "Imprest Holder":=Pay."Account No."
                  END
                 ELSE
                  BEGIN
                      ERROR('Please Enter the Customer/Account Number');
                  END;
                END;
                */

            end;
        }
        field(3; "Account Name"; Text[30])
        {
            Caption = 'Account Name';
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(5; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(6; "Imprest Holder"; Code[20])
        {
            TableRelation = Customer."No.";
            Caption = 'Imprest Holder';
        }
        field(7; "Actual Spent"; Decimal)
        {
            Caption = 'Actual Spent';
        }
        field(41; "Apply to"; Code[20])
        {
            Caption = 'Apply to';
        }
        field(42; "Apply to ID"; Code[20])
        {
            Caption = 'Apply to ID';
        }
        field(44; "Surrender Date"; Date)
        {
            Caption = 'Surrender Date';
        }
        field(45; Surrendered; Boolean)
        {
            Caption = 'Surrendered';
        }
        field(46; "M.R. No"; Code[20])
        {
            Caption = 'M.R. No';
        }
        field(47; "Date Issued"; Date)
        {
            Caption = 'Date Issued';
        }
        field(48; "Type of Surrender"; Option)
        {
            OptionMembers = " ",Cash,Receipt;
            Caption = 'Type of Surrender';
        }
        field(49; "Dept. Vch. No."; Code[20])
        {
            Caption = 'Dept. Vch. No.';
        }
        field(50; "Cash Surrender Amt"; Decimal)
        {
            Caption = 'Cash Surrender Amt';
        }
        field(51; "Bank/Petty Cash"; Code[20])
        {
            TableRelation = "Bank Account";
            Caption = 'Bank/Petty Cash';
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        GLAcc: Record "G/L Account";
        Pay: Record "Payment Line";
}
