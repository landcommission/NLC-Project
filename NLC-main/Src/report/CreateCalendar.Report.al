#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193494 CreateCalendar
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/CreateCalendar.rdlc';
    ApplicationArea = All;
    Caption = 'CreateCalendar';
    dataset
    {
        dataitem("HR Calendar"; "HR Calendar")
        {
            column(ReportForNavId_1; 1) { }

            trigger OnAfterGetRecord()
            begin

                "HR Calendar".Init();
                "HR Calendar".Code := '2020/2021';
                "HR Calendar"."Created By" := UserId;
                "HR Calendar"."Start Date" := 20210107D;
                "HR Calendar"."End Date" := 20210630D;
                "HR Calendar".Current := false;
                "HR Calendar".Description := 'Test';
                "HR Calendar".Insert();
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPostReport()
    begin
        Message('Done')
    end;

    var
        HRCal: Record "HR Calendar";
}
