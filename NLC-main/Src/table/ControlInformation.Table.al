#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193558 "Control-Information"
{
    Caption = 'Control-Information';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
        }
        field(4; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(5; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(6; City; Text[50])
        {
            Caption = 'City';
        }
        field(7; "Phone No."; Text[150])
        {
            Caption = 'Phone No.';
        }
        field(8; "Phone No. 2"; Text[20])
        {
            Caption = 'Phone No. 2';
        }
        field(9; "Telex No."; Text[20])
        {
            Caption = 'Telex No.';
        }
        field(10; "Fax No."; Text[20])
        {
            Caption = 'Fax No.';
        }
        field(11; "Giro No."; Text[20])
        {
            Caption = 'Giro No.';
        }
        field(12; "Bank Name"; Text[30])
        {
            Caption = 'Bank Name';
        }
        field(13; "Bank Branch No."; Text[20])
        {
            Caption = 'Bank Branch No.';
        }
        field(14; "Bank Account No."; Text[20])
        {
            Caption = 'Bank Account No.';
        }
        field(15; "Payment Routing No."; Text[20])
        {
            Caption = 'Payment Routing No.';
        }
        field(17; "Customs Permit No."; Text[10])
        {
            Caption = 'Customs Permit No.';
        }
        field(18; "Customs Permit Date"; Date)
        {
            Caption = 'Customs Permit Date';
        }
        field(19; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';
        }
        field(20; "Registration No."; Text[20])
        {
            Caption = 'Registration No.';
        }
        field(21; "Telex Answer Back"; Text[20])
        {
            Caption = 'Telex Answer Back';
        }
        field(22; "Ship-to Name"; Text[30])
        {
            Caption = 'Ship-to Name';
        }
        field(23; "Ship-to Name 2"; Text[30])
        {
            Caption = 'Ship-to Name 2';
        }
        field(24; "Ship-to Address"; Text[30])
        {
            Caption = 'Ship-to Address';
        }
        field(25; "Ship-to Address 2"; Text[30])
        {
            Caption = 'Ship-to Address 2';
        }
        field(26; "Ship-to City"; Text[30])
        {
            Caption = 'Ship-to City';
        }
        field(27; "Ship-to Contact"; Text[30])
        {
            Caption = 'Ship-to Contact';
        }
        field(28; "Location Code"; Code[10])
        {
            TableRelation = Location;
            Caption = 'Location Code';
        }
        field(29; Picture; Blob)
        {
            Subtype = Bitmap;
            Caption = 'Picture';
        }
        field(30; "Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
            Caption = 'Post Code';
            trigger OnValidate()
            begin
                if PostCode.Get("Post Code") then
                    City := PostCode.City;
            end;
        }
        field(31; County; Text[30])
        {
            Caption = 'County';
        }
        field(32; "Ship-to Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
            Caption = 'Ship-to Post Code';
            trigger OnValidate()
            begin
                if PostCode.Get("Ship-to Post Code") then
                    "Ship-to City" := PostCode.City;
            end;
        }
        field(33; "Ship-to County"; Text[30])
        {
            Caption = 'Ship-to County';
        }
        field(34; "E-Mail"; Text[80])
        {
            Caption = 'E-Mail';
        }
        field(35; "Home Page"; Text[80])
        {
            Caption = 'Home Page';
        }
        field(50000; "Company P.I.N"; Code[30])
        {
            Caption = 'Company P.I.N';
        }
        field(50001; "N.S.S.F No."; Code[30])
        {
            Caption = 'N.S.S.F No.';
        }
        field(50002; "Company code"; Code[10])
        {
            Caption = 'Company code';
        }
        field(50003; "Working Days Per Year"; Integer)
        {
            Caption = 'Working Days Per Year';
        }
        field(50004; "Working Hours Per Week"; Integer)
        {
            Caption = 'Working Hours Per Week';
        }
        field(50005; "Working Hours Per Day"; Integer)
        {
            Caption = 'Working Hours Per Day';
        }
        field(50006; Mission; Text[250])
        {
            Caption = 'Mission';
        }
        field(50007; "Mission/Vision Link"; Text[50])
        {
            Caption = 'Mission/Vision Link';
        }
        field(50008; Vision; Text[250])
        {
            Caption = 'Vision';
        }
        field(50009; "N.H.I.F No"; Text[100])
        {
            Caption = 'N.H.I.F No';
        }
        field(50010; "Payslip Message"; Text[250])
        {
            Description = 'Dennis Added';
            Caption = 'Payslip Message';
        }
        field(50011; "Multiple Payroll"; Boolean)
        {
            Caption = 'Multiple Payroll';
        }
        field(50012; "Picture USAID"; Blob)
        {
            Subtype = Bitmap;
            Caption = 'Picture USAID';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        PostCode: Record "Post Code";
}
