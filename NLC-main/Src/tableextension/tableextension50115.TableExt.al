#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50115 tableextension50115 extends "Item Journal Line"
{
    fields
    {
        field(50000; "Output From Line"; Boolean)
        {
            Caption = 'Output From Line';
            DataClassification = CustomerContent;
        }
        field(50001; Status; Text[50])
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(50002; "Vendor No"; Code[20])
        {
            Caption = 'Vendor No';
            DataClassification = CustomerContent;
        }
        field(50003; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            DataClassification = CustomerContent;
        }
        field(50004; "Order No"; Code[50])
        {
            Caption = 'Order No';
            DataClassification = CustomerContent;
        }
        field(50005; "Invoice No"; Code[50])
        {
            Caption = 'Invoice No';
            DataClassification = CustomerContent;
        }
        field(50006; "Employee No"; Code[50])
        {
            Caption = 'Employee No';
            DataClassification = CustomerContent;
        }
        field(50007; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
            DataClassification = CustomerContent;
        }
        field(50008; "User ID"; Code[100])
        {
            Caption = 'User ID';
            DataClassification = CustomerContent;
        }
        field(39003900; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Rec.ValidateShortcutDimCode(1, Rec."Shortcut Dimension 1 Code");
            end;
        }
        field(39003901; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Rec.ValidateShortcutDimCode(2, Rec."Shortcut Dimension 2 Code");
            end;
        }
        field(39003902; "New Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3,' + Text007;
            Caption = 'New Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Rec.TestField(Rec."Entry Type", Rec."Entry Type"::Transfer);
                Rec.ValidateNewShortcutDimCode(1, Rec."New Shortcut Dimension 1 Code");
            end;
        }
        field(39003904; "New Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4,' + Text007;
            Caption = 'New Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Rec.TestField(Rec."Entry Type", Rec."Entry Type"::Transfer);
                Rec.ValidateNewShortcutDimCode(2, Rec."New Shortcut Dimension 2 Code");
            end;
        }
    }
    var
        Text007: Label 'New ';

}
