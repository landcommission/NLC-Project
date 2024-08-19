
#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50037 "Custom Approvals Codeunit"
{

    trigger OnRun()
    begin
        AddWorkflowEventsToLibrary
    end;

    var
        //changed
        WorkflowManagement: Codeunit "Workflow Management";
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';
        NoWorkflowEnabledErr: label 'This record is not supported by related approval workflow.';
        //Test
        RunWorkflowOnSendHrEmpQualificationForApprovalCode: label 'RUNWORKFLOWONSENDHrEmpQualicationRFORAPPROVAL';
        RunWorkflowOnCancelHrEmpQualificationForApprovalCode: label 'RUNWORKFLOWONCANCELHrEmpQualicationFORAPPROVAL';
        OnCancelHrEmpQualificationpprovalRequestTxt: label 'An Approval of Hr Emp Qualifications is cancelled';
        OnSendHrEmpQualificationApprovalRequestTxt: label ' An Approval of Hr Emp Qualifications is requested';
        //CompActivity
        RunWorkflowOnSendCompanyActivityForApprovalCode: label 'RUNWORKFLOWONSENDCOMPANYACTIVITYRFORAPPROVAL';
        RunWorkflowOnCancelCompanyActivityForApprovalCode: label 'RUNWORKFLOWONCANCELCOMPANYACTIVITYFORAPPROVAL';
        OnCancelCompanyActivityApprovalRequestTxt: label 'An Approval of Company Activity is cancelled';
        OnSendCompanyActivityApprovalRequestTxt: label ' An Approval of Company Activity is requested';
        //Staff Changes
        RunWorkflowOnsendStaffEmpchangesForApprovalCode: label 'RUNWORKFLOWONSENDSTAFFCHANGESRFORAPPROVAL';
        RunWorkflowOnCancelstaffempchangesForApprovalCode: label 'RUNWORKFLOWONCANCELSTAFFCHANGESFORAPPROVAL';
        OnCancelStaffEmpChangesEmpApprovalRequestTxt: label 'An Approval of Staff employee Changes is cancelled';
        OnSendStaffEmpChangesApprovalRequestTxt: label ' An Approval of Staff employee Changes is requested';
        //Staff Registration
        RunWorkflowOnsendStaffregistrationForApprovalCode: label 'RUNWORKFLOWONSENDSTAFFREGISTRATIONRFORAPPROVAL';
        RunWorkflowOnCancelstaffRegistrationForApprovalCode: label 'RUNWORKFLOWONCANCELSTAFFREGISTRATIONFORAPPROVAL';
        OnCancelStaffRegistrationApprovalRequestTxt: label 'An Approval of Staff registration is cancelled';
        OnSendStaffRegistrationApprovalRequestTxt: label ' An Approval of Staff registration is requested';
        //Storeheader
        RunWorkflowOnsendStoreRequisionHeadersForApprovalCode: label 'RUNWORKFLOWONSENDStoreRequisionHeadersRFORAPPROVAL';
        RunWorkflowOnCancelStoreRequisionHeadersForApprovalCode: label 'RUNWORKFLOWONCANCELStoreRequisionHeadersFORAPPROVAL';
        OnCancelStoreRequisionHeadersApprovalRequestTxt: label 'An Approval of Store Requision Headers is cancelled';
        OnSendStoreRequisionHeadersApprovalRequestTxt: label ' An Approval of Store Requision Headers is requested';
        //Disposal

        RunWorkflowOnsendDisposalPlanTableHeadersForApprovalCode: label 'RUNWORKFLOWONSENDDisposalPlanTableHeadersRFORAPPROVAL';
        RunWorkflowOnCancelDisposalPlanTableHeadersForApprovalCode: label 'RUNWORKFLOWONCANCELDisposalPlanTableHeadersFORAPPROVAL';
        OnCancelDisposalPlanTableHeadersApprovalRequestTxt: label 'An Approval of Disposal Plan Table Headers is cancelled';
        OnSendDisposalPlanTableHeadersApprovalRequestTxt: label ' An Approval of Disposal Plan Table Headers is requested';


    procedure CheckApprovalsWorkflowEnabled(var Variant: Variant): Boolean
    var
        RecRef: RecordRef;
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        HREmplQualification: Record "HR Emp Qualification Changes";
        StaffChanges: Record "HR Employee Staff Changes";
        Staffregistration: Record "HR Employee Registration";
        StaffRequisition: Record "Store Requistion Headers";
        DisposalReq: Record "Disposal Plan Table Headers";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            Database::"Disposal Plan Table Headers":
                exit(CheckApprovalsWorkflowEnabledCode(variant, RunWorkflowOnsendDisposalPlanTableHeadersForApprovalCode));

            Database::"Store Requistion Headers":
                exit(CheckApprovalsWorkflowEnabledCode(variant, RunWorkflowOnsendStoreRequisionHeadersForApprovalCode));
            Database::"HR Employee Staff Changes":
                exit(CheckApprovalsWorkflowEnabledCode(variant, RunWorkflowOnsendStaffEmpchangesForApprovalCode));
            Database::"HR Emp Qualification Changes":
                exit(CheckApprovalsWorkflowEnabledCode(variant, RunWorkflowOnSendHrEmpQualificationForApprovalCode));
            Database::"HR Company Activities":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendCompanyActivityForApprovalCode));
            Database::"HR Employee Registration":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnsendStaffregistrationForApprovalCode));
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;


    procedure CheckApprovalsWorkflowEnabledCode(var Variant: Variant; CheckApprovalsWorkflowTxt: Text): Boolean
    var
        RecRef: RecordRef;
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        begin
            if not WorkflowManagement.CanExecuteWorkflow(Variant, CheckApprovalsWorkflowTxt) then
                Error(NoWorkflowEnabledErr);
            exit(true);
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

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure AddWorkflowEventsToLibrary()
    var
        WorkFlowEventHandling: Codeunit "Workflow Event Handling";
    begin
        //DisposalHeaders
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnsendDisposalPlanTableHeadersForApprovalCode, Database::"Disposal Plan Table Headers", OnSendDisposalPlanTableHeadersApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelDisposalPlanTableHeadersForApprovalCode, Database::"Disposal Plan Table Headers", OnCancelDisposalPlanTableHeadersApprovalRequestTxt, 0, false);

        //StoreRequaest
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnsendStoreRequisionHeadersForApprovalCode, Database::"Store Requistion Headers", OnSendStoreRequisionHeadersApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelStoreRequisionHeadersForApprovalCode, Database::"Store Requistion Headers", OnCancelStoreRequisionHeadersApprovalRequestTxt, 0, false);
        //StaffChanges
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnsendStaffEmpchangesForApprovalCode, Database::"HR Employee Staff Changes", OnSendStaffEmpChangesApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelstaffempchangesForApprovalCode, Database::"HR Employee Staff Changes", OnCancelStaffEmpChangesEmpApprovalRequestTxt, 0, false);

        //ClearanceForm
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendHrEmpQualificationForApprovalCode, Database::"HR Emp Qualification Changes", OnSendHrEmpQualificationApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelHrEmpQualificationForApprovalCode, Database::"HR Emp Qualification Changes", OnCancelHrEmpQualificationpprovalRequestTxt, 0, false);
        //Companyactivity
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendCompanyActivityForApprovalCode, Database::"HR Company Activities", OnSendCompanyActivityApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelCompanyActivityForApprovalCode, Database::"HR Company Activities", OnCancelCompanyActivityApprovalRequestTxt, 0, false);
        //Staffregistration
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnsendStaffregistrationForApprovalCode, Database::"HR Employee Registration", OnSendStaffRegistrationApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelstaffRegistrationForApprovalCode, Database::"HR Employee Registration", OnCancelStaffRegistrationApprovalRequestTxt, 0, false);

    end;

    local procedure RunWorkflowOnSendApprovalRequestCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendApprovalRequest'));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Approvals Codeunit", 'OnSendDocForApproval', '', false, false)]

    procedure RunWorkflowOnSendApprovalRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            Database::"Disposal Plan Table Headers":
                WorkflowManagement.HandleEvent(RunWorkflowOnsendDisposalPlanTableHeadersForApprovalCode, Variant);
            Database::"Store Requistion Headers":
                WorkflowManagement.HandleEvent(RunWorkflowOnsendStoreRequisionHeadersForApprovalCode, Variant);
            Database::"HR Employee Staff Changes":
                WorkflowManagement.HandleEvent(RunWorkflowOnsendStaffEmpchangesForApprovalCode, Variant);
            Database::"HR Emp Qualification Changes":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHrEmpQualificationForApprovalCode, Variant);
            Database::"HR Company Activities":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendCompanyActivityForApprovalCode, Variant);
            Database::"HR Employee Registration":
                WorkflowManagement.HandleEvent(RunWorkflowOnsendStaffregistrationForApprovalCode, Variant);
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Approvals Codeunit", 'OnCancelDocApprovalRequest', '', false, false)]

    procedure RunWorkflowOnCancelApprovalRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            Database::"Disposal Plan Table Headers":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelDisposalPlanTableHeadersForApprovalCode, Variant);

            Database::"Store Requistion Headers":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelStoreRequisionHeadersForApprovalCode, Variant);
            Database::"HR Employee Staff Changes":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelstaffempchangesForApprovalCode, Variant);
            Database::"HR Emp Qualification Changes":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHrEmpQualificationForApprovalCode, Variant);
            Database::"HR Company Activities":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelCompanyActivityForApprovalCode, Variant);
            Database::"HR Employee Registration":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelstaffRegistrationForApprovalCode, Variant);
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;

    //for approvals mgnt


    //Handle responses kkaimor

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpendocument', '', false, false)]
    local procedure OnOpendocument(RecRef: RecordRef; var Handled: Boolean)

    var
        HrEmpQuali: Record "HR Emp Qualification Changes";
        CompanyAct: Record "HR Company Activities";
        StaffChanges: Record "HR Employee Staff Changes";
        StaffREgistration: Record "HR Employee Registration";
        StoreHeaaders: Record "Store Requistion Headers";
        DisposalHeaders: Record "Disposal Plan Table Headers";

    begin
        case RecRef.number of
            Database::"Disposal Plan Table Headers":
                begin
                    RecRef.SetTable(DisposalHeaders);
                    DisposalHeaders.Validate(DisposalHeaders.Status, DisposalHeaders.Status::Open);
                    DisposalHeaders.Modify;
                    Handled := true;
                end;
            Database::"Store Requistion Headers":
                begin
                    RecRef.SetTable(StoreHeaaders);
                    StoreHeaaders.Validate(StoreHeaaders."Approval Status", StoreHeaaders."Approval Status"::Open);
                    StoreHeaaders.Modify;
                    Handled := true;
                end;
            Database::"HR Employee Registration":
                begin
                    RecRef.SetTable(StaffREgistration);
                    StaffREgistration.Validate(StaffREgistration."Approval Status", StaffChanges."Approval Status"::Open);
                    StaffREgistration.Modify;
                    Handled := true;
                end;
            Database::"HR Employee Staff Changes":
                begin
                    RecRef.SetTable(StaffChanges);
                    StaffChanges.Validate(StaffChanges."Approval Status", StaffChanges."Approval Status"::Open);
                    StaffChanges.Modify;
                    Handled := true;
                end;
            Database::"HR Emp Qualification Changes":
                begin
                    RecRef.SetTable(HrEmpQuali);
                    HrEmpQuali.Validate(Status, HrEmpQuali.Status::Open);
                    HrEmpQuali.Modify;
                    Handled := true;
                end;
            Database::"HR Company Activities":
                begin
                    RecRef.SetTable(CompanyAct);
                    CompanyAct.Validate(Status, CompanyAct.Status::New);
                    CompanyAct.Modify;
                    Handled := true;
                end;

        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'onSetStatusToPendingApproval', '', false, false)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        HrEmpQuali: Record "HR Emp Qualification Changes";
        CompanyAct: Record "HR Company Activities";
        StaffChanges: Record "HR Employee Staff Changes";
        StaffRegistration: Record "HR Employee Registration";
        StoreHeaders: Record "Store Requistion Headers";
        DisposalHeaders: Record "Disposal Plan Table Headers";

    begin
        case RecRef.number of
            Database::"Disposal Plan Table Headers":
                begin
                    RecRef.SetTable(DisposalHeaders);
                    DisposalHeaders.Validate(DisposalHeaders.Status, DisposalHeaders.Status::"Pending Approval");
                    DisposalHeaders.Modify(true);
                    Variant := DisposalHeaders;
                    IsHandled := true;
                end;
            Database::"Store Requistion Headers":
                begin
                    RecRef.SetTable(StoreHeaders);
                    StoreHeaders.Validate(StoreHeaders."Approval Status", StoreHeaders."Approval Status"::"Pending Approval");
                    StoreHeaders.Modify(true);
                    Variant := StoreHeaders;
                    IsHandled := true;
                end;
            Database::"HR Employee Registration":
                begin
                    RecRef.SetTable(StaffRegistration);
                    StaffRegistration.Validate(StaffRegistration."Approval Status", StaffRegistration."Approval Status"::"Pending Approval");
                    StaffRegistration.Modify(true);
                    Variant := StaffRegistration;
                    IsHandled := true;
                end;
            Database::"HR Employee Staff Changes":
                begin
                    RecRef.SetTable(StaffChanges);
                    StaffChanges.Validate(StaffChanges."Approval Status", StaffChanges."Approval Status"::"Pending Approval");
                    StaffChanges.Modify(true);
                    Variant := StaffChanges;
                    IsHandled := true;
                end;
            Database::"HR Emp Qualification Changes":
                begin
                    RecRef.SetTable(HrEmpQuali);
                    HrEmpQuali.Validate(Status, HrEmpQuali.Status::"Pending Approval");
                    HrEmpQuali.Modify(true);
                    Variant := HrEmpQuali;
                    IsHandled := true;
                end;
            Database::"HR Company Activities":
                begin
                    RecRef.SetTable(CompanyAct);
                    CompanyAct.Validate(Status, CompanyAct.Status::"Pending Approval");
                    CompanyAct.Modify(true);
                    Variant := CompanyAct;
                    IsHandled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', false, false)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry"; workflowstepInstance: Record "Workflow Step Instance")
    var
        HrEmpQuali: Record "HR Emp Qualification Changes";
        CompanyAct: Record "HR Company Activities";
        StaffChanges: Record "HR Employee Staff Changes";
        StaffRegistration: Record "HR Employee Registration";
        StoreHeaders: Record "Store Requistion Headers";
        DisposalHeaders: Record "Disposal Plan Table Headers";

    begin
        case RecRef.number of
            Database::"Disposal Plan Table Headers":
                begin
                    RecRef.SetTable(DisposalHeaders);
                    ApprovalEntryArgument."Document No." := DisposalHeaders."No.";
                end;
            Database::"Store Requistion Headers":
                begin
                    RecRef.SetTable(StoreHeaders);
                    ApprovalEntryArgument."Document No." := StoreHeaders."No.";
                end;
            Database::"HR Employee Registration":
                begin
                    RecRef.SetTable(StaffRegistration);
                    ApprovalEntryArgument."Document No." := StaffRegistration."No.";
                end;
            Database::"HR Employee Staff Changes":
                begin
                    RecRef.SetTable(StaffChanges);
                    ApprovalEntryArgument."Document No." := StaffChanges."No.";
                    //ApprovalEntryArgument.Modify();
                end;
            Database::"HR Emp Qualification Changes":
                begin
                    RecRef.SetTable(HrEmpQuali);
                    ApprovalEntryArgument."Document No." := HrEmpQuali."Qualfi Code";
                end;
            Database::"HR Company Activities":
                begin
                    RecRef.SetTable(CompanyAct);
                    ApprovalEntryArgument."Document No." := CompanyAct.Code;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', false, false)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: boolean)
    var
        HrEmpQuali: Record "HR Emp Qualification Changes";
        CompanyAct: Record "HR Company Activities";
        Staffchanges: Record "HR Employee Staff Changes";
        StaffRegistration: Record "HR Employee Registration";
        StoreHeaders: Record "Store Requistion Headers";
        DisposalHeaders: Record "Disposal Plan Table Headers";
    begin
        case RecRef.Number of
            Database::"Disposal Plan Table Headers":
                begin
                    RecRef.SetTable(DisposalHeaders);
                    DisposalHeaders.Validate(DisposalHeaders.Status, DisposalHeaders.Status::Approved);
                    DisposalHeaders.Modify;
                    Handled := true;
                end;
            Database::"Store Requistion Headers":
                begin
                    RecRef.SetTable(StoreHeaders);
                    StoreHeaders.Validate(StoreHeaders."Approval Status", StoreHeaders."Approval Status"::Approved);
                    StoreHeaders.Modify;
                    Handled := true;
                end;
            Database::"HR Employee Registration":
                begin
                    RecRef.SetTable(StaffRegistration);
                    StaffRegistration.Validate(StaffRegistration."Approval Status", StaffRegistration."Approval Status"::Approved);
                    StaffRegistration.Modify;
                    Handled := true;
                end;
            Database::"HR Employee Staff Changes":
                begin
                    RecRef.SetTable(Staffchanges);
                    Staffchanges.Validate(Staffchanges."Approval Status", Staffchanges."Approval Status"::Approved);
                    Staffchanges.Posted := true;
                    Staffchanges.Modify;
                    Handled := true;
                end;
            Database::"HR Emp Qualification Changes":
                begin
                    RecRef.SetTable(HrEmpQuali);
                    HrEmpQuali.Validate(Status, HrEmpQuali.Status::Approved);
                    HrEmpQuali.Posted := true;
                    HrEmpQuali.Modify;
                    Handled := true;
                end;
            Database::"HR Company Activities":
                begin
                    RecRef.SetTable(CompanyAct);
                    CompanyAct.Validate(Status, CompanyAct.Status::Approved);
                    CompanyAct.Modify;
                    Handled := true;
                end;

        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]

    local procedure OnRejectApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    var
        HrEmpQuali: Record "HR Emp Qualification Changes";
        CompanyAct: Record "HR Company Activities";
        StaffChanges: Record "HR Employee Staff Changes";
        StaffRegistration: Record "HR Employee Registration";
        StoreHeaders: Record "Store Requistion Headers";
        DisposalHeaders: Record "Disposal Plan Table Headers";

    begin
        case ApprovalEntry."Table ID" of
            database::"Disposal Plan Table Headers":
                begin
                    if DisposalHeaders.Get(ApprovalEntry."Document No.") then begin
                        DisposalHeaders.validate(DisposalHeaders.Status, DisposalHeaders.Status::Rejected);
                        DisposalHeaders.modify(true);
                    end;
                end;
            database::"Store Requistion Headers":
                begin
                    if StoreHeaders.Get(ApprovalEntry."Document No.") then begin
                        StoreHeaders.validate(StoreHeaders."Approval Status", StoreHeaders."Approval Status"::Rejected);
                        StoreHeaders.modify(true);
                    end;
                end;
            database::"HR Employee Registration":
                begin
                    if StaffRegistration.Get(ApprovalEntry."Document No.") then begin
                        StaffRegistration.validate(StaffRegistration."Approval Status", StaffRegistration."Approval Status"::Rejected);
                        StaffRegistration.modify(true);
                    end;
                end;
            database::"HR Employee Staff Changes":
                begin
                    if StaffChanges.Get(ApprovalEntry."Document No.") then begin
                        StaffChanges.validate(StaffChanges."Approval Status", StaffChanges."Approval Status"::Rejected);
                        StaffChanges.modify(true);

                    end;
                end;


            database::"HR Emp Qualification Changes":
                begin
                    if HrEmpQuali.Get(ApprovalEntry."Document No.") then begin
                        HrEmpQuali.validate(Status, HrEmpQuali.Status::Rejected);
                        HrEmpQuali.modify(true);
                    end;

                end;
            database::"HR Company Activities":
                begin
                    if CompanyAct.Get(ApprovalEntry."Document No.") then begin
                        CompanyAct.validate(Status, CompanyAct.Status::Rejected);
                        CompanyAct.modify(true);
                    end;

                end;


        end;
    end;
    //approvals response


    procedure ReOpen(var Variant: Variant)
    var

        RecRef: RecordRef;
        HrEmpQuali: Record "HR Emp Qualification Changes";
        CompanyAct: Record "HR Company Activities";
        StaffChanges: Record "HR Employee Staff Changes";
        StaffRegistration: Record "HR Employee Registration";
        StoreHeaders: Record "Store Requistion Headers";
        DisposalHeaders: Record "Disposal Plan Table Headers";

    begin

        RecRef.GetTable(Variant);
        case RecRef.Number of
            Database::"Disposal Plan Table Headers":
                begin
                    RecRef.SetTable(DisposalHeaders);
                    DisposalHeaders.Validate(DisposalHeaders.Status, DisposalHeaders.Status::Open);
                    DisposalHeaders.Modify;
                    Variant := DisposalHeaders;
                end;
            Database::"Store Requistion Headers":
                begin
                    RecRef.SetTable(StoreHeaders);
                    StoreHeaders.Validate(StoreHeaders."Approval Status", StoreHeaders."Approval Status"::Open);
                    StoreHeaders.Modify;
                    Variant := StoreHeaders;
                end;
            Database::"HR Employee Registration":
                begin
                    RecRef.SetTable(StaffRegistration);
                    StaffRegistration.Validate(StaffRegistration."Approval Status", StaffRegistration."Approval Status"::Open);
                    StaffRegistration.Modify;
                    Variant := StaffRegistration;
                end;
            Database::"HR Employee Staff Changes":
                begin
                    RecRef.SetTable(StaffChanges);
                    StaffChanges.Validate(StaffChanges."Approval Status", StaffChanges."Approval Status"::Open);
                    StaffChanges.Modify;
                    Variant := StaffChanges;
                end;
            Database::"HR Emp Qualification Changes":
                begin
                    RecRef.SetTable(HrEmpQuali);
                    HrEmpQuali.Validate(Status, HrEmpQuali.Status::Open);
                    HrEmpQuali.Modify;
                    Variant := HrEmpQuali;
                end;
            Database::"HR Company Activities":
                begin
                    RecRef.SetTable(CompanyAct);
                    CompanyAct.Validate(Status, CompanyAct.Status::New);
                    CompanyAct.Modify;
                    Variant := CompanyAct;
                end;

            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end

    end;

    procedure SetStatusToPending(var Variant: Variant)
    var
        RecRef: RecordRef;
        HrEmpQuali: Record "HR Emp Qualification Changes";
        CompanyAct: Record "HR Company Activities";
        StaffChanges: Record "HR Employee Staff Changes";
        StaffREgistration: Record "HR Employee Registration";
        StoreHeaders: Record "Store Requistion Headers";
        DisposalHeaders: Record "Disposal Plan Table Headers";

    begin

        RecRef.GetTable(Variant);
        case RecRef.Number of
            Database::"Disposal Plan Table Headers":
                begin
                    RecRef.SetTable(DisposalHeaders);
                    DisposalHeaders.Validate(DisposalHeaders.Status, DisposalHeaders.Status::"Pending Approval");
                    DisposalHeaders.Modify;
                    Variant := DisposalHeaders;
                end;
            Database::"Store Requistion Headers":
                begin
                    RecRef.SetTable(StoreHeaders);
                    StoreHeaders.Validate(StoreHeaders."Approval Status", StoreHeaders."Approval Status"::"Pending Approval");
                    StoreHeaders.Modify;
                    Variant := StoreHeaders;
                end;
            //Gurantor Substitution
            Database::"HR Employee Registration":
                begin
                    RecRef.SetTable(StaffREgistration);
                    StaffREgistration.Validate(StaffREgistration."Approval Status", StaffREgistration."Approval Status"::"Pending approval");
                    StaffREgistration.Modify;
                    Variant := StaffREgistration;
                end;
            Database::"HR Employee Staff Changes":
                begin
                    RecRef.SetTable(StaffChanges);
                    StaffChanges.Validate(StaffChanges."Approval Status", StaffChanges."Approval Status"::"Pending approval");
                    StaffChanges.Modify;
                    Variant := StaffChanges;
                end;
            Database::"HR Emp Qualification Changes":
                begin
                    RecRef.SetTable(HrEmpQuali);
                    HrEmpQuali.Validate(Status, HrEmpQuali.Status::"Pending Approval");
                    HrEmpQuali.Modify;
                    Variant := HrEmpQuali;
                end;
            Database::"HR Company Activities":
                begin
                    RecRef.SetTable(CompanyAct);
                    CompanyAct.Validate(Status, CompanyAct.Status::"Pending Approval");
                    CompanyAct.Modify;
                    Variant := CompanyAct;
                end;
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end
    end;
}
