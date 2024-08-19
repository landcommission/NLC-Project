#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194079 "HR Employee Exit Interviews"
{
    ApplicationArea = Basic;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Exit Interview,Exit Comments';
    SourceTable = "HR Employee Exit Interviews";
    UsageCategory = Lists;
    Caption = 'HR Employee Exit Interviews';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Exit Interview No"; Rec."Exit Interview No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exit Interview No field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Date Of Interview"; Rec."Date Of Interview")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Interview field.';
                }
                field("Interview Done By"; Rec."Interview Done By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Done By field.';
                }
                field("Interviewer Name"; Rec."Interviewer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Interviewer Name field.';
                }

                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Responsibility centre"; Rec."Responsibility centre")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsibility centre field.';
                }
                field("Reason For Leaving"; Rec."Reason For Leaving")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason For Leaving field.';
                }
                field("Reason For Leaving (Other)"; Rec."Reason For Leaving (Other)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Reason For Leaving (Other) field.';
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Leaving field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Other Comments"; Rec."Other Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Other Comments field.';
                }
                field("No Series"; Rec."No Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No Series field.';
                }
                field("Re Employ In Future"; Rec."Re Employ In Future")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Re Employ In Future field.';
                }
                field("Form Submitted"; Rec."Form Submitted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Form Submitted field.';
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Seperation No"; "Seperation No")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
            part(SF; "Misc. Articles")
            {
                Caption = 'Misc Articles';
                SubPageLink = Code = field("Employee No.");
                Visible = false;
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755008; Outlook) { }
            systempart(Control1102755010; Notes) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Exit Interview")
            {
                Caption = '&Exit Interview';
                action("Submit Exit Interview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Submit Exit Interview';
                    Image = CheckList;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Submit Eit Interview action.';
                    trigger OnAction()
                    begin
                        if Rec."Form Submitted" = true then
                            Error('The Exit%1has already been submitted', Rec."Exit Interview No");


                        if Confirm('Are you sure you want to close this Exit Interview and Deactivated the Staff?', true) then begin
                            Rec."Form Submitted" := true;
                            Rec.Modify();
                            Rec.Validate("Form Submitted");
                            Message('The Exit Inteview%1for%2 has been submitted', Rec."Exit Interview No", Rec."Employee Name");
                        end;
                    end;
                }
                action("Exit Comments")
                {
                    ApplicationArea = Basic, Suite;
                    Image = ViewComments;
                    Caption = 'Comments';
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Hr Appraisal Comments";
                    RunPageLink = "Sal No." = field("Seperation No");
                }
            }
        }
    }


    var
        JobTitle: Text[30];
        Supervisor: Text[60];
        HREmp: Record "HR Employees";
        Dates: Codeunit "HR Dates";
        DAge: Text[100];
        DService: Text[100];
        DPension: Text[100];
        DMedical: Text[100];
        HREmpForm: Page "HR Employee Card";
        sUserID: Code[30];
        DoclLink: Record "HR Company Attachments";
        InteractTemplLanguage: Record "Interaction Tmpl. Language";
        D: Date;
        Misc: Record "Misc. Article Information";
        Text19062217: Label 'Misc Articles';
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
    //ApprovalMgt: Codeunit "Export F/O Consolidation";


    procedure RecalcDates()
    begin
        //Recalculate Important Dates
        if (HREmp."Date Of Leaving" = 0D) then begin
            if (HREmp."Date Of Birth" <> 0D) then
                DAge := Dates.DetermineAge(HREmp."Date Of Birth", Today);
            if (HREmp."Date Of Joining the Company" <> 0D) then
                DService := Dates.DetermineAge(HREmp."Date Of Joining the Company", Today);
            if (HREmp."Pension Scheme Join Date" <> 0D) then
                DPension := Dates.DetermineAge(HREmp."Pension Scheme Join Date", Today);
            if (HREmp."Medical Scheme Join Date" <> 0D) then
                DMedical := Dates.DetermineAge(HREmp."Medical Scheme Join Date", Today);
            //MODIFY;
        end else begin
            if (HREmp."Date Of Birth" <> 0D) then
                DAge := Dates.DetermineAge(HREmp."Date Of Birth", HREmp."Date Of Leaving");
            if (HREmp."Date Of Joining the Company" <> 0D) then
                DService := Dates.DetermineAge(HREmp."Date Of Joining the Company", HREmp."Date Of Leaving");
            if (HREmp."Pension Scheme Join Date" <> 0D) then
                DPension := Dates.DetermineAge(HREmp."Pension Scheme Join Date", HREmp."Date Of Leaving");
            if (HREmp."Medical Scheme Join Date" <> 0D) then
                DMedical := Dates.DetermineAge(HREmp."Medical Scheme Join Date", HREmp."Date Of Leaving");
            //MODIFY;
        end;
    end;

    local procedure EmployeeNoOnAfterValidate()
    begin
        CurrPage.SaveRecord();
        Rec.FilterGroup := 2;
        //Misc.SETRANGE(Misc."Employee No.",Dependants);
        Rec.FilterGroup := 0;
        if Misc.Find('-') then;
        CurrPage.Update(false);
    end;

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        ControlPage();

    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        ControlPage();

    end;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        ControlPage();

    end;

    local procedure ControlPage()
    var
        myInt: Integer;
    begin
        if rec."Form Submitted" = true then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;

    end;
}
