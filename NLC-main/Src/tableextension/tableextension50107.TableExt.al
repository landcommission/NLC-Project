#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50107 tableextension50107 extends "Item Ledger Entry"
{
    fields
    {
        field(6603; "Vendor No"; Code[20])
        {
            Caption = 'Vendor No';
            DataClassification = CustomerContent;
        }
        field(6604; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            DataClassification = CustomerContent;
        }
        field(6605; "Order No"; Code[20])
        {
            Caption = 'Order No';
            DataClassification = CustomerContent;
        }
        field(6606; "Invoice No"; Code[20])
        {
            Caption = 'Invoice No';
            DataClassification = CustomerContent;
        }
        field(6607; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
            DataClassification = CustomerContent;
        }
        field(6608; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
            DataClassification = CustomerContent;
        }
        field(6609; "User ID"; Code[100])
        {
            Caption = 'User ID';
            DataClassification = CustomerContent;
        }
    }
}
