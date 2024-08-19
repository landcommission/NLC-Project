#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193812 Questionaire
{
    Caption = 'Questionaire';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
            Caption = 'Line No.';
        }
        field(2; "Tender No."; Code[20])
        {
            Editable = false;
            Caption = 'Tender No.';
        }
        field(3; "Receipt No."; Code[20])
        {
            Editable = false;
            Caption = 'Receipt No.';
        }
        field(4; "PIN No."; Code[20])
        {
            Editable = false;
            Caption = 'PIN No.';
        }
        field(5; "Legal Name of Firm"; Text[100])
        {
            Caption = 'Legal Name of Firm';
        }
        field(6; "Post Office Box Number"; Text[50])
        {
            Caption = 'Post Office Box Number';
        }
        field(7; "Post Code"; Code[20])
        {
            TableRelation = "Post Code".Code;
            Caption = 'Post Code';
        }
        field(8; "City/Town"; Code[50])
        {
            Caption = 'City/Town';
        }
        field(9; Country; Code[20])
        {
            TableRelation = "Country/Region".Code;
            Caption = 'Country';
        }
        field(10; "Physical Location"; Text[100])
        {
            Caption = 'Physical Location';
        }
        field(11; "City/Town 2"; Text[50])
        {
            Caption = 'City/Town 2';
        }
        field(12; "Country 2"; Code[20])
        {
            TableRelation = "Country/Region".Code;
            Caption = 'Country 2';
        }
        field(13; Street; Text[50])
        {
            Caption = 'Street';
        }
        field(14; "Plot No"; Text[50])
        {
            Caption = 'Plot No';
        }
        field(15; "Building Name"; Text[50])
        {
            Caption = 'Building Name';
        }
        field(16; "Telephone No"; Text[50])
        {
            Caption = 'Telephone No';
        }
        field(17; "Fax Number"; Text[50])
        {
            Caption = 'Fax Number';
        }
        field(18; "Mobile Number"; Text[50])
        {
            Caption = 'Mobile Number';
        }
        field(19; "Out Of Hours Telephone"; Text[50])
        {
            Caption = 'Out Of Hours Telephone';
        }
        field(20; "Email Address"; Text[50])
        {
            Caption = 'Email Address';
        }
        field(21; "Person Of Contact"; Text[50])
        {
            Caption = 'Person Of Contact';
        }
        field(22; Title; Text[50])
        {
            Caption = 'Title';
        }
        field(23; "Current Trade Licence No"; Text[50])
        {
            Caption = 'Current Trade Licence No';
        }
        field(24; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
        }
        field(25; "Maximum Business Value"; Decimal)
        {
            Caption = 'Maximum Business Value';
        }
        field(26; "Company Directors"; Text[50])
        {
            Caption = 'Company Directors';
        }
        field(27; "Company Secretary"; Text[50])
        {
            Caption = 'Company Secretary';
        }
        field(28; "General Manager"; Text[50])
        {
            Caption = 'General Manager';
        }
        field(29; "Finance Manager"; Text[50])
        {
            Caption = 'Finance Manager';
        }
        field(30; "Company Pharmacist"; Text[50])
        {
            Caption = 'Company Pharmacist';
        }
        field(31; "Reg. No."; Text[50])
        {
            Caption = 'Reg. No.';
        }
        field(32; "Management Personnel Others"; Text[100])
        {
            Caption = 'Management Personnel Others';
        }
        field(33; "Sole Proprietor Name"; Text[50])
        {
            Caption = 'Sole Proprietor Name';
        }
        field(34; "Sole Proprietor Nationality"; Code[20])
        {
            Caption = 'Sole Proprietor Nationality';
        }
        field(35; "Date Of Start"; Date)
        {
            Caption = 'Date Of Start';
        }
        field(36; "Under Management Since"; Date)
        {
            Caption = 'Under Management Since';
        }
        field(37; "Net Worth"; Decimal)
        {
            Caption = 'Net Worth';
        }
        field(38; "Bank Reference"; Text[50])
        {
            Caption = 'Bank Reference';
        }
        field(39; "Bonding Company"; Text[100])
        {
            Caption = 'Bonding Company';
        }
        field(40; "Main Activity Fields Summary"; Text[100])
        {
            Caption = 'Main Activity Fields Summary';
        }
        field(41; "Sup Name"; Text[250])
        {
            Caption = 'Sup Name';
        }
        field(42; "Sup Address"; Text[50])
        {
            Caption = 'Sup Address';
        }
        field(43; "Sup Telephone"; Text[30])
        {
            Caption = 'Sup Telephone';
        }
        field(44; "Sup Fax"; Text[30])
        {
            Caption = 'Sup Fax';
        }
        field(45; "Sup Email Address"; Text[30])
        {
            Caption = 'Sup Email Address';
        }
        field(46; "Sup Cell Phone No"; Text[30])
        {
            Caption = 'Sup Cell Phone No';
        }
        field(47; "Sup Education Qualification"; Text[30])
        {
            Caption = 'Sup Education Qualification';
        }
        field(48; "Sup Registration Cerificate No"; Text[30])
        {
            Caption = 'Sup Registration Cerificate No';
        }
        field(49; "Sup Date"; Date)
        {
            Caption = 'Sup Date';
        }
        field(50; "Sup Share Holder/Employee"; Option)
        {
            OptionMembers = "Share Holder",Employee;
            Caption = 'Sup Share Holder/Employee';
        }
        field(51; "Sup Length Of Service"; Decimal)
        {
            Caption = 'Sup Length Of Service';
        }
        field(52; "Sup Position Held"; Text[30])
        {
            Caption = 'Sup Position Held';
        }
        field(54; "FP Liabilities"; Decimal)
        {
            Caption = 'FP Liabilities';
        }
        field(55; "FP Assets/Liabilities Date"; Date)
        {
            Caption = 'FP Assets/Liabilities Date';
        }
        field(56; "FP Assets/Liabilities Summary"; Text[100])
        {
            Caption = 'FP Assets/Liabilities Summary';
        }
        field(57; "FP Assets"; Decimal)
        {
            Caption = 'FP Assets';
        }
        field(58; "FP Cash Hand"; Decimal)
        {
            Caption = 'FP Cash Hand';
        }
        field(59; "FP Cash Bank"; Decimal)
        {
            Caption = 'FP Cash Bank';
        }
        field(61; "Delivery Logistics"; Text[50])
        {
            Caption = 'Delivery Logistics';
        }
        field(62; "Lead Time Delivery"; Text[50])
        {
            Caption = 'Lead Time Delivery';
        }
        field(66; "Nature Of Business"; Option)
        {
            OptionCaption = 'Primary Manufacturer,Distributor/Agent,Wholesaler,Retailer,Parent Company,Subsidiary Of Parent Company';
            OptionMembers = "Primary Manufacturer","Distributor/Agent",Wholesaler,Retailer,"Parent Company","Subsidiary Of Parent Company";
            Caption = 'Nature Of Business';
        }
        field(67; "Company Name"; Text[100])
        {
            Caption = 'Company Name';
        }
        field(68; "Signed By (Names)"; Text[50])
        {
            Caption = 'Signed By (Names)';
        }
        field(69; Date; Date)
        {
            Caption = 'Date';
        }
        field(70; "Job Title/Position"; Text[50])
        {
            Caption = 'Job Title/Position';
        }
        field(93; "Cert Und We"; Text[30])
        {
            Caption = 'Cert Und We';
        }
        field(94; "Cert Und Tenderer"; Text[30])
        {
            Caption = 'Cert Und Tenderer';
        }
        field(95; "Cert Und Address"; Text[30])
        {
            Caption = 'Cert Und Address';
        }
        field(96; "Cert Und Telephone"; Text[30])
        {
            Caption = 'Cert Und Telephone';
        }
        field(97; "Cert Und Fax"; Text[30])
        {
            Caption = 'Cert Und Fax';
        }
        field(98; "Cert Und Email"; Text[30])
        {
            Caption = 'Cert Und Email';
        }
        field(99; "Cert Und Mobile"; Text[30])
        {
            Caption = 'Cert Und Mobile';
        }
        field(100; "Cert Und Witness"; Text[30])
        {
            Caption = 'Cert Und Witness';
        }
        field(101; "Cert Und Address 2"; Text[30])
        {
            Caption = 'Cert Und Address 2';
        }
        field(102; "Cert Und Telephone 2"; Text[30])
        {
            Caption = 'Cert Und Telephone 2';
        }
        field(103; "Cert Und Fax 2"; Text[30])
        {
            Caption = 'Cert Und Fax 2';
        }
        field(104; "TOTO We"; Text[30])
        {
            Caption = 'TOTO We';
        }
        field(105; "TOTO Contribution Form"; Text[30])
        {
            Caption = 'TOTO Contribution Form';
        }
        field(106; "TOTO Tenderer"; Text[30])
        {
            Caption = 'TOTO Tenderer';
        }
        field(107; "TOTO Address"; Text[30])
        {
            Caption = 'TOTO Address';
        }
        field(108; "TOTO Email"; Text[30])
        {
            Caption = 'TOTO Email';
        }
        field(109; "TOTO Telephone"; Text[30])
        {
            Caption = 'TOTO Telephone';
        }
        field(110; "TOTO Fax"; Text[30])
        {
            Caption = 'TOTO Fax';
        }
        field(111; "BD Account No"; Code[20])
        {
            Caption = 'BD Account No';
        }
        field(112; "BD Account Name"; Text[50])
        {
            Caption = 'BD Account Name';
        }
        field(113; "BD Bank Name"; Text[50])
        {
            Caption = 'BD Bank Name';
        }
        field(114; "BD Bank Code"; Code[20])
        {
            Caption = 'BD Bank Code';
        }
        field(115; "BD Branch Name"; Text[50])
        {
            Caption = 'BD Branch Name';
        }
        field(116; "BD Branch Code"; Code[20])
        {
            Caption = 'BD Branch Code';
        }
        field(39004242; MyRecId; RecordId)
        {
            Caption = 'MyRecId';
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
