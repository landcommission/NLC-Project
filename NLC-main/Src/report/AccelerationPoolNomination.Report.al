#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193633 "Acceleration Pool Nomination"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Acceleration Pool Nomination.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Acceleration Pool Nomination';
    dataset
    {
        dataitem("Acceleration Pool Nomination"; "Acceleration Pool Nomination")
        {
            column(ReportForNavId_1; 1) { }
            column(NomineeName_AccelerationPoolNomination; "Acceleration Pool Nomination"."Nominee Name") { }
            column(SupportsCommisionValues_AccelerationPoolNomination; "Acceleration Pool Nomination"."Supports Commision Values") { }
            column(LeadershipPromise_AccelerationPoolNomination; "Acceleration Pool Nomination"."Leadership Promise") { }
            column(InterpersonalSkills_AccelerationPoolNomination; "Acceleration Pool Nomination"."Interpersonal Skills") { }
            column(DemonstrationofResults_AccelerationPoolNomination; "Acceleration Pool Nomination"."Demonstration of Results") { }
            column(DevelopmentalOrientation_AccelerationPoolNomination; "Acceleration Pool Nomination"."Developmental Orientation") { }
            column(CountR; CountR) { }

            trigger OnAfterGetRecord()
            begin
                CountR := CountR + 1;
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
        CountR: Integer;
}
