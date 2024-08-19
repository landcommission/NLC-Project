#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194178 "Emp. Appraisal Training Needs"
{
    PageType = List;
    SourceTable = "HR Training Needs";
    ApplicationArea = All;
    Caption = 'Emp. Appraisal Training Needs';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field(Costs; Rec.Costs)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Costs field.';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field("Need Source"; Rec."Need Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Need Source field.';
                }
                field(Provider; Rec.Provider)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Provider field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Type field.';
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Description field.';
                }
                field("Provider Name"; Rec."Provider Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Provider Name field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Bondage Start Date"; Rec."Bondage Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bondage Start Date field.';
                }
                field("Bondage Duration"; Rec."Bondage Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bondage Duration field.';
                }
                field("Bondage Release Date"; Rec."Bondage Release Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bondage Release Date field.';
                }
                field("Bondage Required?"; Rec."Bondage Required?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bondage Required? field.';
                }
                field("No. of Training Cost Items"; Rec."No. of Training Cost Items")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Training Cost Items field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Early Bonded Exit?"; Rec."Early Bonded Exit?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Early Bonded Exit? field.';
                }
            }
        }
    }

    actions { }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        IndividualTargets.Reset();
        IndividualTargets.SetRange(IndividualTargets."Employee No", Rec."Employee No");
        if IndividualTargets.Find('-') then
            Rec."Employee No" := IndividualTargets."Employee No";
    end;


    var
        IndividualTargets: Record "HR Individual Targets Header";
}
