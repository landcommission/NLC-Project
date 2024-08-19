#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193702 "Vendor Appraisal"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Vendor Appraisal.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Vendor Appraisal';
    dataset
    {
        dataitem("Evaluation Parameter Header"; "Evaluation Parameter Header")
        {
            RequestFilterFields = "Criteria Code", "Evaluation  Period", "Vendor No.";
            column(ReportForNavId_1; 1) { }
            column(CriteriaCode_EvaluationParameterHeader; "Evaluation Parameter Header"."Criteria Code") { }
            column(CriteriaDescription_EvaluationParameterHeader; "Evaluation Parameter Header"."Criteria Description") { }
            column(EvaluationPeriod_EvaluationParameterHeader; "Evaluation Parameter Header"."Evaluation  Period") { }
            dataitem("Evaluation Parameter Line"; "Evaluation Parameter Line")
            {
                DataItemLink = Code = field("Criteria Code");
                DataItemTableView = sorting(Code, "Line No.") order(ascending);
                column(ReportForNavId_2; 2) { }
                column(ParameterCode_EvaluationParameterLine; "Evaluation Parameter Line"."Parameter Code") { }
                column(MinScore_EvaluationParameterLine; "Evaluation Parameter Line"."Min. Score") { }
                column(MaxScore_EvaluationParameterLine; "Evaluation Parameter Line"."Max. Score") { }
                column(VendorNo_EvaluationParameterLine; "Evaluation Parameter Line"."Vendor No") { }
                column(ActualsScores_EvaluationParameterLine; "Evaluation Parameter Line"."Actuals Scores") { }
                column(VendorName_EvaluationParameterLine; "Evaluation Parameter Line"."Vendor Name") { }
                column(OverallComment_EvaluationParameterLine; "Evaluation Parameter Line"."Overall Comment") { }
                column(CompanyInformationName; CompanyInformation.Name) { }
                column(CompanyInformationName2; CompanyInformation."Name 2") { }
                column(CompanyInformationAddress; CompanyInformation.Address) { }
                column(CompanyInformationAddress2; CompanyInformation."Address 2") { }
                column(CompanyInformationPicture; CompanyInformation.Picture) { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        CompanyInformation: Record "Company Information";
}
