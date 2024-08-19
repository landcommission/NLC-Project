#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193638 valki
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/valki.rdlc';
    ApplicationArea = All;
    Caption = 'valki';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            column(ReportForNavId_1; 1) { }

            trigger OnAfterGetRecord()
            begin
                if "HR Employees".Find('-') then
                    repeat
                        "HR Employees".Validate("HR Employees"."Date Of Birth");

                        "HR Employees".Modify();
                    until "HR Employees".Next() = 0;
            end;

            trigger OnPostDataItem()
            begin
                Message('validated')
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        hremp: Record "HR Employees";
}
