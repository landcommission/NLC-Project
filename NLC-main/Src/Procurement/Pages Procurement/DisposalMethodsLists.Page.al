#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50135 "Disposal Methods Lists"
{
    PageType = List;
    SourceTable = "Disposal Method";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Disposal Methods"; "Disposal Methods")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Description"; "Disposal Description")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

