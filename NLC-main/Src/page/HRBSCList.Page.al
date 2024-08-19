#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194118 "HR BSC List"
{
    CardPageId = "HR BSC Appraisal Header";
    PageType = List;
    SourceTable = "HR Individual Targets Header";
    SourceTableView = where(Status = filter(<> Posted));
    ApplicationArea = All;
    Caption = 'HR BSC List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Appraisal No"; Rec."Appraisal No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal No field.';
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Period field.';
                }
                field("Appraisal Date"; Rec."Appraisal Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Date field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Appraisal Year"; Rec."Appraisal Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Year field.';
                }
                field("Finance Rating"; Rec."Finance Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Finance Rating field.';
                }
                field("Customer Rating"; Rec."Customer Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Rating field.';
                }
                field("Training Rating"; Rec."Training Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Rating field.';
                }
                field("Service Rating"; Rec."Service Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Rating field.';
                }
                field("Overall Rating"; Rec."Overall Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Rating field.';
                }
            }
        }
    }

    actions { }

    trigger OnOpenPage()
    begin
        Rec.SetFilter(Rec."User ID", UserId);
    end;
}
