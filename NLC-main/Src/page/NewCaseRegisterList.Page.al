#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 56097 "New Case Register List"
{
    CardPageId = "Case Register Card";
    PageType = List;
    SourceTable = "Case Register";
    SourceTableView = where(Status = const(New),
                            Type = const(External));
    ApplicationArea = All;
    Caption = 'New Case Register List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("From Document Number"; Rec."From Document Number")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the From Document Number field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Number field.';
                }
                field("Name of Parties"; Rec."Name of Parties")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Name of Parties field.';
                }
                field("Nature of Case"; Rec."Nature of Case")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nature of Case field.';
                }
                field("Case Types"; Rec."Case Types")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Types field.';
                }
                field("Nature of Claim"; Rec."Nature of Claim")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nature of Claim field.';
                }
                field("Last Hearing Date"; Rec."Last Hearing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Hearing Date field.';
                }
                field(Progress; Rec.Progress)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Progress field.';
                }
                field("Next Hearing Date"; Rec."Next Hearing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Hearing Date field.';
                }
                field("Advocate on Record"; Rec."Advocate on Record")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advocate on Record field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control9; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

