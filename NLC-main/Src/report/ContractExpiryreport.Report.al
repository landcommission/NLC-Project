#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193543 "Contract Expiry report"
{
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Contract Expiry report';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            column(ReportForNavId_1; 1) { }

            trigger OnAfterGetRecord()
            begin



                //MESSAGE(FORMAT(DaystoProbaton));

                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "HR Employees"."No.");
                HREmp.SetRange(HREmp.Status, "HR Employees".Status::Active);
                if HREmp.Find('-') then
                  //MESSAGE(FORMAT(DaystoProbaton));

                  begin
                    if "HR Employees"."Contract End Date" <> 0D then
                        DaystoProbaton := "HR Employees"."Contract End Date" - Today;
                    if DaystoProbaton > 20 then
                        Error('found');
                    repeat
                        EmailMessage.Create(HREmp."Company E-Mail",
                          'Probation End Date Notification', 'Dear' + ' ' + "HR Employees"."First Name" + '<br>' +
                           'Your probation period will be coming to an end on,' + ' ' + Format("HR Employees"."Contract End Date") + Format("HR Employees"."ID Number") + '  ' +
                            "HR Employees"."Full Name" + ' ', true);

                        // HREmailParam.Subject,'Dear'+' '+ HREmp."First Name" +'<br>'+
                        //            Text0002+' '+ "Job Description" +' '+ 'is open for application to all Internal Staff'+'<br><br>Regards',TRUE);
                        Email.Send(EmailMessage);
                    until HREmp.Next() = 0;
                    Message('[%1] Employees have been notified about this vacancy', HREmp.Count);
                end;


                UserSetup.Reset();
                UserSetup.SetRange(UserSetup."User ID", UserId);
                if UserSetup.Find('-') then;
                //  IF UserSetup."Allow Payroll"=FALSE THEN
                //  ERROR('You have no rights')
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
        HREmp: Record "HR Employees";
        DaystoProbaton: Integer;
        //smtp: Codeunit "SMTP Mail";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        UserSetup: Record "User Setup";
}
