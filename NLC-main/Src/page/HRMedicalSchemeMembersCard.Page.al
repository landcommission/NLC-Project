#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194078 "HR Medical Scheme Members Card"
{
    PageType = Card;
    SourceTable = "HR Medical Scheme Members";
    ApplicationArea = All;
    Caption = 'HR Medical Scheme Members Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Scheme No"; Rec."Scheme No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheme No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Scheme Join Date"; Rec."Scheme Join Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheme Join Date field.';
                }
                field("Scheme Anniversary"; Rec."Scheme Anniversary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheme Anniversary field.';
                }
                field("Out-Patient Limit"; Rec."Out-Patient Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Out-Patient Limit field.';
                }
                field("Cumm.Amount Spent Out"; Rec."Cumm.Amount Spent Out")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cumm.Amount Spent Out field.';
                }
                field("Balance Out- Patient"; Rec."Balance Out- Patient")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance Out- Patient field.';
                }
                field("In-patient Limit"; Rec."In-patient Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the In-patient Limit field.';
                }
                field("Cumm.Amount Spent"; Rec."Cumm.Amount Spent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cumm.Amount Spent field.';
                }
                field("Balance In- Patient"; Rec."Balance In- Patient")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance In- Patient field.';
                }
                field("Maximum Cover"; Rec."Maximum Cover")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Cover field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("Medical Claims")
                {
                    ApplicationArea = Basic;
                    Caption = 'Medical Claims';
                    Image = PersonInCharge;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Medical Claims action.';
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        Medscheme.Reset();
        Medscheme.SetRange(Medscheme."Scheme No", Rec."Scheme No");
        if Medscheme.Find('-') then begin
            Rec."Out-Patient Limit" := Medscheme."Out-patient limit";
            Rec."In-patient Limit" := Medscheme."In-patient limit";
            Rec."Balance In- Patient" := Rec."In-patient Limit" - Rec."Cumm.Amount Spent";
            Rec."Balance Out- Patient" := Rec."Out-Patient Limit" - Rec."Cumm.Amount Spent Out";
        end;
    end;

    trigger OnInit()
    begin

        Medscheme.Reset();
        Medscheme.SetRange(Medscheme."Scheme No", Rec."Scheme No");
        if Medscheme.Find('-') then begin
            Rec."Out-Patient Limit" := Medscheme."Out-patient limit";
            Rec."In-patient Limit" := Medscheme."In-patient limit";
            Rec."Balance In- Patient" := Rec."In-patient Limit" - Rec."Cumm.Amount Spent";
            Rec."Balance Out- Patient" := Rec."Out-Patient Limit" - Rec."Cumm.Amount Spent Out";
        end;
    end;

    trigger OnOpenPage()
    begin
        Medscheme.Reset();
        Medscheme.SetRange(Medscheme."Scheme No", Rec."Scheme No");
        if Medscheme.Find('-') then begin
            Rec."Out-Patient Limit" := Medscheme."Out-patient limit";
            Rec."In-patient Limit" := Medscheme."In-patient limit";
            Rec."Balance In- Patient" := Rec."In-patient Limit" - Rec."Cumm.Amount Spent";
            Rec."Balance Out- Patient" := Rec."Out-Patient Limit" - Rec."Cumm.Amount Spent Out";
        end;
    end;

    var
        objSchMembers: Record "HR Medical Scheme Members";
        objScmDetails: Record "HR Medical Schemes";
        decInPatientBal: Decimal;
        Medscheme: Record "HR Medical Schemes";
}
