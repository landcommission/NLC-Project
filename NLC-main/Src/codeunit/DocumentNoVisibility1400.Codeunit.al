#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 50018 DocumentNoVisibility1400
{


    procedure FundsMgtDocumentNoIsVisible(DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer; DocNo: Code[20]): Boolean
    var
        NoSeries: Record "No. Series";
        FundsMgtNoSeriesSetup: Page "Cash Office No. Series Setup";
        DocNoSeries: Code[10];
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
        if DocNo <> '' then
            exit(false);

        DocNoSeries := DetermineFundsMgtSeriesNo(DocType);

        if not NoSeries.Get(DocNoSeries) then begin
            FundsMgtNoSeriesSetup.SetFieldsVisibility(DocType);
            FundsMgtNoSeriesSetup.RunModal();
            DocNoSeries := DetermineFundsMgtSeriesNo(DocType);
            if not NoSeries.Get(DocNoSeries) then
                exit(true);
        end;

        exit(DocumentNoVisibility.ForceShowNoSeriesForDocNo(DocNoSeries));
    end;

    local procedure DetermineFundsMgtSeriesNo(DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer): Code[10]
    var
        FundsMgtSetup: Record "Cash Office Setup";
    begin
        FundsMgtSetup.Get();
        case DocType of
            DocType::"Payment Voucher":
                exit(FundsMgtSetup."Normal Payments No");
            DocType::"Petty Cash":
                exit(FundsMgtSetup."Petty Cash Payments No");
            DocType::Imprest:
                exit(FundsMgtSetup."Imprest Req No");
            DocType::ImprestSurrender:
                exit(FundsMgtSetup."Imprest Surrender No");
            DocType::Interbank:
                exit(FundsMgtSetup."InterBank Transfer No.");
            DocType::Receipt:
                exit(FundsMgtSetup."Receipts No");
            DocType::"Staff Claim":
                exit(FundsMgtSetup."Staff Claim No.");
            DocType::"Staff Advance":
                exit(FundsMgtSetup."Other Staff Advance No.");
            DocType::AdvanceSurrender:
                exit(FundsMgtSetup."Staff Advance Surrender No.");
        end;
    end;

}
