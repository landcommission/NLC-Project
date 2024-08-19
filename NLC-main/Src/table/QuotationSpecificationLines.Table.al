#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193683 "Quotation Specification Lines"
{
    Caption = 'Quotation Specification Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document No."; Code[20])
        {
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Quote));
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Code"; Code[20])
        {
            TableRelation = "HR Calendar".Code;
            Caption = 'Code';
            trigger OnValidate()
            begin
                QuoteSpec.Get(Code);
                "Max Score" := QuoteSpec."Value/Weight";
                Description := QuoteSpec.Description;
            end;
        }
        field(4; Description; Text[60])
        {
            Caption = 'Description';
        }
        field(5; Score; Decimal)
        {
            Caption = 'Score';
            trigger OnValidate()
            begin
                if Score > "Max Score" then
                    Error('The score can not be graeter than the max score specified');
            end;
        }
        field(6; "Request No."; Code[20])
        {
            TableRelation = "Purchase Quote Header"."No." where(Status = const(Released));
            Caption = 'Request No.';
        }
        field(7; "Request Line No."; Integer)
        {
            TableRelation = "HR Setup"."Leave Application Nos.";
            Caption = 'Request Line No.';
        }
        field(8; Type; Text[30])
        {
            Caption = 'Type';
        }
        field(9; "Type No."; Code[20])
        {
            Caption = 'Type No.';
        }
        field(10; "Type Name"; Text[100])
        {
            Caption = 'Type Name';
        }
        field(11; "Max Score"; Decimal)
        {
            Caption = 'Max Score';
        }
        field(12; "Total Score"; Decimal)
        {
            Caption = 'Total Score';
            // CalcFormula = sum("HR Lookup Values"."Notice Period" where (Type=field("Document No."),
            //                                                             Closed=field("Request No.")));
            // FieldClass = FlowField;
        }
        field(13; "Temp Total Score"; Decimal)
        {
            Caption = 'Temp Total Score';
        }
        field(14; "Vendor No"; Code[20])
        {
            Caption = 'Vendor No';
        }
        field(15; "Assigned Value"; Decimal)
        {
            Caption = 'Assigned Value';
        }
        field(16; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.", "Code", "Request No.", "Request Line No.", Score)
        {
            Clustered = true;
        }
        key(Key2; Score) { }
        key(Key3; "Request No.", "Code", Type, "Type No.", Score) { }
        key(Key4; "Document No.", "Request No.")
        {
            SumIndexFields = Score;
        }
        key(Key5; "Temp Total Score") { }
    }

    fieldgroups { }

    var
        QuoteSpec: Record "Quote Specifications";
}
