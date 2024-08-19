#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193551 "Base Calendar Entries SubfrmNe"
{
    Caption = 'Lines';
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = Date;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field(CurrentCalendarCode; CurrentCalendarCode)
                {
                    ApplicationArea = Basic;
                    Caption = 'Base Calendar Code';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Base Calendar Code field.';
                }
                field("Period Start"; Rec."Period Start")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date';
                    Editable = false;
                    ToolTip = 'Specifies the starting date of the period that you want to view.';
                }
                field("Period Name"; Rec."Period Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Day';
                    Editable = false;
                    ToolTip = 'Specifies the name of the period shown in the line.';
                }
                field(WeekNo; WeekNo)
                {
                    ApplicationArea = Basic;
                    Caption = 'Week No.';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Week No. field.';
                }
                field(Nonworking; Nonworking)
                {
                    ApplicationArea = Basic;
                    Caption = 'Nonworking';
                    Editable = true;
                    ToolTip = 'Specifies the value of the Nonworking field.';
                    trigger OnValidate()
                    begin
                        UpdateBaseCalendarChanges();
                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    ToolTip = 'Specifies the value of the Description field.';
                    trigger OnValidate()
                    begin
                        UpdateBaseCalendarChanges();
                    end;
                }
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    begin
        //Nonworking := CalendarMgmt.CheckDateStatus(CurrentCalendarCode,Rec."Period Start",Description);
        WeekNo := Date2DWY(Rec."Period Start", 2);
        CurrentCalendarCodeOnFormat();
        PeriodStartOnFormat();
        PeriodNameOnFormat();
        DescriptionOnFormat();
    end;

    trigger OnFindRecord(Which: Text): Boolean
    begin
        exit(PeriodFormMgt.FindDate(Which, Rec, ItemPeriodLength));
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        exit(PeriodFormMgt.NextDate(Steps, Rec, ItemPeriodLength));
    end;

    trigger OnOpenPage()
    begin
        Rec.Reset();
        Rec.SetFilter(Rec."Period Start", '>=%1', 00000101D);
    end;

    var
        PeriodFormMgt: Codeunit PeriodFormManagement;
        ItemPeriodLength: Option Day,Week,Month,Quarter,Year,Period;
        Nonworking: Boolean;
        Description: Text[50];
        CurrentCalendarCode: Code[10];
        CalendarMgmt: Codeunit "Calendar Management";
        BaseCalendarChange: Record "prEmployee Salary Ledger";
        WeekNo: Integer;


    procedure SetCalendarCode(CalendarCode: Code[10])
    begin
        CurrentCalendarCode := CalendarCode;
        CurrPage.Update();
    end;


    procedure UpdateBaseCalendarChanges()
    begin
        /*{
        BaseCalendarChange.RESET;
        BaseCalendarChange.SETRANGE("Employee Code",CurrentCalendarCode);
        BaseCalendarChange.SETRANGE("Transaction Name 2","Period Start");
        IF BaseCalendarChange.FINDFIRST THEN
          BaseCalendarChange.DELETE;
        BaseCalendarChange.INIT;
        BaseCalendarChange."Employee Code" := CurrentCalendarCode;
        BaseCalendarChange."Transaction Name 2" := "Period Start";
        BaseCalendarChange.Balance := Description;
        BaseCalendarChange."Original Amount" := Nonworking;
        BaseCalendarChange.Amount := "Period No.";
        BaseCalendarChange.INSERT;
        }*/

    end;


    procedure ShowMonthlyCalendar()
    var
        GraphicCalendar: Page "Monthly Calendar";
    begin
        //GraphicCalendar.SetCalendarCode(1,0,'','',CurrentCalendarCode,Rec."Period Start");
        GraphicCalendar.Run();
    end;

    local procedure CurrentCalendarCodeOnFormat()
    begin
        if Nonworking then;
    end;

    local procedure PeriodStartOnFormat()
    begin
        if Nonworking then;
    end;

    local procedure PeriodNameOnFormat()
    begin
        if Nonworking then;
    end;

    local procedure DescriptionOnFormat()
    begin
        if Nonworking then;
    end;
}
