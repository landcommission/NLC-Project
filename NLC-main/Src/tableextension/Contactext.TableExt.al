#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50087 "tableextension50087" extends Contact
{
    fields
    {
        modify("Company No.")
        {
            TableRelation = Contact."No." where(Type = const(Company));
        }

        //Unsupported feature: Code Modification on ""No."(Field 1).OnValidate".

        //trigger "(Field 1)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "No." <> xRec."No." THEN BEGIN
          RMSetup.GET;
          NoSeriesMgt.TestManual(RMSetup."Contact Nos.");
          "No. Series" := '';
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "No." <> xRec."No." THEN BEGIN
          IF "Portal Request"=FALSE THEN BEGIN
        #2..4
          END ELSE BEGIN
            ProcSetup.GET;
          NoSeriesMgt.TestManual(ProcSetup."Request For Registration Nos");
          "No. Series" := '';

            END;
        END;
        */
        //end;
        field(11; "Application Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Acc Fee Schedules" where(Blocked = filter(false));

            trigger OnValidate()
            var
            //  AccreditationType: Record "Accreditation Type Series";
            begin
                // AccreditationType.RESET;
                // AccreditationType.SETRANGE(Code,"Application Type");
                // IF AccreditationType.FINDFIRST THEN BEGIN
                // "Application Type Name":=AccreditationType.Description;
                //  AccFeeSchedules.RESET;
                //  AccFeeSchedules.SETRANGE(Service,AccreditationType.Code);
                //  IF AccFeeSchedules.FINDFIRST THEN BEGIN
                //    "Application Fee LCY":=AccFeeSchedules.Amount;
                //    "Application Fee":="Application Fee LCY"*1;
                //
                //    END;
                //
                // END
            end;
        }
        field(30; "Institution Type Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Institution Types";

            trigger OnValidate()
            begin
                // InstitutionTypes.Reset;
                // InstitutionTypes.SetRange(Code, "Institution Type Code");
                //  if InstitutionTypes.FindFirst then begin
                //    "Institution Type" := InstitutionTypes.Description;
            end;
            //end;
        }
        field(31; "Institution Type"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(153; contactName; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50000; test; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(50100; password; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Password';
        }
        field(50101; "KRA PIN"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Tax Compliance Certificate No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50103; "Director 1 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Director 2 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "Director 3 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50106; Group; Code[100])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Stakeholder Group".Code;
        }
        field(50107; "Sub-Group"; Code[100])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Stakeholder Sub-Group".Code where("Stakeholder Group" = field(Group));
        }
        field(50108; "Parent Contact ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(50109; "Entity Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Organization,Individual';
            OptionMembers = Organization,Individual;
        }
        field(50110; UserVerified; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50111; "ID Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50112; "Portal Request"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50113; "Applicant Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,E-Procurment,E-Recruitment,ESS';
            OptionMembers = " ","E-Procurment","E-Recruitment",ESS;
        }

        field(85000; "Course ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85001; Disabled; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85002; "NCPWD No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85003; "Kasneb Reference No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85004; "Training Institution Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85005; "Date of Birth"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(85006; Created; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85007; "Registration Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(85008; Gender; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Male,Female,Other;
        }
        field(85009; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85010; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(85011; "Assigned Registration No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85012; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(85013; "Highest Academic QCode"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85014; "Highest Academic Qualification"; Text[50])
        {
            CalcFormula = lookup(Qualification.Description);
            FieldClass = FlowField;
        }
        field(85015; "Course Description"; Text[50])
        {
            CalcFormula = lookup(Qualification.Description);
            FieldClass = FlowField;
        }
        field(85016; "Reason for Rejection"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(85017; "Assigned Customer No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(85018; "Applicant Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Work Type";
        }
        field(85019; "Exam Transaction Type"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85020; "Training Institution"; Text[50])
        {
            CalcFormula = lookup(Customer.Name);
            FieldClass = FlowField;
        }
        field(85021; Student; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = New,Existing;
        }
        field(85022; "Record Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Contact,Student,Job Applicant,Employee';
            OptionMembers = Contact,Student,"Job Applicant",Employee;
        }
        field(85023; Generated; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85024; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    RMSetup.GET;

    IF "No." = '' THEN BEGIN
      RMSetup.TESTFIELD("Contact Nos.");
      NoSeriesMgt.InitSeries(RMSetup."Contact Nos.",xRec."No. Series",0D,"No.","No. Series");
    END;

    IF NOT SkipDefaults THEN BEGIN
    #9..26

    TypeChange;
    SetLastDateTimeModified;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
      IF "Portal Request"=FALSE THEN BEGIN
      RMSetup.TESTFIELD("Contact Nos.");
      NoSeriesMgt.InitSeries(RMSetup."Contact Nos.",xRec."No. Series",0D,"No.","No. Series");
      END;

      IF "Portal Request" = TRUE THEN BEGIN
        ProcSetup.GET;
        ProcSetup.TESTFIELD(ProcSetup."Request For Registration Nos");
       NoSeriesMgt.InitSeries(ProcSetup."Request For Registration Nos",xRec."No. Series",0D,"No.","No. Series");
        END;
    #6..29
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: PortalUSer) (VariableCollection) on "CreateVendor(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: RandomDigit) (VariableCollection) on "CreateVendor(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: Procurement) (VariableCollection) on "CreateVendor(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: entryno) (VariableCollection) on "CreateVendor(PROCEDURE 7)".



    //Unsupported feature: Code Modification on "CreateVendor(PROCEDURE 7)".

    //procedure CreateVendor();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CheckForExistingRelationships(ContBusRel."Link to Table"::Vendor);
    CheckIfPrivacyBlockedGeneric;
    TESTFIELD("Company No.");
    RMSetup.GET;
    RMSetup.TESTFIELD("Bus. Rel. Code for Vendors");

    CLEAR(Vend);
    Vend.SetInsertFromContact(TRUE);
    OnBeforeVendorInsert(Vend);
    Vend.INSERT(TRUE);
    Vend.SetInsertFromContact(FALSE);

    IF Type = Type::Company THEN
      ContComp := Rec
    ELSE
      ContComp.GET("Company No.");

    ContBusRel."Contact No." := ContComp."No.";
    ContBusRel."Business Relation Code" := RMSetup."Bus. Rel. Code for Vendors";
    ContBusRel."Link to Table" := ContBusRel."Link to Table"::Vendor;
    ContBusRel."No." := Vend."No.";
    ContBusRel.INSERT(TRUE);

    OnAfterVendorInsert(Vend,Rec);

    UpdateCustVendBank.UpdateVendor(ContComp,ContBusRel);

    IF OfficeMgt.IsAvailable THEN
      PAGE.RUN(PAGE::"Vendor Card",Vend)
    ELSE
      IF NOT HideValidationDialog THEN
        MESSAGE(RelatedRecordIsCreatedMsg,Vend.TABLECAPTION);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
     CheckForExistingRelationships(ContBusRel."Link to Table"::Vendor);
     CheckIfPrivacyBlockedGeneric;
     TESTFIELD("Company No.");
     RMSetup.GET;
     RMSetup.TESTFIELD("Bus. Rel. Code for Vendors");
     ProcSetup.GET;
     CLEAR(Vend);
     Vend.SetInsertFromContact(TRUE);
     OnBeforeVendorInsert(Vend);
     //added by daudi
     Vend."Gen. Bus. Posting Group":=ProcSetup."Default General Product PG";
     Vend."Vendor Posting Group":=ProcSetup."Default Vendor PG";
     Vend.INSERT(TRUE);
     Vend.SetInsertFromContact(FALSE);

     IF Type = Type::Company THEN
      ContComp := Rec
     ELSE
      ContComp.GET("Company No.");

     ContBusRel."Contact No." := ContComp."No.";
     ContBusRel."Business Relation Code" := RMSetup."Bus. Rel. Code for Vendors";
     ContBusRel."Link to Table" := ContBusRel."Link to Table"::Vendor;
     ContBusRel."No." := Vend."No.";
     ContBusRel.INSERT(TRUE);

     OnAfterVendorInsert(Vend,Rec);

     UpdateCustVendBank.UpdateVendor(ContComp,ContBusRel);
    // Update Dynasoft Portal user
    PortalUSer.RESET;
    IF PortalUSer.FINDLAST THEN
      entryno:=PortalUSer."Entry No";
    PortalUSer.RESET;
    PortalUSer.SETRANGE("User Name","E-Mail");
    IF NOT PortalUSer.FINDSET THEN BEGIN
      PortalUSer.INIT;
      PortalUSer."Entry No":=entryno+1;
      PortalUSer."User Name":="E-Mail";
      PortalUSer."Full Name":=Name;
      PortalUSer."Authentication Email":="E-Mail";
      PortalUSer."Mobile Phone No.":="Phone No.";
      PortalUSer.State:=PortalUSer.State::Enabled;
      PortalUSer."Record Type":=PortalUSer."Record Type"::Vendor;
      PortalUSer."Record ID":=Vend."No.";

    RandomDigit := CREATEGUID;
    RandomDigit := DELCHR(RandomDigit,'=','{}-01');
    RandomDigit := COPYSTR(RandomDigit,1,8);
    //MESSAGE(RandomDigit);
      PortalUSer."Password Value":=RandomDigit;
      PortalUSer.INSERT;
     Procurement.FnSendEmaiNotificationOnSupplierAccountActivation(Rec);
      END;




     IF OfficeMgt.IsAvailable THEN
      PAGE.RUN(PAGE::"Vendor Card",Vend)
     ELSE
      IF NOT HideValidationDialog THEN
        MESSAGE(RelatedRecordIsCreatedMsg,Vend.TABLECAPTION);
    */
    //end;

    var
    // ProcSetup: Record "Procurement Setup";
    //   InstitutionTypes: Record "Institution Types";
}

