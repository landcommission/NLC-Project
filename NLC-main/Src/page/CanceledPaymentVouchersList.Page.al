#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193950 "Canceled Payment Vouchers List"
{
    CardPageId = "Canceled Payment Header";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Payments Header";
    SourceTableView = where("Payment Type" = filter(<> "Petty Cash"),
                            Posted = const(false),
                            Status = filter(Cancelled));
    ApplicationArea = All;
    Caption = 'Canceled Payment Vouchers List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Type field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total VAT Amount field.';
                }
                field("Total Witholding Tax Amount"; Rec."Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Witholding Tax Amount field.';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Net Amount field.';
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cheque No. field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755014; Notes) { }
            systempart(Control1102755015; MyNotes) { }
            systempart(Control1102755016; Outlook) { }
            systempart(Control1102755017; Links) { }
        }
    }

    actions
    {
        area(Processing)
        {
            group("<Action1102755006>")
            {
                Caption = '&Functions';
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print/Preview';
                    Image = ConfirmAndPrint;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Print/Preview action.';
                    trigger OnAction()
                    begin
                        // IF Status<>Status::Approved THEN
                        //   ERROR('You can only print a Payment Voucher after it is fully Approved');



                        //IF Status=Status::Pending THEN
                        //ERROR('You cannot Print until the document is released for approval');
                        Rec.Reset();
                        Rec.SetFilter(Rec."No.", Rec."No.");
                        Report.Run(39005884, true, true, Rec);
                        Rec.Reset();

                        CurrPage.Update();
                        CurrPage.SaveRecord();
                    end;
                }
                action("Vendor Payment Advise")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor Payment Advise';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    ToolTip = 'Executes the Vendor Payment Advise action.';
                    trigger OnAction()
                    begin
                        if Rec.Status = Rec.Status::Pending then
                            Error('You cannot Print until the document is released for approval');
                        Rec.Reset();
                        Rec.SetFilter(Rec."No.", Rec."No.");
                        Report.Run(50289, true, true, Rec);
                        Rec.Reset();
                    end;
                }
                action("Cheque Confirmation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cheque Confirmation';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    ToolTip = 'Executes the Cheque Confirmation action.';
                }
                separator(Action1102755019) { }
                action("<Action1102756006>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Document';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Cancel Document action.';

                }
            }
        }
    }

    var
        Text001: Label 'This Document no %1 has printed Cheque No %2 which will have to be voided first before reposting.';
        Text000: Label 'Do you want to Void Check No %1';
        Text002: Label 'You have selected post and generate a computer cheque ensure that your cheque printer is ready do you want to continue?';
}
