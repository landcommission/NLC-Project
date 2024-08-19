#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50122 tableextension50122 extends "General Ledger Setup"
{
    fields
    {
        field(50021; "Journal Approval Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Journal Approval Nos';
            DataClassification = CustomerContent;
        }
        field(50146; "Bank Balances"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Bank Account Ledger Entry"."Amount (LCY)" where("Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                                "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                                "Posting Date" = field("Date Filter")));
            Caption = 'Bank Balances';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50147; "Pending L.O.P"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Outstanding Amount (LCY)" where("Shortcut Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                                "Expected Receipt Date" = field("Date Filter"),
                                                                                Amount = filter(<> 0),
                                                                                "Document Type" = filter(<> Quote)));
            FieldClass = FlowField;
            Caption = 'Pending L.O.P';
            Editable = false;
        }
        field(39004241; "GjnlBatch Approval No"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'GjnlBatch Approval No';
            DataClassification = CustomerContent;
        }
        field(39004242; "LCY Code Decimals"; Code[10])
        {
            Caption = 'LCY Code Decimals';
            DataClassification = CustomerContent;
        }
        field(39004250; "Base No. Series"; Option)
        {
            OptionCaption = ' ,Responsibility Center,Shortcut Dimension 1,Shortcut Dimension 2,Shortcut Dimension 3,Shortcut Dimension 4';
            OptionMembers = " ","Responsibility Center","Shortcut Dimension 1","Shortcut Dimension 2","Shortcut Dimension 3","Shortcut Dimension 4","Shortcut Dimension 5","Shortcut Dimension 6","Shortcut Dimension 7","Shortcut Dimension 8";
            Caption = 'Base No. Series';
            DataClassification = CustomerContent;
        }
        field(39004251; "Cash Purchases Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Cash Purchases Nos';
            DataClassification = CustomerContent;
        }
        field(39004252; "Payroll Posting Group"; Code[20])
        {
            Caption = 'Payroll Posting Group';
            DataClassification = CustomerContent;
        }
        field(39004253; "Interbank Transfer Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Interbank Transfer Nos';
            DataClassification = CustomerContent;
        }
        field(39004254; "Vote Transfer"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Vote Transfer';
            DataClassification = CustomerContent;
        }
        field(39004255; "Incident Nos."; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Incident Nos.';
            DataClassification = CustomerContent;
        }
        field(39004256; "Accident Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Accident Nos';
            DataClassification = CustomerContent;
        }
        field(39004257; "Master Record Form Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Master Record Form Nos';
            DataClassification = CustomerContent;
        }
    }
}
