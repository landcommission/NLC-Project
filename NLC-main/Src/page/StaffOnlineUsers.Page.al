#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193569 "Staff Online Users"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Online Users";
    UsageCategory = Lists;
    Caption = 'Staff Online Users';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Name field.';
                }
                field(Password; Rec.Password)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Password field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Changed Password"; Rec."Changed Password")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Changed Password field.';
                }
                field("Number Of Logins"; Rec."Number Of Logins")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number Of Logins field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
            }
        }
    }

    actions { }
}
