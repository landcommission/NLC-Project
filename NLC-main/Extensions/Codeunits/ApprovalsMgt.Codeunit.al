codeunit 50106 "Approvals Mgt"
{
    var
        WorkflowManagement: Codeunit "Workflow Management";
        NoWorkflowEnabledErr: Label 'No related approval workflow is enabled.';
        OnSendPaymentHeaderApprovalRequestTxt: Label 'Approval of Payments Header is requested';
        RunWorkflowOnSendPaymentHeaderForApprovalCode: Label 'RUNWORKFLOWONSENDPAYMENTHEADERFORAPPROVAL';
        OnCancelPaymentHeaderApprovalRequestTxt: Label 'An Approval of Payments Header is canceled';
        RunWorkflowOnCancelPaymentHeaderForApprovalCode: Label 'RUNWORKFLOWONCANCELPAYMENTHEADERFORAPPROVAL';

        OnSendImprestHeaderApprovalRequestTxt: Label 'Approval of Imprest Header is requested';
        RunWorkflowOnSendImprestHeaderForApprovalCode: Label 'RUNWORKFLOWONSENDIMPRESTHEADERFORAPPROVAL';
        OnCancelImprestHeaderApprovalRequestTxt: Label 'An Approval of Imprest Header is canceled';
        RunWorkflowOnCancelImprestHeaderForApprovalCode: Label 'RUNWORKFLOWONCANCELIMPRESTHEADERFORAPPROVAL';

        OnSendImprestSurrApprovalRequestTxt: Label 'Approval of Imprest Surrender Header is requested';
        RunWorkflowOnSendImprestSurrForApprovalCode: Label 'RUNWORKFLOWONSENDIMPRESTSURRFORAPPROVAL';
        OnCancelImprestSurrApprovalRequestTxt: Label 'An Approval of Imprest Surrender Header is canceled';
        RunWorkflowOnCancelImprestSurrForApprovalCode: Label 'RUNWORKFLOWONCANCELIMPRESTSURRFORAPPROVAL';

        OnSendInterbankTransApprovalRequestTxt: Label 'Approval of InterBank Transfers is requested';
        RunWorkflowOnSendInterbankTransForApprovalCode: Label 'RUNWORKFLOWONSENDINTERBANKTRANSFORAPPROVAL';
        OnCancelInterbankTransApprovalRequestTxt: Label 'An Approval of InterBank Transfers is canceled';
        RunWorkflowOnCancelInterbankTransForApprovalCode: Label 'RUNWORKFLOWONCANCELINTERBANKTRANSFORAPPROVAL';

        OnSendReceiptApprovalRequestTxt: Label 'Approval of Receipts Header is requested';
        RunWorkflowOnSendReceiptForApprovalCode: Label 'RUNWORKFLOWONSENDRECEIPTFORAPPROVAL';
        OnCancelReceiptApprovalRequestTxt: Label 'An Approval of Receipts Header is canceled';
        RunWorkflowOnCancelReceiptForApprovalCode: Label 'RUNWORKFLOWONCANCELRECEIPTFORAPPROVAL';

        OnSendStaffClaimApprovalRequestTxt: Label 'Approval of Staff Claims Header is requested';
        RunWorkflowOnSendStaffClaimForApprovalCode: Label 'RUNWORKFLOWONSENDSTAFFCLAIMFORAPPROVAL';
        OnCancelStaffClaimApprovalRequestTxt: Label 'An Approval of Staff Claims Header is canceled';
        RunWorkflowOnCancelStaffClaimForApprovalCode: Label 'RUNWORKFLOWONCANCELSTAFFCLAIMFORAPPROVAL';

        OnSendStaffAdvanceApprovalRequestTxt: Label 'Approval of Staff Advance Headers is requested';
        RunWorkflowOnSendStaffAdvanceForApprovalCode: Label 'RUNWORKFLOWONSENDSTAFFADVANCEFORAPPROVAL';
        OnCancelStaffAdvanceApprovalRequestTxt: Label 'An Approval of Staff Advance Headers is canceled';
        RunWorkflowOnCancelStaffAdvanceForApprovalCode: Label 'RUNWORKFLOWONCANCELSTAFFADVANCEFORAPPROVAL';

        OnSendStaffAdvanceSurrApprovalRequestTxt: Label 'Approval of Staff Advance Surrender Header is requested';
        RunWorkflowOnSendStaffAdvanceSurrForApprovalCode: Label 'RUNWORKFLOWONSENDSTAFFADVANCESURRFORAPPROVAL';
        OnCancelStaffAdvanceSurrApprovalRequestTxt: Label 'An Approval of Staff Advance Surrender Header is canceled';
        RunWorkflowOnCancelStaffAdvanceSurrForApprovalCode: Label 'RUNWORKFLOWONCANCELSTAFFADVANCESURRFORAPPROVAL';

        OnSendCashOfficeSetupApprovalRequestTxt: Label 'Approval of Cash Office Setup is requested';
        RunWorkflowOnSendCashOfficeSetupForApprovalCode: Label 'RUNWORKFLOWONSENDCASHOFFICESETUPFORAPPROVAL';
        OnCancelCashOfficeSetupApprovalRequestTxt: Label 'An Approval of Cash Office Setup is canceled';
        RunWorkflowOnCancelCashOfficeSetupForApprovalCode: Label 'RUNWORKFLOWONCANCELCASHOFFICESETUPFORAPPROVAL';

        OnSendGenJnlBatchApprovalRequestTxt: Label 'Approval of Gen. Journal Batch is requested';
        RunWorkflowOnSendGenJnlBatchForApprovalCode: Label 'RUNWORKFLOWONSENDGENJNLBATCHFORAPPROVAL';
        OnCancelGenJnlBatchApprovalRequestTxt: Label 'An Approval of Gen. Journal Batch is canceled';
        RunWorkflowOnCancelGenJnlBatchForApprovalCode: Label 'RUNWORKFLOWONCANCELGENJNLBATCHFORAPPROVAL';

        OnSendHRJobsApprovalRequestTxt: Label 'Approval of HR Jobs is requested';
        RunWorkflowOnSendHRJobsForApprovalCode: Label 'RUNWORKFLOWONSENDHRJOBSFORAPPROVAL';
        OnCancelHRJobsApprovalRequestTxt: Label 'An Approval of HR Jobs is canceled';
        RunWorkflowOnCancelHRJobsForApprovalCode: Label 'RUNWORKFLOWONCANCELHRJOBSFORAPPROVAL';

        OnSendHRLeaveAppApprovalRequestTxt: Label 'Approval of HR Leave Application is requested';
        RunWorkflowOnSendHRLeaveAppForApprovalCode: Label 'RUNWORKFLOWONSENDHRLEAVEAPPFORAPPROVAL';
        OnCancelHRLeaveAppApprovalRequestTxt: Label 'An Approval of HR Leave Application is canceled';
        RunWorkflowOnCancelHRLeaveAppForApprovalCode: Label 'RUNWORKFLOWONCANCELHRLEAVEAPPFORAPPROVAL';

        //Leave Planner
        OnSendHRLeavePlannerApprovalRequestTxt: Label 'Approval of HR Leave Planner Application is requested';
        RunWorkflowOnSendHRLeavePLannerForApprovalCode: Label 'RUNWORKFLOWONSENDHRLEAVEPLANNERFORAPPROVAL';
        OnCancelHRLeavePlannerApprovalRequestTxt: Label 'An Approval of HR Leave Planner Application is canceled';
        RunWorkflowOnCancelHRLeavePlannerForApprovalCode: Label 'RUNWORKFLOWONCANCELHRLEAVEPLANNERFORAPPROVAL';

        //Employee Transfer
        OnSendEmployeeTransferApprovalRequestTxt: Label 'Approval of Employee Transfer is requested';
        RunWorkflowOnSendEmployeeTransferForApprovalCode: Label 'RUNWORKFLOWONSENDEMPLOYEETRANSFERFORAPPROVAL';
        OnCancelEmployeeTransferApprovalRequestTxt: Label 'An Approval of Employee Transfer is canceled';
        RunWorkflowOnCancelEmployeeTransferForApprovalCode: Label 'RUNWORKFLOWONCANCELEMPLOYEETRANSFERFORAPPROVAL';

        OnSendHrempreqApprovalRequestTxt: Label 'Approval of HR Employee Requisitions is requested';
        RunWorkflowOnSendHrempreqForApprovalCode: Label 'RUNWORKFLOWONSENDHREMPREQFORAPPROVAL';
        OnCancelHrempreqApprovalRequestTxt: Label 'An Approval of HR Employee Requisitions is canceled';
        RunWorkflowOnCancelHrempreqForApprovalCode: Label 'RUNWORKFLOWONCANCELHREMPREQFORAPPROVAL';

        OnSendTrainingApprovalRequestTxt: Label 'Approval of HR Training App Header is requested';
        RunWorkflowOnSendTrainingForApprovalCode: Label 'RUNWORKFLOWONSENDTRAININGFORAPPROVAL';
        OnCancelTrainingApprovalRequestTxt: Label 'An Approval of HR Training App Header is canceled';
        RunWorkflowOnCancelTrainingForApprovalCode: Label 'RUNWORKFLOWONCANCELTRAININGFORAPPROVAL';

        OnSendhrtransportApprovalRequestTxt: Label 'Approval of Transport Allocations is requested';
        RunWorkflowOnSendhrtransportForApprovalCode: Label 'RUNWORKFLOWONSENDHRTRANSPORTFORAPPROVAL';
        OnCancelhrtransportApprovalRequestTxt: Label 'An Approval of Transport Allocations is canceled';
        RunWorkflowOnCancelhrtransportForApprovalCode: Label 'RUNWORKFLOWONCANCELHRTRANSPORTFORAPPROVAL';


        OnSendJVHeaderApprovalRequestTxt: Label 'Approval of JV Header is requested';
        RunWorkflowOnSendJVHeaderForApprovalCode: Label 'RUNWORKFLOWONSENDJVHEADERFORAPPROVAL';
        OnCancelJVHeaderApprovalRequestTxt: Label 'An Approval of JV Header is canceled';
        RunWorkflowOnCancelJVHeaderForApprovalCode: Label 'RUNWORKFLOWONCANCELJVHEADERFORAPPROVAL';

        OnSendHRLeaveReimbApprovalRequestTxt: Label 'Approval of HR Leave Reimbursement is requested';
        RunWorkflowOnSendHRLeaveReimbForApprovalCode: Label 'RUNWORKFLOWONSENDHRLEAVEREIMBFORAPPROVAL';
        OnCancelHRLeaveReimbApprovalRequestTxt: Label 'An Approval of HR Leave Reimbursement is canceled';
        RunWorkflowOnCancelHRLeaveReimbForApprovalCode: Label 'RUNWORKFLOWONCANCELHRLEAVEREIMBFORAPPROVAL';

        OnSendmJobsApprovalRequestTxt: Label 'Approval of Jobs is requested';
        RunWorkflowOnSendmJobsForApprovalCode: Label 'RUNWORKFLOWONSENDMJOBSFORAPPROVAL';
        OnCancelmJobsApprovalRequestTxt: Label 'An Approval of Jobs is canceled';
        RunWorkflowOnCancelmJobsForApprovalCode: Label 'RUNWORKFLOWONCANCELMJOBSFORAPPROVAL';

        OnSendGrantSurrHeaderApprovalRequestTxt: Label 'Approval of Grant Surrender Header is requested';
        RunWorkflowOnSendGrantSurrHeaderForApprovalCode: Label 'RUNWORKFLOWONSENDGRANTSURRHEADERFORAPPROVAL';
        OnCancelGrantSurrHeaderApprovalRequestTxt: Label 'An Approval of Grant Surrender Header is canceled';
        RunWorkflowOnCancelGrantSurrHeaderForApprovalCode: Label 'RUNWORKFLOWONCANCELGRANTSURRHEADERFORAPPROVAL';

        OnSendGRNApprovalRequestTxt: Label 'Approval of Purch. Rcpt. Header is requested';
        RunWorkflowOnSendGRNForApprovalCode: Label 'RUNWORKFLOWONSENDGRNFORAPPROVAL';
        OnCancelGRNApprovalRequestTxt: Label 'An Approval of Purch. Rcpt. Header is canceled';
        RunWorkflowOnCancelGRNForApprovalCode: Label 'RUNWORKFLOWONCANCELGRNFORAPPROVAL';

        OnSendAssetDonationApprovalRequestTxt: Label 'Approval of HR Job Occupations is requested';
        RUNWORKFLOWONSENDASSETDonationForApprovalCode: Label 'RUNWORKFLOWONSENDASSETDONATIONFORAPPROVAL';
        OnCancelAssetDonationApprovalRequestTxt: Label 'An Approval of HR Job Occupations is canceled';
        RUNWORKFLOWONCANCELASSETDonationForApprovalCode: Label 'RUNWORKFLOWONCANCELASSETDONATIONFORAPPROVAL';

        OnSendAssetTransferApprovalRequestTxt: Label 'Approval of HR Asset Transfer Header is requested';
        RUNWORKFLOWONSENDASSETTransferForApprovalCode: Label 'RUNWORKFLOWONSENDASSETTRANSFERFORAPPROVAL';
        OnCancelAssetTransferApprovalRequestTxt: Label 'An Approval of HR Asset Transfer Header is canceled';
        RUNWORKFLOWONCANCELASSETTransferForApprovalCode: Label 'RUNWORKFLOWONCANCELASSETTRANSFERFORAPPROVAL';

        OnSendPCAdviceApprovalRequestTxt: Label 'Approval of Staff Claim Lines is requested';
        RunWorkflowOnSendPCAdviceForApprovalCode: Label 'RUNWORKFLOWONSENDPCADVICEFORAPPROVAL';
        OnCancelPCAdviceApprovalRequestTxt: Label 'An Approval of Staff Claim Lines is canceled';
        RunWorkflowOnCancelPCAdviceForApprovalCode: Label 'RUNWORKFLOWONCANCELPCADVICEFORAPPROVAL';

        OnSendBudgetApprovalRequestTxt: Label 'Approval of G/L Budget Name is requested';
        RunWorkflowOnSendBudgetForApprovalCode: Label 'RUNWORKFLOWONSENDBUDGETFORAPPROVAL';
        OnCancelBudgetApprovalRequestTxt: Label 'An Approval of G/L Budget Name is canceled';
        RunWorkflowOnCancelBudgetForApprovalCode: Label 'RUNWORKFLOWONCANCELBUDGETFORAPPROVAL';

        OnSendGLAApprovalRequestTxt: Label 'Approval of G/L Account is requested';
        RunWorkflowOnSendGLAForApprovalCode: Label 'RUNWORKFLOWONSENDGLAFORAPPROVAL';
        OnCancelGLAApprovalRequestTxt: Label 'An Approval of G/L Account is canceled';
        RunWorkflowOnCancelGLAForApprovalCode: Label 'RUNWORKFLOWONCANCELGLAFORAPPROVAL';

        OnSendinspectionHDApprovalRequestTxt: Label 'Approval of Inspection Header is requested';
        RunWorkflowOnSendinspectionHDForApprovalCode: Label 'RUNWORKFLOWONSENDINSPECTIONHDFORAPPROVAL';
        OnCancelinspectionHDApprovalRequestTxt: Label 'An Approval of Inspection Header is canceled';
        RunWorkflowOnCancelinspectionHDForApprovalCode: Label 'RUNWORKFLOWONCANCELINSPECTIONHDFORAPPROVAL';

        OnSendHRCarryOverApprovalRequestTxt: Label 'Approval of Temp Fixed Asset is requested';
        RunWorkflowOnSendHRCarryOverForApprovalCode: Label 'RUNWORKFLOWONSENDHRCARRYOVERFORAPPROVAL';
        OnCancelHRCarryOverApprovalRequestTxt: Label 'An Approval of Temp Fixed Asset is canceled';
        RunWorkflowOnCancelHRCarryOverForApprovalCode: Label 'RUNWORKFLOWONCANCELHRCARRYOVERFORAPPROVAL';

        OnSendcloseoutHDApprovalRequestTxt: Label 'Approval of HR OSInjured Person is requested';
        RunWorkflowOnSendcloseoutHDForApprovalCode: Label 'RUNWORKFLOWONSENDCLOSEOUTHDFORAPPROVAL';
        OnCancelcloseoutHDApprovalRequestTxt: Label 'An Approval of HR OSInjured Person is canceled';
        RunWorkflowOnCancelcloseoutHDForApprovalCode: Label 'RUNWORKFLOWONCANCELCLOSEOUTHDFORAPPROVAL';

        OnSendEmpTransApprovalRequestTxt: Label 'Approval of HR Employee Transfer Header is requested';
        RunWorkflowOnSendEmpTransForApprovalCode: Label 'RUNWORKFLOWONSENDEMPTRANSFORAPPROVAL';
        OnCancelEmpTransApprovalRequestTxt: Label 'An Approval of HR Employee Transfer Header is canceled';
        RunWorkflowOnCancelEmpTransForApprovalCode: Label 'RUNWORKFLOWONCANCELEMPTRANSFORAPPROVAL';

        OnSendGLSetupApprovalRequestTxt: Label 'Approval of General Ledger Setup is requested';
        RunWorkflowOnSendGLSetupForApprovalCode: Label 'RUNWORKFLOWONSENDGLSETUPFORAPPROVAL';
        OnCancelGLSetupApprovalRequestTxt: Label 'An Approval of General Ledger Setup is canceled';
        RunWorkflowOnCancelGLSetupForApprovalCode: Label 'RUNWORKFLOWONCANCELGLSETUPFORAPPROVAL';

        OnSendDimValApprovalRequestTxt: Label 'Approval of Dimension Value is requested';
        RunWorkflowOnSendDimValForApprovalCode: Label 'RUNWORKFLOWONSENDDIMVALFORAPPROVAL';
        OnCancelDimValApprovalRequestTxt: Label 'An Approval of Dimension Value is canceled';
        RunWorkflowOnCancelDimValForApprovalCode: Label 'RUNWORKFLOWONCANCELDIMVALFORAPPROVAL';

        OnSendMasterApprovalRequestTxt: Label 'Approval of Master  Creation Header is requested';
        RunWorkflowOnSendMasterForApprovalCode: Label 'RUNWORKFLOWONSENDMASTERFORAPPROVAL';
        OnCancelMasterApprovalRequestTxt: Label 'An Approval of Master  Creation Header is canceled';
        RunWorkflowOnCancelMasterForApprovalCode: Label 'RUNWORKFLOWONCANCELMASTERFORAPPROVAL';

        OnSendInvestmentApprovalRequestTxt: Label 'Approval of Investment Header is requested';
        RunWorkflowOnSendInvestmentForApprovalCode: Label 'RUNWORKFLOWONSENDINVESTMENTFORAPPROVAL';
        OnCancelInvestmentApprovalRequestTxt: Label 'An Approval of Investment Header is canceled';
        RunWorkflowOnCancelInvestmentForApprovalCode: Label 'RUNWORKFLOWONCANCELINVESTMENTFORAPPROVAL';

        OnSendEmpConfirmationApprovalRequestTxt: Label 'Approval of HR Employee Confirmation is requested';
        RunWorkflowOnSendEmpConfirmationForApprovalCode: Label 'RUNWORKFLOWONSENDEMPCONFIRMATIONFORAPPROVAL';
        OnCancelEmpConfirmationApprovalRequestTxt: Label 'An Approval of HR Employee Confirmation is canceled';
        RunWorkflowOnCancelEmpConfirmationForApprovalCode: Label 'RUNWORKFLOWONCANCELEMPCONFIRMATIONFORAPPROVAL';

        OnSendPromotionApprovalRequestTxt: Label 'Approval of HR Promo. Recommend Header is requested';
        RunWorkflowOnSendPromotionForApprovalCode: Label 'RUNWORKFLOWONSENDPROMOTIONFORAPPROVAL';
        OnCancelPromotionApprovalRequestTxt: Label 'An Approval of HR Promo. Recommend Header is canceled';
        RunWorkflowOnCancelPromotionForApprovalCode: Label 'RUNWORKFLOWONCANCELPROMOTIONFORAPPROVAL';

        OnSendProfessionalBodyApprovalRequestTxt: Label 'Approval of HR Professional body Header is requested';
        RunWorkflowOnSendProfessionalBodyForApprovalCode: Label 'RUNWORKFLOWONSENDPROFESSIONALBODYFORAPPROVAL';
        OnCancelProfessionalBodyApprovalRequestTxt: Label 'An Approval of HR Professional body Header is canceled';
        RunWorkflowOnCancelProfessionalBodyForApprovalCode: Label 'RUNWORKFLOWONCANCELPROFESSIONALBODYFORAPPROVAL';

        OnSendBalscorecardApprovalRequestTxt: Label 'Approval of HR Individual Targets Header is requested';
        RunWorkflowOnSendBalscorecardForApprovalCode: Label 'RUNWORKFLOWONSENDBALSCORECARDFORAPPROVAL';
        OnCancelBalscorecardApprovalRequestTxt: Label 'An Approval of HR Individual Targets Header is canceled';
        RunWorkflowOnCancelBalscorecardForApprovalCode: Label 'RUNWORKFLOWONCANCELBALSCORECARDFORAPPROVAL';

        OnSendTransReqApprovalRequestTxt: Label 'Approval of HR Transport Requisition is requested';
        RunWorkflowOnSendTransReqForApprovalCode: Label 'RUNWORKFLOWONSENDTRANSREQFORAPPROVAL';
        OnCancelTransReqApprovalRequestTxt: Label 'An Approval of HR Transport Requisition is canceled';
        RunWorkflowOnCancelTransReqForApprovalCode: Label 'RUNWORKFLOWONCANCELTRANSREQFORAPPROVAL';

        OnSendHROvertimeHeaderApprovalRequestTxt: Label 'Approval of HR Overtime Header is requested';
        RunWorkflowOnSendHROvertimeHeaderForApprovalCode: Label 'RUNWORKFLOWONSENDHROVERTIMEHEADERFORAPPROVAL';
        OnCancelHROvertimeHeaderApprovalRequestTxt: Label 'An Approval of HR Overtime Header is canceled';
        RunWorkflowOnCancelHROvertimeHeaderForApprovalCode: Label 'RUNWORKFLOWONCANCELHROVERTIMEHEADERFORAPPROVAL';

        OnSendJobstoSucceedApprovalRequestTxt: Label 'Approval of HR Jobs to Succeed is requested';
        RunWorkflowOnSendJobstoSucceedForApprovalCode: Label 'RUNWORKFLOWONSENDJOBSTOSUCCEEDFORAPPROVAL';
        OnCancelJobstoSucceedApprovalRequestTxt: Label 'An Approval of HR Jobs to Succeed is canceled';
        RunWorkflowOnCancelJobstoSucceedForApprovalCode: Label 'RUNWORKFLOWONCANCELJOBSTOSUCCEEDFORAPPROVAL';

        OnSendInductionScheduleApprovalRequestTxt: Label 'Approval of HR Induction Schedule is requested';
        RunWorkflowOnSendInductionScheduleForApprovalCode: Label 'RUNWORKFLOWONSENDINDUCTIONSCHEDULEFORAPPROVAL';
        OnCancelInductionScheduleApprovalRequestTxt: Label 'An Approval of HR Induction Schedule is canceled';
        RunWorkflowOnCancelInductionScheduleForApprovalCode: Label 'RUNWORKFLOWONCANCELINDUCTIONSCHEDULEFORAPPROVAL';

        OnSendQualifiedApplicantsApprovalRequestTxt: Label 'Approval of HR Job Applications is requested';
        RunWorkflowOnSendQualifiedApplicantsForApprovalCode: Label 'RUNWORKFLOWONSENDQUALIFIEDAPPLICANTSFORAPPROVAL';
        OnCancelQualifiedApplicantsApprovalRequestTxt: Label 'An Approval of HR Job Applications is canceled';
        RunWorkflowOnCancelQualifiedApplicantsForApprovalCode: Label 'RUNWORKFLOWONCANCELQUALIFIEDAPPLICANTSFORAPPROVAL';

        OnSendDiscCaseApprovalRequestTxt: Label 'Approval of HR Disciplinary Cases NCA is requested';
        RunWorkflowOnSendDiscCaseForApprovalCode: Label 'RUNWORKFLOWONSENDDISCCASEFORAPPROVAL';
        OnCancelDiscCaseApprovalRequestTxt: Label 'An Approval of HR Disciplinary Cases NCA is canceled';
        RunWorkflowOnCancelDiscCaseForApprovalCode: Label 'RUNWORKFLOWONCANCELDISCCASEFORAPPROVAL';

        OnSendChangeDetailsApprovalRequestTxt: Label 'Approval of prPayChange is requested';
        RunWorkflowOnSendChangeDetailsForApprovalCode: Label 'RUNWORKFLOWONSENDCHANGEDETAILSFORAPPROVAL';
        OnCancelChangeDetailsApprovalRequestTxt: Label 'An Approval of prPayChange is canceled';
        RunWorkflowOnCancelChangeDetailsForApprovalCode: Label 'RUNWORKFLOWONCANCELCHANGEDETAILSFORAPPROVAL';

        OnSendClearanceApprovalRequestTxt: Label 'Approval of Clearance Certificate is requested';
        RunWorkflowOnSendClearanceForApprovalCode: Label 'RUNWORKFLOWONSENDCLEARANCEFORAPPROVAL';
        OnCancelClearanceApprovalRequestTxt: Label 'An Approval of Clearance Certificate is canceled';
        RunWorkflowOnCancelClearanceForApprovalCode: Label 'RUNWORKFLOWONCANCELCLEARANCEFORAPPROVAL';

        OnSendHREmployeesChangesApprovalRequestTxt: Label 'Approval of HR Employees - Changes is requested';
        RunWorkflowOnSendHREmployeesChangesForApprovalCode: Label 'RUNWORKFLOWONSENDHREMPLOYEESCHANGESFORAPPROVAL';
        OnCancelHREmployeesChangesApprovalRequestTxt: Label 'An Approval of HR Employees - Changes is canceled';
        RunWorkflowOnCancelHREmployeesChangesForApprovalCode: Label 'RUNWORKFLOWONCANCELHREMPLOYEESCHANGESFORAPPROVAL';

        OnSendHREmpApprovalRequestTxt: Label 'Approval of HR Employees is requested';
        RunWorkflowOnSendHREmpForApprovalCode: Label 'RUNWORKFLOWONSENDHREMPFORAPPROVAL';
        OnCancelHREmpApprovalRequestTxt: Label 'An Approval of HR Employees is canceled';
        RunWorkflowOnCancelHREmpForApprovalCode: Label 'RUNWORKFLOWONCANCELHREMPFORAPPROVAL';

        OnSendPayChangeApprovalRequestTxt: Label 'Approval of Payroll Changes is requested';
        RunWorkflowOnSendPayChangeForApprovalCode: Label 'RUNWORKFLOWONSENDPAYCHANGEFORAPPROVAL';
        OnCancelPayChangeApprovalRequestTxt: Label 'An Approval of Payroll Changes is canceled';
        RunWorkflowOnCancelPayChangeForApprovalCode: Label 'RUNWORKFLOWONCANCELPAYCHANGEFORAPPROVAL';

        OnSendSeparationApprovalRequestTxt: Label 'Approval of Employee Separation Header is requested';
        RunWorkflowOnSendSeparationForApprovalCode: Label 'RUNWORKFLOWONSENDSEPARATIONFORAPPROVAL';
        OnCancelSeparationApprovalRequestTxt: Label 'An Approval of Employee Separation Header is canceled';
        RunWorkflowOnCancelSeparationForApprovalCode: Label 'RUNWORKFLOWONCANCELSEPARATIONFORAPPROVAL';

        OnSendPoolApprovalRequestTxt: Label 'Approval of Acceleration Pool Nomination is requested';
        RunWorkflowOnSendPoolForApprovalCode: Label 'RUNWORKFLOWONSENDPOOLFORAPPROVAL';
        OnCancelPoolApprovalRequestTxt: Label 'An Approval of Acceleration Pool Nomination is canceled';
        RunWorkflowOnCancelPoolForApprovalCode: Label 'RUNWORKFLOWONCANCELPOOLFORAPPROVAL';

        OnSendAssetRepairHeaderApprovalRequestTxt: Label 'Approval of Asset Repair Header is requested';//Denno
        RUNWORKFLOWONSENDASSETRepairHeaderForApprovalCode: Label 'RUNWORKFLOWONSENDASSETREPAIRHEADERFORAPPROVAL';
        OnCancelAssetRepairHeaderApprovalRequestTxt: Label 'An Approval of Asset Repair Header is canceled';
        RUNWORKFLOWONCANCELASSETRepairHeaderForApprovalCode: Label 'RUNWORKFLOWONCANCELASSETREPAIRHEADERFORAPPROVAL';

        OnSendHRTrainingNeedsApprovalRequestTxt: Label 'Approval of HR Training Needs is requested';//Denno
        RunWorkflowOnSendHRTrainingNeedsForApprovalCode: Label 'RUNWORKFLOWONSENDHRTRAININGNEEDSFORAPPROVAL';
        OnCancelHRTrainingNeedsApprovalRequestTxt: Label 'An Approval of HR Training Needs is canceled';
        RunWorkflowOnCancelHRTrainingNeedsForApprovalCode: Label 'RUNWORKFLOWONCANCELHRTRAININGNEEDSFORAPPROVAL';





    procedure CheckApprovalsWorkflowEnabled(var Variant: Variant): Boolean
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            Database::"Payments Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPaymentHeaderForApprovalCode));
            Database::"Imprest Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendImprestHeaderForApprovalCode));
            Database::"Imprest Surrender Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendImprestSurrForApprovalCode));
            Database::"InterBank Transfers":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendInterbankTransForApprovalCode));
            Database::"Receipts Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendReceiptForApprovalCode));
            Database::"Staff Claims Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendStaffClaimForApprovalCode));
            Database::"Staff Advance Headers":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendStaffAdvanceForApprovalCode));
            Database::"Staff Advance Surrender Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendStaffAdvanceSurrForApprovalCode));
            Database::"Cash Office Setup":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendCashOfficeSetupForApprovalCode));
            Database::"Gen. Journal Batch":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendGenJnlBatchForApprovalCode));
            Database::"HR Jobs":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendHRJobsForApprovalCode));
            Database::"HR Leave Application":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendHRLeaveAppForApprovalCode));
            //Leave Planner
            Database::"HR Leave Planner Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendHRLeavePlannerForApprovalCode));
            //Employee Transfer
            Database::"Employee Transfers":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendEmployeeTransferForApprovalCode));
            Database::"HR Employee Requisitions":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendHrempreqForApprovalCode));
            Database::"HR Training App Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTrainingForApprovalCode));
            Database::"HR Transport Allocations":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendhrtransportForApprovalCode));

            Database::"JV Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendJVHeaderForApprovalCode));
            Database::"HR Leave Reimbursement":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendHRLeaveReimbForApprovalCode));
            Database::Jobs:
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendmJobsForApprovalCode));
            Database::"Grant Surrender Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendGrantSurrHeaderForApprovalCode));
            Database::"Purch. Rcpt. Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendGRNForApprovalCode));
            Database::"HR Job Occupations":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RUNWORKFLOWONSENDASSETDonationForApprovalCode));
            Database::"HR Asset Transfer Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RUNWORKFLOWONSENDASSETTransferForApprovalCode));
            Database::"Staff Claim Lines":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPCAdviceForApprovalCode));
            Database::"G/L Budget Name":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBudgetForApprovalCode));
            Database::"G/L Account":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendGLAForApprovalCode));
            Database::"Inspection Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendinspectionHDForApprovalCode));
            Database::"Temp Fixed Asset":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendHRCarryOverForApprovalCode));
            Database::"HR OSInjured Person":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendcloseoutHDForApprovalCode));
            Database::"HR Employee Transfer Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendEmpTransForApprovalCode));
            Database::"General Ledger Setup":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendGLSetupForApprovalCode));
            Database::"Dimension Value":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDimValForApprovalCode));
            Database::"Master Record Creation Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendMasterForApprovalCode));
            Database::"Investment Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendInvestmentForApprovalCode));
            Database::"HR Employee Confirmation":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendEmpConfirmationForApprovalCode));
            Database::"HR Promo. Recommend Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPromotionForApprovalCode));
            Database::"HR Professional body Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendProfessionalBodyForApprovalCode));
            Database::"HR Individual Targets Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBalscorecardForApprovalCode));
            Database::"HR Transport Requisition":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTransReqForApprovalCode));
            Database::"HR Overtime Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendHROvertimeHeaderForApprovalCode));
            Database::"HR Jobs to Succeed":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendJobstoSucceedForApprovalCode));
            Database::"HR Induction Schedule":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendInductionScheduleForApprovalCode));
            Database::"HR Job Applications":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendQualifiedApplicantsForApprovalCode));
            Database::"HR Disciplinary Cases NCA":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDiscCaseForApprovalCode));
            Database::prPayChange:
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendChangeDetailsForApprovalCode));
            Database::"Clearance Certificate":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendClearanceForApprovalCode));
            Database::"HR Employees - Changes":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendHREmployeesChangesForApprovalCode));
            Database::"HR Employees":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendHREmpForApprovalCode));
            Database::"Payroll Changes":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPayChangeForApprovalCode));
            Database::"Employee Separation Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendSeparationForApprovalCode));
            Database::"Acceleration Pool Nomination":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPoolForApprovalCode));
            Database::"Asset Repair Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RUNWORKFLOWONSENDASSETRepairHeaderForApprovalCode));
            Database::"HR Training Needs":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendHRTrainingNeedsForApprovalCode));

        end;
    end;

    procedure CheckApprovalsWorkflowEnabledCode(var Variant: Variant; CheckApprovalsWorkflowTxt: Text): Boolean
    begin
        if not WorkflowManagement.CanExecuteWorkflow(Variant, CheckApprovalsWorkflowTxt) then
            Error(NoWorkflowEnabledErr);
        exit(true);
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure AddWorkflowEventsToLibrary()
    var
        WorkFlowEventHandling: Codeunit "Workflow Event Handling";
    begin
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendPaymentHeaderForApprovalCode, Database::"Payments Header", OnSendPaymentHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelPaymentHeaderForApprovalCode, Database::"Payments Header", OnCancelPaymentHeaderApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendImprestHeaderForApprovalCode, Database::"Imprest Header", OnSendImprestHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelImprestHeaderForApprovalCode, Database::"Imprest Header", OnCancelImprestHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendImprestSurrForApprovalCode, Database::"Imprest Surrender Header", OnSendImprestSurrApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelImprestSurrForApprovalCode, Database::"Imprest Surrender Header", OnCancelImprestSurrApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendInterbankTransForApprovalCode, Database::"InterBank Transfers", OnSendInterbankTransApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelInterbankTransForApprovalCode, Database::"InterBank Transfers", OnCancelInterbankTransApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendReceiptForApprovalCode, Database::"Receipts Header", OnSendReceiptApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelReceiptForApprovalCode, Database::"Receipts Header", OnCancelReceiptApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendStaffClaimForApprovalCode, Database::"Staff Claims Header", OnSendStaffClaimApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelStaffClaimForApprovalCode, Database::"Staff Claims Header", OnCancelStaffClaimApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendStaffAdvanceForApprovalCode, Database::"Staff Advance Headers", OnSendStaffAdvanceApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelStaffAdvanceForApprovalCode, Database::"Staff Advance Headers", OnCancelStaffAdvanceApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendStaffAdvanceSurrForApprovalCode, Database::"Staff Advance Surrender Header", OnSendStaffAdvanceSurrApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelStaffAdvanceSurrForApprovalCode, Database::"Staff Advance Surrender Header", OnCancelStaffAdvanceSurrApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendCashOfficeSetupForApprovalCode, Database::"Cash Office Setup", OnSendCashOfficeSetupApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelCashOfficeSetupForApprovalCode, Database::"Cash Office Setup", OnCancelCashOfficeSetupApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendGenJnlBatchForApprovalCode, Database::"Gen. Journal Batch", OnSendGenJnlBatchApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelGenJnlBatchForApprovalCode, Database::"Gen. Journal Batch", OnCancelGenJnlBatchApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendHRJobsForApprovalCode, Database::"HR Jobs", OnSendHRJobsApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelHRJobsForApprovalCode, Database::"HR Jobs", OnCancelHRJobsApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendHRLeaveAppForApprovalCode, Database::"HR Leave Application", OnSendHRLeaveAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelHRLeaveAppForApprovalCode, Database::"HR Leave Application", OnCancelHRLeaveAppApprovalRequestTxt, 0, false);
        //Leave Planner
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendHRLeavePlannerForApprovalCode, Database::"HR Leave Planner Header", OnSendHRLeavePlannerApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelHRLeavePlannerForApprovalCode, Database::"HR Leave Planner Header", OnCancelHRLeavePlannerApprovalRequestTxt, 0, false);
        //Employee Transfer
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendEMployeeTransferForApprovalCode, Database::"Employee Transfers", OnSendEmployeeTransferApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelEmployeeTransferForApprovalCode, Database::"Employee Transfers", OnCancelEmployeeTransferApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendHrempreqForApprovalCode, Database::"HR Employee Requisitions", OnSendHrempreqApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelHrempreqForApprovalCode, Database::"HR Employee Requisitions", OnCancelHrempreqApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendTrainingForApprovalCode, Database::"HR Training App Header", OnSendTrainingApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelTrainingForApprovalCode, Database::"HR Training App Header", OnCancelTrainingApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendhrtransportForApprovalCode, Database::"HR Transport Allocations", OnSendhrtransportApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelhrtransportForApprovalCode, Database::"HR Transport Allocations", OnCancelhrtransportApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendJVHeaderForApprovalCode, Database::"JV Header", OnSendJVHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelJVHeaderForApprovalCode, Database::"JV Header", OnCancelJVHeaderApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendHRLeaveReimbForApprovalCode, Database::"HR Leave Reimbursement", OnSendHRLeaveReimbApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelHRLeaveReimbForApprovalCode, Database::"HR Leave Reimbursement", OnCancelHRLeaveReimbApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendmJobsForApprovalCode, Database::Jobs, OnSendmJobsApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelmJobsForApprovalCode, Database::Jobs, OnCancelmJobsApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendGrantSurrHeaderForApprovalCode, Database::"Grant Surrender Header", OnSendGrantSurrHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelGrantSurrHeaderForApprovalCode, Database::"Grant Surrender Header", OnCancelGrantSurrHeaderApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendGRNForApprovalCode, Database::"Purch. Rcpt. Header", OnSendGRNApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelGRNForApprovalCode, Database::"Purch. Rcpt. Header", OnCancelGRNApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RUNWORKFLOWONSENDASSETDonationForApprovalCode, Database::"HR Job Occupations", OnSendAssetDonationApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RUNWORKFLOWONCANCELASSETDonationForApprovalCode, Database::"HR Job Occupations", OnCancelAssetDonationApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RUNWORKFLOWONSENDASSETTransferForApprovalCode, Database::"HR Asset Transfer Header", OnSendAssetTransferApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RUNWORKFLOWONCANCELASSETTransferForApprovalCode, Database::"HR Asset Transfer Header", OnCancelAssetTransferApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendPCAdviceForApprovalCode, Database::"Staff Claim Lines", OnSendPCAdviceApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelPCAdviceForApprovalCode, Database::"Staff Claim Lines", OnCancelPCAdviceApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendBudgetForApprovalCode, Database::"G/L Budget Name", OnSendBudgetApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelBudgetForApprovalCode, Database::"G/L Budget Name", OnCancelBudgetApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendGLAForApprovalCode, Database::"G/L Account", OnSendGLAApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelGLAForApprovalCode, Database::"G/L Account", OnCancelGLAApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendinspectionHDForApprovalCode, Database::"Inspection Header", OnSendinspectionHDApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelinspectionHDForApprovalCode, Database::"Inspection Header", OnCancelinspectionHDApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendHRCarryOverForApprovalCode, Database::"Temp Fixed Asset", OnSendHRCarryOverApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelHRCarryOverForApprovalCode, Database::"Temp Fixed Asset", OnCancelHRCarryOverApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendcloseoutHDForApprovalCode, Database::"HR OSInjured Person", OnSendcloseoutHDApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelcloseoutHDForApprovalCode, Database::"HR OSInjured Person", OnCancelcloseoutHDApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendEmpTransForApprovalCode, Database::"HR Employee Transfer Header", OnSendEmpTransApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelEmpTransForApprovalCode, Database::"HR Employee Transfer Header", OnCancelEmpTransApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendGLSetupForApprovalCode, Database::"General Ledger Setup", OnSendGLSetupApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelGLSetupForApprovalCode, Database::"General Ledger Setup", OnCancelGLSetupApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendDimValForApprovalCode, Database::"Dimension Value", OnSendDimValApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelDimValForApprovalCode, Database::"Dimension Value", OnCancelDimValApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendMasterForApprovalCode, Database::"Master Record Creation Header", OnSendMasterApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelMasterForApprovalCode, Database::"Master Record Creation Header", OnCancelMasterApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendInvestmentForApprovalCode, Database::"Investment Header", OnSendInvestmentApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelInvestmentForApprovalCode, Database::"Investment Header", OnCancelInvestmentApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendEmpConfirmationForApprovalCode, Database::"HR Employee Confirmation", OnSendEmpConfirmationApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelEmpConfirmationForApprovalCode, Database::"HR Employee Confirmation", OnCancelEmpConfirmationApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendPromotionForApprovalCode, Database::"HR Promo. Recommend Header", OnSendPromotionApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelPromotionForApprovalCode, Database::"HR Promo. Recommend Header", OnCancelPromotionApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendProfessionalBodyForApprovalCode, Database::"HR Professional body Header", OnSendProfessionalBodyApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelProfessionalBodyForApprovalCode, Database::"HR Professional body Header", OnCancelProfessionalBodyApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendBalscorecardForApprovalCode, Database::"HR Individual Targets Header", OnSendBalscorecardApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelBalscorecardForApprovalCode, Database::"HR Individual Targets Header", OnCancelBalscorecardApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendTransReqForApprovalCode, Database::"HR Transport Requisition", OnSendTransReqApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelTransReqForApprovalCode, Database::"HR Transport Requisition", OnCancelTransReqApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendHROvertimeHeaderForApprovalCode, Database::"HR Overtime Header", OnSendHROvertimeHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelHROvertimeHeaderForApprovalCode, Database::"HR Overtime Header", OnCancelHROvertimeHeaderApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendJobstoSucceedForApprovalCode, Database::"HR Jobs to Succeed", OnSendJobstoSucceedApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelJobstoSucceedForApprovalCode, Database::"HR Jobs to Succeed", OnCancelJobstoSucceedApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendInductionScheduleForApprovalCode, Database::"HR Induction Schedule", OnSendInductionScheduleApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelInductionScheduleForApprovalCode, Database::"HR Induction Schedule", OnCancelInductionScheduleApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendQualifiedApplicantsForApprovalCode, Database::"HR Job Applications", OnSendQualifiedApplicantsApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelQualifiedApplicantsForApprovalCode, Database::"HR Job Applications", OnCancelQualifiedApplicantsApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendDiscCaseForApprovalCode, Database::"HR Disciplinary Cases NCA", OnSendDiscCaseApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelDiscCaseForApprovalCode, Database::"HR Disciplinary Cases NCA", OnCancelDiscCaseApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendChangeDetailsForApprovalCode, Database::prPayChange, OnSendChangeDetailsApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelChangeDetailsForApprovalCode, Database::prPayChange, OnCancelChangeDetailsApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendClearanceForApprovalCode, Database::"Clearance Certificate", OnSendClearanceApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelClearanceForApprovalCode, Database::"Clearance Certificate", OnCancelClearanceApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendHREmployeesChangesForApprovalCode, Database::"HR Employees - Changes", OnSendHREmployeesChangesApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelHREmployeesChangesForApprovalCode, Database::"HR Employees - Changes", OnCancelHREmployeesChangesApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendHREmpForApprovalCode, Database::"HR Employees", OnSendHREmpApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelHREmpForApprovalCode, Database::"HR Employees", OnCancelHREmpApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendPayChangeForApprovalCode, Database::"Payroll Changes", OnSendPayChangeApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelPayChangeForApprovalCode, Database::"Payroll Changes", OnCancelPayChangeApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendSeparationForApprovalCode, Database::"Employee Separation Header", OnSendSeparationApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelSeparationForApprovalCode, Database::"Employee Separation Header", OnCancelSeparationApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendPoolForApprovalCode, Database::"Acceleration Pool Nomination", OnSendPoolApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelPoolForApprovalCode, Database::"Acceleration Pool Nomination", OnCancelPoolApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(RUNWORKFLOWONSENDASSETRepairHeaderForApprovalCode, Database::"Asset Repair Header", OnSendAssetRepairHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RUNWORKFLOWONCANCELASSETRepairHeaderForApprovalCode, Database::"Asset Repair Header", OnCancelAssetRepairHeaderApprovalRequestTxt, 0, false);

        //Denno3
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendHRTrainingNeedsForApprovalCode, Database::"HR Training Needs", OnSendHRTrainingNeedsApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelHRTrainingNeedsForApprovalCode, Database::"HR Training Needs", OnCancelHRTrainingNeedsApprovalRequestTxt, 0, false);


    end;

    local procedure RunWorkflowOnSendApprovalRequestCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendApprovalRequest'));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgt", 'OnSendDocForApproval', '', false, false)]
    procedure RunWorkflowOnSendApprovalRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            Database::"Payments Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPaymentHeaderForApprovalCode, Variant);
            Database::"Imprest Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendImprestHeaderForApprovalCode, Variant);
            Database::"Imprest Surrender Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendImprestSurrForApprovalCode, Variant);
            Database::"InterBank Transfers":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendInterbankTransForApprovalCode, Variant);
            Database::"Receipts Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendReceiptForApprovalCode, Variant);
            Database::"Staff Claims Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendStaffClaimForApprovalCode, Variant);
            Database::"Staff Advance Headers":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendStaffAdvanceForApprovalCode, Variant);
            Database::"Staff Advance Surrender Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendStaffAdvanceSurrForApprovalCode, Variant);
            Database::"Cash Office Setup":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendCashOfficeSetupForApprovalCode, Variant);
            Database::"Gen. Journal Batch":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendGenJnlBatchForApprovalCode, Variant);
            Database::"HR Jobs":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHRJobsForApprovalCode, Variant);
            Database::"HR Leave Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHRLeaveAppForApprovalCode, Variant);
            //Leave Planner
            Database::"HR Leave Planner Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHRLeavePlannerForApprovalCode, Variant);
            //Employee Transfer
            Database::"Employee Transfers":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendEmployeeTransferForApprovalCode, Variant);
            Database::"HR Employee Requisitions":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHrempreqForApprovalCode, Variant);
            Database::"HR Training App Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendTrainingForApprovalCode, Variant);
            Database::"HR Transport Allocations":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendhrtransportForApprovalCode, Variant);

            Database::"JV Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendJVHeaderForApprovalCode, Variant);
            Database::"HR Leave Reimbursement":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHRLeaveReimbForApprovalCode, Variant);
            Database::Jobs:
                WorkflowManagement.HandleEvent(RunWorkflowOnSendmJobsForApprovalCode, Variant);
            Database::"Grant Surrender Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendGrantSurrHeaderForApprovalCode, Variant);
            Database::"Purch. Rcpt. Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendGRNForApprovalCode, Variant);
            Database::"HR Job Occupations":
                WorkflowManagement.HandleEvent(RUNWORKFLOWONSENDASSETDonationForApprovalCode, Variant);
            Database::"HR Asset Transfer Header":
                WorkflowManagement.HandleEvent(RUNWORKFLOWONSENDASSETTransferForApprovalCode, Variant);
            Database::"Staff Claim Lines":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPCAdviceForApprovalCode, Variant);
            Database::"G/L Budget Name":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendBudgetForApprovalCode, Variant);
            Database::"G/L Account":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendGLAForApprovalCode, Variant);
            Database::"Inspection Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendinspectionHDForApprovalCode, Variant);
            Database::"Temp Fixed Asset":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHRCarryOverForApprovalCode, Variant);
            Database::"HR OSInjured Person":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendcloseoutHDForApprovalCode, Variant);
            Database::"HR Employee Transfer Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendEmpTransForApprovalCode, Variant);
            Database::"General Ledger Setup":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendGLSetupForApprovalCode, Variant);
            Database::"Dimension Value":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDimValForApprovalCode, Variant);
            Database::"Master Record Creation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendMasterForApprovalCode, Variant);
            Database::"Investment Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendInvestmentForApprovalCode, Variant);
            Database::"HR Employee Confirmation":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendEmpConfirmationForApprovalCode, Variant);
            Database::"HR Promo. Recommend Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPromotionForApprovalCode, Variant);
            Database::"HR Professional body Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendProfessionalBodyForApprovalCode, Variant);
            Database::"HR Individual Targets Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendBalscorecardForApprovalCode, Variant);
            Database::"HR Transport Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendTransReqForApprovalCode, Variant);
            Database::"HR Overtime Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHROvertimeHeaderForApprovalCode, Variant);
            Database::"HR Jobs to Succeed":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendJobstoSucceedForApprovalCode, Variant);
            Database::"HR Induction Schedule":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendInductionScheduleForApprovalCode, Variant);
            Database::"HR Job Applications":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendQualifiedApplicantsForApprovalCode, Variant);
            Database::"HR Disciplinary Cases NCA":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDiscCaseForApprovalCode, Variant);
            Database::prPayChange:
                WorkflowManagement.HandleEvent(RunWorkflowOnSendChangeDetailsForApprovalCode, Variant);
            Database::"Clearance Certificate":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendClearanceForApprovalCode, Variant);
            Database::"HR Employees - Changes":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHREmployeesChangesForApprovalCode, Variant);
            Database::"HR Employees":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHREmpForApprovalCode, Variant);
            Database::"Payroll Changes":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPayChangeForApprovalCode, Variant);
            Database::"Employee Separation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendSeparationForApprovalCode, Variant);
            Database::"Acceleration Pool Nomination":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPoolForApprovalCode, Variant);
            Database::"Asset Repair Header":
                WorkflowManagement.HandleEvent(RUNWORKFLOWONSENDASSETRepairHeaderForApprovalCode, Variant);
            Database::"HR Training Needs":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHRTrainingNeedsForApprovalCode, Variant);

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgt", 'OnCancelDocApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelApprovalRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            Database::"Payments Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPaymentHeaderForApprovalCode, Variant);
            Database::"Imprest Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelImprestHeaderForApprovalCode, Variant);
            Database::"Imprest Surrender Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelImprestSurrForApprovalCode, Variant);
            Database::"InterBank Transfers":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelInterbankTransForApprovalCode, Variant);
            Database::"Receipts Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelReceiptForApprovalCode, Variant);
            Database::"Staff Claims Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelStaffClaimForApprovalCode, Variant);
            Database::"Staff Advance Headers":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelStaffAdvanceForApprovalCode, Variant);
            Database::"Staff Advance Surrender Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelStaffAdvanceSurrForApprovalCode, Variant);
            Database::"Cash Office Setup":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelCashOfficeSetupForApprovalCode, Variant);
            Database::"Gen. Journal Batch":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelGenJnlBatchForApprovalCode, Variant);
            Database::"HR Jobs":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHRJobsForApprovalCode, Variant);
            Database::"HR Leave Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHRLeaveAppForApprovalCode, Variant);
            //Leave Planner
            Database::"HR Leave Planner Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHRLeavePlannerForApprovalCode, Variant);
            //Employee Transfer
            Database::"Employee Transfers":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelEmployeeTransferForApprovalCode, Variant);
            Database::"HR Employee Requisitions":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHrempreqForApprovalCode, Variant);
            Database::"HR Training App Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelTrainingForApprovalCode, Variant);
            Database::"HR Transport Allocations":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelhrtransportForApprovalCode, Variant);

            Database::"JV Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelJVHeaderForApprovalCode, Variant);
            Database::"HR Leave Reimbursement":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHRLeaveReimbForApprovalCode, Variant);
            Database::Jobs:
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelmJobsForApprovalCode, Variant);
            Database::"Grant Surrender Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelGrantSurrHeaderForApprovalCode, Variant);
            Database::"Purch. Rcpt. Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelGRNForApprovalCode, Variant);
            Database::"HR Job Occupations":
                WorkflowManagement.HandleEvent(RUNWORKFLOWONCANCELASSETDonationForApprovalCode, Variant);
            Database::"HR Asset Transfer Header":
                WorkflowManagement.HandleEvent(RUNWORKFLOWONCANCELASSETTransferForApprovalCode, Variant);
            Database::"Staff Claim Lines":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPCAdviceForApprovalCode, Variant);
            Database::"G/L Budget Name":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelBudgetForApprovalCode, Variant);
            Database::"G/L Account":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelGLAForApprovalCode, Variant);
            Database::"Inspection Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelinspectionHDForApprovalCode, Variant);
            Database::"Temp Fixed Asset":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHRCarryOverForApprovalCode, Variant);
            Database::"HR OSInjured Person":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelcloseoutHDForApprovalCode, Variant);
            Database::"HR Employee Transfer Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelEmpTransForApprovalCode, Variant);
            Database::"General Ledger Setup":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelGLSetupForApprovalCode, Variant);
            Database::"Dimension Value":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelDimValForApprovalCode, Variant);
            Database::"Master Record Creation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelMasterForApprovalCode, Variant);
            Database::"Investment Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelInvestmentForApprovalCode, Variant);
            Database::"HR Employee Confirmation":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelEmpConfirmationForApprovalCode, Variant);
            Database::"HR Promo. Recommend Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPromotionForApprovalCode, Variant);
            Database::"HR Professional body Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelProfessionalBodyForApprovalCode, Variant);
            Database::"HR Individual Targets Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelBalscorecardForApprovalCode, Variant);
            Database::"HR Transport Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelTransReqForApprovalCode, Variant);
            Database::"HR Overtime Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHROvertimeHeaderForApprovalCode, Variant);
            Database::"HR Jobs to Succeed":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelJobstoSucceedForApprovalCode, Variant);
            Database::"HR Induction Schedule":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelInductionScheduleForApprovalCode, Variant);
            Database::"HR Job Applications":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelQualifiedApplicantsForApprovalCode, Variant);
            Database::"HR Disciplinary Cases NCA":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelDiscCaseForApprovalCode, Variant);
            Database::prPayChange:
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelChangeDetailsForApprovalCode, Variant);
            Database::"Clearance Certificate":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelClearanceForApprovalCode, Variant);
            Database::"HR Employees - Changes":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHREmployeesChangesForApprovalCode, Variant);
            Database::"HR Employees":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHREmpForApprovalCode, Variant);
            Database::"Payroll Changes":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPayChangeForApprovalCode, Variant);
            Database::"Employee Separation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelSeparationForApprovalCode, Variant);
            Database::"Acceleration Pool Nomination":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPoolForApprovalCode, Variant);
            Database::"Asset Repair Header":
                WorkflowManagement.HandleEvent(RUNWORKFLOWONCANCELASSETRepairHeaderForApprovalCode, Variant);
            Database::"HR Training Needs":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHRTrainingNeedsForApprovalCode, Variant);

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeCheckUserAsApprovalAdministrator', '', false, false)]
    local procedure BypassUserIDCheck(ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean)
    begin
        if ApprovalEntry."Approver ID" <> '' then
            // Set IsHandled to true to bypass the standard approval process
            IsHandled := true;

        // Implement any additional custom logic here, if necessary
        // For example, log a message or perform other actions
        //Message('Bypassing the check of User ID against Approver ID.');
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeCreateApprReqForApprTypeWorkflowUserGroup', '', false, false)]
    local procedure OnBeforeCreateApprReqForApprTypeWorkflowUserGroup(var Sender: Codeunit "Approvals Mgmt."; var WorkflowUserGroupMember: Record "Workflow User Group Member"; WorkflowStepArgument: Record "Workflow Step Argument"; ApprovalEntry: Record "Approval Entry"; SequenceNo: Integer; var IsHandled: Boolean);
    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        ApproverId: Code[50];
        UserSetup: Record "User Setup";
        HRLeave: Record "HR Leave Application";
    begin
        if ApprovalEntry."Table ID" = 52193448 then
            exit;
        if ApprovalEntry."Table ID" = 52193448 then
            if HRLeave.Get(ApprovalEntry."Document No.") then begin

                UserSetup.Reset();
                UserSetup.SetRange("User ID", HRLeave."User ID");
                //UserSetup.SetRange("Approval Administrator", true);
                if UserSetup.FindFirst() then
                    if UserSetup."Approver ID" <> '' then begin
                        //if UserSetup."User ID" <> '' then begin
                        ApproverId := UserSetup."Approver ID";
                        ApprovalMgt.MakeApprovalEntry(ApprovalEntry, 0, ApproverId, WorkflowStepArgument);
                    end;
            end;
    end;

    [IntegrationEvent(false, false)]
    procedure OnSendDocForApproval(var Variant: Variant)
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnCancelDocApprovalRequest(var Variant: Variant)
    begin
    end;

    procedure CreateTransferAllowancePayChange(EmpTrans: Record "Employee Transfers")
    var
        PayChange: Record "prBasic pay PCA";
        Lines: Record "prEmployee Trans PCA";
        HRSetup: Record "PR Vital Setup Info";
        SalaryScale: Record "Salary Scales";
        Employee: Record "HR Employees";
        SalaryCard: Record "PR Salary Card";
        PayrollSetup: Record "PR Vital Setup Info";
        DutyStation: Record "Duty Station";
        PayPeriod: Record "PR Payroll Periods";
        Begindate: Date;
    begin
        if EmpTrans.Type = EmpTrans.Type::"Self initiated" then
            exit;
        Employee.Get(EmpTrans."Employee No");
        SalaryScale.Get(Employee.Grade);
        PayChange.Init();
        PayChange.Validate("Employee Code", EmpTrans."Employee No");
        PayChange."Source Document" := PayChange."Source Document"::Mobility;
        PayChange."Change Advice Serial No." := EmpTrans."Document No";
        PayChange.Insert(true);
        HRSetup.Get();
        Lines.Init();
        Lines.Validate("Transaction Code", HRSetup."Baggage Allowance Code");
        Lines."Employee Code" := PayChange."Employee Code";
        Lines."Change Advice Serial No." := PayChange."Change Advice Serial No.";
        Lines.Amount := SalaryScale."Mobility Transfer Rate" * EmpTrans.Distance;
        Lines.Insert();
        Lines.Init();
        SalaryCard.Get(EmpTrans."Employee No");
        Lines.Validate("Transaction Code", HRSetup."Transfer Allowance Code");
        Lines."Employee Code" := PayChange."Employee Code";
        Lines."Change Advice Serial No." := PayChange."Change Advice Serial No.";
        Lines.Amount := SalaryCard."Basic Pay";
        Lines.Insert();


        GetPayPeriod();
        PayrollSetup.Get();
        PayrollSetup.TestField("Hardship Allowance Code");
        DutyStation.Get(EmpTrans."Original Station");
        if DutyStation."Hardship Area" then begin
            Lines.Init();
            Lines."Employee Code" := PayChange."Employee Code";
            Lines."Change Advice Serial No." := PayChange."Change Advice Serial No.";
            Lines."Employee Code" := PayChange."Employee Code";
            Lines.Validate("Transaction Code", PayrollSetup."Hardship Allowance Code");
            Lines."Payroll Period" := Begindate;
            // Lines.Amount := 40 / 100 * PayChange."Basic Pay";
            if PayPeriod.Get(Begindate) then begin
                Lines."Period Month" := PayPeriod."Period Month";
                Lines."Period Year" := PayPeriod."Period Year";
            end;
            Lines.Insert();
        end;
    end;

    procedure GetPayPeriod()
    var
        PayPeriod: Record "PR Payroll Periods";
        Begindate: Date;
    begin
        PayPeriod.Reset();
        PayPeriod.SetRange(PayPeriod.Closed, false);
        if PayPeriod.Find('-') then
            Begindate := PayPeriod."Date Opened";
    end;




}

