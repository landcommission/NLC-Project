#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193894 DMS
{
    Caption = 'DMS';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "DMS Link Type"; Option)
        {
            OptionMembers = " ","Staff File","Job Card","Emp Req","Job App",Leave,Transport,Training,Appraisal,Disciplinary,"Exit",Payroll,succeed;
            Caption = 'DMS Link Type';
        }
        field(2; "DMS Link Path"; Text[250])
        {
            Caption = 'DMS Link Path';
        }
    }

    keys
    {
        key(Key1; "DMS Link Type")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
