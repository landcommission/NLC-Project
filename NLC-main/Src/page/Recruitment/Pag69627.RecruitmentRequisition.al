#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69627 "Recruitment Requisition"
{
    PageType = Card;
    SourceTable = "Recruitment Requisition Header";
    SourceTableView = where("Document Type" = filter("Recruitment Requisition"));
    PromotedActionCategories = 'New,Process,Report,Approval,Document';
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Target Candidate Source"; Rec."Target Candidate Source")
                {
                    ApplicationArea = Basic;
                }
                field("Requester Staff No"; Rec."Requester Staff No")
                {
                    ApplicationArea = Basic;
                }
                field("Requester Name"; Rec."Requester Name")
                {
                    ApplicationArea = Basic;
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Plan Type"; Rec."Recruitment Plan Type")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Plan ID"; Rec."Recruitment Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                }

                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Job Purpose"; Rec."Job Purpose")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Purpose field.';
                }
                field("No of Openings"; Rec."No of Openings")
                {
                    ApplicationArea = Basic;
                }
                field("Duty Station ID"; Rec."Duty Station ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Duty Station ID field.';
                }

                field("Primary Recruitment Reason"; Rec."Primary Recruitment Reason")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Justification"; Rec."Recruitment Justification")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Sourcing Method"; Rec."Sourcing Method")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
            }
            group("Recruitment Timelines")
            {
                field("Recruitment Cycle Type"; Rec."Recruitment Cycle Type")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Lead Time"; Rec."Recruitment Lead Time")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Recruitment Start Date"; Rec."Planned Recruitment Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Recruitment End Date"; Rec."Planned Recruitment End Date")
                {
                    ApplicationArea = Basic;
                }
                // field("Planned Employment Start Date"; Rec."Planned Employment Start Date")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Planned Employment End Date"; Rec."Planned Employment End Date")
                // {
                //     ApplicationArea = Basic;
                // }
            }
            group("Recruitment Budget")
            {
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Finacial Year Code"; Rec."Finacial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Line Budget Cost"; Rec."Recruitment Line Budget Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Average Cost/Hire"; Rec."Average Cost/Hire")
                {
                    ApplicationArea = Basic;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Vacancy Details")
            {
                field("Staff Establishment"; Rec."Staff Establishment")
                {
                    ApplicationArea = Basic;
                }
                field("Current Headcount"; Rec."Current Headcount")
                {
                    ApplicationArea = Basic;
                }
                field("Hierarchically Reports To"; Rec."Hierarchically Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Functionally  Reports To"; Rec."Functionally  Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Estimate Gross Salary"; Rec."Estimate Gross Salary")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Estimate Gross Salary field.';
                }
                field("Job Grade ID"; Rec."Job Grade ID")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Appointment Authority"; Rec."Overall Appointment Authority")
                {
                    ApplicationArea = Basic;
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Default Terms of Service Code"; Rec."Default Terms of Service Code")
                {
                    ApplicationArea = Basic;
                }

            }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Academic Requirements")
            {
                ApplicationArea = Basic;
                Image = Register;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Requisition Requirements";
                RunPageLink = "Document No." = field("Document No."), "Qualification Category" = filter(Academic);
            }
            action("Professional Requirements")
            {
                ApplicationArea = Basic;
                Image = Register;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Requisition Requirements";
                RunPageLink = "Document No." = field("Document No."), "Qualification Category" = filter(Professional);
            }
            action("Skills & Competencies")
            {
                ApplicationArea = Basic;
                Image = Register;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Requisition Requirements";
                RunPageLink = "Document No." = field("Document No."), "Qualification Category" = filter("Skills & Competencies");
            }
            action("Experience")
            {
                ApplicationArea = Basic;
                Image = Register;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Requisition Requirements";
                RunPageLink = "Document No." = field("Document No."), "Qualification Category" = filter(Experience);
            }
            action("Ethics & Integrity")
            {
                ApplicationArea = Basic;
                Image = Register;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Requisition Requirements";
                RunPageLink = "Document No." = field("Document No."), "Qualification Category" = filter("Ethics & Integrity");
            }
            action("Physical Attributes")
            {
                ApplicationArea = Basic;
                Image = Register;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Requisition Requirements";
                RunPageLink = "Document No." = field("Document No."), "Qualification Category" = filter("Physical Attributes");
            }
            action("Requirements Substitutes")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Requisition Substitutes";
                RunPageLink = "Document No." = field("Document No.");
            }
            action("Duties and Responsibilities")
            {
                ApplicationArea = Basic;
                Image = ReceiveLoaner;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Requisition Responsibilities";
                RunPageLink = "Document No." = field("Document No."), Type = filter(Responsibility);
            }
            action("Job Dimensions")
            {
                ApplicationArea = Basic;
                Image = ReceiveLoaner;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Requisition Responsibilities";
                RunPageLink = "Document No." = field("Document No."), Type = filter("Job Dimensions");
            }
            action("Work Condition")
            {
                ApplicationArea = Basic;
                Image = WorkCenter;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Recruitment Work Condition";
                RunPageLink = "Document No" = field("Document No.");
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = true;
                ShortCutKey = 'Shift+Ctrl+D';

                trigger OnAction()
                begin
                    CurrPage.SaveRecord;
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalsMgt: Codeunit "Approvals Mgmt.";
                begin

                    ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                    VarVariant: Variant;
                // CustomApprovals: Codeunit "Custom Approvals Codeunit";

                //  ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin
                    VarVariant := Rec;
                    //  if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                    //      ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                //   CustomApprovals: Codeunit "Custom Approvals Codeunit";
                //   ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin
                    VarVariant := Rec;
                    //     CustomApprovals.OnCancelDocApprovalRequest(VarVariant);

                end;
            }
            action("Create Vacancy")
            {
                ApplicationArea = Basic;
                Image = PostDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //create the vacancy based on vacancies available
                    Rec.TestField("No of Openings");
                    Rec.TestField("Vacancy Created", false);
                    Rec.TestField("Approval Status", Rec."approval status"::Released);
                    Rec.SetRange("Document No.", Rec."Document No.");
                    // Recruitment.TransferRequisitionToVacancy(Rec);
                end;
            }
            action("Suggest Position Requirements")
            {
                ApplicationArea = Basic;
                Image = SuggestPayment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //  Recruitment.CopyPositionDetails(Rec);
                end;
            }
            action("Position Benefits")
            {
                ApplicationArea = Basic;
                Image = BankAccountLedger;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                //  RunObject = Page "Recruitment Salary Benefits";
                //  RunPageLink = "Document No" = field("Document No.");
            }
        }
    }

    var
    //  Recruitment: Codeunit Recruitment;
}

#pragma implicitwith restore

