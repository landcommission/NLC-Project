#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50015 "Attachment Lines"
{

    fields
    {
        field(1;"Auto No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Asset No.";Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(3;Type;Option)
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
            OptionCaption = 'Item,Asset,Service';
            OptionMembers = Item,Asset,Service;
        }
        field(4;Description;Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(5;Quantity;Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:5;

            trigger OnValidate()
            begin
                  if Price<>0 then
                  "Line Total":=Quantity*Price
            end;
        }
        field(6;"Unit of Measure";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Line No";Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Category;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Price;Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                  if Quantity<>0 then
                  "Line Total":=Quantity*Price
            end;
        }
        field(10;"Line Total";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Account Combination";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Req No";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Quot No";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Contr. No";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;Currency;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Processed Order No";Code[20])
        {
            CalcFormula = lookup("Store Requistion Headers"."No." where ("Purchase Order No"=field("IFMIS No")));
            FieldClass = FlowField;
        }
        field(17;"Asset Code";Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'For Asset Code as text';
        }
        field(19;"IFMIS No";Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'For Order No i.e 1820';
        }
        field(20;"IFMIS Code";Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'For Asset Code / Item Code not lookup .ie M00000988';
        }
        field(21;"Item No";Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Item No as Lookup';
            TableRelation = Item where (Blocked=const(false));
        }
    }

    keys
    {
        key(Key1;"Auto No","IFMIS No","IFMIS Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

