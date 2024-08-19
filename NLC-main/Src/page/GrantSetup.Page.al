#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193903 "Grant Setup"
{
    Caption = 'Grant Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Jobs-Setup";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
            }
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Job Nos."; Rec."Job Nos.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grants No.';
                    ToolTip = 'Specifies the value of the Grants No. field.';
                }
                field("Grant Task Nos"; Rec."Grant Task Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Task Nos field.';
                }
                field("Concept Nos"; Rec."Concept Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Concept Nos field.';
                }
                field("Proposal Nos"; Rec."Proposal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposal Nos field.';
                }
                field("Closeout Nos"; Rec."Closeout Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closeout Nos field.';
                }
                field("Donor Contact Nos"; Rec."Donor Contact Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Donor Contact Nos field.';
                }
                field("System Contract Nos"; Rec."System Contract Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the System Contract Nos field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions { }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
