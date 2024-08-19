table 52193904 "HR Employee Changes Requests"
{
    Caption = 'HR Employee Changes Requests';
    DataClassification = ToBeClassified;
    DrillDownPageId = "HR Transport Requisition List";
    LookupPageId = "HR Transport Requisition List";

    fields
    {
        field(1; "Request No"; Code[20])
        {
            Caption = 'Transport Request No';
            trigger OnValidate()
            begin

                //TEST IF MANUAL NOs ARE ALLOWED
                if "Request No" <> xRec."Request No" then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(HRSetup."Transport Req Nos");
                    "No series" := '';
                end;
            end;
        }
        field(2; "Document Type"; Option)
        {
            Editable = true;
            OptionCaption = 'New,Pending Approval,Rejected,Approved';
            OptionMembers = New,"Pending Approval",Rejected,Approved;
            Caption = 'Status';
        }


        field(3; Status; Option)
        {
            Editable = true;
            OptionCaption = 'New,Pending Approval,Rejected,Approved';
            OptionMembers = New,"Pending Approval",Rejected,Approved;
            Caption = 'Status';
        }

        field(17; "No series"; Code[30])
        {
            Caption = 'No series';
        }



    }
    keys
    {
        key(Key1; "Request No")
        {
            Clustered = true;
        }
    }
    var
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
