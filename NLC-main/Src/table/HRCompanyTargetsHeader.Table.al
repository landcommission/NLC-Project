#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193432 "HR Company Targets Header"
{
    Caption = 'HR Company Targets Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Appraisal no"; Code[20])
        {
            Caption = 'Appraisal no';
        }
        field(2; "Appraisal Period"; Date)
        {
            TableRelation = "HR Appraisal Period"."Appraisal Period";
            Caption = 'Appraisal Period';
        }
        field(3; "Appraisal Date"; Date)
        {
            Caption = 'Appraisal Date';
        }
        field(4; "Employee No"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No';
        }
        field(5; "Financial Targeted Score"; Decimal)
        {
            CalcFormula = sum("HR Individual Target Line"."Targeted Score" where("Perspective Type" = filter("Financial Stewardship")));
            FieldClass = FlowField;
            Caption = 'Financial Targeted Score';
            Editable = false;
        }
        field(7; "Achieved Financial  Score"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Achieved Financial  Score';
        }
        field(8; "Unachieved Targets"; Decimal)
        {
            Caption = 'Unachieved Targets';
        }
        field(9; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
        }
        field(10; "Training Targeted Score"; Decimal)
        {
            CalcFormula = sum("HR Individual Target Line"."Targeted Score" where("Perspective Type" = filter("Training and Development")));
            FieldClass = FlowField;
            Caption = 'Training Targeted Score';
            Editable = false;
        }
        field(11; "Service Delivery Target Score"; Decimal)
        {
            CalcFormula = sum("HR Individual Target Line"."Targeted Score" where("Perspective Type" = filter("Service Delivery")));
            FieldClass = FlowField;
            Caption = 'Service Delivery Target Score';
            Editable = false;
        }
        field(12; "Customer Target Score"; Decimal)
        {
            CalcFormula = sum("HR Individual Target Line"."Targeted Score" where("Perspective Type" = filter("Customer and Sales")));
            FieldClass = FlowField;
            Caption = 'Customer Target Score';
            Editable = false;
        }
        field(13; "Customer Achieved  Score"; Decimal)
        {
            Caption = 'Customer Achieved  Score';
        }
        field(14; "Service Delivery Achieved"; Decimal)
        {
            Caption = 'Service Delivery Achieved';
        }
        field(15; "Training Achieved  Score"; Decimal)
        {
            Caption = 'Training Achieved  Score';
        }
    }

    keys
    {
        key(Key1; "Appraisal no")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
