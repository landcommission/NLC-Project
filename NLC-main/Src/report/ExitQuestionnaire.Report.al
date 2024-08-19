#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193434 "Exit Questionnaire"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Exit Questionnaire.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Exit Questionnaire';
    dataset
    {
        dataitem("Exit Interview Questionnaire"; "Exit Interview Questionnaire")
        {
            column(ReportForNavId_1; 1) { }
            column(InterviewNo_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Interview No.") { }
            column(EmployeeNo_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Employee No") { }
            column(EmployeeName_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Employee Name") { }
            column(JobTitle_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Job Title") { }
            column(Directorate_ExitInterviewQuestionnaire; "Exit Interview Questionnaire".Directorate) { }
            column(DateofEmployement_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Date of Employement") { }
            column(StartDateinPosition_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Start Date in Position") { }
            column(SeparationDate_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Separation Date") { }
            column(TotalLengthofService_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Total Length of Service") { }
            column(OtherPositionsHeldintheCo_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Other Positions Held in the Co") { }
            column(Status_ExitInterviewQuestionnaire; "Exit Interview Questionnaire".Status) { }
            column(ResponsibilityCentre_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Responsibility Centre") { }
            column(NoSeries_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."No Series") { }
            column(Text1_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 1") { }
            column(Text2_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 2") { }
            column(Text3_ExitInterviewQuestionnaire; "Exit Interview Questionnaire".Dissatisfaction) { }
            column(Text4_ExitInterviewQuestionnaire; "Exit Interview Questionnaire".Relocation) { }
            column(Text5_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 5") { }
            column(Text6_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 6") { }
            column(Text7_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 7") { }
            column(Text8_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 8") { }
            column(Text9_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 9") { }
            column(Text10_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 10") { }
            column(Text11_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 11") { }
            column(Text12_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 12") { }
            column(Text13_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 13") { }
            column(Text14_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 14") { }
            column(Text15_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 15") { }
            column(Text16_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 16") { }
            column(Text17_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 17") { }
            column(Text18_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 18") { }
            column(Text19_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 19") { }
            column(Text20_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 20") { }
            column(Text21_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 21") { }
            column(Text22_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 22") { }
            column(Text23_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 23") { }
            column(Text24_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 24") { }
            column(Text25_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 25") { }
            column(Text26_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 26") { }
            column(Text27_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 27") { }
            column(Text28_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 28") { }
            column(Text29_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 29") { }
            column(Text30_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 30") { }
            column(Text31_ExitInterviewQuestionnaire; "Exit Interview Questionnaire"."Text 31") { }
            column(Picture; CompInfo.Picture) { }
            column(Name; CompInfo.Name) { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        CompInfo.Reset();
        CompInfo.Get();
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    var
        CompInfo: Record "Company Information";
}
