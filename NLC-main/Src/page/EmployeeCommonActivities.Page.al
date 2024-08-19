#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193776 "Employee Common Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Archived Investment Header";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            cuegroup("Document Approvals")
            {
                Caption = 'Document Approvals';
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Caption = 'Leaves Pending Approvals';
                    ToolTip = 'Specifies the value of the Leaves Pending Approvals field.';
                }

                actions
                {
                    action("Create Reminders...")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Create Reminders...';
                        Image = CreateReminders;
                        RunObject = report "Create Reminders";
                        ToolTip = 'Executes the Create Reminders... action.';
                    }
                    action("Create Finance Charge Memos...")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Create Finance Charge Memos...';
                        Image = CreateFinanceChargememo;
                        RunObject = report "Create Finance Charge Memos";
                        ToolTip = 'Executes the Create Finance Charge Memos... action.';
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
    end;
}
