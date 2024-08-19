#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50020 "Fixed assets dimensions"
{
    ProcessingOnly = true;
    ApplicationArea = All;
    Caption = 'Fixed assets dimensions';
    dataset
    {
        dataitem("Fixed Asset"; "Fixed Asset")
        {
            column(ReportForNavId_1000000000; 1000000000) { }

            trigger OnAfterGetRecord()
            begin
                if "Fixed Asset"."No." > 'FA00015' then begin

                    "Fixed Asset"."Global Dimension 1 Code" := 'DON0000060';
                    "Fixed Asset".Validate("Fixed Asset"."Global Dimension 1 Code");
                    "Fixed Asset"."Global Dimension 2 Code" := 'GR000015';
                    "Fixed Asset".Validate("Fixed Asset"."Global Dimension 2 Code");
                end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Complete!');
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
