#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193820 "Lab Request Form"
{
    PageType = CardPart;
    SourceTable = "Lab request";
    ApplicationArea = All;
    Caption = 'Lab Request Form';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Proposal No."; Rec."Proposal No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposal No. field.';
                }
                field("Study Purpose/Use"; Rec."Study Purpose/Use")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study Purpose/Use field.';
                }
                field("Study Synopsis Attached"; Rec."Study Synopsis Attached")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study Synopsis Attached field.';
                }
                field("Lab Testing Algorithm Known"; Rec."Lab Testing Algorithm Known")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lab Testing Algorithm Known field.';
                }
                field("Test schedule/Vol./Repertoire"; Rec."Test schedule/Vol./Repertoire")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test schedule/Vol./Repertoire field.';
                }
                field("All Test Covered by Test List"; Rec."All Test Covered by Test List")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the All Test Covered by Test List field.';
                }
                field("Test List Description"; Rec."Test List Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test List Description field.';
                }
                field("Specimen/Isolates Processing"; Rec."Specimen/Isolates Processing")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specimen/Isolates Processing field.';
                }
                field("Specimen/Isolates Process Desc"; Rec."Specimen/Isolates Process Desc")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specimen/Isolates Process Desc field.';
                }
                field("Special Storage Required"; Rec."Special Storage Required")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special Storage Required field.';
                }
                field("Destroy Samples Per Protocol"; Rec."Destroy Samples Per Protocol")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destroy Samples Per Protocol field.';
                }
                field("Samples need to be Shipped"; Rec."Samples need to be Shipped")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Samples need to be Shipped field.';
                }
                field("Samples Shipped Desc"; Rec."Samples Shipped Desc")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Samples Shipped Desc field.';
                }
                field("Special Data/H.copy Storage"; Rec."Special Data/H.copy Storage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special Data/H.copy Storage field.';
                }
                field("Special Data/H.copy Desc."; Rec."Special Data/H.copy Desc.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special Data/H.copy Desc. field.';
                }
                field("Special Staff/working hrs Req."; Rec."Special Staff/working hrs Req.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special Staff/working hrs Req. field.';
                }
                field("Special Staff/working hrs Desc"; Rec."Special Staff/working hrs Desc")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special Staff/working hrs Desc field.';
                }
                field("Exp/Imp Permits Required"; Rec."Exp/Imp Permits Required")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exp/Imp Permits Required field.';
                }
                field("IREC Approval"; Rec."IREC Approval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IREC Approval field.';
                }
            }
        }
    }

    actions { }
}
