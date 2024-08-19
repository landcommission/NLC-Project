#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193837 "Grant Surrender Details"
{
    // CALCFIELDS("Grant Phase");
    //
    // JobTask.RESET;
    // JobTask.SETRANGE(JobTask."Job No.","Grant Task");
    // JobTask.CALCFIELDS(JobTask."Grant Phase");
    // JobTask.SETRANGE(JobTask."Grant Phase","Grant Phase");
    // IF PAGE.RUNMODAL(39004410,JobTask,"Line No.")=ACTION::LookupOK
    // THEN
    //   BEGIN
    //     "Grant Task Line":=JobTask."Line No.";
    //     VALIDATE("Grant Task Line");
    //   END;

    DelayedInsert = true;
    Editable = true;
    PageType = CardPart;
    SourceTable = "Grant Surrender Details";
    ApplicationArea = All;
    Caption = 'Grant Surrender Details';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("PV No"; Rec."PV No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PV No field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(Partner; Rec.Partner)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Partner field.';
                }
                field("Account No:"; Rec."Account No:")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No: field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Disbursed Amount"; Rec."Disbursed Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disbursed Amount field.';
                }
                field("Actual Spent"; Rec."Actual Spent")
                {
                    ApplicationArea = Basic;
                    Caption = 'Actual Spent';
                    Editable = true;
                    ToolTip = 'Specifies the value of the Actual Spent field.';
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("Cash Receipt No"; Rec."Cash Receipt No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cash Receipt No field.';
                }
                field("Cash Receipt Amount"; Rec."Cash Receipt Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cash Receipt Amount field.';
                }
                field("Apply to"; Rec."Apply to")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Apply to field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec."Apply to" := '';
                        Rec."Apply to ID" := '';

                        //Amt:=0;

                        Custledger.Reset();
                        Custledger.SetCurrentKey(Custledger."Customer No.", Open, "Document No.");
                        Custledger.SetRange(Custledger."Customer No.", Rec.Partner);
                        Custledger.SetRange(Open, true);
                        //CustLedger.SETRANGE(CustLedger."Transaction Type",CustLedger."Transaction Type"::"Down Payment");
                        Custledger.CalcFields(Custledger.Amount);
                        if Page.RunModal(Page::"Customer Ledger Entries", Custledger) = Action::LookupOK then
                            if Custledger."Applies-to ID" <> '' then begin
                                Custledger1.Reset();
                                Custledger1.SetCurrentKey(Custledger1."Customer No.", Open, "Applies-to ID");
                                Custledger1.SetRange(Custledger1."Customer No.", Rec.Partner);
                                Custledger1.SetRange(Open, true);
                                //CustLedger1.SETRANGE("Transaction Type",CustLedger1."Transaction Type"::"Down Payment");
                                Custledger1.SetRange("Applies-to ID", Custledger."Applies-to ID");
                                if Custledger1.Find('-') then
                                    repeat
                                        Custledger1.CalcFields(Custledger1.Amount);
                                        Amt := Amt + Abs(Custledger1.Amount);
                                    until Custledger1.Next() = 0;

                                if Amt <> Amt then
                                    //ERROR('Amount is not equal to the amount applied on the application form');
                                    /*Amount:=Amt;
                                    VALIDATE(Amount);*/
                           Rec."Apply to" := Custledger."Document No.";
                                Rec."Apply to ID" := Custledger."Applies-to ID";
                            end else begin
                                if Rec."Disbursed Amount" <> Abs(Custledger.Amount) then
                                    Custledger.CalcFields(Custledger."Remaining Amount");

                                /*Amount:=ABS(CustLedger."Remaining Amount");
                                 VALIDATE(Amount);*/
                                //ERROR('Amount is not equal to the amount applied on the application form');

                                Rec."Apply to" := Custledger."Document No.";
                                Rec."Apply to ID" := Custledger."Applies-to ID";

                            end;

                        if Rec."Apply to ID" <> '' then
                            Rec."Apply to" := '';

                        Rec.Validate(Rec."Disbursed Amount");

                    end;
                }
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    begin
        GrantSurrenderDetails.Reset();
        GrantSurrenderDetails.SetRange(GrantSurrenderDetails.Posted, true);
        GrantSurrenderDetails.SetRange(GrantSurrenderDetails.Partner, Rec.Partner);
        GrantSurrenderDetails.SetRange(GrantSurrenderDetails."Grant No", Rec."Grant No");
        if GrantSurrenderDetails.Find('-') then
            repeat
                AccAmount := AccAmount + GrantSurrenderDetails."Actual Spent";
            until GrantSurrenderDetails.Next() = 0;
    end;

    var
        Custledger: Record "Cust. Ledger Entry";
        Custledger1: Record "Cust. Ledger Entry";
        Amt: Decimal;
        JobTask: Record "Job-Planning Line";
        GrantSurrenderDetails: Record "Grant Surrender Details";
        AccAmount: Decimal;


    procedure refreshform()
    begin
        CurrPage.Update(false);
    end;
}
