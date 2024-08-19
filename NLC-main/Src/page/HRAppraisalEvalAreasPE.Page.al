#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194094 "HR Appraisal Eval Areas - PE"
{
    ApplicationArea = Basic;
    Caption = 'HR Appraisal Evaluation Areas - Employee''s Peers';
    PageType = List;
    SourceTable = "HR Appraisal Eval Areas";
    SourceTableView = where("Categorize As" = const("Employee's Peers"));
    UsageCategory = Tasks;

    layout
    {
        area(Content)
        {
            repeater(Control1102760000)
            {
                Editable = true;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                    trigger OnValidate()
                    begin
                        Rec.TestField(Rec.Code);
                    end;
                }
                field("Categorize As"; Rec."Categorize As")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Categorize As field.';
                }
                field("Sub Category"; Rec."Sub Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Category field.';
                }
                field("Include in Evaluation Form"; Rec."Include in Evaluation Form")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Include in Evaluation Form field.';
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Period field.';
                }
            }
        }
    }

    actions { }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Categorize As" := Rec."Categorize As"::"Employee's Peers";
        Rec."Include in Evaluation Form" := true;
    end;
}
