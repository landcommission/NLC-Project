codeunit 50107 "Response Handling"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Variant: Variant;
        PaymentHeader: Record "Payments Header";
        ImprestHeader: Record "Imprest Header";
        SRHeader: Record "Store Requistion Headers";
        ImprestSurr: Record "Imprest Surrender Header";
        InterbankTrans: Record "InterBank Transfers";
        Receipt: Record "Receipts Header";
        StaffClaim: Record "Staff Claims Header";
        StaffAdvance: Record "Staff Advance Headers";
        StaffAdvanceSurr: Record "Staff Advance Surrender Header";
        GenJnlBatch: Record "Gen. Journal Batch";
        HRJobs: Record "HR Jobs";
        HRLeaveApp: Record "HR Leave Application";
        Hrempreq: Record "HR Employee Requisitions";
        Training: Record "HR Training App Header";
        JVHeader: Record "JV Header";
        HRLeaveReimb: Record "HR Leave Reimbursement";
        mJobs: Record Jobs;
        GrantSurrHeader: Record "Grant Surrender Header";
        GRN: Record "Purch. Rcpt. Header";
        AssetTransfer: Record "HR Asset Transfer Header";
        Budget: Record "G/L Budget Name";
        GLA: Record "G/L Account";
        inspectionHD: Record "Inspection Header";
        EmpTrans: Record "HR Employee Transfer Header";
        Master: Record "Master Record Creation Header";
        Investment: Record "Investment Header";
        EmpConfirmation: Record "HR Employee Confirmation";
        Promotion: Record "HR Promo. Recommend Header";
        ProfessionalBody: Record "HR Professional body Header";
        Balscorecard: Record "HR Individual Targets Header";
        TransReq: Record "HR Transport Requisition";
        HROvertimeHeader: Record "HR Overtime Header";
        JobstoSucceed: Record "HR Jobs to Succeed";
        InductionSchedule: Record "HR Induction Schedule";
        QualifiedApplicants: Record "HR Job Applications";
        DiscCase: Record "HR Disciplinary Cases NCA";
        ChangeDetails: Record prPayChange;
        Clearance: Record "Clearance Certificate";
        HREmployeesChanges: Record "HR Employees - Changes";
        HREmp: Record "HR Employees";
        PayChange: Record "Payroll Changes";
        Separation: Record "Employee Separation Header";
        Pool: Record "Acceleration Pool Nomination";
        HRTrainingNeeds: Record "HR Training Needs";
        LeavePlanner: Record "HR Leave Planner Header";
        EmployeeTransfer: Record "Employee Transfers";
        AssetRep: Record "Asset Repair Header";

    begin
        case RecRef.Number of
            Database::"Asset Repair Header":
                begin
                    RecRef.SetTable(AssetRep);
                    AssetRep.Validate(Status, AssetRep.Status::New);
                    AssetRep.Modify();
                    Variant := AssetRep;
                    Handled := true;
                end;
            Database::"Payments Header":
                begin
                    RecRef.SetTable(PaymentHeader);
                    PaymentHeader.Validate(Status, PaymentHeader.Status::Pending);
                    PaymentHeader.Modify();
                    Variant := PaymentHeader;
                    Handled := true;
                end;
            Database::"Imprest Header":
                begin
                    RecRef.SetTable(ImprestHeader);
                    ImprestHeader.Validate(Status, ImprestHeader.Status::Pending);
                    ImprestHeader.Modify();
                    Variant := ImprestHeader;
                    Handled := true;
                end;
            Database::"Store Requistion Headers":
                begin
                    RecRef.SetTable(SRHeader);
                    SRHeader.Validate(Status, SRHeader.Status::Open);
                    SRHeader.Modify();
                    Variant := SRHeader;
                    Handled := true;
                end;
            Database::"Imprest Surrender Header":
                begin
                    RecRef.SetTable(ImprestSurr);
                    ImprestSurr.Validate(Status, ImprestSurr.Status::Pending);
                    ImprestSurr.Modify();
                    Variant := ImprestSurr;
                    Handled := true;
                end;
            Database::"InterBank Transfers":
                begin
                    RecRef.SetTable(InterbankTrans);
                    InterbankTrans.Validate(Status, InterbankTrans.Status::Pending);
                    InterbankTrans.Modify();
                    Variant := InterbankTrans;
                    Handled := true;
                end;
            Database::"Receipts Header":
                begin
                    RecRef.SetTable(Receipt);
                    Receipt.Validate(Status, Receipt.Status::" ");
                    Receipt.Modify();
                    Variant := Receipt;
                    Handled := true;
                end;
            Database::"Staff Claims Header":
                begin
                    RecRef.SetTable(StaffClaim);
                    StaffClaim.Validate(Status, StaffClaim.Status::Pending);
                    StaffClaim.Modify();
                    Variant := StaffClaim;
                    Handled := true;
                end;
            Database::"Staff Advance Headers":
                begin
                    RecRef.SetTable(StaffAdvance);
                    StaffAdvance.Validate(Status, StaffAdvance.Status::Pending);
                    StaffAdvance.Modify();
                    Variant := StaffAdvance;
                    Handled := true;
                end;
            Database::"Staff Advance Surrender Header":
                begin
                    RecRef.SetTable(StaffAdvanceSurr);
                    StaffAdvanceSurr.Validate(Status, StaffAdvanceSurr.Status::Pending);
                    StaffAdvanceSurr.Modify();
                    Variant := StaffAdvanceSurr;
                    Handled := true;
                end;
            Database::"Gen. Journal Batch":
                begin
                    RecRef.SetTable(GenJnlBatch);
                    GenJnlBatch.Validate(Status, GenJnlBatch.Status::Open);
                    GenJnlBatch.Modify();
                    Variant := GenJnlBatch;
                    Handled := true;
                end;
            Database::"HR Jobs":
                begin
                    RecRef.SetTable(HRJobs);
                    HRJobs.Validate(Status, HRJobs.Status::New);
                    HRJobs.Modify();
                    Variant := HRJobs;
                    Handled := true;
                end;
            Database::"HR Leave Application":
                begin
                    RecRef.SetTable(HRLeaveApp);
                    HRLeaveApp.Status := HRLeaveApp.Status::New;
                    HRLeaveApp.Modify();
                    Variant := HRLeaveApp;
                    Handled := true;
                end;

            Database::"HR Leave Planner Header":
                begin
                    RecRef.SetTable(LeavePlanner);
                    LeavePlanner.Status := LeavePlanner.Status::New;
                    LeavePlanner.Modify();
                    Variant := LeavePlanner;
                    Handled := true;
                end;
            //Employee Transfer
            Database::"Employee Transfers":
                begin
                    RecRef.SetTable(EmployeeTransfer);
                    //EmployeeTransfer.Status := EmployeeTransfer.Status::Open;
                    EmployeeTransfer.Validate(Status, EmployeeTransfer.Status::Open);
                    EmployeeTransfer.Modify();
                    Variant := EmployeeTransfer;
                    Handled := true;
                end;
            Database::"HR Employee Requisitions":
                begin
                    RecRef.SetTable(Hrempreq);
                    Hrempreq.Validate(Status, Hrempreq.Status::New);
                    Hrempreq.Advertised := false;
                    Hrempreq.Modify();
                    Variant := Hrempreq;
                    Handled := true;
                end;
            Database::"HR Training App Header":
                begin
                    RecRef.SetTable(Training);
                    Training.Validate(Status, Training.Status::New);
                    Training.Modify();
                    Variant := Training;
                    Handled := true;
                end;

            Database::"JV Header":
                begin
                    RecRef.SetTable(JVHeader);
                    JVHeader.Validate(Status, JVHeader.Status::Pending);
                    JVHeader.Modify();
                    Variant := JVHeader;
                    Handled := true;
                end;
            Database::"HR Leave Reimbursement":
                begin
                    RecRef.SetTable(HRLeaveReimb);
                    HRLeaveReimb.Validate(Status, HRLeaveReimb.Status::New);
                    HRLeaveReimb.Modify();
                    Variant := HRLeaveReimb;
                    Handled := true;
                end;
            Database::Jobs:
                begin
                    RecRef.SetTable(mJobs);
                    mJobs.Validate("Approval Status", mJobs."Approval Status"::Open);
                    mJobs.Modify();
                    Variant := mJobs;
                    Handled := true;
                end;
            Database::"Grant Surrender Header":
                begin
                    RecRef.SetTable(GrantSurrHeader);
                    GrantSurrHeader.Validate(Status, GrantSurrHeader.Status::Pending);
                    GrantSurrHeader.Modify();
                    Variant := GrantSurrHeader;
                    Handled := true;
                end;
            Database::"Purch. Rcpt. Header":
                begin
                    RecRef.SetTable(GRN);
                    GRN.Validate(Status, GRN.Status::Open);
                    GRN.Modify();
                    Variant := GRN;
                    Handled := true;
                end;

            Database::"HR Asset Transfer Header":
                begin
                    RecRef.SetTable(AssetTransfer);
                    AssetTransfer.Validate(Status, AssetTransfer.Status::Open);
                    AssetTransfer.Modify();
                    Variant := AssetTransfer;
                    Handled := true;
                end;

            Database::"G/L Budget Name":
                begin
                    RecRef.SetTable(Budget);
                    Budget.Validate(Status, Budget.Status::Open);
                    Budget.Modify();
                    Variant := Budget;
                    Handled := true;
                end;
            Database::"G/L Account":
                begin
                    RecRef.SetTable(GLA);
                    GLA.Validate(Status, GLA.Status::New);
                    GLA.Modify();
                    Variant := GLA;
                    Handled := true;
                end;
            Database::"Inspection Header":
                begin
                    RecRef.SetTable(inspectionHD);
                    inspectionHD.Validate(Status, inspectionHD.Status::Open);
                    inspectionHD.Modify();
                    Variant := inspectionHD;
                    Handled := true;
                end;

            Database::"HR Employee Transfer Header":
                begin
                    RecRef.SetTable(EmpTrans);
                    EmpTrans.Status := EmpTrans.Status::New;
                    EmpTrans.Modify();
                    Variant := EmpTrans;
                    Handled := true;
                end;

            Database::"Master Record Creation Header":
                begin
                    RecRef.SetTable(Master);
                    Master.Validate(Status, Master.Status::Open);
                    Master.Modify();
                    Variant := Master;
                    Handled := true;
                end;
            Database::"Investment Header":
                begin
                    RecRef.SetTable(Investment);
                    Investment.Validate(Status, Investment.Status::Open);
                    Investment.Modify();
                    Variant := Investment;
                    Handled := true;
                end;
            Database::"HR Employee Confirmation":
                begin
                    RecRef.SetTable(EmpConfirmation);
                    EmpConfirmation.Validate(Status, EmpConfirmation.Status::New);
                    EmpConfirmation.Modify();
                    Variant := EmpConfirmation;
                    Handled := true;
                end;
            Database::"HR Promo. Recommend Header":
                begin
                    RecRef.SetTable(Promotion);
                    Promotion.Validate(Status, Promotion.Status::New);
                    Promotion.Modify();
                    Variant := Promotion;
                    Handled := true;
                end;
            Database::"HR Professional body Header":
                begin
                    RecRef.SetTable(ProfessionalBody);
                    ProfessionalBody.Validate(Status, ProfessionalBody.Status::New);
                    ProfessionalBody.Modify();
                    Variant := ProfessionalBody;
                    Handled := true;
                end;
            Database::"HR Individual Targets Header":
                begin
                    RecRef.SetTable(Balscorecard);
                    Balscorecard.Validate(Status, Balscorecard.Status::Open);
                    Balscorecard.Modify();
                    Variant := Balscorecard;
                    Handled := true;
                end;
            Database::"HR Transport Requisition":
                begin
                    RecRef.SetTable(TransReq);
                    TransReq.Validate(Status, TransReq.Status::New);
                    TransReq.Modify();
                    Variant := TransReq;
                    Handled := true;
                end;
            Database::"HR Overtime Header":
                begin
                    RecRef.SetTable(HROvertimeHeader);
                    HROvertimeHeader.Validate(Status, HROvertimeHeader.Status::New);
                    HROvertimeHeader.Modify();
                    Variant := HROvertimeHeader;
                    Handled := true;
                end;
            Database::"HR Jobs to Succeed":
                begin
                    RecRef.SetTable(JobstoSucceed);
                    JobstoSucceed.Validate(Status, JobstoSucceed.Status::New);
                    JobstoSucceed.Modify();
                    Variant := JobstoSucceed;
                    Handled := true;
                end;
            Database::"HR Induction Schedule":
                begin
                    RecRef.SetTable(InductionSchedule);
                    InductionSchedule.Validate(Status, InductionSchedule.Status::New);
                    InductionSchedule.Modify();
                    Variant := InductionSchedule;
                    Handled := true;
                end;
            Database::"HR Job Applications":
                begin
                    RecRef.SetTable(QualifiedApplicants);
                    QualifiedApplicants.Validate("Approval Status", QualifiedApplicants."Approval Status"::New);
                    QualifiedApplicants.Modify();
                    Variant := QualifiedApplicants;
                    Handled := true;
                end;
            // Database::"HR Disciplinary Cases NCA":
            //     begin
            //         RecRef.SetTable(DiscCase);
            //         DiscCase.Validate(Status, DiscCase.Status::New);
            //         DiscCase.Modify();
            //         Variant := DiscCase;
            //         Handled := true;
            //     end;
            Database::prPayChange:
                begin
                    RecRef.SetTable(ChangeDetails);
                    ChangeDetails.Status := ChangeDetails.Status::New;
                    ChangeDetails.Modify();
                    Variant := ChangeDetails;
                    Handled := true;
                end;
            Database::"Clearance Certificate":
                begin
                    RecRef.SetTable(Clearance);
                    Clearance.Validate(Status, Clearance.Status::New);
                    Clearance.Modify();
                    Variant := Clearance;
                    Handled := true;
                end;
            Database::"HR Employees - Changes":
                begin
                    RecRef.SetTable(HREmployeesChanges);
                    HREmployeesChanges."Approval Status" := HREmployeesChanges."Approval Status"::Open;
                    HREmployeesChanges.Modify();
                    Variant := HREmployeesChanges;
                    Handled := true;
                end;
            Database::"HR Employees":
                begin
                    RecRef.SetTable(HREmp);
                    HREmp.Status := HREmp.Status::New;
                    HREmp.Modify();
                    Variant := HREmp;
                    Handled := true;
                end;
            Database::"Payroll Changes":
                begin
                    RecRef.SetTable(PayChange);
                    PayChange.Status := PayChange.Status::New;
                    PayChange.Modify();
                    Variant := PayChange;
                    Handled := true;
                end;
            Database::"Employee Separation Header":
                begin
                    RecRef.SetTable(Separation);
                    Separation.Validate(Status, Separation.Status::New);
                    Separation.Modify();
                    Variant := Separation;
                    Handled := true;
                end;
            Database::"Acceleration Pool Nomination":
                begin
                    RecRef.SetTable(Pool);
                    Pool.Validate(Status, Pool.Status::New);
                    Pool.Modify();
                    Variant := Pool;
                    Handled := true;
                end;
            Database::"HR Training Needs":
                begin
                    RecRef.SetTable(HRTrainingNeeds);
                    HRTrainingNeeds.Validate(Status, HRTrainingNeeds.Status::Open);
                    HRTrainingNeeds.Modify();
                    Variant := HRTrainingNeeds;
                    Handled := true;
                end;

        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Variant: Variant;
        PaymentHeader: Record "Payments Header";
        ImprestHeader: Record "Imprest Header";
        SRHeader: Record "Store Requistion Headers";
        ImprestSurr: Record "Imprest Surrender Header";
        InterbankTrans: Record "InterBank Transfers";
        Receipt: Record "Receipts Header";
        StaffClaim: Record "Staff Claims Header";
        StaffAdvance: Record "Staff Advance Headers";
        StaffAdvanceSurr: Record "Staff Advance Surrender Header";
        GenJnlBatch: Record "Gen. Journal Batch";
        HRJobs: Record "HR Jobs";
        HRLeaveApp: Record "HR Leave Application";
        Hrempreq: Record "HR Employee Requisitions";
        Training: Record "HR Training App Header";
        JVHeader: Record "JV Header";
        HRLeaveReimb: Record "HR Leave Reimbursement";
        mJobs: Record Jobs;
        GrantSurrHeader: Record "Grant Surrender Header";
        GRN: Record "Purch. Rcpt. Header";
        AssetTransfer: Record "HR Asset Transfer Header";
        Budget: Record "G/L Budget Name";
        GLA: Record "G/L Account";
        inspectionHD: Record "Inspection Header";
        EmpTrans: Record "HR Employee Transfer Header";
        Master: Record "Master Record Creation Header";
        Investment: Record "Investment Header";
        EmpConfirmation: Record "HR Employee Confirmation";
        Promotion: Record "HR Promo. Recommend Header";
        ProfessionalBody: Record "HR Professional body Header";
        Balscorecard: Record "HR Individual Targets Header";
        TransReq: Record "HR Transport Requisition";
        HROvertimeHeader: Record "HR Overtime Header";
        JobstoSucceed: Record "HR Jobs to Succeed";
        InductionSchedule: Record "HR Induction Schedule";
        QualifiedApplicants: Record "HR Job Applications";
        DiscCase: Record "HR Disciplinary Cases NCA";
        ChangeDetails: Record prPayChange;
        Clearance: Record "Clearance Certificate";
        HREmployeesChanges: Record "HR Employees - Changes";
        HREmp: Record "HR Employees";
        PayChange: Record "Payroll Changes";
        Separation: Record "Employee Separation Header";
        Pool: Record "Acceleration Pool Nomination";
        HRTrainingNeeds: Record "HR Training Needs";
        LeavePlanner: Record "HR Leave Planner Header";
        EmployeeTransfer: Record "Employee Transfers";
        AssetRe: Record "Asset Repair Header";

    begin
        case RecRef.Number of
            Database::"Asset Repair Header":
                begin
                    RecRef.SetTable(AssetRe);
                    AssetRe.Validate(Status, AssetRe.Status::Approved);
                    AssetRe.Modify();
                    Variant := AssetRe;
                    Handled := true;
                end;
            Database::"Payments Header":
                begin
                    RecRef.SetTable(PaymentHeader);
                    PaymentHeader.Validate(Status, PaymentHeader.Status::Approved);
                    PaymentHeader.Modify();
                    Variant := PaymentHeader;
                    Handled := true;
                end;
            Database::"Imprest Header":
                begin
                    RecRef.SetTable(ImprestHeader);
                    ImprestHeader.Validate(Status, ImprestHeader.Status::Approved);
                    ImprestHeader.Modify();
                    Variant := ImprestHeader;
                    Handled := true;
                end;
            Database::"Store Requistion Headers":
                begin
                    RecRef.SetTable(SRHeader);
                    SRHeader.Validate(Status, SRHeader.Status::Released);
                    SRHeader.Modify();
                    Variant := SRHeader;
                    Handled := true;
                end;
            Database::"Imprest Surrender Header":
                begin
                    RecRef.SetTable(ImprestSurr);
                    ImprestSurr.Validate(Status, ImprestSurr.Status::Approved);
                    ImprestSurr.Modify();
                    Variant := ImprestSurr;
                    Handled := true;
                end;
            Database::"InterBank Transfers":
                begin
                    RecRef.SetTable(InterbankTrans);
                    InterbankTrans.Validate(Status, InterbankTrans.Status::Approved);
                    InterbankTrans.Modify();
                    Variant := InterbankTrans;
                    Handled := true;
                end;
            Database::"Receipts Header":
                begin
                    RecRef.SetTable(Receipt);
                    Receipt.Validate(Status, Receipt.Status::" ");
                    Receipt.Modify();
                    Variant := Receipt;
                    Handled := true;
                end;
            Database::"Staff Claims Header":
                begin
                    RecRef.SetTable(StaffClaim);
                    StaffClaim.Validate(Status, StaffClaim.Status::Approved);
                    StaffClaim.Modify();
                    Variant := StaffClaim;
                    Handled := true;
                end;
            Database::"Staff Advance Headers":
                begin
                    RecRef.SetTable(StaffAdvance);
                    StaffAdvance.Validate(Status, StaffAdvance.Status::Approved);
                    StaffAdvance.Modify();
                    Variant := StaffAdvance;
                    Handled := true;
                end;
            Database::"Staff Advance Surrender Header":
                begin
                    RecRef.SetTable(StaffAdvanceSurr);
                    StaffAdvanceSurr.Validate(Status, StaffAdvanceSurr.Status::Approved);
                    StaffAdvanceSurr.Modify();
                    Variant := StaffAdvanceSurr;
                    Handled := true;
                end;
            Database::"Gen. Journal Batch":
                begin
                    RecRef.SetTable(GenJnlBatch);
                    GenJnlBatch.Validate(Status, GenJnlBatch.Status::Approved);
                    GenJnlBatch.Modify();
                    Variant := GenJnlBatch;
                    Handled := true;
                end;
            Database::"HR Jobs":
                begin
                    RecRef.SetTable(HRJobs);
                    HRJobs.Validate(Status, HRJobs.Status::Approved);
                    HRJobs.Modify();
                    Variant := HRJobs;
                    Handled := true;
                end;
            Database::"HR Leave Application":
                begin
                    RecRef.SetTable(HRLeaveApp);
                    HRLeaveApp.Status := HRLeaveApp.Status::Approved;
                    HRLeaveApp.Modify();
                    Variant := HRLeaveApp;
                    Handled := true;
                end;

            Database::"HR Leave Planner Header":
                begin
                    RecRef.SetTable(LeavePlanner);
                    LeavePlanner.Status := LeavePlanner.Status::Approved;
                    LeavePlanner.Modify();
                    Variant := LeavePlanner;
                    Handled := true;
                end;

            //Employee Transfer
            Database::"Employee Transfers":
                begin
                    RecRef.SetTable(EmployeeTransfer);
                    //EmployeeTransfer.Status := EmployeeTransfer.Status::Released;
                    EmployeeTransfer.Validate(Status, EmployeeTransfer.Status::Released);
                    EmployeeTransfer.Modify();
                    Variant := EmployeeTransfer;
                    Handled := true;
                end;
            Database::"HR Employee Requisitions":
                begin
                    RecRef.SetTable(Hrempreq);
                    Hrempreq.Status := Hrempreq.Status::Approved;
                    Hrempreq.Modify();
                    Variant := Hrempreq;
                    Handled := true;
                end;
            Database::"HR Training App Header":
                begin
                    RecRef.SetTable(Training);
                    Training.Validate(Status, Training.Status::Approved);
                    Training.Modify();
                    Variant := Training;
                    Handled := true;
                end;

            Database::"JV Header":
                begin
                    RecRef.SetTable(JVHeader);
                    JVHeader.Validate(Status, JVHeader.Status::Approved);
                    JVHeader.Modify();
                    Variant := JVHeader;
                    Handled := true;
                end;
            Database::"HR Leave Reimbursement":
                begin
                    RecRef.SetTable(HRLeaveReimb);
                    HRLeaveReimb.Validate(Status, HRLeaveReimb.Status::Approved);
                    HRLeaveReimb.Modify();
                    Variant := HRLeaveReimb;
                    Handled := true;
                end;
            Database::Jobs:
                begin
                    RecRef.SetTable(mJobs);
                    mJobs.Validate("Approval Status", mJobs."Approval Status"::Approved);
                    mJobs.Modify();
                    Variant := mJobs;
                    Handled := true;
                end;
            Database::"Grant Surrender Header":
                begin
                    RecRef.SetTable(GrantSurrHeader);
                    GrantSurrHeader.Validate(Status, GrantSurrHeader.Status::Approved);
                    GrantSurrHeader.Modify();
                    Variant := GrantSurrHeader;
                    Handled := true;
                end;
            Database::"Purch. Rcpt. Header":
                begin
                    RecRef.SetTable(GRN);
                    GRN.Validate(Status, GRN.Status::Approved);
                    GRN.Modify();
                    Variant := GRN;
                    Handled := true;
                end;

            Database::"HR Asset Transfer Header":
                begin
                    RecRef.SetTable(AssetTransfer);
                    AssetTransfer.Validate(Status, AssetTransfer.Status::Approved);
                    AssetTransfer.Modify();
                    Variant := AssetTransfer;
                    Handled := true;
                end;

            Database::"G/L Budget Name":
                begin
                    RecRef.SetTable(Budget);
                    Budget.Validate(Status, Budget.Status::Approved);
                    Budget.Modify();
                    Variant := Budget;
                    Handled := true;
                end;
            Database::"G/L Account":
                begin
                    RecRef.SetTable(GLA);
                    GLA.Validate(Status, GLA.Status::Approved);
                    GLA.Modify();
                    Variant := GLA;
                    Handled := true;
                end;
            Database::"Inspection Header":
                begin
                    RecRef.SetTable(inspectionHD);
                    inspectionHD.Validate(Status, inspectionHD.Status::Approved);
                    inspectionHD.Modify();
                    Variant := inspectionHD;
                    Handled := true;
                end;

            Database::"HR Employee Transfer Header":
                begin
                    RecRef.SetTable(EmpTrans);
                    //EmpTrans.Status := EmpTrans.Status::Approved;
                    EmpTrans.Validate(Status, EmpTrans.Status::Approved);
                    Message('Employee details Updated successfully');
                    EmpTrans."Date Approved" := Today;
                    EmpTrans."Transfer details Updated" := true;
                    EmpTrans.Modify();
                    Variant := EmpTrans;
                    Handled := true;
                end;

            Database::"Master Record Creation Header":
                begin
                    RecRef.SetTable(Master);
                    Master.Validate(Status, Master.Status::Approved);
                    Master.Modify();
                    Variant := Master;
                    Handled := true;
                end;
            Database::"Investment Header":
                begin
                    RecRef.SetTable(Investment);
                    Investment.Validate(Status, Investment.Status::Approved);
                    Investment.Modify();
                    Variant := Investment;
                    Handled := true;
                end;
            Database::"HR Employee Confirmation":
                begin
                    RecRef.SetTable(EmpConfirmation);
                    EmpConfirmation.Validate(Status, EmpConfirmation.Status::Approved);
                    EmpConfirmation.Modify();
                    Variant := EmpConfirmation;
                    Handled := true;
                end;
            Database::"HR Promo. Recommend Header":
                begin
                    RecRef.SetTable(Promotion);
                    Promotion.Validate(Status, Promotion.Status::Approved);
                    Promotion."Approved By" := UserId;
                    Promotion.Modify();
                    Variant := Promotion;
                    Handled := true;
                end;
            Database::"HR Professional body Header":
                begin
                    RecRef.SetTable(ProfessionalBody);
                    ProfessionalBody.Validate(Status, ProfessionalBody.Status::Approved);
                    ProfessionalBody.Modify();
                    Variant := ProfessionalBody;
                    Handled := true;
                end;
            Database::"HR Individual Targets Header":
                begin
                    RecRef.SetTable(Balscorecard);
                    Balscorecard.Validate(Status, Balscorecard.Status::Approved);
                    Balscorecard.Modify();
                    Variant := Balscorecard;
                    Handled := true;
                end;
            Database::"HR Transport Requisition":
                begin
                    RecRef.SetTable(TransReq);
                    TransReq.Validate(Status, TransReq.Status::Approved);
                    TransReq.Modify();
                    Variant := TransReq;
                    Handled := true;
                end;
            Database::"HR Overtime Header":
                begin
                    RecRef.SetTable(HROvertimeHeader);
                    HROvertimeHeader.Validate(Status, HROvertimeHeader.Status::Approved);
                    HROvertimeHeader.Modify();
                    Variant := HROvertimeHeader;
                    Handled := true;
                end;
            Database::"HR Jobs to Succeed":
                begin
                    RecRef.SetTable(JobstoSucceed);
                    JobstoSucceed.Validate(Status, JobstoSucceed.Status::Approved);
                    JobstoSucceed.Modify();
                    Variant := JobstoSucceed;
                    Handled := true;
                end;
            Database::"HR Induction Schedule":
                begin
                    RecRef.SetTable(InductionSchedule);
                    InductionSchedule.Validate(Status, InductionSchedule.Status::Approved);
                    InductionSchedule.Modify();
                    Variant := InductionSchedule;
                    Handled := true;
                end;
            Database::"HR Job Applications":
                begin
                    RecRef.SetTable(QualifiedApplicants);
                    QualifiedApplicants.Validate("Approval Status", QualifiedApplicants."Approval Status"::Approved);
                    QualifiedApplicants.Modify();
                    Variant := QualifiedApplicants;
                    Handled := true;
                end;
            // Database::"HR Disciplinary Cases NCA":
            //     begin
            //         RecRef.SetTable(DiscCase);
            //         DiscCase.Validate(Status, DiscCase.Status::Approved);
            //         DiscCase.Modify();
            //         Variant := DiscCase;
            //         Handled := true;
            //     end;
            Database::prPayChange:
                begin
                    RecRef.SetTable(ChangeDetails);
                    ChangeDetails.Status := ChangeDetails.Status::Approved;
                    ChangeDetails.Modify();
                    Variant := ChangeDetails;
                    Handled := true;
                end;
            Database::"Clearance Certificate":
                begin
                    RecRef.SetTable(Clearance);
                    Clearance.Validate(Status, Clearance.Status::Approved);
                    Clearance."Cleared By" := UserId;
                    Clearance."Clearance Cleared" := true;
                    Clearance.Modify();
                    Variant := Clearance;
                    Handled := true;
                end;
            Database::"HR Employees - Changes":
                begin
                    RecRef.SetTable(HREmployeesChanges);
                    HREmployeesChanges."Approval Status" := HREmployeesChanges."Approval Status"::Approved;
                    HREmployeesChanges.Modify();
                    Variant := HREmployeesChanges;
                    Handled := true;
                end;
            Database::"HR Employees":
                begin
                    RecRef.SetTable(HREmp);
                    HREmp.Status := HREmp.Status::Active;
                    HREmp.Modify();
                    Variant := HREmp;
                    Handled := true;
                end;
            Database::"Payroll Changes":
                begin
                    RecRef.SetTable(PayChange);
                    PayChange.Validate(PayChange.Status, PayChange.Status::Approved);
                    PayChange.Modify();
                    //Variant := PayChange;
                    Handled := true;
                end;
            Database::"Employee Separation Header":
                begin
                    RecRef.SetTable(Separation);
                    Separation.Validate(Status, Separation.Status::Approved);
                    Separation.Modify();
                    Variant := Separation;
                    Handled := true;
                end;
            Database::"Acceleration Pool Nomination":
                begin
                    RecRef.SetTable(Pool);
                    Pool.Validate(Status, Pool.Status::Approved);
                    Pool.Modify();
                    Variant := Pool;
                    Handled := true;
                end;
            Database::"HR Training Needs":
                begin
                    RecRef.SetTable(HRTrainingNeeds);
                    HRTrainingNeeds.Validate(Status, HRTrainingNeeds.Status::Approved);
                    HRTrainingNeeds.Modify();
                    Variant := HRTrainingNeeds;
                    Handled := true;
                end;

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        PaymentHeader: Record "Payments Header";
        ImprestHeader: Record "Imprest Header";
        SRHeader: Record "Store Requistion Headers";
        ImprestSurr: Record "Imprest Surrender Header";
        InterbankTrans: Record "InterBank Transfers";
        Receipt: Record "Receipts Header";
        StaffClaim: Record "Staff Claims Header";
        StaffAdvance: Record "Staff Advance Headers";
        StaffAdvanceSurr: Record "Staff Advance Surrender Header";
        GenJnlBatch: Record "Gen. Journal Batch";
        HRJobs: Record "HR Jobs";
        HRLeaveApp: Record "HR Leave Application";
        Hrempreq: Record "HR Employee Requisitions";
        Training: Record "HR Training App Header";
        JVHeader: Record "JV Header";
        HRLeaveReimb: Record "HR Leave Reimbursement";
        mJobs: Record Jobs;
        GrantSurrHeader: Record "Grant Surrender Header";
        GRN: Record "Purch. Rcpt. Header";
        AssetTransfer: Record "HR Asset Transfer Header";
        Budget: Record "G/L Budget Name";
        GLA: Record "G/L Account";
        inspectionHD: Record "Inspection Header";
        EmpTrans: Record "HR Employee Transfer Header";
        Master: Record "Master Record Creation Header";
        Investment: Record "Investment Header";
        EmpConfirmation: Record "HR Employee Confirmation";
        Promotion: Record "HR Promo. Recommend Header";
        ProfessionalBody: Record "HR Professional body Header";
        Balscorecard: Record "HR Individual Targets Header";
        TransReq: Record "HR Transport Requisition";
        HROvertimeHeader: Record "HR Overtime Header";
        JobstoSucceed: Record "HR Jobs to Succeed";
        InductionSchedule: Record "HR Induction Schedule";
        QualifiedApplicants: Record "HR Job Applications";
        DiscCase: Record "HR Disciplinary Cases NCA";
        ChangeDetails: Record prPayChange;
        Clearance: Record "Clearance Certificate";
        HREmployeesChanges: Record "HR Employees - Changes";
        HREmp: Record "HR Employees";
        PayChange: Record "Payroll Changes";
        Separation: Record "Employee Separation Header";
        Pool: Record "Acceleration Pool Nomination";
        HRTrainingNeeds: Record "HR Training Needs";
        LeavePlanner: Record "HR Leave Planner Header";
        EmployeeTransfer: Record "Employee Transfers";
        AssetRe: Record "Asset Repair Header";

    begin
        case RecRef.Number of
            Database::"Asset Repair Header":
                begin
                    RecRef.SetTable(AssetRe);
                    AssetRe.Status := AssetRe.Status::"Pending Approval";
                    AssetRe.Modify();
                    Variant := AssetRe;
                    IsHandled := true;
                end;
            Database::"Payments Header":
                begin
                    RecRef.SetTable(PaymentHeader);
                    PaymentHeader.Status := PaymentHeader.Status::"Pending Approval";
                    PaymentHeader.Modify();
                    Variant := PaymentHeader;
                    IsHandled := true;
                end;
            Database::"Imprest Header":
                begin
                    RecRef.SetTable(ImprestHeader);
                    ImprestHeader.Status := ImprestHeader.Status::"Pending Approval";
                    ImprestHeader.Modify();
                    Variant := ImprestHeader;
                    IsHandled := true;
                end;
            Database::"Store Requistion Headers":
                begin
                    RecRef.SetTable(SRHeader);
                    SRHeader.Status := SRHeader.Status::"Pending Approval";
                    SRHeader.Modify();
                    Variant := SRHeader;
                    IsHandled := true;
                end;
            Database::"Imprest Surrender Header":
                begin
                    RecRef.SetTable(ImprestSurr);
                    ImprestSurr.Status := ImprestSurr.Status::"Pending Approval";
                    ImprestSurr.Modify();
                    Variant := ImprestSurr;
                    IsHandled := true;
                end;
            Database::"InterBank Transfers":
                begin
                    RecRef.SetTable(InterbankTrans);
                    InterbankTrans.Status := InterbankTrans.Status::"Pending Approval";
                    InterbankTrans.Modify();
                    Variant := InterbankTrans;
                    IsHandled := true;
                end;
            Database::"Receipts Header":
                begin
                    RecRef.SetTable(Receipt);
                    Receipt.Status := Receipt.Status::" ";
                    Receipt.Modify();
                    Variant := Receipt;
                    IsHandled := true;
                end;
            Database::"Staff Claims Header":
                begin
                    RecRef.SetTable(StaffClaim);
                    StaffClaim.Status := StaffClaim.Status::"Pending Approval";
                    StaffClaim.Modify();
                    Variant := StaffClaim;
                    IsHandled := true;
                end;
            Database::"Staff Advance Headers":
                begin
                    RecRef.SetTable(StaffAdvance);
                    StaffAdvance.Status := StaffAdvance.Status::"Pending Approval";
                    StaffAdvance.Modify();
                    Variant := StaffAdvance;
                    IsHandled := true;
                end;
            Database::"Staff Advance Surrender Header":
                begin
                    RecRef.SetTable(StaffAdvanceSurr);
                    StaffAdvanceSurr.Status := StaffAdvanceSurr.Status::"Pending Approval";
                    StaffAdvanceSurr.Modify();
                    Variant := StaffAdvanceSurr;
                    IsHandled := true;
                end;
            Database::"Gen. Journal Batch":
                begin
                    RecRef.SetTable(GenJnlBatch);
                    GenJnlBatch.Status := GenJnlBatch.Status::"Pending Approval";
                    GenJnlBatch.Modify();
                    Variant := GenJnlBatch;
                    IsHandled := true;
                end;
            Database::"HR Jobs":
                begin
                    RecRef.SetTable(HRJobs);
                    HRJobs.Status := HRJobs.Status::"Pending Approval";
                    HRJobs.Modify();
                    Variant := HRJobs;
                    IsHandled := true;
                end;
            Database::"HR Leave Application":
                begin
                    RecRef.SetTable(HRLeaveApp);
                    HRLeaveApp.Status := HRLeaveApp.Status::"Pending Approval";
                    HRLeaveApp.Modify();
                    Variant := HRLeaveApp;
                    IsHandled := true;
                end;

            Database::"HR Leave Planner Header":
                begin
                    RecRef.SetTable(LeavePlanner);
                    LeavePlanner.Status := LeavePlanner.Status::"Pending Approval";
                    LeavePlanner.Modify();
                    Variant := LeavePlanner;
                    IsHandled := true;
                end;
            //Employee Transfer
            Database::"Employee Transfers":
                begin
                    RecRef.SetTable(EmployeeTransfer);
                    //EmployeeTransfer.Status := EmployeeTransfer.Status::"Pending Approval";
                    EmployeeTransfer.Validate(Status, EmployeeTransfer.Status::"Pending Approval");
                    EmployeeTransfer.Modify();
                    Variant := EmployeeTransfer;
                    IsHandled := true;
                end;
            Database::"HR Employee Requisitions":
                begin
                    RecRef.SetTable(Hrempreq);
                    Hrempreq.Status := Hrempreq.Status::"Pending Approval";
                    Hrempreq.Modify();
                    Variant := Hrempreq;
                    IsHandled := true;
                end;
            Database::"HR Training App Header":
                begin
                    RecRef.SetTable(Training);
                    Training.Status := Training.Status::"Pending Approval";
                    Training.Modify();
                    Variant := Training;
                    IsHandled := true;
                end;

            Database::"JV Header":
                begin
                    RecRef.SetTable(JVHeader);
                    JVHeader.Status := JVHeader.Status::"Pending Approval";
                    JVHeader.Modify();
                    Variant := JVHeader;
                    IsHandled := true;
                end;
            Database::"HR Leave Reimbursement":
                begin
                    RecRef.SetTable(HRLeaveReimb);
                    HRLeaveReimb.Status := HRLeaveReimb.Status::"Pending Approval";
                    HRLeaveReimb.Modify();
                    Variant := HRLeaveReimb;
                    IsHandled := true;
                end;
            Database::Jobs:
                begin
                    RecRef.SetTable(mJobs);
                    mJobs."Approval Status" := mJobs."Approval Status"::"Pending Approval";
                    mJobs.Modify();
                    Variant := mJobs;
                    IsHandled := true;
                end;
            Database::"Grant Surrender Header":
                begin
                    RecRef.SetTable(GrantSurrHeader);
                    GrantSurrHeader.Status := GrantSurrHeader.Status::"Pending Approval";
                    GrantSurrHeader.Modify();
                    Variant := GrantSurrHeader;
                    IsHandled := true;
                end;
            Database::"Purch. Rcpt. Header":
                begin
                    RecRef.SetTable(GRN);
                    GRN.Status := GRN.Status::"Pending Approval";
                    GRN.Modify();
                    Variant := GRN;
                    IsHandled := true;
                end;

            Database::"HR Asset Transfer Header":
                begin
                    RecRef.SetTable(AssetTransfer);
                    AssetTransfer.Status := AssetTransfer.Status::"Pending Approval";
                    AssetTransfer.Modify();
                    Variant := AssetTransfer;
                    IsHandled := true;
                end;

            Database::"G/L Budget Name":
                begin
                    RecRef.SetTable(Budget);
                    Budget.Status := Budget.Status::"Pending Approval";
                    Budget.Modify();
                    Variant := Budget;
                    IsHandled := true;
                end;
            Database::"G/L Account":
                begin
                    RecRef.SetTable(GLA);
                    GLA.Status := GLA.Status::"Pending Approval";
                    GLA.Modify();
                    Variant := GLA;
                    IsHandled := true;
                end;
            Database::"Inspection Header":
                begin
                    RecRef.SetTable(inspectionHD);
                    inspectionHD.Status := inspectionHD.Status::"Pending Approval";
                    inspectionHD.Modify();
                    Variant := inspectionHD;
                    IsHandled := true;
                end;

            Database::"HR Employee Transfer Header":
                begin
                    RecRef.SetTable(EmpTrans);
                    EmpTrans.Status := EmpTrans.Status::"Pending Approval";
                    EmpTrans.Modify();
                    Variant := EmpTrans;
                    IsHandled := true;
                end;

            Database::"Master Record Creation Header":
                begin
                    RecRef.SetTable(Master);
                    Master.Status := Master.Status::"Pending Approval";
                    Master.Modify();
                    Variant := Master;
                    IsHandled := true;
                end;
            Database::"Investment Header":
                begin
                    RecRef.SetTable(Investment);
                    Investment.Status := Investment.Status::"Pending Approval";
                    Investment.Modify();
                    Variant := Investment;
                    IsHandled := true;
                end;
            Database::"HR Employee Confirmation":
                begin
                    RecRef.SetTable(EmpConfirmation);
                    EmpConfirmation.Status := EmpConfirmation.Status::"Pending Approval";
                    EmpConfirmation.Modify();
                    Variant := EmpConfirmation;
                    IsHandled := true;
                end;
            Database::"HR Promo. Recommend Header":
                begin
                    RecRef.SetTable(Promotion);
                    Promotion.Status := Promotion.Status::"Pending Approval";
                    Promotion.Modify();
                    Variant := Promotion;
                    IsHandled := true;
                end;
            Database::"HR Professional body Header":
                begin
                    RecRef.SetTable(ProfessionalBody);
                    ProfessionalBody.Status := ProfessionalBody.Status::"Pending Approval";
                    ProfessionalBody.Modify();
                    Variant := ProfessionalBody;
                    IsHandled := true;
                end;
            Database::"HR Individual Targets Header":
                begin
                    RecRef.SetTable(Balscorecard);
                    Balscorecard.Status := Balscorecard.Status::"Pending Approval";
                    Balscorecard.Modify();
                    Variant := Balscorecard;
                    IsHandled := true;
                end;
            Database::"HR Transport Requisition":
                begin
                    RecRef.SetTable(TransReq);
                    TransReq.Status := TransReq.Status::"Pending Approval";
                    TransReq.Modify();
                    Variant := TransReq;
                    IsHandled := true;
                end;
            Database::"HR Overtime Header":
                begin
                    RecRef.SetTable(HROvertimeHeader);
                    HROvertimeHeader.Status := HROvertimeHeader.Status::"Pending Approval";
                    HROvertimeHeader.Modify();
                    Variant := HROvertimeHeader;
                    IsHandled := true;
                end;
            Database::"HR Jobs to Succeed":
                begin
                    RecRef.SetTable(JobstoSucceed);
                    JobstoSucceed.Status := JobstoSucceed.Status::"Pending Approval";
                    JobstoSucceed.Modify();
                    Variant := JobstoSucceed;
                    IsHandled := true;
                end;
            Database::"HR Induction Schedule":
                begin
                    RecRef.SetTable(InductionSchedule);
                    InductionSchedule.Status := InductionSchedule.Status::"Pending Approval";
                    InductionSchedule.Modify();
                    Variant := InductionSchedule;
                    IsHandled := true;
                end;
            Database::"HR Job Applications":
                begin
                    RecRef.SetTable(QualifiedApplicants);
                    QualifiedApplicants."Approval Status" := QualifiedApplicants."Approval Status"::"Pending Approval";
                    QualifiedApplicants.Modify();
                    Variant := QualifiedApplicants;
                    IsHandled := true;
                end;
            // Database::"HR Disciplinary Cases NCA":
            //     begin
            //         RecRef.SetTable(DiscCase);
            //         DiscCase.Status := DiscCase.Status::"Pending Approval";
            //         DiscCase.Modify();
            //         Variant := DiscCase;
            //         IsHandled := true;
            //     end;
            Database::prPayChange:
                begin
                    RecRef.SetTable(ChangeDetails);
                    ChangeDetails.Status := ChangeDetails.Status::"Pending Approval";
                    ChangeDetails.Modify();
                    Variant := ChangeDetails;
                    IsHandled := true;
                end;
            Database::"Clearance Certificate":
                begin
                    RecRef.SetTable(Clearance);
                    Clearance.Status := Clearance.Status::"Pending Approval";
                    Clearance.Modify();
                    Variant := Clearance;
                    IsHandled := true;
                end;
            Database::"HR Employees - Changes":
                begin
                    RecRef.SetTable(HREmployeesChanges);
                    HREmployeesChanges."Approval Status" := HREmployeesChanges."Approval Status"::"Pending Approval";
                    HREmployeesChanges.Modify();
                    Variant := HREmployeesChanges;
                    IsHandled := true;
                end;
            Database::"HR Employees":
                begin
                    RecRef.SetTable(HREmp);
                    HREmp.Status := HREmp.Status::"Pending Approval";
                    HREmp.Modify();
                    Variant := HREmp;
                    IsHandled := true;
                end;
            Database::"Payroll Changes":
                begin
                    RecRef.SetTable(PayChange);
                    PayChange.Status := PayChange.Status::"Pending Approval";
                    PayChange.Modify();
                    Variant := PayChange;
                    IsHandled := true;
                end;
            Database::"Employee Separation Header":
                begin
                    RecRef.SetTable(Separation);
                    Separation.Status := Separation.Status::"Pending Approval";
                    Separation.Modify();
                    Variant := Separation;
                    IsHandled := true;
                end;
            Database::"Acceleration Pool Nomination":
                begin
                    RecRef.SetTable(Pool);
                    Pool.Status := Pool.Status::"Pending Approval";
                    Pool.Modify();
                    Variant := Pool;
                    IsHandled := true;
                end;
            Database::"HR Training Needs":
                begin
                    RecRef.SetTable(HRTrainingNeeds);
                    HRTrainingNeeds.Status := HRTrainingNeeds.Status::"Pending Approval";
                    HRTrainingNeeds.Modify();
                    Variant := HRTrainingNeeds;
                    IsHandled := true;
                end;

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]
    procedure PopulateApprovalEntryArgument(RecRef: RecordRef; WorkflowStepInstance: Record "Workflow Step Instance"; var ApprovalEntryArgument: Record "Approval Entry")
    var
        PaymentHeader: Record "Payments Header";
        ImprestHeader: Record "Imprest Header";
        SRHeader: Record "Store Requistion Headers";
        ImprestSurr: Record "Imprest Surrender Header";
        InterbankTrans: Record "InterBank Transfers";
        Receipt: Record "Receipts Header";
        StaffClaim: Record "Staff Claims Header";
        StaffAdvance: Record "Staff Advance Headers";
        StaffAdvanceSurr: Record "Staff Advance Surrender Header";
        HRJobs: Record "HR Jobs";
        HRLeaveApp: Record "HR Leave Application";
        Hrempreq: Record "HR Employee Requisitions";
        Training: Record "HR Training App Header";
        JVHeader: Record "JV Header";
        HRLeaveReimb: Record "HR Leave Reimbursement";
        mJobs: Record Jobs;
        GrantSurrHeader: Record "Grant Surrender Header";
        GRN: Record "Purch. Rcpt. Header";
        AssetTransfer: Record "HR Asset Transfer Header";
        GLA: Record "G/L Account";
        inspectionHD: Record "Inspection Header";
        EmpTrans: Record "HR Employee Transfer Header";
        Master: Record "Master Record Creation Header";
        Investment: Record "Investment Header";
        EmpConfirmation: Record "HR Employee Confirmation";
        Promotion: Record "HR Promo. Recommend Header";
        ProfessionalBody: Record "HR Professional body Header";
        Balscorecard: Record "HR Individual Targets Header";
        TransReq: Record "HR Transport Requisition";
        HROvertimeHeader: Record "HR Overtime Header";
        JobstoSucceed: Record "HR Jobs to Succeed";
        InductionSchedule: Record "HR Induction Schedule";
        QualifiedApplicants: Record "HR Job Applications";
        DiscCase: Record "HR Disciplinary Cases NCA";
        ChangeDetails: Record prPayChange;
        Clearance: Record "Clearance Certificate";
        HREmployeesChanges: Record "HR Employees - Changes";
        HREmp: Record "HR Employees";
        PayChange: Record "Payroll Changes";
        Separation: Record "Employee Separation Header";
        Pool: Record "Acceleration Pool Nomination";
        HRTrainingNeeds: Record "HR Training Needs";
        LeavePlanner: Record "HR Leave Planner Header";
        EmployeeTransfer: Record "Employee Transfers";
        AssetRepair: Record "Asset Repair Header";

    begin
        ApprovalEntryArgument.Init();
        ApprovalEntryArgument."Table ID" := RecRef.Number;
        ApprovalEntryArgument."Record ID to Approve" := RecRef.RecordId;
        ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::" ";
        ApprovalEntryArgument."Approval Code" := WorkflowStepInstance."Workflow Code";
        ApprovalEntryArgument."Workflow Step Instance ID" := WorkflowStepInstance.ID;

        case RecRef.Number of
            Database::"Asset Repair Header":
                begin
                    RecRef.SetTable(AssetRepair);
                    ApprovalEntryArgument."Document No." := AssetRepair."Request No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Transport Requisition";
                end;
            Database::"Payments Header":
                begin
                    RecRef.SetTable(PaymentHeader);
                    ApprovalEntryArgument."Document No." := PaymentHeader."No.";
                end;
            Database::"Imprest Header":
                begin
                    RecRef.SetTable(ImprestHeader);
                    ApprovalEntryArgument."Document No." := ImprestHeader."No.";
                end;
            Database::"Store Requistion Headers":
                begin
                    RecRef.SetTable(SRHeader);
                    ApprovalEntryArgument."Document No." := SRHeader."No.";
                end;
            Database::"Imprest Surrender Header":
                begin
                    RecRef.SetTable(ImprestSurr);
                    ApprovalEntryArgument."Document No." := ImprestSurr.No;
                end;
            Database::"InterBank Transfers":
                begin
                    RecRef.SetTable(InterbankTrans);
                    ApprovalEntryArgument."Document No." := InterbankTrans.No;
                end;
            Database::"Receipts Header":
                begin
                    RecRef.SetTable(Receipt);
                    ApprovalEntryArgument."Document No." := Receipt."No.";
                end;
            Database::"Staff Claims Header":
                begin
                    RecRef.SetTable(StaffClaim);
                    ApprovalEntryArgument."Document No." := StaffClaim."No.";
                end;
            Database::"Staff Advance Headers":
                begin
                    RecRef.SetTable(StaffAdvance);
                    ApprovalEntryArgument."Document No." := StaffAdvance."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Staff Advance";
                end;
            Database::"Staff Advance Surrender Header":
                begin
                    RecRef.SetTable(StaffAdvanceSurr);
                    ApprovalEntryArgument."Document No." := StaffAdvanceSurr.No;
                end;
            Database::"HR Jobs":
                begin
                    RecRef.SetTable(HRJobs);
                    ApprovalEntryArgument."Document No." := HRJobs."Job ID";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Job Approval";

                end;
            Database::"HR Leave Application":
                begin
                    RecRef.SetTable(HRLeaveApp);
                    ApprovalEntryArgument."Document No." := HRLeaveApp."Application Code";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Leave Application";
                end;
            //Leave Planner
            Database::"HR Leave Planner Header":
                begin
                    RecRef.SetTable(LeavePlanner);
                    ApprovalEntryArgument."Document No." := LeavePlanner."Application Code";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::LeavePlanner;
                end;

            //Employee Transfer
            Database::"Employee Transfers":
                begin
                    RecRef.SetTable(EmployeeTransfer);
                    ApprovalEntryArgument."Document No." := EmployeeTransfer."Document No";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::EmpTrans;
                end;
            Database::"HR Employee Requisitions":
                begin
                    RecRef.SetTable(Hrempreq);
                    ApprovalEntryArgument."Document No." := Hrempreq."Requisition No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::EmpReq;
                end;
            Database::"HR Training App Header":
                begin
                    RecRef.SetTable(Training);
                    ApprovalEntryArgument."Document No." := Training."Application No";
                end;
            Database::"JV Header":
                begin
                    RecRef.SetTable(JVHeader);
                    ApprovalEntryArgument."Document No." := JVHeader."Document No.";
                end;
            Database::"HR Leave Reimbursement":
                begin
                    RecRef.SetTable(HRLeaveReimb);
                    ApprovalEntryArgument."Document No." := HRLeaveReimb."Application Code";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Leave Reimburse";
                end;
            Database::Jobs:
                begin
                    RecRef.SetTable(mJobs);
                    ApprovalEntryArgument."Document No." := mJobs."No.";
                end;
            Database::"Grant Surrender Header":
                begin
                    RecRef.SetTable(GrantSurrHeader);
                    ApprovalEntryArgument."Document No." := GrantSurrHeader.No;
                end;
            Database::"Purch. Rcpt. Header":
                begin
                    RecRef.SetTable(GRN);
                    ApprovalEntryArgument."Document No." := GRN."No.";
                end;
            Database::"HR Asset Transfer Header":
                begin
                    RecRef.SetTable(AssetTransfer);
                    ApprovalEntryArgument."Document No." := AssetTransfer."No.";
                end;
            Database::"G/L Account":
                begin
                    RecRef.SetTable(GLA);
                    ApprovalEntryArgument."Document No." := GLA."No.";
                end;
            Database::"Inspection Header":
                begin
                    RecRef.SetTable(inspectionHD);
                    ApprovalEntryArgument."Document No." := inspectionHD."No.";
                end;
            Database::"HR Employee Transfer Header":
                begin
                    RecRef.SetTable(EmpTrans);
                    ApprovalEntryArgument."Document No." := EmpTrans."Request No";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::EmpTrans;
                end;
            Database::"Master Record Creation Header":
                begin
                    RecRef.SetTable(Master);
                    ApprovalEntryArgument."Document No." := Master."No.";
                end;
            Database::"Investment Header":
                begin
                    RecRef.SetTable(Investment);
                    ApprovalEntryArgument."Document No." := Investment."No.";
                end;
            Database::"HR Employee Confirmation":
                begin
                    RecRef.SetTable(EmpConfirmation);
                    ApprovalEntryArgument."Document No." := EmpConfirmation.No;
                end;
            Database::"HR Promo. Recommend Header":
                begin
                    RecRef.SetTable(Promotion);
                    ApprovalEntryArgument."Document No." := Promotion.No;
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Prom;
                end;
            Database::"HR Professional body Header":
                begin
                    RecRef.SetTable(ProfessionalBody);
                    ApprovalEntryArgument."Document No." := ProfessionalBody."No.";
                end;
            Database::"HR Individual Targets Header":
                begin
                    RecRef.SetTable(Balscorecard);
                    ApprovalEntryArgument."Document No." := Balscorecard."Appraisal No";
                end;
            Database::"HR Transport Requisition":
                begin
                    RecRef.SetTable(TransReq);
                    ApprovalEntryArgument."Document No." := TransReq."Transport Request No";
                    //ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Transport Requisition";
                end;
            Database::"HR Overtime Header":
                begin
                    RecRef.SetTable(HROvertimeHeader);
                    ApprovalEntryArgument."Document No." := HROvertimeHeader."Application Code";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::OT;
                end;
            Database::"HR Jobs to Succeed":
                begin
                    RecRef.SetTable(JobstoSucceed);
                    ApprovalEntryArgument."Document No." := JobstoSucceed."Job ID";
                end;
            Database::"HR Induction Schedule":
                begin
                    RecRef.SetTable(InductionSchedule);
                    ApprovalEntryArgument."Document No." := InductionSchedule."Induction Code";
                end;
            Database::"HR Job Applications":
                begin
                    RecRef.SetTable(QualifiedApplicants);
                    ApprovalEntryArgument."Document No." := QualifiedApplicants."Job Application No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Job Approval";
                end;
            Database::"HR Disciplinary Cases NCA":
                begin
                    RecRef.SetTable(DiscCase);
                    ApprovalEntryArgument."Document No." := DiscCase."Case Number";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Disciplinary Approvals";
                end;
            Database::prPayChange:
                begin
                    RecRef.SetTable(ChangeDetails);
                    ApprovalEntryArgument."Document No." := ChangeDetails."Request No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::PayChange;
                end;
            Database::"Clearance Certificate":
                begin
                    RecRef.SetTable(Clearance);
                    ApprovalEntryArgument."Document No." := Clearance."Clearance No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Clearence;
                end;
            Database::"HR Employees - Changes":
                begin
                    RecRef.SetTable(HREmployeesChanges);
                    ApprovalEntryArgument."Document No." := HREmployeesChanges.Code;
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Employee;
                end;
            Database::"HR Employees":
                begin
                    RecRef.SetTable(HREmp);
                    ApprovalEntryArgument."Document No." := HREmp."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Employee;
                end;
            Database::"Payroll Changes":
                begin
                    RecRef.SetTable(PayChange);
                    ApprovalEntryArgument."Document No." := PayChange."Payroll Change No";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::PC;
                end;
            Database::"Employee Separation Header":
                begin
                    RecRef.SetTable(Separation);
                    ApprovalEntryArgument."Document No." := Separation."Separation No.";
                end;
            Database::"Acceleration Pool Nomination":
                begin
                    RecRef.SetTable(Pool);
                    ApprovalEntryArgument."Document No." := Pool."Pool No."
                end;
            Database::"HR Training Needs":
                begin
                    RecRef.SetTable(HRTrainingNeeds);
                    ApprovalEntryArgument."Document No." := HRTrainingNeeds.Code;
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Training Need";
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    local procedure OnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry");
    var
        AppMGt: Codeunit "Approvals Mgmt.";
        PaymentHeader: Record "Payments Header";
        ImprestHeader: Record "Imprest Header";
        SRHeader: Record "Store Requistion Headers";
        ImprestSurr: Record "Imprest Surrender Header";
        InterbankTrans: Record "InterBank Transfers";
        Receipt: Record "Receipts Header";
        StaffClaim: Record "Staff Claims Header";
        StaffAdvance: Record "Staff Advance Headers";
        StaffAdvanceSurr: Record "Staff Advance Surrender Header";
        GenJnlBatch: Record "Gen. Journal Batch";
        HRJobs: Record "HR Jobs";
        HRLeaveApp: Record "HR Leave Application";
        Hrempreq: Record "HR Employee Requisitions";
        Training: Record "HR Training App Header";
        JVHeader: Record "JV Header";
        HRLeaveReimb: Record "HR Leave Reimbursement";
        mJobs: Record Jobs;
        GrantSurrHeader: Record "Grant Surrender Header";
        GRN: Record "Purch. Rcpt. Header";
        AssetTransfer: Record "HR Asset Transfer Header";
        Budget: Record "G/L Budget Name";
        GLA: Record "G/L Account";
        inspectionHD: Record "Inspection Header";
        EmpTrans: Record "HR Employee Transfer Header";
        Master: Record "Master Record Creation Header";
        Investment: Record "Investment Header";
        EmpConfirmation: Record "HR Employee Confirmation";
        Promotion: Record "HR Promo. Recommend Header";
        ProfessionalBody: Record "HR Professional body Header";
        Balscorecard: Record "HR Individual Targets Header";
        TransReq: Record "HR Transport Requisition";
        HROvertimeHeader: Record "HR Overtime Header";
        JobstoSucceed: Record "HR Jobs to Succeed";
        InductionSchedule: Record "HR Induction Schedule";
        QualifiedApplicants: Record "HR Job Applications";
        DiscCase: Record "HR Disciplinary Cases NCA";
        ChangeDetails: Record prPayChange;
        Clearance: Record "Clearance Certificate";
        HREmployeesChanges: Record "HR Employees - Changes";
        HREmp: Record "HR Employees";
        PayChange: Record "Payroll Changes";
        Separation: Record "Employee Separation Header";
        Pool: Record "Acceleration Pool Nomination";
        // ClearanceCertificate: Record "Clearance Certificate";
        ApprovalMgt: Codeunit "Approvals Mgt";
        HRTrainingNeeds: Record "HR Training Needs";
        LeavePalnner: Record "HR Leave Planner Header";
        EmployeeTransfer: Record "Employee Transfers";
        AssetRepair: Record "Asset Repair Header";


        RecRef: RecordRef;
        VarVariant: Variant;
    begin
        RecRef.Get(ApprovalEntry."Record ID to Approve");
        case RecRef.Number of
            Database::"Asset Repair Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(AssetRepair);
                    AssetRepair.Validate(Status, AssetRepair.Status::Approved);
                    AssetRepair.Modify();

                end;
            Database::"Payments Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(PaymentHeader);
                    PaymentHeader.Validate(Status, PaymentHeader.Status::Approved);
                    PaymentHeader.Modify();

                end;
            Database::"Imprest Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(ImprestHeader);
                    ImprestHeader.Validate(Status, ImprestHeader.Status::Approved);
                    ImprestHeader.Modify();

                end;
            Database::"Store Requistion Headers":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(SRHeader);
                    SRHeader.Validate(Status, SRHeader.Status::Released);
                    SRHeader.Modify();

                end;
            Database::"Imprest Surrender Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(ImprestSurr);
                    ImprestSurr.Validate(Status, ImprestSurr.Status::Approved);
                    ImprestSurr.Modify();

                end;
            Database::"InterBank Transfers":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(InterbankTrans);
                    InterbankTrans.Validate(Status, InterbankTrans.Status::Approved);
                    InterbankTrans.Modify();

                end;
            Database::"Receipts Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(Receipt);
                    Receipt.Validate(Status, Receipt.Status::Approved);
                    Receipt.Modify();

                end;
            Database::"Staff Claims Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(StaffClaim);
                    StaffClaim.Validate(Status, StaffClaim.Status::Approved);
                    StaffClaim.Modify();

                end;
            Database::"Staff Advance Headers":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(StaffAdvance);
                    StaffAdvance.Validate(Status, StaffAdvance.Status::Approved);
                    StaffAdvance.Modify();

                end;
            Database::"Staff Advance Surrender Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(StaffAdvanceSurr);
                    StaffAdvanceSurr.Validate(Status, StaffAdvanceSurr.Status::Approved);
                    StaffAdvanceSurr.Modify();

                end;
            Database::"Gen. Journal Batch":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(GenJnlBatch);
                    GenJnlBatch.Validate(Status, GenJnlBatch.Status::Approved);
                    GenJnlBatch.Modify();

                end;
            Database::"HR Jobs":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(HRJobs);
                    HRJobs.Validate(Status, HRJobs.Status::Approved);
                    HRJobs.Modify();

                end;
            Database::"HR Leave Application":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(HRLeaveApp);
                    HRLeaveApp.CreateLeaveLedgerEntries();
                    HRLeaveApp.Validate(Status, HRLeaveApp.Status::Approved);
                    HRLeaveApp.Modify();

                end;


            //Leave Planner

            Database::"HR Leave Planner Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(LeavePalnner);
                    //HRLeaveApp.CreateLeaveLedgerEntries();
                    LeavePalnner.Validate(Status, LeavePalnner.Status::Approved);
                    LeavePalnner.Modify();
                end;

            Database::"Employee Transfers":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(EmployeeTransfer);
                    //HRLeaveApp.CreateLeaveLedgerEntries();
                    EmployeeTransfer.Validate(Status, EmployeeTransfer.Status::Released);
                    EmployeeTransfer."Transfer Date" := EmployeeTransfer."Request Date";
                    EmployeeTransfer.Modify();
                end;

            Database::"HR Employee Requisitions":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(Hrempreq);
                    Hrempreq.Validate(Status, Hrempreq.Status::Approved);
                    Hrempreq.Modify();

                end;
            Database::"HR Training App Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(Training);
                    Training.Validate(Status, Training.Status::Approved);
                    Training.Modify();

                end;

            Database::"JV Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(JVHeader);
                    JVHeader.Validate(Status, JVHeader.Status::Approved);
                    JVHeader.Modify();

                end;
            Database::"HR Leave Reimbursement":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(HRLeaveReimb);
                    HRLeaveReimb.Validate(Status, HRLeaveReimb.Status::Approved);
                    HRLeaveReimb.Modify();

                end;
            Database::Jobs:

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(mJobs);
                    mJobs.Validate("Approval Status", mJobs."Approval Status"::Approved);
                    mJobs.Modify();

                end;
            Database::"Grant Surrender Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(GrantSurrHeader);
                    GrantSurrHeader.Validate(Status, GrantSurrHeader.Status::Approved);
                    GrantSurrHeader.Modify();

                end;
            Database::"Purch. Rcpt. Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(GRN);
                    GRN.Validate(Status, GRN.Status::Approved);
                    GRN.Modify();

                end;

            Database::"HR Asset Transfer Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(AssetTransfer);
                    AssetTransfer.Validate(Status, AssetTransfer.Status::Approved);
                    AssetTransfer.Modify();

                end;

            Database::"G/L Budget Name":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(Budget);
                    Budget.Validate(Status, Budget.Status::Approved);
                    Budget.Modify();

                end;
            Database::"G/L Account":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(GLA);
                    GLA.Validate(Status, GLA.Status::Approved);
                    GLA.Modify();

                end;
            Database::"Inspection Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(inspectionHD);
                    inspectionHD.Validate(Status, inspectionHD.Status::Approved);
                    inspectionHD.Modify();

                end;

            Database::"HR Employee Transfer Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(EmpTrans);
                    EmpTrans.Validate(Status, EmpTrans.Status::Approved);
                    EmpTrans.Modify();

                end;

            Database::"Master Record Creation Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(Master);
                    Master.Validate(Status, Master.Status::Approved);
                    Master.Modify();

                end;
            Database::"Investment Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(Investment);
                    Investment.Validate(Status, Investment.Status::Approved);
                    Investment.Modify();

                end;
            Database::"HR Employee Confirmation":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(EmpConfirmation);
                    EmpConfirmation.Validate(Status, EmpConfirmation.Status::Approved);
                    EmpConfirmation.Modify();

                end;
            Database::"HR Promo. Recommend Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(Promotion);
                    Promotion.Validate(Status, Promotion.Status::Approved);
                    Promotion.Modify();
                end;
            Database::"HR Professional body Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(ProfessionalBody);
                    ProfessionalBody.Validate(Status, ProfessionalBody.Status::Approved);
                    ProfessionalBody.Modify();

                end;
            Database::"HR Individual Targets Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(Balscorecard);
                    Balscorecard.Validate(Status, Balscorecard.Status::Approved);
                    Balscorecard.Modify();

                end;
            Database::"HR Transport Requisition":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(TransReq);
                    TransReq.Validate(Status, TransReq.Status::Approved);
                    TransReq.Modify();

                end;
            Database::"HR Overtime Header":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(HROvertimeHeader);
                    HROvertimeHeader.Validate(Status, HROvertimeHeader.Status::Approved);
                    HROvertimeHeader.Modify();

                end;
            Database::"HR Jobs to Succeed":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(JobstoSucceed);
                    JobstoSucceed.Validate(Status, JobstoSucceed.Status::Approved);
                    JobstoSucceed.Modify();

                end;
            Database::"HR Induction Schedule":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(InductionSchedule);
                    InductionSchedule.Validate(Status, InductionSchedule.Status::Approved);
                    InductionSchedule.Modify();

                end;
            Database::"HR Job Applications":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(QualifiedApplicants);
                    QualifiedApplicants.Validate("Approval Status", QualifiedApplicants."Approval Status"::Approved);
                    QualifiedApplicants.Modify();

                end;
            // Database::"HR Disciplinary Cases NCA":

            //     if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
            //         RecRef.SetTable(DiscCase);
            //         DiscCase.Validate(Status, DiscCase.Status::Approved);
            //         DiscCase.Modify();

            //     end;
            Database::prPayChange:

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(ChangeDetails);
                    ChangeDetails.Validate(Status, ChangeDetails.Status::Approved);
                    ChangeDetails.Modify();

                end;
            // Database::"Clearance Certificate":

            //     if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
            //         RecRef.SetTable(Clearance);
            //         Clearance.Validate(Status, Clearance.Status::Approved);
            //         Clearance.Modify();

            //     end;
            Database::"HR Employees - Changes":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(HREmployeesChanges);
                    HREmployeesChanges.Validate("Approval Status", HREmployeesChanges."Approval Status"::Approved);
                    HREmployeesChanges.Modify();
                end;
            Database::"HR Employees":
                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(HREmp);
                    HREmp.Validate(Status, HREmp.Status::Active);
                    HREmp.Modify();
                end;
            Database::"Payroll Changes":
                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(PayChange);
                    PayChange.Validate(Status, PayChange.Status::Approved);
                    PayChange.Status := PayChange.Status::Approved;
                    PayChange.Modify(true);
                end;
            // Database::"Employee Separation Header":

            //     if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
            //         RecRef.SetTable(Separation);
            //         Separation.Validate(Status, Separation.Status::Approved);

            //******TO POPULATE CLERANCE CERTIFICATE
            // if Separation.Status = Separation.Status::Approved then begin
            //     ClearanceCertificate.Init();
            //     ClearanceCertificate."P/No" := Separation."Staff Code";
            //     ClearanceCertificate."Employee No" := Separation."Staff Code";
            //     ClearanceCertificate."Separation No" := Separation."Separation No.";
            //     //ClearanceCertificate."Responsibility Center":=Separation."Responsibility Center";
            //     ClearanceCertificate."Responsibility Center" := 'HRM';
            //     ClearanceCertificate.Name := Separation."Staff Name";
            //     ClearanceCertificate."USER ID" := Separation."User ID";
            //     ClearanceCertificate.Insert(true);
            //     //PortalWebService.SendClearanceReqForApproval(ClearanceCertificate."Clearance No.");
            //     VarVariant := ClearanceCertificate;
            //     ApprovalMgt.OnSendDocForApproval(VarVariant);
            // end;
            // error('test') ;
            //******
            //     Separation.Modify();
            // end;
            Database::"Acceleration Pool Nomination":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(Pool);
                    Pool.Validate(Status, Pool.Status::Approved);
                    Pool.Modify();

                end;
            Database::"HR Training Needs":

                if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                    RecRef.SetTable(HRTrainingNeeds);
                    HRTrainingNeeds.Validate(Status, HRTrainingNeeds.Status::Approved);
                    HRTrainingNeeds.Modify();
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    local procedure OnRejectApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    var
        LeaveAppli: Record "HR Leave Application";
        Clearance: Record "Clearance Certificate";
        AssetRe: Record "Asset Repair Header";
    begin
        case ApprovalEntry."Table ID" of
            Database::"Asset Repair Header":
                if AssetRe.Get(ApprovalEntry."Document No.") then begin
                    AssetRe.validate(status, AssetRe.status::Rejected);
                    AssetRe.Modify(true);
                end;
            Database::"HR Leave Application":
                if LeaveAppli.Get(ApprovalEntry."Document No.") then begin
                    LeaveAppli.validate(status, LeaveAppli.status::Rejected);
                    LeaveAppli.Modify(true);
                end;
            Database::"Clearance Certificate":
                if Clearance.Get(ApprovalEntry."Document No.") then begin
                    Clearance.validate(status, Clearance.status::Rejected);
                    Clearance.Modify(true);
                end;
        end;
    end;
}