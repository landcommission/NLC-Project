#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69616 "Duty Station"
{
    PageType = List;
    SourceTable = "Duty Station";
    UsageCategory = Tasks;
    ApplicationArea = All;
    Caption = 'Duty Station';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
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
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field(Longitude; Rec.Longitude)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Longitude field.';
                }
                field(Latitude; Rec.Latitude)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Latitude field.';
                }
                field("Hardship Area"; Rec."Hardship Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hardship Area field.';
                }
                field("Approved Establishment"; Rec."Approved Establishment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Establishment field.';
                }
                field("No. of Active Employees"; Rec."No. of Active Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Active Employees field.';
                }

                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {

            action(VehicleEntitlement)
            {
                ApplicationArea = All;
                Promoted = true;
                Image = AdjustItemCost;
                Caption = 'Vehicle Entitlement';
                RunObject = page "Vehicle Entitlement";
                RunPageLink = "Station No" = field(Code);
                ToolTip = 'Executes the Vehicle Entitlement action.';
            }
        }
    }
}

#pragma implicitwith restore

