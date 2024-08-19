#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193498 "HR Training Cost"
{
    Caption = 'HR Training Cost';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Training ID"; Code[50])
        {
            Editable = false;
            Caption = 'Training ID';
        }
        field(2; "Cost Item"; Code[30])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter("Training Cost Items"));
            Caption = 'Cost Item';
            trigger OnValidate()
            var
                myInt: Integer;
                Vlooops: Record "HR Lookup Values";
            begin
                Validatedetails();
                Cost := 0;
                Vlooops.Reset();
                Vlooops.SetRange(Vlooops.Code, Rec."Cost Item");
                if Vlooops.FindFirst() then begin
                    rec.Cost := Vlooops."Maximum Pay";
                    Rec."Cost Item Description" := Vlooops.Description;
                end;

            end;
        }
        field(3; Cost; Decimal)
        {
            Caption = 'Cost';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Validatedetails();
            end;
        }
        field(4; "Cost Item Description"; Text[100])
        {
            Caption = 'Cost Item Description';
        }
    }

    keys
    {
        key(Key1; "Training ID", "Cost Item")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
    trigger OnDelete()
    var
        myInt: Integer;
    begin
        Validatedetails();

    end;

    trigger OnModify()
    var
        myInt: Integer;
    begin
        Validatedetails();

    end;

    trigger OnInsert()
    var
        myInt: Integer;
    begin
        Validatedetails();

    end;

    local procedure Validatedetails()
    var
        myInt: Integer;
        Traings: Record "HR Training Needs";
    begin
        Traings.Reset();
        Traings.SetRange(Traings.Code, Rec."Training ID");
        if Traings.FindFirst() then
            if Traings.Status <> Traings.Status::Open then
                Error('You cannot modify the record at this stage');

    end;
}
