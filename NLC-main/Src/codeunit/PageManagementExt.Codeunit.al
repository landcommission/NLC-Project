codeunit 50008 "Page Management Ext"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", 'OnAfterGetPageID', '', false, false)]
    local procedure OnAfterGetPageID(RecordRef: RecordRef; var PageID: Integer);
    var

    begin
        if PageID = 0 then
            PageID := GetConditionalCardPageID(RecordRef);


    end;

    local procedure GetConditionalCardPageID(RecRef: RecordRef): Integer
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
        hrtransport: Record "HR Transport Allocations";
        JVHeader: Record "JV Header";
        HRLeaveReimb: Record "HR Leave Reimbursement";
        mJobs: Record Jobs;
        GrantSurrHeader: Record "Grant Surrender Header";
        GRN: Record "Purch. Rcpt. Header";
        AssetDonation: Record "HR Job Occupations";
        AssetTransfer: Record "HR Asset Transfer Header";
        inspectionHD: Record "Inspection Header";
        closeoutHD: Record "HR OSInjured Person";
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

    begin
        case RecRef.Number of
            Database::"Payments Header":

                RecRef.SetTable(PaymentHeader);
            //exit(Page::)
            Database::"Imprest Header":

                RecRef.SetTable(ImprestHeader);
            //exit(Page::)
            Database::"Store Requistion Headers":
                begin
                    RecRef.SetTable(SRHeader);
                    exit(Page::"Store Requisition Card")
                end;
            Database::"Imprest Surrender Header":
                begin
                    RecRef.SetTable(ImprestSurr);
                    exit(Page::"Imprest Surrender")
                end;
            Database::"InterBank Transfers":
                begin
                    RecRef.SetTable(InterbankTrans);
                    exit(Page::"InterBank Transfers List")
                end;
            Database::"Receipts Header":
                begin
                    RecRef.SetTable(Receipt);
                    exit(Page::"Receipt Header")
                end;
            Database::"Staff Claims Header":
                begin
                    RecRef.SetTable(StaffClaim);
                    exit(Page::"Staff Claims")
                end;
            Database::"Staff Advance Headers":
                begin
                    RecRef.SetTable(StaffAdvance);
                    exit(Page::"Salary Advance Request Crd")
                end;
            Database::"Staff Advance Surrender Header":
                begin
                    RecRef.SetTable(StaffAdvanceSurr);
                    exit(Page::"Staff Advance Surrender")
                end;


            Database::"HR Jobs":
                begin
                    RecRef.SetTable(HRJobs);
                    exit(Page::"Job Card")
                end;
            Database::"HR Leave Application":
                begin
                    RecRef.SetTable(HRLeaveApp);
                    exit(Page::"HR Leave Application Card")
                end;
            Database::"HR Employee Requisitions":
                begin
                    RecRef.SetTable(Hrempreq);
                    exit(Page::"HR Employee Requisition Card")
                end;
            Database::"HR Training App Header":
                begin
                    RecRef.SetTable(Training);
                    exit(Page::"HR Training Application Card")
                end;
            Database::"HR Transport Allocations":
                begin
                    RecRef.SetTable(hrtransport);
                    exit(Page::"HR Transport Allocation")
                end;
            Database::"JV Header":
                begin
                    RecRef.SetTable(JVHeader);
                    exit(Page::"JV Header")
                end;
            Database::"HR Leave Reimbursement":
                begin
                    RecRef.SetTable(HRLeaveReimb);
                    exit(Page::"HR Leave Reimbursment Card")
                end;
            Database::Jobs:

                RecRef.SetTable(mJobs);
            //exit(Page::)
            Database::"Grant Surrender Header":
                begin
                    RecRef.SetTable(GrantSurrHeader);
                    exit(Page::"Grant Surrender")
                end;
            Database::"Purch. Rcpt. Header":

                RecRef.SetTable(GRN);
            //exit(Page::)
            Database::"HR Job Occupations":
                begin
                    RecRef.SetTable(AssetDonation);
                    exit(Page::"HR Job Occupants")
                end;
            Database::"HR Asset Transfer Header":
                begin
                    RecRef.SetTable(AssetTransfer);
                    exit(Page::"HR Asset Transfer Card")
                end;


            Database::"Inspection Header":
                begin
                    RecRef.SetTable(inspectionHD);
                    exit(Page::"Inspection Header")
                end;

            Database::"HR OSInjured Person":
                begin
                    RecRef.SetTable(closeoutHD);
                    exit(Page::"HR OSAccident Card")
                end;
            Database::"HR Employee Transfer Header":
                begin
                    RecRef.SetTable(EmpTrans);
                    exit(Page::"HR Emp Transfer Card")
                end;

            Database::"Master Record Creation Header":
                begin
                    RecRef.SetTable(Master);
                    exit(Page::"Master Record Creation Card")
                end;
            Database::"Investment Header":
                begin
                    RecRef.SetTable(Investment);
                    exit(Page::"Investment Card")
                end;
            Database::"HR Employee Confirmation":
                begin
                    RecRef.SetTable(EmpConfirmation);
                    exit(Page::"HR Employee confirmation")
                end;
            Database::"HR Promo. Recommend Header":
                begin
                    RecRef.SetTable(Promotion);
                    exit(Page::"HR Promotion Recommendation")
                end;
            Database::"HR Professional body Header":
                begin
                    RecRef.SetTable(ProfessionalBody);
                    exit(Page::"HR Professional bodies")
                end;
            Database::"HR Individual Targets Header":
                begin
                    RecRef.SetTable(Balscorecard);
                    exit(Page::HRObjectivesTargets)
                end;
            Database::"HR Transport Requisition":
                begin
                    RecRef.SetTable(TransReq);
                    exit(Page::"HR Staff Transport Requisition")
                end;
            Database::"HR Overtime Header":

                RecRef.SetTable(HROvertimeHeader);
            //exit(Page::)
            Database::"HR Jobs to Succeed":
                begin
                    RecRef.SetTable(JobstoSucceed);
                    exit(Page::"HR Jobs to succeed Card")
                end;
            Database::"HR Induction Schedule":
                begin
                    RecRef.SetTable(InductionSchedule);
                    exit(Page::"HR Induction Schedule Card")
                end;
            Database::"HR Job Applications":
                begin
                    RecRef.SetTable(QualifiedApplicants);
                    exit(Page::"HR Applicants Qualified Card")
                end;
            Database::"HR Disciplinary Cases NCA":
                begin
                    RecRef.SetTable(DiscCase);
                    exit(Page::"HR Disciplinary Cases")
                end;
            Database::prPayChange:

                RecRef.SetTable(ChangeDetails);
            //exit(Page::)
            Database::"Clearance Certificate":
                begin
                    RecRef.SetTable(Clearance);
                    exit(Page::"Clearance Certificate Card")
                end;
            Database::"HR Employees - Changes":
                begin
                    RecRef.SetTable(HREmployeesChanges);
                    exit(Page::"HR Employee Card Changes View")
                end;
            Database::"HR Employees":
                begin
                    RecRef.SetTable(HREmp);
                    exit(Page::"HR Employee Card")
                end;
            Database::"Payroll Changes":
                begin
                    RecRef.SetTable(PayChange);
                    exit(Page::"Employee Payroll Changes View")
                end;
            Database::"Employee Separation Header":
                begin
                    RecRef.SetTable(Separation);
                    exit(Page::"Employee Separation Card")
                end;
            Database::"Acceleration Pool Nomination":
                begin
                    RecRef.SetTable(Pool);
                    exit(Page::"Acceleration Pool Nom. Card")
                end;
            Database::"HR Training Needs":
                begin
                    RecRef.SetTable(HRTrainingNeeds);
                    exit(Page::"HR Training Needs Card")
                end;
        end;
    end;
}
