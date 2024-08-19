#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194109 "HR Company Targets Header"
{
    PageType = Card;
    SourceTable = "HR Company Targets Header";
    ApplicationArea = All;
    Caption = 'HR Company Targets Header';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Appraisal no"; Rec."Appraisal no")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal no field.';
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
                field("Financial Targeted Score"; Rec."Financial Targeted Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Targeted Score field.';
                }
                field("Achieved Financial  Score"; Rec."Achieved Financial  Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achieved Financial  Score field.';
                }
                field("Unachieved Targets"; Rec."Unachieved Targets")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unachieved Targets field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Training Targeted Score"; Rec."Training Targeted Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Targeted Score field.';
                }
                field("Service Delivery Target Score"; Rec."Service Delivery Target Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Delivery Target Score field.';
                }
                field("Customer Target Score"; Rec."Customer Target Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Target Score field.';
                }
                field("Customer Achieved  Score"; Rec."Customer Achieved  Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Achieved  Score field.';
                }
                field("Service Delivery Achieved"; Rec."Service Delivery Achieved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Delivery Achieved field.';
                }
                field("Training Achieved  Score"; Rec."Training Achieved  Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Achieved  Score field.';
                }
            }
            part(Control1000000016; "HR Company Target Line")
            {
                SubPageLink = "Appraisal No" = field("Appraisal no");
            }
        }
    }

    actions { }
}
