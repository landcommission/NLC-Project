#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50027 "Petty Cash Surrender"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Petty Cash Surrender.rdlc';
    ApplicationArea = All;
    Caption = 'Petty Cash Surrender';
    dataset
    {
        dataitem("Staff Advance Surrender Header"; "Staff Advance Surrender Header")
        {
            column(ReportForNavId_1; 1) { }
            column(Date; "Staff Advance Surrender Header"."Surrender Date") { }
            column(Cashier; "Staff Advance Surrender Header".Cashier) { }
            column(Account_No; "Staff Advance Surrender Header"."Account No.") { }
            dataitem("Staff Advanc Surrender Details"; "Staff Advanc Surrender Details")
            {
                column(ReportForNavId_5; 5) { }
                column(Account_No_Lines; "Staff Advanc Surrender Details"."Account No:") { }
                column(Account_Name; "Staff Advanc Surrender Details"."Account Name") { }
                column(Amount; "Staff Advanc Surrender Details".Amount) { }
            }

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get();
                CompanyInfo.CalcFields(CompanyInfo.Picture);
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
        CompanyInfo: Record "Company Information";
}
