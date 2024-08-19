#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193433 "HR Jobs List"
{
    ApplicationArea = Basic;
    CardPageId = "HR Jobs Card";
    DeleteAllowed = false;
    InsertAllowed = true;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Functions,Job,Administration';
    RefreshOnActivate = true;
    SourceTable = "HR Jobs";
    UsageCategory = Lists;
    Caption = 'HR Jobs List';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Title';
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("No of Posts"; Rec."No of Posts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Posts field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
        area(FactBoxes)
        {
            part("<Page39003906>"; "HR Jobs Factbox")
            {
                SubPageLink = "Job ID" = field("Job ID");
            }
            systempart(Control1102755004; Outlook) { }
        }
    }

    actions { }

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
    //AppMgmt: Codeunit "Export F/O Consolidation";
}
