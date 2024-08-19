#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193834 "Evaluation Parameters Areas"
{
    Caption = 'Evaluation Parameters Areas';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No';
        }
        field(2; "Parameter Code"; Code[10])
        {
            TableRelation = "Evaluation Parameters Setup".Code;
            Caption = 'Parameter Code';
            trigger OnValidate()
            begin
                EvaluationParametersSetup.Reset();
                EvaluationParametersSetup.SetRange(EvaluationParametersSetup.Code, "Parameter Code");
                if EvaluationParametersSetup.Find('-') then
                    Description := EvaluationParametersSetup.Description;
            end;
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(4; "Expected Min.Value"; Decimal)
        {
            Caption = 'Expected Min.Value';
        }
        field(5; "Expected Max.Value"; Decimal)
        {
            Caption = 'Expected Max.Value';
        }
        field(6; "Vendor No."; Code[10])
        {
            Caption = 'Vendor No.';
            trigger OnValidate()
            begin
                Vend.Reset();
                Vend.SetRange(Vend."No.", "Vendor No.");
                if Vend.Find('-') then
                    "Vendor Name" := Vend.Name;
            end;
        }
        field(7; "Evaluation Year"; Code[30])
        {
            TableRelation = "Evaluation Year".Code;
            Caption = 'Evaluation Year';
        }
        field(8; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
        }
    }

    keys
    {
        key(Key1; "Line No", "Vendor No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        EvaluationParametersSetup: Record "Evaluation Parameters Setup";
        Vend: Record Vendor;
}
