#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193798 "Posted Investment Card"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Investment Header";
    SourceTableView = where("Investment Rollover Status" = filter(Closed));
    ApplicationArea = All;
    Caption = 'Posted Investment Card';
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
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Investment Start Date"; Rec."Investment Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Start Date field.';
                }
                field("Investment End Date"; Rec."Investment End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment End Date field.';
                }
                field("Investment Duration"; Rec."Investment Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Duration field.';
                }
                field("Investment Firm Code"; Rec."Investment Firm Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Company Code field.';
                }
                field("Investment Firm Name"; Rec."Investment Firm Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Company Code field.';
                }
                field("Investment Type"; Rec."Investment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Type field.';
                }
                field("Paying Document No."; Rec."Paying Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paying Document No. field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        PaymentHeader: Record "Payments Header" temporary;
                        PaymentLines: Record "Payment Line";
                    begin

                        PaymentLines.Reset();
                        PaymentLines.SetRange(PaymentLines.Type, 'INVESTMENT');
                        if PaymentLines.Find('-') then begin
                            //Popultate payment table with investment pvs
                            PaymentHeader.Reset();
                            PaymentHeader.DeleteAll();

                            repeat
                                Payments.Get(PaymentLines.No);
                                PaymentHeader.SetRange(PaymentHeader."No.", PaymentLines.No);
                                if not PaymentHeader.Find('-') then begin
                                    PaymentHeader.TransferFields(Payments);
                                    PaymentHeader.Insert();
                                end;


                            until PaymentLines.Next() = 0;
                            //PAGE.RUN(PAGE::"Payment Vouchers List",PaymentHeader);
                        end;
                        Page.Run(Page::"Payment Vouchers List", PaymentHeader);
                    end;
                }
                field("Investment Principal"; Rec."Investment Principal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Principal field.';
                }
                field("Investment Rate"; Rec."Investment Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Rate field.';
                }
                field("Expected Interest"; Rec."Expected Interest")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Expected Interest field.';
                }
                field("Interest Earned"; Rec."Interest Earned")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Earned field.';
                }
                field("Withholding Tax Rate"; Rec."Withholding Tax Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withholding Tax Rate field.';
                }
                field("Investment Withholding Tax"; Rec."Investment Withholding Tax")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Withholding Tax field.';
                }
                field("Investment Rollover Status"; Rec."Investment Rollover Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Rollover Status field.';
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
            systempart(Control18; Links) { }
            systempart(Control19; MyNotes) { }
        }
    }

    actions
    {
        area(Processing) { }
    }


    var
        GenJnl: Record "Gen. Journal Line";
        InvestmentSetup: Record "Investment Setup";
        Batch: Code[10];
        Template: Code[10];
        PV: Record "Payments Header";
        Bank: Record "Bank Account";
        BankPostingGrps: Record "Bank Account Posting Group";
        InvestmentGL: Code[10];
        Payments: Record "Payments Header";

    local procedure Close()
    begin
    end;

    local procedure Rollover()
    begin
    end;
}
