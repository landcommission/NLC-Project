#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193927 "Tender Plan Header"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Tender Plan Header";
    UsageCategory = Tasks;
    Caption = 'Tender Plan Header';
    layout
    {
        area(Content)
        {
            group(Control1)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Workplan Code"; Rec."Workplan Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Code field.';
                }
                field("Workplan Description"; Rec."Workplan Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Workplan Description field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                    trigger OnValidate()
                    begin
                        if Rec."Proc. method number" <> '' then
                            Rec.UpdateLines();
                        CurrPage.SubPage1.Page.UpdtControls();
                    end;
                }
                field("Proc. method number"; Rec."Proc. method number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proc. method number field.';
                    trigger OnValidate()
                    begin
                        CurrPage.SubPage1.Page.UpdtControls();
                    end;
                }
                field("Proc. Method Name"; Rec."Proc. Method Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Proc. Method Name field.';
                }
            }
            part(SubPage1; "Tender Plan Lines")
            {
                SubPageLink = "Tender No." = field(No);
                SubPageView = sorting("Tender No.", Stage);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("Print/Preview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print/Preview';
                    ToolTip = 'Executes the Print/Preview action.';
                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetRange(Rec.No, Rec.No);

                        Report.Run(39005615, true, true, Rec);
                        Rec.Reset()
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        "Get Descriptions"();
        OnAfterGetCurrRecord();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnAfterGetCurrRecord();
    end;

    var
        Workplan: Record "Workplan Entry";
        Workplandet: Text[250];
        "RECTenderno.s": Record "Tender Plan Header";
        WorkPlanAct: Text[250];


    procedure "Get Descriptions"()
    begin
        WorkPlanAct := '';

        Workplan.Reset();
        Workplan.SetRange(Workplan."Workplan Code", Rec."Workplan Code");
        if Workplan.Find('-') then begin
            WorkPlanAct := Workplan."Workplan Code";
            Workplan."Workplan Code" := WorkPlanAct;
        end;
    end;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        "Get Descriptions"();
    end;
}
