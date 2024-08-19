#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194059 "HR Exit Training Bonding Line"
{
    PageType = ListPart;
    PromotedActionCategories = 'New,Process,Reports,Exit Interview';
    SourceTable = "HR Exit Training Bonding";
    ApplicationArea = All;
    Caption = 'HR Exit Training Bonding Line';
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Training Application Code"; Rec."Training Application Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Application Code field.';
                }
                field("Training Description"; Rec."Training Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Description field.';
                }
                field("Bondage Start Date"; Rec."Bondage Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bondage Start Date field.';
                }
                field("Bonding Duration"; Rec."Bonding Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bonding Duration field.';
                }
                field("Bondage Release Date"; Rec."Bondage Release Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bondage Release Date field.';
                }
                field("Cleared for Early Release?"; Rec."Cleared for Early Release?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cleared for Early Release? field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Training Bonding Conditions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Bonding Conditions';
                    Image = BOM;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = page "HR Training Bonding Cond. List";
                    RunPageLink = "Training Bonding Code" = field("Training Application Code");
                    ToolTip = 'Executes the Training Bonding Conditions action.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        if HREmp.Get(Rec."Employee No.") then begin
            JobTitle := HREmp."Job Title";
            sUserID := HREmp."User ID";
        end else begin
            JobTitle := '';
            sUserID := '';
        end;


        Rec.SetRange(Rec."Employee No.");
        DAge := '';
        DService := '';
        DPension := '';
        DMedical := '';

        RecalcDates();
    end;

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
        HRDatess: Codeunit "HR Leave Jnl.- Check Line";


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
        Misc.SetRange(Misc."Employee No.", Rec."Employee No.");
        Rec.FilterGroup := 0;
        if Misc.Find('-') then;
        CurrPage.Update(false);
    end;
}
