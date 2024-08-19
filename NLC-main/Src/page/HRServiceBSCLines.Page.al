#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194113 "HR Service BSC Lines"
{
    PageType = ListPart;
    SourceTable = "HR Individual Target Line";
    SourceTableView = where("Perspective Type" = const("Service Delivery"));
    ApplicationArea = All;
    Caption = 'HR Service BSC Lines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Perspective Code"; Rec."Perspective Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Perspective Code field.';
                }
                field("Perspective Description"; Rec."Perspective Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Perspective Description field.';
                }
                field(Objective; Rec.Objective)
                {
                    ApplicationArea = Basic;
                    Editable = TargetSettingStatus;
                    Enabled = TargetSettingStatus;
                    ToolTip = 'Specifies the value of the Objective field.';
                }
                field("Targeted Score"; Rec."Targeted Score")
                {
                    ApplicationArea = Basic;
                    Editable = TargetSettingStatus;
                    Enabled = TargetSettingStatus;
                    ToolTip = 'Specifies the value of the Targeted Score field.';
                }
                field("Achieved Score"; Rec."Achieved Score")
                {
                    ApplicationArea = Basic;
                    Editable = SelfRating;
                    Enabled = SelfRating;
                    ToolTip = 'Specifies the value of the Achieved Score field.';
                }
                field("Unachieved Targets"; Rec."Unachieved Targets")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Unachieved Targets field.';
                }
                field("Self Rating"; Rec."Self Rating")
                {
                    ApplicationArea = Basic;
                    Editable = SelfRating;
                    Enabled = SelfRating;
                    ToolTip = 'Specifies the value of the Self Rating field.';
                }
                field("Supervisor Rating"; Rec."Supervisor Rating")
                {
                    ApplicationArea = Basic;
                    Editable = SupervisorRating;
                    Enabled = SupervisorRating;
                    ToolTip = 'Specifies the value of the Supervisor Rating field.';
                }
                field("Agreed Rating"; Rec."Agreed Rating")
                {
                    ApplicationArea = Basic;
                    Editable = AgreedRating;
                    Enabled = AgreedRating;
                    ToolTip = 'Specifies the value of the Agreed Rating field.';
                }
                field("Appraisee Comments"; Rec."Appraisee Comments")
                {
                    ApplicationArea = Basic;
                    Editable = SelfRating;
                    Enabled = SelfRating;
                    ToolTip = 'Specifies the value of the Appraisee Comments field.';
                }
                field("Appraiser Comments"; Rec."Appraiser Comments")
                {
                    ApplicationArea = Basic;
                    Editable = SupervisorRating;
                    Enabled = SupervisorRating;
                    ToolTip = 'Specifies the value of the Appraiser Comments field.';
                }
                field("Perspective Type"; Rec."Perspective Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Perspective Type field.';
                }
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    begin
        FnEdittableUnedittable();

        Rec."Perspective Type" := Rec."Perspective Type"::"Service Delivery";
    end;

    trigger OnInit()
    begin
        FnEdittableUnedittable();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        FnEdittableUnedittable();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        FnEdittableUnedittable();

        Rec."Perspective Type" := Rec."Perspective Type"::"Service Delivery";
    end;

    trigger OnOpenPage()
    begin
        FnEdittableUnedittable();
    end;

    var
        TargetSettingStatus: Boolean;
        AppraisalStatus: Boolean;
        SupervisorRating: Boolean;
        AgreedRating: Boolean;
        SelfRating: Boolean;


    procedure FnEdittableUnedittable()
    begin
        Rec.CalcFields(Rec."Appraisal Type", Rec.Status);
        if (Rec."Appraisal Type" = Rec."Appraisal Type"::"Target Setting") and (Rec.Status = Rec.Status::Open) then begin
            TargetSettingStatus := true;
            AppraisalStatus := false;
            SupervisorRating := false;
            AgreedRating := false;
            SelfRating := false;
        end else
            if (Rec."Appraisal Type" = Rec."Appraisal Type"::"Target Setting") and (Rec.Status <> Rec.Status::Open) then begin
                TargetSettingStatus := false;
                AppraisalStatus := false;
                SupervisorRating := false;
                AgreedRating := false;
                SelfRating := false;
            end else
                if ((Rec."Appraisal Type" = Rec."Appraisal Type"::"Appraisal Review") or (Rec."Appraisal Type" = Rec."Appraisal Type"::"End Year Appraisal"))
                 and (Rec.Status = Rec.Status::Open) then begin
                    TargetSettingStatus := false;
                    AppraisalStatus := true;
                    SupervisorRating := false;
                    AgreedRating := false;
                    SelfRating := true;
                end else
                    if ((Rec."Appraisal Type" = Rec."Appraisal Type"::"Appraisal Review") or (Rec."Appraisal Type" = Rec."Appraisal Type"::"End Year Appraisal"))
                    and (Rec.Status = Rec.Status::"Pending Approval") then begin
                        TargetSettingStatus := false;
                        AppraisalStatus := false;
                        SupervisorRating := true;
                        AgreedRating := true;
                        SelfRating := false;
                    end else
                        if ((Rec."Appraisal Type" = Rec."Appraisal Type"::"Appraisal Review") or (Rec."Appraisal Type" = Rec."Appraisal Type"::"End Year Appraisal"))
                        and (Rec.Status = Rec.Status::Approved) then begin
                            TargetSettingStatus := false;
                            AppraisalStatus := false;
                            SupervisorRating := false;
                            AgreedRating := false;
                            SelfRating := false;
                        end;
        if (Rec.Status = Rec.Status::Posted) then begin
            TargetSettingStatus := false;
            AppraisalStatus := false;
            SupervisorRating := false;
            AgreedRating := false;
            SelfRating := false;
        end
    end;
}
