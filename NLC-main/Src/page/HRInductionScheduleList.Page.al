#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194132 "HR Induction Schedule List"
{
    CardPageId = "HR Induction Schedule Card";
    Editable = false;
    PageType = List;
    SourceTable = "HR Induction Schedule";
    ApplicationArea = All;
    Caption = 'HR Induction Schedule List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Induction Code"; Rec."Induction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Induction Code field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Selected field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Induction Period"; Rec."Induction Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Induction Period field.';
                }
                field("Induction Start date"; Rec."Induction Start date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Induction Start date field.';
                }
                field("Induction End  date"; Rec."Induction End  date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Induction End  date field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
            }
        }
    }

    actions { }

    var
        "Induction`": Record "HR Induction Schedule";
        DepartmentName: Text[40];
        sDate: Date;
        Inductionschedule: Record "HR Induction Schedule";
        Number: Integer;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Budget Transfer","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Induction Approval";
        ApprovalEntries: Page "Approval Entries";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        HRJobs: Record "HR Jobs";
        Department: Record "Dimension Value";


    procedure TESTFIELDS()
    begin

        Inductionschedule.TestField(Inductionschedule."Department Code");
        Inductionschedule.TestField(Inductionschedule."Induction Start date");
        Inductionschedule.TestField(Inductionschedule."Induction End  date");
        Inductionschedule.TestField(Inductionschedule."Induction Period");
        //Inductionschedule.TESTFIELD(HRTrainingApplications.Duration);
        //Inductionschedule.TESTFIELD(HRTrainingApplications."Cost Of Training");
        //Inductionschedule.TESTFIELD(HRTrainingApplications.Location);
        //Inductionschedule.TESTFIELD(HRTrainingApplications.Provider);
        //Inductionschedule.TESTFIELD(Inductionschedule.Comments");
    end;


    procedure FillVariables()
    begin
        //GET THE APPLICANT DETAILS

        Department.Reset();
        if Department.Get(Rec."Department Code") then
            Rec."Department Name" := Department.Name;
        //Department:=HREmp."Global Dimension 2";
        //"Job Title":=HREmp."Job Description";
        //END ELSE BEGIN
        //Department:='';

        //GET THE JOB DESCRIPTION FRON THE HR JOBS TABLE AND PASS IT TO THE VARIABLE
        /*HRJobs.RESET;
        IF HRJobs.GET("Job Title") THEN
        BEGIN
        "Job Title":=HRJobs."Job Description";
        END ELSE BEGIN
        "Job Title":='';
        END;
        */
        //GET THE APPROVER NAMES
        /*HREmp.RESET;
        HREmp.SETRANGE(HREmp."User ID",Supervisor);
        IF HREmp.FIND('-') THEN
        BEGIN
        "Supervisor Name":=HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
        END ELSE BEGIN
        "Supervisor Name":='';
        END;
        */

    end;


    procedure UpdateControls()
    begin

        /* IF Status=Status::New THEN BEGIN
         CurrForm."Application No".EDITABLE:=TRUE;
         CurrForm."User ID".EDITABLE:=TRUE;
         CurrForm."Staff Names".EDITABLE:=TRUE;
         CurrForm."Job Title".EDITABLE:=TRUE;
         CurrForm.Supervisor.EDITABLE:=TRUE;
         CurrForm."Supervisor Name".EDITABLE:=TRUE;
         CurrForm."Course Title".EDITABLE:=TRUE;
         CurrForm."Purpose of Training".EDITABLE:=TRUE;
         CurrForm.Status.EDITABLE:=TRUE;
         CurrForm."Employee No.".EDITABLE:=TRUE;
         CurrForm.Selected.EDITABLE:=TRUE;
         CurrForm.Recommendations.EDITABLE:=TRUE;
         CurrForm.Status.EDITABLE:=TRUE;
         CurrForm."Responsibility Center".EDITABLE:=TRUE;
         END ELSE BEGIN
         CurrForm."Application No".EDITABLE:=FALSE;
         CurrForm."User ID".EDITABLE:=FALSE;
         CurrForm."Staff Names".EDITABLE:=FALSE;
         CurrForm."Job Title".EDITABLE:=FALSE;
         CurrForm.Supervisor.EDITABLE:=FALSE;
         CurrForm."Supervisor Name".EDITABLE:=FALSE;
         CurrForm."Course Title".EDITABLE:=FALSE;
         CurrForm."Purpose of Training".EDITABLE:=FALSE;
         CurrForm.Status.EDITABLE:=FALSE;
         CurrForm."Employee No.".EDITABLE:=FALSE;
         CurrForm.Selected.EDITABLE:=FALSE;
         CurrForm.Recommendations.EDITABLE:=FALSE;
         CurrForm.Status.EDITABLE:=FALSE;
         CurrForm."Responsibility Center".EDITABLE:=FALSE;
         END;
         */

    end;


    procedure GetTrainingTypes("Course Title": Text[50])
    begin
    end;
}
