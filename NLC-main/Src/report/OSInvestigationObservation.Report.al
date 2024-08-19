#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193457 "OSInvestigation Observation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/OSInvestigation Observation.rdlc';
    ApplicationArea = All;
    Caption = 'OSInvestigation Observation';
    dataset
    {
        dataitem("HR OSInvestigation"; "HR OSInvestigation")
        {
            column(ReportForNavId_1; 1) { }
            column(InvestigationNo_OSInvestigation; "HR OSInvestigation"."Investigation No") { }
            column(IncidentNo_OSInvestigation; "HR OSInvestigation"."Incident No") { }
            column(IncidentDescription_OSInvestigation; "HR OSInvestigation"."Incident Description") { }
            column(DateofIncident_OSInvestigation; "HR OSInvestigation"."Date of Incident") { }
            column(LocationCode_OSInvestigation; "HR OSInvestigation"."Location Name") { }
            column(Status_OSInvestigation; "HR OSInvestigation".Status) { }
            dataitem("HR OSAccident Incident Line"; "HR OSAccident Incident Line")
            {
                DataItemLink = "Incident No" = field("Incident No");
                column(ReportForNavId_8; 8) { }
                column(IncidentNo_OSAccidentIncidentLine; "HR OSAccident Incident Line"."Incident No") { }
                column(AccidentNo_OSAccidentIncidentLine; "HR OSAccident Incident Line"."Accident No.") { }
                column(Cause_OSAccidentIncidentLine; "HR OSAccident Incident Line".Cause) { }
                column(CauseNo_OSAccidentIncidentLine; "HR OSAccident Incident Line"."Cause No") { }
                column(ResolutionRecommendation_OSAccidentIncidentLine; "HR OSAccident Incident Line"."Resolution/Recommendation") { }
                column(Incident_OSAccidentIncidentLine; "HR OSAccident Incident Line".Incident) { }

                trigger OnAfterGetRecord()
                begin
                    if "HR OSAccident Incident Line"."Accident No." = '' then
                        CurrReport.Skip();
                end;
            }
            dataitem("HR OSSafety Checklist"; "HR OSSafety Checklist")
            {
                DataItemLink = "Incident No" = field("Incident No");
                column(ReportForNavId_15; 15) { }
                column(SafetyRules_OSSafetyChecklist; "HR OSSafety Checklist"."Safety Rules") { }
                column(Observed_OSSafetyChecklist; "HR OSSafety Checklist".Observed) { }
                column(NotObserved_OSSafetyChecklist; "HR OSSafety Checklist"."Not Observed") { }
                column(AccidentNo_OSSafetyChecklist; "HR OSSafety Checklist"."Accident No") { }
                column(IncidentNo_OSSafetyChecklist; "HR OSSafety Checklist"."Incident No") { }
                column(ObservationMade_OSSafetyChecklist; "HR OSSafety Checklist"."Observation Made") { }

                trigger OnAfterGetRecord()
                begin
                    if "HR OSSafety Checklist"."Incident No" = '' then
                        CurrReport.Skip();
                end;
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
