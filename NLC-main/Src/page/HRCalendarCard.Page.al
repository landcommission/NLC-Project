#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193508 "HR Calendar Card"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Functions';
    SourceTable = "HR Calendar";
    UsageCategory = Administration;
    Caption = 'HR Calendar Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Current; Rec.Current)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Current field.';
                }
            }
            part(Control1102755000; "HR Calendar Lines")
            {
                SubPageLink = Code = field(Code);
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action(CreateCalendar)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Calendar';
                    Image = CalculateCalendar;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Create Calendar action.';
                    trigger OnAction()
                    var
                        Text8000: Text;
                        TEXT0025: Label 'Saturday';
                        TEXT0026: Label 'Sunday';
                    begin
                        Rec.TestField(Rec.Code);
                        Rec.TestField(Rec."Start Date");
                        Rec.TestField(Rec."End Date");

                        if Confirm('Generate Calendar [%1]', false, Rec.Code) = true then begin
                            Date.Reset();
                            Date.SetRange(Date."Period Type", Date."Period Type"::Date);
                            Date.SetRange(Date."Period Start", Rec."Start Date", Rec."End Date");
                            if Date.Find('-') then begin
                                HRCalendarList.Reset();
                                HRCalendarList.DeleteAll();

                                repeat
                                    HRCalendarList.Init();

                                    HRCalendarList.Code := Rec.Code;
                                    HRCalendarList.Date := Date."Period Start";
                                    ;      // e.g 01-01-15


                                    HRCalendarList.Day := Date."Period Name";         // e.g Thursday
                                    HRCalendarList."Non Working" := fn_DetermineNonWorking(Date."Period Start");

                                    //Saturday
                                    if (Date."Period Name" = TEXT0025) and not (HRCalendarList."Non Working") then begin
                                        HRCalendarList."Non Working" := true;
                                        HRCalendarList.Reason := TEXT0025;
                                    end;
                                    //Sunday
                                    if (Date."Period Name" = TEXT0026) and not (HRCalendarList."Non Working") then begin
                                        HRCalendarList."Non Working" := true;
                                        HRCalendarList.Reason := TEXT0026;
                                    end;

                                    HRCalendarList.Insert();
                                until Date.Next() = 0;
                                Message('Process complete');
                            end else
                                Error('Invalid Date format');
                        end else
                            //Creation aborted
                            exit;
                    end;
                }
            }
        }
    }

    var
        Day: Date;
        Date: Record Date;
        HRCalendarList: Record "HR Calendar List";

    local procedure fn_DetermineNonWorking(currDate: Date) isNonWorking: Boolean
    var
        HRNonWorkingDays: Record "HR Non Working Days & Dates";
    begin
        isNonWorking := false;
        HRCalendarList.Reason := '';

        HRNonWorkingDays.Reset();
        if HRNonWorkingDays.Get(currDate) then begin
            isNonWorking := true;
            HRCalendarList.Reason := HRNonWorkingDays.Reason;
        end;
    end;
}
