#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193564 "Salary Step/Notch Transactions"
{
    DrillDownPageId = "Funds Mgt Comment Sheet";
    LookupPageId = "Funds Mgt Comment Sheet";
    Caption = 'Salary Step/Notch Transactions';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Salary Grade"; Code[20])
        {
            TableRelation = "PR Basic Pay"."Employee No";
            Caption = 'Salary Grade';
        }
        field(2; "Salary Step/Notch"; Code[20])
        {
            Caption = 'Salary Step/Notch';
            //TableRelation = "prSalary Review Lines".test where ("Line No."=field("Salary Grade"));
        }
        field(3; "Transaction Code"; Code[20])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
            Caption = 'Transaction Code';
            trigger OnValidate()
            begin
                if Trans.Get("Transaction Code") then begin
                    "Transaction Name" := Trans."Transaction Name";
                    "Transaction Type" := Trans."Transaction Type";
                    Formula := Trans.Formula;
                end;
            end;
        }
        field(4; "Transaction Name"; Text[100])
        {
            Caption = 'Transaction Name';
        }
        field(5; "Transaction Type"; Option)
        {
            OptionMembers = Income,Deduction;
            Caption = 'Transaction Type';
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
            trigger OnValidate()
            begin
                "Annual Amount" := Amount * 12;
            end;
        }
        field(7; "% of Basic Pay"; Decimal)
        {
            Caption = '% of Basic Pay';
        }
        field(8; Formula; Code[100])
        {
            Caption = 'Formula';
        }
        field(9; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(10; "Annual Amount"; Decimal)
        {
            Caption = 'Annual Amount';
            trigger OnValidate()
            begin
                if "Annual Amount" > 0 then
                    Amount := "Annual Amount" / 12;
            end;
        }
    }

    keys
    {
        key(Key1; "Salary Grade", "Salary Step/Notch", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Trans: Record "PR Transaction Codes";
}
