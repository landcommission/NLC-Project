#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193749 "Job-Entry No."
{
    Caption = 'Job Entry No.';
    PasteIsValid = false;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            Editable = false;
        }
        field(2; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            Editable = false;
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


    procedure GetNextEntryNo(): Integer
    begin
        LockTable();
        if not Get() then
            Insert();
        "Entry No." := "Entry No." + 1;
        Modify();
        exit("Entry No.");
    end;
}
