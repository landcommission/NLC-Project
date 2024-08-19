#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193678 "Daily Diesel Tracking"
{
    Caption = 'Daily Diesel Tracking';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Doc No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Doc No.';
        }
        field(2; Date; Date)
        {
            Caption = 'Date';
        }
        field(3; "Opening Litres"; Decimal)
        {
            Caption = 'Opening Litres';
        }
        field(4; "Time on"; Time)
        {
            Caption = 'Time on';
        }
        field(5; "Time Off"; Time)
        {
            Caption = 'Time Off';
            trigger OnValidate()
            begin
                "Time Run" := "Time Off" - "Time on";
            end;
        }
        field(6; "Time Run"; Decimal)
        {
            Caption = 'Time Run';
            trigger OnValidate()
            begin
                if "Time Run" > 0 then
                    "Hours Run" := "Time Run" / 60;
                //*8.5;
            end;
        }
        field(7; "Total Fuel Consumed"; Decimal)
        {
            Caption = 'Total Fuel Consumed';
        }
        field(8; "Closing Balance"; Decimal)
        {
            Caption = 'Closing Balance';
        }
        field(9; Remarks; Text[100])
        {
            Caption = 'Remarks';
        }
        field(10; "User Id"; Code[50])
        {
            Caption = 'User Id';
        }
        field(11; "DateTime Entered"; DateTime)
        {
            Caption = 'DateTime Entered';
        }
        field(12; "Hours Run"; Decimal)
        {
            Editable = false;
            Caption = 'Hours Run';
        }
        field(13; "Week No"; Integer)
        {
            Caption = 'Week No';
        }
        field(14; "Opening Mileage(Hrs)"; Integer)
        {
            Caption = 'Opening Mileage(Hrs)';
            trigger OnValidate()
            begin
                CalculateMileage();
            end;
        }
        field(15; "Opening Mileage(Minutes)"; Integer)
        {
            Caption = 'Opening Mileage(Minutes)';
            trigger OnValidate()
            begin
                CalculateMileage();
            end;
        }
        field(16; "Closing Mileage(Hrs)"; Integer)
        {
            Caption = 'Closing Mileage(Hrs)';
            trigger OnValidate()
            begin
                CalculateMileage();
            end;
        }
        field(17; "Closing Mileage(Minutes)"; Integer)
        {
            Caption = 'Closing Mileage(Minutes)';
            trigger OnValidate()
            begin
                CalculateMileage();
            end;
        }
        field(18; "Generator Number"; Integer)
        {
            Caption = 'Generator Number';
        }
        field(19; "Calculated Fuel Consumed"; Decimal)
        {
            Caption = 'Calculated Fuel Consumed';
        }
        field(20; "Net Opening Mileage"; Decimal)
        {
            Caption = 'Net Opening Mileage';
        }
        field(21; "Net Closing Mileage"; Decimal)
        {
            Caption = 'Net Closing Mileage';
        }
        field(22; "Net Mileage"; Decimal)
        {
            Caption = 'Net Mileage';
        }
        field(23; Posted; Boolean)
        {
            Caption = 'Posted';
        }
    }

    keys
    {
        key(Key1; "Doc No.")
        {
            Clustered = true;
        }
        key(Key2; Date) { }
        key(Key3; "Week No") { }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        DailyDieselTracking.Reset();
        if DailyDieselTracking.FindLast() then
            "Opening Litres" := DailyDieselTracking."Closing Balance";
        Date := Today;
        "DateTime Entered" := CurrentDateTime;
        "User Id" := UserId;
        "Week No" := Date2DWY(Date, 2);
    end;

    var
        DailyDieselTracking: Record "Daily Diesel Tracking";


    procedure CalculateMileage()
    begin
        "Net Opening Mileage" := "Opening Mileage(Hrs)" + ("Opening Mileage(Minutes)" / 60);
        "Net Closing Mileage" := "Closing Mileage(Hrs)" + ("Closing Mileage(Minutes)" / 60);
        "Net Mileage" := "Net Closing Mileage" - "Net Opening Mileage";
        "Calculated Fuel Consumed" := "Net Mileage" * 8.5;
    end;
}
