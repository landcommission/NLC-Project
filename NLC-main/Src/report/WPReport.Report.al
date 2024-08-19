#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193715 "W/P Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/WP Report.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'W/P Report';
    dataset
    {
        dataitem(Workplan; Workplan)
        {
            column(ReportForNavId_1000000000; 1000000000) { }
            column(WorkplanCode_Workplan; Workplan."Workplan Code") { }
            column(WorkplanDescription_Workplan; Workplan."Workplan Description") { }
            dataitem("Workplan Activities"; "Workplan Activities")
            {
                DataItemLink = "Workplan Code" = field("Workplan Code");
                DataItemTableView = sorting("Activity Code") order(ascending);
                column(ReportForNavId_1000000001; 1000000001) { }
                column(ActivityCode_WorkplanActivities; "Workplan Activities"."Activity Code") { }
                column(ActivityDescription_WorkplanActivities; "Workplan Activities"."Activity Description") { }
                column(AccountType_WorkplanActivities; "Workplan Activities"."Account Type") { }
                column(AmounttoTransfer_WorkplanActivities; "Workplan Activities"."Amount to Transfer") { }
                column(UploadedtoProcurementWorkpl_WorkplanActivities; "Workplan Activities"."Uploaded to Procurement Workpl") { }
                column(DatetoTransfer_WorkplanActivities; "Workplan Activities"."Date to Transfer") { }
                column(Description_WorkplanActivities; "Workplan Activities".Description) { }
                column(ConvertedtoBudget_WorkplanActivities; "Workplan Activities"."Converted to Budget") { }
                column(ExpenseCode_WorkplanActivities; "Workplan Activities"."Expense Code") { }
                column(No_WorkplanActivities; "Workplan Activities"."No.") { }
                column(Type_WorkplanActivities; "Workplan Activities".Type) { }
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
