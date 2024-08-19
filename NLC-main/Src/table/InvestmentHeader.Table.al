#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193704 "Investment Header"
{
    Caption = 'Investment Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; "Investment Start Date"; Date)
        {
            Caption = 'Investment Start Date';
        }
        field(4; "Investment End Date"; Date)
        {
            Caption = 'Investment End Date';

        }
        field(5; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(6; "Investment Firm Code"; Code[20])
        {
            Caption = 'Investment Company Code';
            TableRelation = "Investment Firms"."Firm Code";

            trigger OnValidate()
            begin
                if "Investment Firm Code" <> '' then begin
                    InvestmentFirm.Get("Investment Firm Code");
                    "Investment Firm Name" := InvestmentFirm."Firm Name";
                end else
                    "Investment Firm Name" := '';
            end;
        }
        field(7; "Investment Firm Name"; Text[100])
        {
            Caption = 'Investment Company Code';
        }
        field(8; "Investment Rate"; Decimal)
        {
            TableRelation = Rates.Rate where(Type = filter(Interest));
            Caption = 'Investment Rate';
        }
        field(9; "Investment Withholding Tax"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Investment Withholding Tax';
        }
        field(10; "Investment Type"; Code[20])
        {
            TableRelation = "Investment Types";
            Caption = 'Investment Type';
        }
        field(11; "Investment Principal"; Decimal)
        {
            CalcFormula = sum("Payment Line".Amount where(No = field("Paying Document No."),
                                                           Type = const('INVESTMENT')));
            FieldClass = FlowField;
            Caption = 'Investment Principal';
            Editable = false;
        }
        field(12; "Investment Duration"; Text[100])
        {
            Caption = 'Investment Duration';
        }
        field(13; "Investment Rollover Status"; Option)
        {
            OptionCaption = ' ,First Rollover,Closed';
            OptionMembers = " ","First Rollover",Closed;
            Caption = 'Investment Rollover Status';
        }
        field(14; "Interest Earned"; Decimal)
        {
            Caption = 'Interest Earned';
            trigger OnValidate()
            begin


                "Investment Withholding Tax" := ("Withholding Tax Rate" / 100) * "Interest Earned";
            end;
        }
        field(15; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'No. Series';
        }
        field(16; Status; Option)
        {
            OptionCaption = ' ,Open,Pending Approval,Approved';
            OptionMembers = " ",Open,"Pending Approval",Approved;
            Caption = 'Status';
        }
        field(17; "Paying Document No."; Code[30])
        {
            TableRelation = "Payments Header";
            Caption = 'Paying Document No.';
        }
        field(18; "Expected Interest"; Decimal)
        {
            Caption = 'Expected Interest';
        }
        field(19; "Withholding Tax Rate"; Decimal)
        {
            TableRelation = Rates.Rate where(Type = filter("Withholding Tax"));
            Caption = 'Withholding Tax Rate';
            trigger OnValidate()
            begin
                Validate("Interest Earned");
            end;
        }
        field(20; "Archived Versions"; Integer)
        {
            CalcFormula = count("Archived Investment Header" where("No." = field("No.")));
            FieldClass = FlowField;
            Caption = 'Archived Versions';
            Editable = false;
        }
        field(21; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center BR 2";
            Caption = 'Responsibility Center';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin

        if "No." = '' then begin
            "Investment Setup".Get();
            "Investment Setup".TestField("Investment Setup"."Investment Nos");
            NoSeriesMgt.InitSeries("Investment Setup"."Investment Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        "Document Date" := Today;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        "Investment Setup": Record "Investment Setup";
        InvestmentFirm: Record "Investment Firms";
}
