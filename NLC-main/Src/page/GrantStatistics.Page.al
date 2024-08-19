#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193883 "Grant Statistics"
{
    Caption = 'Grant Statistics';
    Editable = false;
    LinksAllowed = false;
    PageType = Card;
    SourceTable = Jobs;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                label(Control11)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19080001;
                }
                label(Control55)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19012801;
                    Style = Strong;
                    StyleExpr = true;
                }
                label(Control15)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19011378;
                }
                field(Text000; Text000)
                {
                    ApplicationArea = Basic;
                    Caption = 'Price LCY';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Price LCY field.';
                }
                field(Control5; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field("PL[1]"; PL[1])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule field.';

                }
                field("PL[2]"; PL[2])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Price LCY (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Price LCY (Item) field.';

                }
                field("PL[5]"; PL[5])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage field.';

                }
                label(Control30)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19068736;
                    Style = Strong;
                    StyleExpr = true;
                }
                field("PL[6]"; PL[6])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Price LCY (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Price LCY (Item) field.';

                }
                field("PL[9]"; PL[9])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract field.';

                }
                field("PL[10]"; PL[10])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Price LCY (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Price LCY (Item) field.';

                }
                field("PL[13]"; PL[13])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced field.';

                }
                field("PL[14]"; PL[14])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Price LCY (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Price LCY (Item) field.';

                }
                field("Cost LCY"; Text000)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cost LCY';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cost LCY field.';
                }
                field(Control129; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field("CL[1]"; CL[1])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule field.';

                }
                field("CL[2]"; CL[2])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Cost LCY (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Cost LCY (Item) field.';

                }
                field("CL[5]"; CL[5])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage field.';

                }
                field("CL[6]"; CL[6])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Cost LCY (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Cost LCY (Item) field.';

                }
                field("CL[9]"; CL[9])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract field.';

                }
                label(Control72)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19073853;
                    Style = Strong;
                    StyleExpr = true;
                }
                field("CL[10]"; CL[10])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Cost LCY (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Cost LCY (Item) field.';

                }
                field("CL[13]"; CL[13])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced field.';

                }
                field("CL[14]"; CL[14])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Cost LCY (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Cost LCY (Item) field.';

                }
                field("Profit LCY"; Text000)
                {
                    ApplicationArea = Basic;
                    Caption = 'Profit LCY';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Profit LCY field.';
                }
                field(Control148; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field("PL[1] - CL[1]"; PL[1] - CL[1])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule field.';

                }
                field("PL[2] - CL[2]"; PL[2] - CL[2])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Profit LCY (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Profit LCY (Item) field.';

                }
                field("PL[5] - CL[5]"; PL[5] - CL[5])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage field.';

                }
                label(Control20)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19055809;
                }
                field(Control6; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field("PL[6] - CL[6]"; PL[6] - CL[6])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Profit LCY (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Profit LCY (Item) field.';

                }
                field("PL[9] - CL[9]"; PL[9] - CL[9])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract field.';

                }
                field("PL[10] - CL[10]"; PL[10] - CL[10])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Profit LCY (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Profit LCY (Item) field.';

                }
                field("PL[13] - CL[13]"; PL[13] - CL[13])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced field.';

                }
                field("PL[14] - CL[14]"; PL[14] - CL[14])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Profit LCY (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Profit LCY (Item) field.';

                }
                label(Control25)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19028226;
                }
                field(Control88; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field("PL[3]"; PL[3])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Price LCY (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Price LCY (G/L Acc.) field.';

                }
                field("PL[4]"; PL[4])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Price LCY (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Price LCY (Total) field.';

                }
                field("PL[7]"; PL[7])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Price LCY (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Price LCY (G/L Acc.) field.';

                }
                field("PL[8]"; PL[8])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Price LCY (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Price LCY (Total) field.';

                }
                field("PL[11]"; PL[11])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Price LCY (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Price LCY (G/L Acc.) field.';

                }
                field("PL[12]"; PL[12])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Price LCY (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Price LCY (Total) field.';

                }
                field("PL[15]"; PL[15])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Price LCY (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Price LCY (G/L Acc.) field.';

                }
                field("PL[16]"; PL[16])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Price LCY (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Price LCY (Total) field.';

                }
                field(Control145; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field(Control146; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field("CL[3]"; CL[3])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Cost LCY (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Cost LCY (G/L Acc.) field.';

                }
                field("CL[4]"; CL[4])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Cost LCY (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Cost LCY (Total) field.';

                }
                field("CL[7]"; CL[7])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Cost LCY (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Cost LCY (G/L Acc.) field.';

                }
                field("CL[8]"; CL[8])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Cost LCY (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Cost LCY (Total) field.';

                }
                field("CL[11]"; CL[11])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Cost LCY (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Cost LCY (G/L Acc.) field.';

                }
                field("CL[12]"; CL[12])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Cost LCY (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Cost LCY (Total) field.';

                }
                field("CL[15]"; CL[15])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Cost LCY (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Cost LCY (G/L Acc.) field.';

                }
                field("CL[16]"; CL[16])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Cost LCY (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Cost LCY (Total) field.';

                }
                field(Control149; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field(Control150; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field("PL[3] - CL[3]"; PL[3] - CL[3])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Profit LCY (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Profit LCY (G/L Acc.) field.';

                }
                field("PL[4] - CL[4]"; PL[4] - CL[4])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Profit LCY (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Profit LCY (Total) field.';

                }
                field("PL[7] - CL[7]"; PL[7] - CL[7])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Profit LCY (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Profit LCY (G/L Acc.) field.';

                }
                field("PL[8] - CL[8]"; PL[8] - CL[8])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Profit LCY (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Profit LCY (Total) field.';

                }
                field("PL[11] - CL[11]"; PL[11] - CL[11])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Profit LCY (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Profit LCY (G/L Acc.) field.';

                }
                field("PL[12] - CL[12]"; PL[12] - CL[12])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Profit LCY (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Profit LCY (Total) field.';

                }
                field("PL[15] - CL[15]"; PL[15] - CL[15])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Profit LCY (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Profit LCY (G/L Acc.) field.';

                }
                field("PL[16] - CL[16]"; PL[16] - CL[16])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Profit LCY (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Profit LCY (Total) field.';

                }
            }
            group(Currency)
            {
                Caption = 'Currency';
                label(Control103)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19057252;
                }
                label(Control75)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19059736;
                    Style = Strong;
                    StyleExpr = true;
                }
                label(Control117)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19080002;
                }
                field(Price; Text000)
                {
                    ApplicationArea = Basic;
                    Caption = 'Price';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Price field.';
                }
                field(Control152; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field("P[1]"; P[1])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule field.';

                }
                field("P[2]"; P[2])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Price (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Price (Item) field.';

                }
                field("P[5]"; P[5])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage field.';

                }
                label(Control80)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19077570;
                    Style = Strong;
                    StyleExpr = true;
                }
                field("P[6]"; P[6])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Price (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Price (Item) field.';

                }
                field("P[9]"; P[9])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract field.';

                }
                field("P[10]"; P[10])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Price (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Price (Item) field.';

                }
                field("P[13]"; P[13])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced field.';

                }
                field("P[14]"; P[14])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Price (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Price (Item) field.';

                }
                field(Cost; Text000)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cost';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cost field.';
                }
                field(Control156; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field("C[1]"; C[1])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule field.';

                }
                field("C[2]"; C[2])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Cost (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Cost (Item) field.';

                }
                field("C[5]"; C[5])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage field.';

                }
                field("C[6]"; C[6])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Cost (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Cost (Item) field.';

                }
                field("C[9]"; C[9])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract field.';

                }
                label(Control85)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19075586;
                    Style = Strong;
                    StyleExpr = true;
                }
                field("C[10]"; C[10])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Cost (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Cost (Item) field.';

                }
                field("C[13]"; C[13])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced field.';

                }
                field("C[14]"; C[14])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Cost (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Cost (Item) field.';

                }
                field(Profit; Text000)
                {
                    ApplicationArea = Basic;
                    Caption = 'Profit';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Profit field.';
                }
                field(Control160; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field("P[1] - C[1]"; P[1] - C[1])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule field.';

                }
                field("P[2] - C[2]"; P[2] - C[2])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Profit (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Profit (Item) field.';

                }
                field("P[5] - C[5]"; P[5] - C[5])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage field.';

                }
                label(Control131)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19080003;
                }
                field(Control153; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field("P[6] - C[6]"; P[6] - C[6])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Profit (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Profit (Item) field.';

                }
                field("P[9] - C[9]"; P[9] - C[9])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract field.';

                }
                field("P[10] - C[10]"; P[10] - C[10])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Profit (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Profit (Item) field.';

                }
                field("P[13] - C[13]"; P[13] - C[13])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced field.';

                }
                field("P[14] - C[14]"; P[14] - C[14])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Profit (Item)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Profit (Item) field.';

                }
                label(Control144)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19080004;
                }
                field(Control154; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field("P[3]"; P[3])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Price (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Price (G/L Acc.) field.';

                }
                field("P[4]"; P[4])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Price (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Price (Total) field.';

                }
                field("P[7]"; P[7])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Price (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Price (G/L Acc.) field.';

                }
                field("P[8]"; P[8])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Price (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Price (Total) field.';

                }
                field("P[11]"; P[11])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Price (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Price (G/L Acc.) field.';

                }
                field("P[12]"; P[12])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Price (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Price (Total) field.';

                }
                field("P[15]"; P[15])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Price (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Price (G/L Acc.) field.';

                }
                field("P[16]"; P[16])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Price (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Price (Total) field.';

                }
                field(Control157; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field(Control158; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field("C[3]"; C[3])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Cost (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Cost (G/L Acc.) field.';

                }
                field("C[4]"; C[4])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Cost (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Cost (Total) field.';

                }
                field("C[7]"; C[7])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Cost (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Cost (G/L Acc.) field.';

                }
                field("C[8]"; C[8])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Cost (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Cost (Total) field.';

                }
                field("C[11]"; C[11])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Cost (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Cost (G/L Acc.) field.';

                }
                field("C[12]"; C[12])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Cost (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Cost (Total) field.';

                }
                field("C[15]"; C[15])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Cost (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Cost (G/L Acc.) field.';

                }
                field("C[16]"; C[16])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Cost (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Cost (Total) field.';

                }
                field(Control161; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field(Control162; Text000)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Text000 field.';
                }
                field("P[3] - C[3]"; P[3] - C[3])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Profit (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Profit (G/L Acc.) field.';

                }
                field("P[4] - C[4]"; P[4] - C[4])
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Profit (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Schedule Profit (Total) field.';

                }
                field("P[7] - C[7]"; P[7] - C[7])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Profit (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Profit (G/L Acc.) field.';

                }
                field("P[8] - C[8]"; P[8] - C[8])
                {
                    ApplicationArea = Basic;
                    Caption = 'Usage Profit (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Usage Profit (Total) field.';

                }
                field("P[11] - C[11]"; P[11] - C[11])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Profit (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Profit (G/L Acc.) field.';

                }
                field("P[12] - C[12]"; P[12] - C[12])
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Profit (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract Profit (Total) field.';

                }
                field("P[15] - C[15]"; P[15] - C[15])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Profit (G/L Acc.)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Profit (G/L Acc.) field.';

                }
                field("P[16] - C[16]"; P[16] - C[16])
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoiced Profit (Total)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoiced Profit (Total) field.';

                }
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    begin
        OnAfterGetCurrRecord();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnAfterGetCurrRecord();
    end;

    var
        JobCalcStatistics: Codeunit "HR Appraisal Jnl.-Post Batch";
        CL: array[16] of Decimal;
        PL: array[16] of Decimal;
        P: array[16] of Decimal;
        C: array[16] of Decimal;
        Text000: Label 'Placeholder';
        Text19057252: Label 'Resource';
        Text19080001: Label 'Resource';
        Text19059736: Label 'Price';
        Text19012801: Label 'Price LCY';
        Text19011378: Label 'Item';
        Text19080002: Label 'Item';
        Text19077570: Label 'Cost';
        Text19068736: Label 'Cost LCY';
        Text19075586: Label 'Profit';
        Text19073853: Label 'Profit LCY';
        Text19055809: Label 'G/L Account';
        Text19080003: Label 'G/L Account';
        Text19028226: Label 'Total';
        Text19080004: Label 'Total';

    local procedure OnAfterGetCurrRecord()
    begin
        /*
        xRec := Rec;
        CLEAR(JobCalcStatistics);
        //JobCalcStatistics.JobCalculateCommonFilters(Rec);
        //JobCalcStatistics.CalculateAmounts;
        //JobCalcStatistics.GetLCYCostAmounts(CL);
        //JobCalcStatistics.GetLCYPriceAmounts(PL);
        //JobCalcStatistics.GetCostAmounts(C);
        //JobCalcStatistics.GetPriceAmounts(P);
        */

    end;
}
