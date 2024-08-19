#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193895 "Seconded Table"
{
    Caption = 'Seconded Table';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Seconded Start Date"; Date)
        {
            Caption = 'Seconded Start Date';
            trigger OnValidate()
            begin


                "Seconded End Date" := 0D;

                //IF ("Contract Type" = "Contract Type"::seconded/Contract) AND ("Contract Duration" <> '') THEN

                //IF ("Contract Type" = "Contract Type"::seconded/Contract) AND ("Contract Duration" <> '') THEN

                "Seconded End Date" := CalcDate("Seconded Duration", "Seconded Start Date");
            end;
        }
        field(2; "Seconded Duration"; Code[10])
        {
            Caption = 'Seconded Duration';
            trigger OnValidate()
            begin
                "Seconded End Date" := 0D;

                //IF ("Contract Type" = "Contract Type"::Seconded/Contract) AND ("Seconded Duration" <> '') THEN

                //IF ("Contract Type" = "Contract Type"::Seconded/Contract) AND ("Seconded Duration" <> '') THEN

                "Seconded End Date" := CalcDate("Seconded Duration", "Seconded Start Date");
            end;
        }
        field(3; "Seconded End Date"; Date)
        {
            Caption = 'Seconded End Date';
        }
    }

    keys
    {
        key(Key1; "Seconded Start Date")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
