#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193644 "CshMgt Cash Request"
{
    Caption = 'CshMgt Cash Request';
    DataClassification = CustomerContent;
    //DrillDownPageID = UnknownPage39006033;
    //LookupPageID = UnknownPage39006033;

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = false;
            Caption = 'No.';
        }
        field(2; "Request Date"; Date)
        {
            Editable = false;
            Caption = 'Request Date';
        }
        field(3; "Request Time"; Time)
        {
            Editable = false;
            Caption = 'Request Time';
        }
        field(4; "Requester ID"; Code[20])
        {
            Editable = false;
            Caption = 'Requester ID';
            trigger OnValidate()
            begin
                //get the details of the person who is requesting for the cash
                begin
                    User.Reset();
                    User.Get("Requester ID");
                    Rec."Requester Name" := User."User Name";
                end;
            end;
        }
        field(5; "Request Amount"; Decimal)
        {
            Editable = true;
            Caption = 'Request Amount';
        }
        field(6; "Request From ID"; Code[20])
        {
            Editable = false;
            Caption = 'Request From ID';
            trigger OnValidate()
            begin
                //get the details of the person who is requesting for the cash
                begin
                    User.Reset();
                    User.Get("Request From ID");
                    Rec."Request From Name" := User."User Name";
                end;
            end;
        }
        field(7; "Request From Acc. No."; Code[20])
        {
            Editable = false;
            Caption = 'Request From Acc. No.';
        }
        field(8; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
        field(9; Posted; Boolean)
        {
            Editable = false;
            Caption = 'Posted';
        }
        field(10; "Posted By"; Code[20])
        {
            Editable = false;
            Caption = 'Posted By';
        }
        field(11; "Posted Date"; Date)
        {
            Editable = false;
            Caption = 'Posted Date';
        }
        field(12; "Posted Time"; Time)
        {
            Editable = false;
            Caption = 'Posted Time';
        }
        field(13; "Curr. Balance"; Decimal)
        {
            Editable = false;
            Caption = 'Curr. Balance';
        }
        field(14; "Max. Balance"; Decimal)
        {
            Editable = false;
            Caption = 'Max. Balance';
        }
        field(15; "Min. Balance"; Decimal)
        {
            Editable = false;
            Caption = 'Min. Balance';
        }
        field(16; "Request From Name"; Text[30])
        {
            Editable = false;
            Caption = 'Request From Name';
        }
        field(17; "Requester Name"; Text[30])
        {
            Editable = false;
            Caption = 'Requester Name';
        }
        field(18; "Requester Acc. No."; Code[20])
        {
            Editable = false;
            Caption = 'Requester Acc. No.';
        }
        field(19; "Amount Pending"; Decimal)
        {
            Caption = 'Amount Pending';
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

    var
        User: Record User;
}
