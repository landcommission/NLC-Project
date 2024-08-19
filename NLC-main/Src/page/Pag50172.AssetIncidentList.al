#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50172 "Asset Incident List"
{
    ApplicationArea = Basic;
    CardPageID = "Asset Incident Card";
    Editable = false;
    PageType = List;
    SourceTable = "Asset Incident";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(IncidentNo; Rec."Incident No.")
                {
                    ApplicationArea = Basic;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(IncidentType; Rec."Incident Type")
                {
                    ApplicationArea = Basic;
                }
                field(DateReported; Rec."Date Reported")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
            }
        }
    }

    actions
    {
    }
}
