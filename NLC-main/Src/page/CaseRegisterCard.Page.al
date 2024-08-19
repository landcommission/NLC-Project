#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 56098 "Case Register Card"
{
    PageType = Card;
    SourceTable = "Case Register";
    ApplicationArea = All;
    Caption = 'Case Register Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Number field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Nature of Case"; Rec."Nature of Case")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nature of Case field.';
                }
                field("Case Types"; Rec."Case Types")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Types field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Nature of Claim"; Rec."Nature of Claim")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    Style = Favorable;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Nature of Claim field.';
                }
                field(Progress; Rec.Progress)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Progress field.';
                }
                field("Court House"; Rec."Court House")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Court House field.';
                }
                field("Last Hearing Date"; Rec."Last Hearing Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Last Hearing Date field.';
                }
                field("Next Hearing Date"; Rec."Next Hearing Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Next Hearing Date field.';
                }
                field(Judge; Rec.Judge)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Judge field.';
                }
                field("Judge Name"; Rec."Judge Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Judge Name field.';
                }
                field("Advocate on Record"; Rec."Advocate on Record")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Advocate on Record field.';
                }
                field("Advocate name"; Rec."Advocate name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advocate Name';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Advocate Name field.';
                }
                field("Advocate Firm"; Rec."Advocate Firm")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Advocate Firm field.';
                }
                field(Verdict; Rec.Verdict)
                {
                    ApplicationArea = Basic;
                    Caption = 'Verdict Status';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Verdict Status field.';
                }
                field("Last Mention Date"; Rec."Last Mention Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Mention Date field.';
                }
                field("Next Mention Date"; Rec."Next Mention Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Mention Date field.';
                }
                field("No of Attachments"; Rec."No of Attachments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Attachments field.';
                }
            }
            part(Control35; "Case Hearings")
            {
                SubPageLink = "Case Entry" = field("No."),
                              "Entry Type" = const(Hearing);
                ApplicationArea = Basic;
            }
            part(Control59; "Case Mentions")
            {
                SubPageLink = "Case Entry" = field("No."),
                              "Entry Type" = const(Mention);
                ApplicationArea = Basic;
            }
            group("Judgement Details")
            {
                Caption = 'Judgement Details';
                field("Judgement Date"; Rec."Verdict Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Verdict Date field.';
                }
                field("Judgement Summary"; Rec."Verdict Summary")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Verdict Summary field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control9; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("Feasibility Study")
            {
                Caption = 'Feasibility Study';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';

                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';

                }
            }
        }
        area(Processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = false;
                    ToolTip = 'Executes the Send A&pproval Request action.';

                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = false;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                }
                separator(Action28) { }
                action(Plaintiffs)
                {
                    ApplicationArea = Basic;
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = page "Case Plantiffs";
                    RunPageLink = "Case No" = field("No."),
                                  Type = const(Plaintiff);
                    ToolTip = 'Executes the Plaintiffs action.';
                }
                action(Defendants)
                {
                    ApplicationArea = Basic;
                    Image = Account;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = page "Case Defandants";
                    RunPageLink = "Case No" = field("No."),
                                  Type = const(Defendant);
                    ToolTip = 'Executes the Defendants action.';
                }
                action("Defendant Witnesses")
                {
                    ApplicationArea = Basic;
                    Image = ZoneCode;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = page "Case Witnesses";
                    RunPageLink = "Case No" = field("No."),
                                  Type = const(Defendant);
                    ToolTip = 'Executes the Defendant Witnesses action.';
                }
                action("Plaintiff Witnesses")
                {
                    ApplicationArea = Basic;
                    Image = XMLFile;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = page "Case Witnesses";
                    RunPageLink = "Case No" = field("No."),
                                  Type = const(Plantif);
                    ToolTip = 'Executes the Plaintiff Witnesses action.';
                }
                action("Advocates Defendant, Plaintiff")
                {
                    ApplicationArea = Basic;
                    Image = "Action";
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = page "Advocate on record list";
                    RunPageLink = no = field("No.");
                    ToolTip = 'Executes the Advocates Defendant, Plaintiff action.';
                }
                action("Advocate on record for Plaintiff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Advocate on record for Plaintiff action.';
                }
                action(Judges)
                {
                    ApplicationArea = Basic;
                    Image = Add;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = page "Case Judges";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the Judges action.';
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);

                        CaseRegister.Reset();
                        CaseRegister.SetRange("No.", Rec."No.");
                        if CaseRegister.FindSet() then
                            Report.Run(56092, true, false, CaseRegister)
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortcutKey = 'Ctrl+F9';
                    ToolTip = 'Executes the Re&lease action.';

                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';

                }
                separator(Action22) { }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortcutKey = 'F9';
                    Visible = false;
                    ToolTip = 'Executes the P&ost action.';

                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(MoveToOngoing)
                {
                    ApplicationArea = Suite;
                    Caption = 'Move To Ongoing';
                    Image = Migration;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
                        if Dialog.Confirm('Are you sure you want to move case to ongoing?', true) then begin
                            Rec.Status := Rec.Status::Ongoing;
                            Rec.Modify();
                            CurrPage.Close();
                        end;
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = false;

                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = false;

                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';

                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';

                }
                action(DocAttach0)
                {
                    ApplicationArea = All;
                    Caption = 'HR Documents';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = page "Document Attachment Details";
                    //RunPageLink = "No." = field("No."),
                    //           "Document Type" = filter("HR Case");
                    //RunPageView = where("Document Type" = filter("HR Case"));
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                    Visible = false;

                }
                action("Appeal Case")
                {
                    ApplicationArea = Basic;
                    Image = Aging;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Appeal Case action.';
                    // trigger OnAction()
                    // var
                    //     TXT001: label 'Create an appeal for the case %1';
                    // begin
                    //     if Confirm(TXT001, true, Rec."Case Desscription/Transpired") = true then
                    //         CaseManagment.CreateAppeal(Rec);
                    // end;
                }
                action(DocAttach1)
                {
                    ApplicationArea = All;
                    Caption = 'Court Documents';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = page "Document Attachment Details";
                    // RunPageLink = "No." = field("No."),
                    //          "Document Type" = filter("Court Hearings");
                    //  RunPageView = where("Document Type" = filter("Court Hearings"));
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                }
                action(DocAttach2)
                {
                    ApplicationArea = All;
                    Caption = 'Plaintiff Documents';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = page "Document Attachment Details";
                    //RunPageLink = "No." = field("No."),
                    //             "Document Type" = filter(Plaintiffs);
                    //  RunPageView = where("Document Type" = filter(Plaintiffs));
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                }
                action(DocAttach3)
                {
                    ApplicationArea = All;
                    Caption = 'Defendants Documents';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = page "Document Attachment Details";
                    //   RunPageLink = "No." = field("No."),"Document Type" = filter(Defendants);
                    //  RunPageView = where("Document Type" = filter(Defendants));
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                }
                action(DocAttach4)
                {
                    ApplicationArea = All;
                    Caption = 'Judgement Documents';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = page "Document Attachment Details";
                    //RunPageLink = "No." = field("No."),
                    //   "Document Type" = filter(Defendants);
                    //  RunPageView = where("Document Type" = filter(Defendants));
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                }
                separator(Action45) { }
                action(Close)
                {
                    ApplicationArea = Basic;
                    Image = Close;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Close action.';
                    trigger OnAction()
                    begin
                        Rec.TestField("Verdict Summary");
                        Rec.Status := Rec.Status::Closed;
                        Rec.Modify();
                        Message('Case Closed Successfully');
                    end;
                }
                action(CaseMentioning)
                {
                    ApplicationArea = Basic;
                    Caption = 'Case Hearing Reminder';
                    Image = "Action";
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = true;
                    ToolTip = 'Executes the Case Hearing Reminder action.';
                    trigger OnAction()
                    begin
                        if Rec."Next Hearing Date" = Today then
                            InsuranceNotifications.CaseOpeningNotifications(Rec);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::External;
    end;

    var
        ConfirmVerdict: Page "Confirm Verdict";
        CaseRegister: Record "Case Register";
        //CaseManagment: Codeunit CuePortal;
        InsuranceNotifications: Codeunit "Insurance Notifications";
}

#pragma implicitwith restore

