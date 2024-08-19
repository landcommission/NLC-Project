#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50176 "Repair Recommendation Card"
{
    PageType = Card;
    SourceTable = "Repair Recommendation";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field(LineNo; Rec."Line No")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field(RepairNo; Rec."Repair No")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field(VehicleNo; Rec."Vehicle No")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field(Recommendationbyofficer; Rec."Recommendation by officer")
            {
                ApplicationArea = Basic;
                MultiLine = true;
            }
        }
    }

    actions
    {
    }
}
