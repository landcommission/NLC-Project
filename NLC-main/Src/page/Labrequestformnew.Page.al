#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193896 "Lab request form new"
{
    PageType = Card;
    SourceTable = "Investigator Information";
    ApplicationArea = All;
    Caption = 'Lab request form new';
    layout
    {
        area(Content)
        {
            group("Lab Requirements")
            {
                field("LTA Test  Known"; Rec."LTA Test  Known")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lab testing algorithm known field.';
                }
                field("LTA Proposal Submission"; Rec."LTA Proposal Submission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Algorithm included with this proposal submission field.';
                }
                field("LTA Description"; Rec."LTA Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Describe proposed testing schedule field.';
                }
                field("Covered Tests"; Rec."Covered Tests")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Are all test lists covered by current test list? field.';
                }
                field("SPR study"; Rec."SPR study")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special processing requirements required? field.';
                }
                field("SPR Description"; Rec."SPR Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Describe special processing required field.';
                }
                field("Sample Storage Requirements"; Rec."Sample Storage Requirements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special storage requirements for samples? field.';
                }
                field("SSR Destruction prot"; Rec."SSR Destruction prot")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special protocol required for sample destruction? field.';
                }
                field("SSR Shipment?"; Rec."SSR Shipment?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Do samples need to be shipped? field.';
                }
                field("SSR Description"; Rec."SSR Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Describe above special requirements field.';
                }
                field("Data Storage Requirements"; Rec."Data Storage Requirements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special data storage requirements? field.';
                }
                field("DSR Description"; Rec."DSR Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Describe special data storage requirements field.';
                }
                field("Special Requirements"; Rec."Special Requirements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special Requirements for laboratory staff? field.';
                }
                field("Odd Working Hours"; Rec."Odd Working Hours")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is there need for extended working hours field.';
                }
                field("Odd working hours description"; Rec."Odd working hours description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Describe above field.';
                }
            }
        }
    }

    actions { }
}
