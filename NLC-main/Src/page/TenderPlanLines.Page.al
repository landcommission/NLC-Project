#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193928 "Tender Plan Lines"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = ListPart;
    SourceTable = "Tender Plan Lines";
    ApplicationArea = All;
    Caption = 'Tender Plan Lines';
    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field(Stage; Rec.Stage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stage field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Planned start date"; Rec."Planned start date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned start date field.';
                }
                field("Planned end date"; Rec."Planned end date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned end date field.';
                }
                field("Planned duration"; Rec."Planned duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned duration field.';
                }
                field("Actual start date"; Rec."Actual start date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual start date field.';
                }
                field("Actual end date"; Rec."Actual end date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual end date field.';
                }
                field("Actual Duration"; Rec."Actual Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Duration field.';
                }
            }
        }
    }

    actions { }


    procedure UpdtControls()
    begin
        CurrPage.Update(true);
    end;
}
