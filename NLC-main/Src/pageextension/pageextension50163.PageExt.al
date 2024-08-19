#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50163 pageextension50163 extends "User Settings List"
{
    actions
    {
        addfirst(Processing)
        {
            action(Reset)
            {
                ApplicationArea = Basic;
                Caption = 'Reset';
                ToolTip = 'Executes the Reset action.';
            }
        }
    }

    var
        UserPersonalization: Record "User Personalization";
}
