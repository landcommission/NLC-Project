table 50067 "HR Disclipline Cue"
{
    Caption = 'Disclipline Cue';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
        }
        field(2; "No of Submitted Cases"; Integer)
        {
            Caption = 'No of Submitted Cases';
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("HR Disciplinary Cases" where(Status = const(Submitted)));
            Editable = false;
        }
        field(3; "No of Open Cases"; Integer)
        {
            Caption = 'No of Open Cases';
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("HR Disciplinary Cases" where(Status = const(Open)));
            Editable = false;
        }
        field(4; "No of Closed Cases"; Integer)
        {
            Caption = 'No of Closed Cases';
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("HR Disciplinary Cases" where(Status = const(Closed)));
            Editable = false;
        }

        field(5; "Requests to Approve"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"),
                                                        Status = const(Open)));
            Caption = 'Requests to Approve';
            FieldClass = FlowField;
            Editable = false;
        }
        field(6; "Requests Sent for Approval"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Sender ID" = field("User ID Filter"),
                                                        Status = filter(Open)));
            Caption = 'Requests Sent for Approval';
            FieldClass = FlowField;
            Editable = false;
        }
        field(7; "User ID Filter"; Code[50])
        {
            Caption = 'User ID Filter';
            FieldClass = FlowFilter;
        }


    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
