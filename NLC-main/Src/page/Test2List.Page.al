#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194029 "Test 2 List"
{
    CardPageId = "Test 2 Card";
    PageType = List;
    SourceTable = Customer;
    ApplicationArea = All;
    Caption = 'Test 2 List';
    layout
    {
        area(Content)
        {
            repeater(Group) { }
        }
    }

    actions { }
}
