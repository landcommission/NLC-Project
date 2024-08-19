#pragma implicitwith disable
page 52193954 "Vendor Appraisal"
{
    PageType = Card;
    SourceTable = "Evaluation Parameter Header";
    ApplicationArea = All;
    Caption = 'Vendor Appraisal';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Criteria Code"; Rec."Criteria Code")
                {
                    ToolTip = 'Specifies the value of the Criteria Code field.';
                }
                field("Criteria Description"; Rec."Criteria Description")
                {
                    ToolTip = 'Specifies the value of the Criteria Description field.';
                }
                field("Evaluation  Period"; Rec."Evaluation  Period")
                {
                    ToolTip = 'Specifies the value of the Evaluation  Period field.';
                }
                field("Total Expected Value"; Rec."Total Expected Value")
                {
                    ToolTip = 'Specifies the value of the Total Expected Value field.';
                }
                field("Overall Comment"; Rec."Overall Comment")
                {
                    ToolTip = 'Specifies the value of the Overall Comment field.';
                }
                field("Total Actuals Value"; Rec."Total Actuals Value")
                {
                    ToolTip = 'Specifies the value of the Total Actuals Value field.';
                }
            }
            part("Appraisal Performance"; "Appraisal Performance")
            {
                SubPageLink = Code = field("Criteria Code");
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

