page 50018 "HR Interpersonal Factors"
{
    ApplicationArea = All;
    Caption = 'HR Interpersonal Factors';
    PageType = Card;
    SourceTable = "HR Interpersonal Factors";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Agreed Ratings"; Rec."Agreed Ratings")
                {
                    ToolTip = 'Specifies the value of the Agreed Ratings field.';
                }
                field("Appraisal Code"; Rec."Appraisal Code")
                {
                    ToolTip = 'Specifies the value of the Appraisal Code field.';
                }
                field("Appraisee Comments"; Rec."Appraisee Comments")
                {
                    ToolTip = 'Specifies the value of the Appraisee Comments field.';
                }
                field("Attribute Description"; Rec."Attribute Description")
                {
                    ToolTip = 'Specifies the value of the Attribute Description field.';
                }
                field("Criteria Cluster"; Rec."Criteria Cluster")
                {
                    ToolTip = 'Specifies the value of the Criteria Cluster field.';
                }
                field("Criteria Cluster Description"; Rec."Criteria Cluster Description")
                {
                    ToolTip = 'Specifies the value of the Criteria Cluster Description field.';
                }
                field("Examples Behaviours"; Rec."Examples Behaviours")
                {
                    ToolTip = 'Specifies the value of the Examples Behaviours field.';
                }
                field("IF Description"; Rec."IF Description")
                {
                    ToolTip = 'Specifies the value of the IF Description field.';
                }
                field("Interpersonal Factors"; Rec."Interpersonal Factors")
                {
                    ToolTip = 'Specifies the value of the Interpersonal Factors field.';
                }
                field("Interpersonal Factors Text"; Rec."Interpersonal Factors Text")
                {
                    ToolTip = 'Specifies the value of the Interpersonal Factors Text field.';
                }
                field("No Series"; Rec."No Series")
                {
                    ToolTip = 'Specifies the value of the No Series field.';
                }
                field("Peer Comments"; Rec."Peer Comments")
                {
                    ToolTip = 'Specifies the value of the Peer Comments field.';
                }
                field("Peer Ratings"; Rec."Peer Ratings")
                {
                    ToolTip = 'Specifies the value of the Peer Ratings field.';
                }
                field(Ratings; Rec.Ratings)
                {
                    ToolTip = 'Specifies the value of the Ratings field.';
                }
                field("Supervisor Comments"; Rec."Supervisor Comments")
                {
                    ToolTip = 'Specifies the value of the Supervisor Comments field.';
                }
                field("Supervisor Ratings"; Rec."Supervisor Ratings")
                {
                    ToolTip = 'Specifies the value of the Supervisor Ratings field.';
                }
                field("Values Score"; "Values Score")
                {
                    ApplicationArea = all;
                    Caption = 'Values Scored';
                }
            }
        }
    }
}
