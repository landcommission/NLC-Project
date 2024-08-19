#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193816 "Bidder Tender"
{
    Caption = 'Bidder Tender';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Tender ID"; Code[20])
        {
            NotBlank = true;
            TableRelation = Tender."Tender ID";
            Caption = 'Tender ID';
        }
        field(2; "PIN No."; Code[20])
        {
            NotBlank = true;
            TableRelation = Bidder."PIN No";
            Caption = 'PIN No.';
        }
        field(3; "Date Created"; Date)
        {
            Editable = false;
            NotBlank = true;
            Caption = 'Date Created';
        }
        field(4; "Created By"; Code[20])
        {
            Editable = false;
            Caption = 'Created By';
        }
        field(5; "Receipt No."; Code[20])
        {
            Editable = true;
            NotBlank = true;
            Caption = 'Receipt No.';
        }
        field(8; "Non Refundable Fee"; Decimal)
        {
            Editable = false;
            MinValue = 5000;
            Caption = 'Non Refundable Fee';
        }
        field(9; Status; Option)
        {
            OptionCaption = 'Open,Undergoing Approval,Approved,Rejected,Cancelled';
            OptionMembers = Open,"Undergoing Approval",Approved,Rejected,Cancelled;
            Caption = 'Status';
        }
        field(10; Comment; Text[250])
        {
            Caption = 'Comment';
        }
        field(11; "Serial No"; Code[20])
        {
            Caption = 'Serial No';
        }
        field(12; Email; Text[50])
        {
            Caption = 'Email';
        }
        field(13; "Tenderer Names"; Text[70])
        {
            Caption = 'Tenderer Names';
        }
        field(14; "Telephone No"; Text[30])
        {
            Caption = 'Telephone No';
        }
        field(15; "Witness Names"; Text[70])
        {
            Caption = 'Witness Names';
        }
        field(16; "Tender Name"; Text[200])
        {
            Caption = 'Tender Name';
        }
        field(17; "Posted To Portal"; Boolean)
        {
            Caption = 'Posted To Portal';
        }
        field(18; Year; Option)
        {
            OptionCaption = '2014,2015,2016,2017,2018,2019,2020,2021,2022';
            OptionMembers = "2014","2015","2016","2017","2018","2019","2020","2021","2022";
            Caption = 'Year';
        }
    }

    keys
    {
        key(Key1; "Tender ID", "PIN No.", "Receipt No.")
        {
            Clustered = true;
        }
        key(Key2; "Date Created") { }
        key(Key3; "PIN No.") { }
    }

    fieldgroups { }
}
