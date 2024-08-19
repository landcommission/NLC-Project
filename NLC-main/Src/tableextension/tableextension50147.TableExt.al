#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50147 tableextension50147 extends "Approval Entry"
{
    fields
    {

        //Unsupported feature: Property Modification (OptionString) on ""Document Type"(Field 2)".

        modify("Sender ID")
        {
            TableRelation = "User Setup";
        }
        modify("Approver ID")
        {
            TableRelation = "User Setup";
        }

        //Unsupported feature: Property Deletion (OptionCaptionML) on ""Document Type"(Field 2)".

        field(50000; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            DataClassification = CustomerContent;
            //AutoIncrement = true;
        }
        field(50001; "Approver Type"; Option)
        {
            Caption = 'Approval Type';
            OptionMembers = Approver,Recommender;
            DataClassification = CustomerContent;
        }
    }

    //Unsupported feature: Variable Insertion (Variable: mJobs) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: PaymentsHeader) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: ImprestHeader) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: SRHeader) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: ImprestSurr) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: Interbank) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: StaffAdvance) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: StaffAdvanceSurr) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: StaffClaim) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: GenJnl) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: GenJnlPage) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: JVHead) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: HRJobs) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: LeavePlanner) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: Master) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: Investment) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: Clearance) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: Training) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: HREmp) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: PayChange) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: EmpReq) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: Separation) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: Pool) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: EmpBankChanges) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: EmpPromoTransChanges) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: LeaveApp) (VariableCollection) on "ShowDocument(PROCEDURE 1)".


    //Unsupported feature: Variable Insertion (Variable: Transport) (VariableCollection) on "ShowDocument(PROCEDURE 1)".



    //Unsupported feature: Code Modification on "ShowDocument(PROCEDURE 1)".

    //procedure ShowDocument();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CASE "Table ID" OF
      DATABASE::"Sales Header":
        BEGIN
          IF NOT SalesHeader.GET("Document Type","Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::Quote:
              PAGE.RUN(PAGE::"Sales Quote",SalesHeader);
            "Document Type"::Order:
              PAGE.RUN(PAGE::"Sales Order",SalesHeader);
            "Document Type"::Invoice:
              PAGE.RUN(PAGE::"Sales Invoice",SalesHeader);
            "Document Type"::"Credit Memo":
              PAGE.RUN(PAGE::"Sales Credit Memo",SalesHeader);
            "Document Type"::"Blanket Order":
              PAGE.RUN(PAGE::"Blanket Sales Order",SalesHeader);
            "Document Type"::"Return Order":
              PAGE.RUN(PAGE::"Sales Return Order",SalesHeader);
          END;
        END;
      DATABASE::"Purchase Header":
        BEGIN
          IF NOT PurchHeader.GET("Document Type","Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::Quote:
              PAGE.RUN(PAGE::"Purchase Quote",PurchHeader);
            "Document Type"::Order:
              PAGE.RUN(PAGE::"Purchase Order",PurchHeader);
            "Document Type"::Invoice:
              PAGE.RUN(PAGE::"Purchase Invoice",PurchHeader);
            "Document Type"::"Credit Memo":
              PAGE.RUN(PAGE::"Purchase Credit Memo",PurchHeader);
            "Document Type"::"Blanket Order":
              PAGE.RUN(PAGE::"Blanket Purchase Order",PurchHeader);
            "Document Type"::"Return Order":
              PAGE.RUN(PAGE::"Purchase Return Order",PurchHeader);
          END;
        END;
      ELSE
        EXIT;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
            "Document Type"::"Blan Order":
              PAGE.RUN(PAGE::"Blanket Sales Order",SalesHeader);
            "Document Type"::Ret:
    #18..33
            "Document Type"::"Blan Order":
              PAGE.RUN(PAGE::"Blanket Purchase Order",PurchHeader);
            "Document Type"::Ret:
    #37..39

    //Other Customized Documents

     //Payment Voucher and Petty Cash
        DATABASE::"Payments Header":
        BEGIN
          IF NOT PaymentsHeader.GET("Document No.") THEN
            EXIT;
         CASE "Document Type" OF
          "Document Type"::PV:
             PAGE.RUN(PAGE::"Payment Header",PaymentsHeader);
           "Document Type"::PettyC:
             PAGE.RUN(PAGE::"Cash Payment Header",PaymentsHeader);
           "Document Type"::Rn:
             PAGE.RUN(PAGE::Page39005951,PaymentsHeader);
        END;
        END;

    //Imprests
        DATABASE::"Imprest Header":
        BEGIN
          IF NOT ImprestHeader.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::Imp:
              PAGE.RUN(PAGE::"Imprest Request",ImprestHeader);
          END;
        END;


    //staff advance
        DATABASE::"Staff Advance Headers":
        BEGIN
          IF NOT StaffAdvance.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::Staff:
              PAGE.RUN(PAGE::"Staff Advance Request",StaffAdvance);
          END;
        END;



       //Employee Requisition
        DATABASE::"HR Employee Requisitions":
        BEGIN
          IF NOT EmpReq.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::EmpReq:
              PAGE.RUN(PAGE::"HR Employee Requisition Card",EmpReq);
          END;
        END;


    //Staff Advance Surrender Header
        DATABASE::"Staff Advance Surrender Header":
        BEGIN
          IF NOT StaffAdvanceSurr.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::AdvSurr:
              PAGE.RUN(PAGE::"Staff Advance Surrender",StaffAdvanceSurr);
          END;
        END;
    {
    //Store Requisition
        DATABASE::"Store Requistion Headers":
        BEGIN
          IF NOT SRHeader.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::Rn:
              PAGE.RUN(PAGE::"Record Link View",SRHeader);
          END;
        END;
    }

    //Imprest Surrender
        DATABASE::"Imprest Surrender Header":
        BEGIN
          IF NOT ImprestSurr.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::ImpS:
              PAGE.RUN(PAGE::"Imprest Surrender",ImprestSurr);
          END;
        END;
    //Master record creation
        DATABASE::"Master Record Creation Header":
        BEGIN
          IF NOT Master.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::MR:
              PAGE.RUN(PAGE::"Master Record Creation Card",Master);
          END;
        END;

    //Investment
        DATABASE::"Investment Header":
        BEGIN
          IF NOT Investment.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::Inves:
              PAGE.RUN(PAGE::"Investment Card",Investment);
          END;
        END;

    //Clearance Certificate
        DATABASE::"Clearance Certificate":
        BEGIN
          IF NOT Clearance.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::Clear:
              PAGE.RUN(PAGE::"Clearance Certificate Card",Clearance);
          END;
        END;


    //Training Applications
        DATABASE::"HR Training App Header":
        BEGIN
          IF NOT Training.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::"Training Requisition":
              PAGE.RUN(PAGE::"HR Emp Training App. Header",Training);
          END;
        END;


    //HR Employees
        DATABASE::"HR Employees":
        BEGIN
          IF NOT HREmp.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::Employee:
              PAGE.RUN(PAGE::"HR Employee Card",HREmp);
          END;
        END;

    {
    //HR Employees
        DATABASE::"Payroll Changes":
        BEGIN
          IF NOT PayChange.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::PC:
              PAGE.RUN(PAGE::"HR Employee Card",PayChange);
          END;
        END;
      }

    //HR Employees
        DATABASE::"Employee Separation Header":
        BEGIN
          IF NOT Pool.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::Pool:
              PAGE.RUN(PAGE::"Acceleration Pool Nom. Card",Pool);
          END;
        END;




    //HR Pool
        DATABASE::"Acceleration Pool Nomination":
        BEGIN
          IF NOT Separation.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::Sep:
              PAGE.RUN(PAGE::"Separation Card",Separation);
          END;
        END;

    //HR Pool
        DATABASE::"HR Leave Application":
        BEGIN
          IF NOT LeaveApp.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::"Leave Application":
              PAGE.RUN(PAGE::"HR Leave Application Card",LeaveApp);
          END;
        END;



    //HR Pool
        DATABASE::"HR Transport Requisition":
        BEGIN
          IF NOT Transport.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::"Transport Requisition":
              PAGE.RUN(PAGE::"HR Staff Transport Requisition",Transport);
          END;
        END;
    //here added
    //HR Employees Payroll Changes
        DATABASE::"Payroll Changes":
        BEGIN
          IF NOT PayChange.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::PC:
             PAGE.RUN(PAGE::"Employee Payroll Changes View",PayChange);
             END;
          CASE "Document Type" OF
            "Document Type"::PV:
             PAGE.RUN(PAGE::"Employee Status Activa View",PayChange);
             END;
        END;

        //Added for HR Employees Bank Details Change
        DATABASE::"HR Employees - Changes":
        BEGIN
          IF NOT EmpBankChanges.GET("Document No.") THEN
            EXIT;
              PAGE.RUN(PAGE::"HR Employee Card Changes View",EmpBankChanges);
        END;

        DATABASE::"HR Employee Transfer Header":
        BEGIN
          IF NOT EmpPromoTransChanges.GET("Document No.") THEN
            EXIT;
              PAGE.RUN(PAGE::"HR Emp Transfer Card View",EmpPromoTransChanges);
        END;

    //End here


    //Modified
    //Store Requisition Headers
        DATABASE::"Store Requistion Headers":
        BEGIN
          IF NOT SRHeader.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::GRN:
             PAGE.RUN(PAGE::"Purchase Req Card View", SRHeader);
             END;
          CASE "Document Type" OF
            "Document Type"::Rn:
             PAGE.RUN(PAGE::"Store Requisition Card View", SRHeader);
             END;
        END;


       //Interbank Transfer
        DATABASE::"InterBank Transfers":
        BEGIN
          IF NOT Interbank.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::InterB:
              PAGE.RUN(PAGE::"Bank & Cash Transfer Request",Interbank);
          END;
        END;

    //Jobs-------------------------------------------------------------    mki
      DATABASE::Jobs:
        BEGIN
          IF NOT mJobs.GET("Document No.") THEN
            EXIT;
          IF ("Document Type" ="Document Type"::"Concept Note") THEN BEGIN   //concept
              PAGE.RUN(PAGE::"Concept Card",mJobs);
         END ELSE
          IF ( "Document Type" = "Document Type"::Proposal) THEN BEGIN   //Proposal
              PAGE.RUN(PAGE::"Proposal Card",mJobs);
         END ELSE
          IF ( "Document Type" = "Document Type"::Contract) THEN BEGIN   //Contract
              PAGE.RUN(PAGE::"Contract Card",mJobs);
          END ELSE
          IF ( "Document Type" = "Document Type"::Project) THEN BEGIN   //Project
              PAGE.RUN(PAGE::"Project Card",mJobs);
          END
        END;
    {
      DATABASE::Jobs:
        BEGIN
          IF NOT mJobs.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF "Document Type"::Proposal:   //Proposal
              PAGE.RUN(PAGE::"Concept Card",mJobs);
         END;
        END;


    //HER Appraisal-------------------------------------------------------------
      DATABASE::Table39005606:
        BEGIN
          IF NOT HRAppraisal.GET("Document No.") THEN
            EXIT;
              PAGE.RUN(PAGE::Page52193771,HRAppraisal);
        END;
      }
    //HR Jobs-----------------------------------------------------------
      DATABASE::"HR Jobs":
        BEGIN
          IF NOT HRJobs.GET("Document No.") THEN
            EXIT;
              PAGE.RUN(PAGE::"HR Jobs Card" ,HRJobs);
        END;

    //Staff Claim-------------------------------------------------------
        DATABASE::"Staff Claims Header":
        BEGIN
          IF NOT StaffClaim.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::StaffA:
              PAGE.RUN(PAGE::Page39005926,StaffClaim);
          END;
        END;

    //JV Card-----------------------------------------------------------
        DATABASE::"JV Header":
        BEGIN
          IF NOT JVHead.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::JV:
              PAGE.RUN(PAGE::Page39005999,JVHead);
          END;
        END;

       //Leave Planner
        DATABASE::Table39005652:
        BEGIN
          IF NOT LeavePlanner.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::LeavePlanner:
              PAGE.RUN(PAGE::Page39005963,LeavePlanner);
          END;
        END;
    {
       //Employee Transfer
        DATABASE::Table39005663:
        BEGIN
          IF NOT Emptrans.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::EmpTransfer:
              PAGE.RUN(PAGE::Page39005730,Emptrans);
          END;
        END;





       //Hr Asset Transfer

        DATABASE::Table39005665:
        BEGIN
          IF NOT HrAssetrans.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::HrAssetTransfer:
              PAGE.RUN(PAGE::Page39005734,HrAssetrans);
          END;
        END;
    }


    //General Journal
        232:
        BEGIN
          GenJnl.RESET;
          GenJnl.SETRANGE(BatchApprovalNo,"Document No.");
          IF NOT GenJnl.FINDFIRST THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::JV:
              BEGIN
              GenJnlPage.GetBatchToOpen(GenJnl.Name);
              GenJnlPage.RUNMODAL;
              END
          END;
        END;
    #40..42





    {
    ------------------------------------------------------------------------------------------
    CASE "Table ID" OF
      DATABASE::"Sales Header":
        BEGIN
          IF NOT SalesHeader.GET("Document Type","Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::Quote:
              PAGE.RUN(PAGE::"Sales Quote",SalesHeader);
            "Document Type"::Order:
              PAGE.RUN(PAGE::"Sales Order",SalesHeader);
            "Document Type"::Invoice:
              PAGE.RUN(PAGE::"Sales Invoice",SalesHeader);
            "Document Type"::"Credit Memo":
              PAGE.RUN(PAGE::"Sales Credit Memo",SalesHeader);
    #15..20

      DATABASE::jobs:
        BEGIN
          IF NOT mJobs.GET("Document No.") THEN
            EXIT;
          CASE "Document Type" OF "Document Type"::"Concept Note":
              PAGE.RUN(PAGE::"Jobs Card",mJobs);
          END;
        END;





      DATABASE::"Purchase Header":
        BEGIN
          IF NOT PurchHeader.GET("Document Type","Document No.") THEN
            EXIT;
          CASE "Document Type" OF
            "Document Type"::Quote:
              PAGE.RUN(PAGE::"Purchase Quote",PurchHeader);
            "Document Type"::Order:
              PAGE.RUN(PAGE::"Purchase Order",PurchHeader);
            "Document Type"::Invoice:
              PAGE.RUN(PAGE::"Purchase Invoice",PurchHeader);
            "Document Type"::"Credit Memo":
              PAGE.RUN(PAGE::"Purchase Credit Memo",PurchHeader);
    #34..42
    ------------------------------}
    */
    //end;

    var
        objComplianceLedgEntrie: Record "HR OSAccident Incident Line";
        objComplianceJnl: Record "HR OSAccident";
}
