#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193575 "prSalary Scale"
{
    Caption = 'prSalary Scale';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Grade; Code[20])
        {
            Caption = 'Grade';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Minimum Pay"; Decimal)
        {
            Caption = 'Minimum Pay';
            trigger OnValidate()
            begin
                SalaryScale.Reset();
                SalaryScale.SetRange(SalaryScale."Minimum Pay", "Minimum Pay");
                if SalaryScale.Find('-') then
                    Error(Txt001);

                SalaryScale.Reset();
                SalaryScale.SetRange(SalaryScale."Maximum Pay", "Minimum Pay");
                if SalaryScale.Find('-') then
                    Error(Txt001);
            end;
        }
        field(4; "Maximum Pay"; Decimal)
        {
            Caption = 'Maximum Pay';
            trigger OnValidate()
            begin
                SalaryScale.Reset();
                SalaryScale.SetRange(SalaryScale."Minimum Pay", "Maximum Pay");
                if SalaryScale.Find('-') then
                    Error(Txt001);

                SalaryScale.Reset();
                SalaryScale.SetRange(SalaryScale."Maximum Pay", "Maximum Pay");
                if SalaryScale.Find('-') then
                    Error(Txt001);
            end;
        }
    }

    keys
    {
        key(Key1; Grade)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Grade, Description, "Minimum Pay", "Maximum Pay") { }
    }

    var
        SalaryScale: Record "prSalary Scale";
        Txt001: Label 'Scale already exists';
}
