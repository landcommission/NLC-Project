#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 56035 "Case File"
{
    Caption = 'Case File';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Case ID"; Code[10])
        {
            Editable = false;
            Caption = 'Case ID';
            trigger OnValidate()
            begin
                if "Case ID" <> xRec."Case ID" then begin
                    NoSetup.Get();
                    NoSeriesMgt.TestManual(NoSetup."Case Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Court Case no"; Code[20])
        {
            Caption = 'Court Case no';
        }
        field(3; "Case Title"; Text[50])
        {
            Caption = 'Case Title';
        }
        field(4; "Case Brief"; Blob)
        {
            Subtype = UserDefined;
            Caption = 'Case Brief';
        }
        field(5; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(6; "Accused Name"; Text[60])
        {
            Caption = 'Accused Name';
        }
        field(7; "Accused Address"; Text[60])
        {
            Caption = 'Accused Address';
        }
        field(8; "Accused Phone No"; Code[20])
        {
            Caption = 'Accused Phone No';
        }
        field(9; "Complainant Name"; Text[60])
        {
            Caption = 'Complainant Name';
        }
        field(10; "Complainant Address"; Text[60])
        {
            Caption = 'Complainant Address';
        }
        field(11; "Complainant Phone No"; Code[20])
        {
            Caption = 'Complainant Phone No';
        }
        field(12; "Court Station"; Code[10])
        {
            Caption = 'Court Station';
            //TableRelation = "Station set-ups".Code;
        }
        field(13; "Main Investigator No"; Code[10])
        {
            Caption = 'Main Investigator No';

        }
        field(14; "Date Created"; Date)
        {
            Editable = false;
            Caption = 'Date Created';
        }
        field(15; "Time Created"; Date)
        {
            Editable = false;
            Caption = 'Time Created';
        }
        field(16; "Created By"; Code[50])
        {
            Editable = false;
            Caption = 'Created By';
        }
        field(17; Status; Option)
        {
            OptionCaption = 'Ongoing,Closed,Withdrawn';
            OptionMembers = Ongoing,Closed,Withdrawn;
            Caption = 'Status';
        }
        field(18; "Case Types"; Code[30])
        {
            TableRelation = "Case Set-Ups".Code;
            Caption = 'Case Types';
        }
        field(19; "Court Rank"; Code[10])
        {
            TableRelation = "Courts Structures".Code;
            Caption = 'Court Rank';
        }
        field(20; "Exhibit No"; Code[10])
        {
            TableRelation = Item."No.";
            Caption = 'Exhibit No';
            trigger OnValidate()
            begin
                if Exhibit.Get("Exhibit No") then
                    "Serial No" := Exhibit."Serial Nos.";
                //"Case ID":=Exhibit.
            end;
        }
        field(21; "Serial No"; Code[20])
        {
            Caption = 'Serial No';
        }
        field(22; "Case No"; Code[20])
        {
            Caption = 'Case No';
        }
        field(23; "Date Removed"; Date)
        {
            Caption = 'Date Removed';
        }
        field(24; "Date brought back"; Date)
        {
            Caption = 'Date brought back';
        }
        field(25; "Final Disposal Date"; Date)
        {
            Caption = 'Final Disposal Date';
        }
        field(26; "Exhibit Details"; Text[30])
        {
            Caption = 'Exhibit Details';
        }
        field(27; "Current Case File Location"; Code[10])
        {
            TableRelation = "Case Schedule";
            Caption = 'Current Case File Location';
        }
        field(28; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(29; "Year of the Case"; Text[30])
        {
            TableRelation = "Case Year Setups".Code;
            Caption = 'Year of the Case';
        }
        field(30; "Nature of Offence"; Text[60])
        {
            Caption = 'Nature of Offence';
        }
        field(31; "Case Outcome"; Option)
        {
            OptionCaption = ',Won,Lost';
            OptionMembers = ,Won,Lost;
            Caption = 'Case Outcome';
        }
        field(32; "Decretal Amount"; Decimal)
        {
            Caption = 'Decretal Amount';
        }
        field(33; "Awarded Amount"; Decimal)
        {
            Caption = 'Awarded Amount';
        }
        field(34; "Payment Status"; Option)
        {
            OptionCaption = ',Partially Paid,Fully Paid';
            OptionMembers = ,"Partially Paid","Fully Paid";
            Caption = 'Payment Status';
        }
        field(35; "Payment Amount"; Decimal)
        {
            Caption = 'Payment Amount';
            trigger OnValidate()
            begin
                "Outstanding Amount" := "Awarded Amount" - "Payment Amount";
            end;
        }
        field(36; "Outstanding Amount"; Decimal)
        {
            Editable = false;
            Caption = 'Outstanding Amount';
        }
        field(37; "Exhibit Disposed"; Boolean)
        {
            Caption = 'Exhibit Disposed';
        }
        field(38; "Main Investigator Name"; Text[250])
        {
            Caption = 'Main Investigator Name';
        }
        field(39; "Arresting Officer No"; Code[50])
        {
            TableRelation = "HR Employees";
            Caption = 'Arresting Officer No';
            trigger OnValidate()
            begin
                if Employee.Get("Arresting Officer No") then
                    "Arresting Officer Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
            end;
        }
        field(40; "Arresting Officer Name"; Text[250])
        {
            Caption = 'Arresting Officer Name';
        }
        field(41; "Nature of cause of action"; Text[250])
        {
            Caption = 'Nature of cause of action';
        }
        field(42; "Interim Orders"; Text[250])
        {
            Caption = 'Interim Orders';
        }
    }

    keys
    {
        key(Key1; "Case ID")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if "Case ID" = '' then begin
            NoSetup.Get();
            NoSetup.TestField(NoSetup."Case Nos");
            NoSeriesMgt.InitSeries(NoSetup."Case Nos", xRec."No. Series", 0D, "Case ID", "No. Series");
        end;

        "Date Created" := Today;
        "Created By" := UserId;
        "Time Created" := "Time Created";
        "Document Date" := Today;
    end;

    var
        NoSetup: Record "Copyright Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Exhibit: Record Item;
        Employee: Record Employee;
        CaseInvestigator: Record "Case Investigator";
}

