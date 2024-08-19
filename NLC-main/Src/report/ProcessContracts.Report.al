report 50042 "Process Contracts"
{
    ApplicationArea = All;
    Caption = 'Process Contracts';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            DataItemTableView = where(Status = filter(Active));
            RequestFilterFields = "No.";
            trigger OnAfterGetRecord()
            var
                Duedate: Date;
                msg: Text;
                NameAv: Text;
            begin
                Duedate := 0D;
                NameAv := '';
                NameAv := "HR Employees"."First Name";
                if "HR Employees"."First Name" <> '' then
                    NameAv := "HR Employees"."First Name"
                else
                    NameAv := "HR Employees"."Last Name";
                Duedate := CalcDate('-2W', "HR Employees"."End of Contract Date");
                if Duedate <= Today then begin
                    msg := 'Dear ' + NameAv + ',' + ' ' + 'your contract is set to expire on' + ' ' + FORMAT("HR Employees"."End of Contract Date") + '.' + 'Kindly make take the necessary action' + '. Thank you.';
                    EmailManager.Create("HR Employees"."E-Mail", 'Contract Expiry', msg, true);
                    Email.Send(EmailManager, Enum::"Email Scenario"::Default);
                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        EmailManager: Codeunit "Email Message";
        Email: Codeunit Email;
}

