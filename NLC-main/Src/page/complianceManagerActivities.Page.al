#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193843 "compliance Manager Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Job Cue";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            cuegroup("Pending Projects")
            {
                Caption = 'Pending Projects';
                field(Compliance; Rec.Compliance)
                {
                    ApplicationArea = Basic;
                    Caption = 'Compliance';
                    ToolTip = 'Specifies the value of the Compliance field.';
                }
                field(Projects; Rec.Projects)
                {
                    ApplicationArea = Basic;
                    Caption = 'Projects Pending Approvals';
                    ToolTip = 'Specifies the value of the Projects Pending Approvals field.';
                }

                actions
                {
                    action("Job Create Sales Invoice")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Job Create Sales Invoice';
                        Image = CreateJobSalesInvoice;
                        RunObject = report "Job Create Sales Invoice";
                        ToolTip = 'Executes the Job Create Sales Invoice action.';
                    }
                }
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

        Rec.SetFilter(Rec."Date Filter", '>=%1', WorkDate());
        Rec.SetFilter(Rec."Date Filter2", '<%1&<>%2', WorkDate(), 0D);
    end;
}
