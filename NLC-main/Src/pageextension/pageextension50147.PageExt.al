#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
pageextension 50147 pageextension50147 extends "Approval Entries"
{
    layout
    {
        modify("Last Date-Time Modified")
        {
            Visible = false;
        }

        addafter("Due Date")
        {

            field("Approver Type"; Rec."Approver Type")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Approval Type field.';
            }
        }
        modify("Document Type")
        {
            Visible = true;
        }
        modify("Document No.")
        {
            Visible = true;
        }
    }
    actions
    {



    }

    var
        objComplianceLedge: Record "HR OSAccident Incident Line";
        objcompliance: Record "HR OSIncident";
        objComplianceJournal: Record "HR OSAccident";
        objPurchaseHeader: Record "Purchase Header";
        objPaymentHeader: Record "Payments Header";
        objImprestHeader: Record "Imprest Header";
        objClaimsHeader: Record "Staff Claims Header";
        objStaffAdvHeader: Record "Staff Advance Headers";
        CashOfficeSetup: Record "Cash Office Setup";

    local procedure CompliancePassed()
    begin
    end;

    local procedure SendToCompliance()
    begin
    end;

    trigger OnOpenPage()
    begin
        //CashOfficeSetup.Get();
        //Rec.SetRange("Due Date", CashOfficeSetup."Current Budget Start Date", CashOfficeSetup."Current Budget End Date");
    end;

    trigger OnAfterGetRecord()
    begin
        //CashOfficeSetup.Get();
        //Rec.SetRange("Due Date", CashOfficeSetup."Current Budget Start Date", CashOfficeSetup."Current Budget End Date");
    end;

    trigger OnAfterGetCurrRecord()
    begin
        //CashOfficeSetup.Get();
        //Rec.SetRange("Due Date", CashOfficeSetup."Current Budget Start Date", CashOfficeSetup."Current Budget End Date");
    end;
}

#pragma implicitwith restore
