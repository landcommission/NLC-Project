#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193592 "Applicant Registers"
{
    Caption = 'Applicant Registers';
    PageType = Card;
    SourceTable = "Applicant Register";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(UserName; Rec.UserName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UserName field.';
                }
                field(Password; Rec.Password)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Password field.';
                }
                field(EmailAddress; Rec.EmailAddress)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EmailAddress field.';
                }
                field(Verified; Rec.Verified)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Verified field.';
                }
                field(MyRecId; Rec.MyRecId)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MyRecId field.';
                }
                field("Changed Password"; Rec."Changed Password")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Changed Password field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(Phone; Rec.Phone)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone field.';
                }
            }
        }
    }

    actions { }
}
