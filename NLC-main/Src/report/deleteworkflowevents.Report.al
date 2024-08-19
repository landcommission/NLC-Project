report 50119 deleteworkflowevents
{
    ApplicationArea = All;
    Caption = 'deleteworkflowevents';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(WorkflowEvent; "Workflow Event")
        {
            //DataItemTableView = where("Table ID" = filter(> 49999));
            trigger OnAfterGetRecord()
            var
                out: Text;
            begin
                out := Format("Table ID") + Description + "Function Name";
                Delete();
            end;
        }
        dataitem("Workflow Step Instance"; "Workflow Step Instance")
        {
            trigger OnAfterGetRecord()
            begin

                Delete();
            end;
        }
        dataitem("Workflow Step"; "Workflow Step")
        {
            trigger OnAfterGetRecord()
            begin

                Delete();
            end;
        }
        dataitem("Workflow Step Argument"; "Workflow Step Argument")
        {
            trigger OnAfterGetRecord()
            begin

                Delete();
            end;

        }
        dataitem(Workflow; Workflow)
        {
            trigger OnAfterGetRecord()
            begin
                Delete();
            end;

        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName) { }
            }
        }
        actions
        {
            area(Processing) { }
        }
    }
}
