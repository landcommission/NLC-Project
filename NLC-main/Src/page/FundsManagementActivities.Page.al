#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193965 "Funds Management Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Funds Management Cue";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            cuegroup("Pending Payment Documents")
            {
                Caption = 'Pending Payment Documents';
                field("Interbank Not Posted"; Rec."Interbank Not Posted")
                {
                    ApplicationArea = Basic;
                    Caption = 'Interbank Transfers';
                    ToolTip = 'Specifies the value of the Interbank Transfers field.';
                }
                field("PV Not Posted"; Rec."PV Not Posted")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payment Vouchers';
                    ToolTip = 'Specifies the value of the Payment Vouchers field.';
                }
                field("PCV Not Posted"; Rec."PCV Not Posted")
                {
                    ApplicationArea = Basic;
                    Caption = 'Petty Cash Vouchers';
                    ToolTip = 'Specifies the value of the Petty Cash Vouchers field.';
                }
                field("Store Req. Not Posted"; Rec."Store Req. Not Posted")
                {
                    ApplicationArea = Basic;
                    Caption = 'Store Requisitions';
                    ToolTip = 'Specifies the value of the Store Requisitions field.';
                }

                actions
                {
                    action("Bank & Cash Transfer")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Bank & Cash Transfer';
                        RunObject = page "Bank & Cash Transfer Request";
                        ToolTip = 'Executes the Bank & Cash Transfer action.';
                    }
                    action(Receipt)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Receipt';
                        RunObject = page "Receipts List";
                        RunPageView = where(Posted = const(false));
                        ToolTip = 'Executes the Receipt action.';
                    }
                    action("Payment Voucher ")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Payment Vouchers';
                        Image = CreateReminders;
                        RunObject = page "Payment Vouchers List";
                        ToolTip = 'Executes the Payment Vouchers action.';
                    }
                    action("Petty Cash Vouchers")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Cash Payment Header";
                        ToolTip = 'Executes the Petty Cash Vouchers action.';
                    }
                }
            }
            cuegroup("Pending Imprest Documents")
            {
                Caption = 'Pending Imprest Documents';
                field("Staff Travel Not Posted"; Rec."Staff Travel Not Posted")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Requistion';
                    ToolTip = 'Specifies the value of the Imprest Requistion field.';
                }
                field("Staff TA Not Posted"; Rec."Staff TA Not Posted")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Surrender';
                    ToolTip = 'Specifies the value of the Imprest Surrender field.';
                }
                field("Other Advance Not Posted"; Rec."Other Advance Not Posted")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Advance';
                    ToolTip = 'Specifies the value of the Staff Advance field.';
                }
                field("Staff Claim Not Posted"; Rec."Staff Claim Not Posted")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Claim';
                    ToolTip = 'Specifies the value of the Staff Claim field.';
                }

                actions
                {
                    action("<Page Imprest requisition>")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Imprest requisition';
                        RunObject = page "Imprest Request";
                        ToolTip = 'Executes the Imprest requisition action.';
                    }
                    action("<page Imprest surrender>")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Imprest surrender';
                        RunObject = page "Imprest Surrender";
                        ToolTip = 'Executes the Imprest surrender action.';
                    }
                    action("Staff Claims")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Staff Claims';
                        RunObject = page "Staff Claims";
                        ToolTip = 'Executes the Staff Claims action.';
                    }
                    action("Staff Advance requisition")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Staff Advance requisition';
                        RunObject = page "Staff Advance Request";
                        ToolTip = 'Executes the Staff Advance requisition action.';
                    }
                    action("<Page Staff Advance surrender>")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Staff Advances surrender';
                        RunObject = page "Staff Advance Surrender";
                        ToolTip = 'Executes the Staff Advances surrender action.';
                    }
                }
            }
            cuegroup("Document Approval")
            {
                Caption = 'Document Approval';
                field("Interbank Pending Approval"; Rec."Interbank Pending Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Interbank Transfers';
                    ToolTip = 'Specifies the value of the Interbank Transfers field.';
                }
                field("PV Pending Approval"; Rec."PV Pending Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payment Vouchers';
                    ToolTip = 'Specifies the value of the Payment Vouchers field.';
                }
                field("PCV Pending Approval"; Rec."PCV Pending Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Petty Cash Vouchers';
                    ToolTip = 'Specifies the value of the Petty Cash Vouchers field.';
                }
                field("Staff Travel Pending Approval"; Rec."Staff Travel Pending Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest requisition';
                    ToolTip = 'Specifies the value of the Imprest requisition field.';
                }
                field("Staff TA Pending Approval"; Rec."Staff TA Pending Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest surrender';
                    ToolTip = 'Specifies the value of the Imprest surrender field.';
                }
                field("Approval Entries"; Rec."Approval Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Entries';
                    DrillDownPageId = "Approval Entries";
                    LookupPageId = "Approval Entries";
                    ToolTip = 'Specifies the value of the Approval Entries field.';
                }
            }
            cuegroup(Control30)
            {
                field("Other Advance Pending Approval"; Rec."Other Advance Pending Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Advance';
                    ToolTip = 'Specifies the value of the Staff Advance field.';
                }
                field("Staff Claim Pending Approval"; Rec."Staff Claim Pending Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Claims';
                    ToolTip = 'Specifies the value of the Staff Claims field.';
                }
                field("Requisitions Pending Approval"; Rec."Requisitions Pending Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisitions';
                    ToolTip = 'Specifies the value of the Purchase Requisitions field.';
                }
                field("Store Req. Pending Approval"; Rec."Store Req. Pending Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Store Requisitions';
                    ToolTip = 'Specifies the value of the Store Requisitions field.';
                }
            }
        }
    }

    actions { }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;

        Rec.SetFilter(Rec."Due Date Filter", '<=%1', WorkDate());
        Rec.SetFilter(Rec."Overdue Date Filter", '<%1', WorkDate());
    end;
}
