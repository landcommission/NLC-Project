#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 52193446 "BankAlertMgt FP"
{

    trigger OnRun()
    begin
        InitAlert();
    end;

    var
        CurrentUserID: Code[20];
        BankAcc: Record "Bank Account";
        TellerSetup: Record "Cash Office User Template";
        BuffAlert: Record "Bank Bal. Alert Buffer";
        Selection: Boolean;
        LineNo: Integer;


    procedure InitAlert()
    begin
        CurrentUserID := UserId;
        if AlertUser() then
            GetTellers()
        else
            exit;
        ShowBankAlert();
    end;


    procedure GetTellers()
    begin
        //this function gets all the tellers who are supervised by the current user
        TellerSetup.Reset();
        TellerSetup.SetRange(TellerSetup."Supervisor ID", CurrentUserID);

        if TellerSetup.Find('-') then
            repeat
                GetTellerBalance
                                (
                                TellerSetup.UserID
                                , TellerSetup."Default Receipts Bank"
                                , TellerSetup."Max. Cash Collection"
                                );
            until TellerSetup.Next() = 0;
    end;


    procedure GetTellerBalance(var TellerID: Code[20]; var "Bank No.": Code[20]; var MaxBal: Decimal)
    var
        Balance: Decimal;
    begin
        //this function gets the teller balance from the database
        BankAcc.Reset();
        BankAcc.Get("Bank No.");
        BankAcc.CalcFields(BankAcc."Balance (LCY)");
        Balance := BankAcc."Balance (LCY)";
        LineNo := LineNo + 1;
        InsertAlertRecord();
        BuffAlert."Line No." := LineNo;
        BuffAlert."Teller ID" := TellerID;
        BuffAlert.Validate(BuffAlert."Teller ID");
        BuffAlert."Account No." := BankAcc."No.";
        BuffAlert."Account Name" := BankAcc.Name;
        BuffAlert."Max. Balance" := MaxBal;
        BuffAlert."Curr. Balance" := Balance;
        BuffAlert."Min. Balance" := BankAcc."Min. Balance";
        BuffAlert."Supervisor ID" := CurrentUserID;
        BuffAlert.Insert();
    end;


    procedure InsertAlertRecord()
    begin
        BuffAlert.Init();
    end;


    procedure AlertUser(): Boolean
    begin
        //CHECK IF THE USER SHOULD BE ALERTED IN RELATION TO THE BANK ALERTS

        TellerSetup.Reset();
        TellerSetup.SetRange(TellerSetup."Supervisor ID", CurrentUserID);

        BuffAlert.Reset();
        if BuffAlert.FindLast() then
            LineNo := BuffAlert."Line No.";

        BuffAlert.Reset();
        BuffAlert.SetRange(BuffAlert."Supervisor ID", CurrentUserID);
        if BuffAlert.Find('-') then
            BuffAlert.DeleteAll();

        //getthe last number from the database

        exit((TellerSetup.Count > 0));
    end;


    procedure ShowBankAlert()
    begin
        //this function shows the form depending on whether the are people in the list who have more money that they should
        BuffAlert.Reset();
        BuffAlert.SetRange(BuffAlert."Supervisor ID", CurrentUserID);
        if BuffAlert.Find('-') then
            repeat
                BuffAlert.Mark(false);
                BuffAlert.Modify();
            until BuffAlert.Next() = 0;

        if BuffAlert.Find('-') then
            repeat
                if BuffAlert."Max. Balance" <= BuffAlert."Curr. Balance" then begin
                    BuffAlert.Mark(true);
                    BuffAlert.Modify();
                end;
            until BuffAlert.Next() = 0;

        //get the count of marked records
        BuffAlert.MarkedOnly(true);

        //check if the count is greater than zero
        if BuffAlert.Count > 0 then begin
            Selection := Confirm('Alert Some Tellers have reached the maximum allowable collection. View details?', false);
            case Selection of
                true://show the user the form


                    Page.Run(39006031, BuffAlert);
                false://exit the screen


                    exit;
            end;
        end;
    end;


    procedure CreateCashRequest(var Rec: Record "Bank Bal. Alert Buffer"; CurrUser: Code[20]): Code[20]
    var
        Request: Record "CshMgt Cash Request";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        TSetup: Record "Cash Office User Template";
        CSSetup: Record "Cash Office Setup";
        UserSelection: Boolean;
        Req: Record "CshMgt Cash Request";
    begin
        //this function creates a cash request from the teller to the person who initiated the request
        begin
            //INSERT THE REQUEST INTO THE DATABASE AFTER GETTING THE NEXT NUMBER IN THE REQUEST TABLE
            CSSetup.Reset();
            CSSetup.Get();
            Request.Init();
            Request."No." := NoSeriesMgt.GetNextNo(CSSetup."Cash Request Nos", Today, true);
            Request."Request Date" := Today;
            Request."Request Time" := Time;
            Request."Requester ID" := CurrUser;
            Request.Validate(Request."Requester ID");
            Request."Request Amount" := Rec."Curr. Balance" - Rec."Min. Balance";
            Request."Request From ID" := Rec."Teller ID";
            Request.Validate(Request."Request From ID");
            Request."Request From Acc. No." := Rec."Account No.";
            Request."Curr. Balance" := Rec."Curr. Balance";
            Request."Max. Balance" := Rec."Max. Balance";
            Request."Min. Balance" := Rec."Min. Balance";
            Request."Amount Pending" := Request."Request Amount";
            //get the details of the person who is requesting for cash
            TSetup.Reset();
            if TSetup.Get(CurrUser) then
                Request."Requester Acc. No." := TSetup."Default Receipts Bank";
            Rec."Request Created" := true;
            Rec.Modify();
            Request.Insert();
        end;
        if Request.Count < 1 then
            exit;
        //ask for user confirmation
        UserSelection := Confirm('A Cash Request ' + Format(Request."No.") + ' has been created. View Request?', false);

        Request.SetRange(Request."No.", Request."No.");

        //check the user selection
        if (UserSelection) and (Req.Count > 0) then
            exit(Request."No.");
    end;


    procedure RetrieveActiveRequests()
    var
        Requests: Record "CshMgt Cash Request";
    begin
        //this function gets the active requests from the database that have not been met
        begin
            Requests.Reset();
            Requests.SetFilter(Requests."Request From ID", UserId);
            Requests.SetFilter(Requests.Posted, Format(true));
            if Requests.Find('-') then
                repeat
                    if Requests."Amount Pending" <> 0 then begin
                        Requests.Mark(true);
                        Requests.Modify();
                    end
                    else begin
                        Requests.Mark(false);
                        Requests.Modify();
                    end;
                until Requests.Next() = 0;
            Requests.MarkedOnly(true);
            if Requests.Count > 0 then
                if Confirm
                          (
                            'You have some pending Requests. View Them ?'
                            ,
                            false
                          ) = false
                then
                    exit
                else
                    Page.Run(39006033, Requests);
        end;
    end;


    procedure CreateCashIssue(var Request: Record "CshMgt Cash Request")
    var
        Issue: Record "CshMgt Cash Issue";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CSSetup: Record "Cash Office Setup";
        Selection: Boolean;
    begin
        //this function creates an issue in relation to the a request that has been sent to the teller
        CSSetup.Get();
        begin
            Issue.Init();
            Issue."No." := NoSeriesMgt.GetNextNo(CSSetup."Cash Issue Nos", Today, true);
            Issue."Request No." := Request."No.";
            Issue."Issue Date" := Today;
            Issue."Issue Time" := Time;
            Issue."Requester ID" := Request."Requester ID";
            Issue."Requester Name" := Request."Requester Name";
            Issue."Requester Acc. No." := Request."Requester Acc. No.";
            Issue."Request Amount" := Request."Request Amount";
            Issue."Issuer ID" := UserId;
            Issue."Issuer Name" := Request."Request From Name";
            Issue."Issuer Acc. No." := Request."Requester Acc. No.";
            Issue."Issue Amount" := Request."Amount Pending";
            Issue.Remarks := '';
            Issue.Insert();

            Issue.SetRange(Issue."No.", Issue."No.");

            if Issue.Count > 0 then begin
                Selection := Confirm('A Cash Issue Document ' + Issue."No." + ' has been created. View The Document ?', false);

                case Selection of
                    true://show the issue form


                        Page.Run(39006034, Issue);
                    false://do not show issue form


                        ;

                end;
            end;
        end;
    end;


    procedure RetrieveActiveIssues(): Boolean
    var
        Issue: Record "CshMgt Cash Issue";
        Selection: Boolean;
    begin
        //this function retrieves the active issues and prompts user for response
        begin
            Issue.Reset();
            Issue.SetFilter(Issue."Requester ID", UserId);
            Issue.SetFilter(Issue.Receipted, Format(false));
            Issue.SetFilter(Issue.Posted, Format(true));
            if Issue.FindFirst() then begin
                //get the user option from the database
                Selection := Confirm('There are pending cash issues. Do you wish to view them now?', false);

                case Selection of
                    true://show the form


                        Page.Run(39006036, Issue);
                    false://decide what to do user can be forced to view and receipt here


                        exit(false);
                end;
            end;
        end;
    end;


    procedure CreateCashReceipt(var Issue: Record "CshMgt Cash Issue")
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CSSetup: Record "Cash Office Setup";
        Receipt: Record "CshMgt Cash Receipt";
        Selection: Boolean;
    begin
        //this function creates a cash receipt in the database
        CSSetup.Get();
        begin
            Receipt.Init();
            Receipt."No." := NoSeriesMgt.GetNextNo(CSSetup."Cash Receipt Nos", Today, true);
            Receipt."Issue No." := Issue."No.";
            Receipt."Receipt Date" := Today;
            Receipt."Receipt Time" := Time;
            Receipt."Issuer ID" := Issue."Issuer ID";
            Receipt."Issuer Name" := Issue."Issuer Name";
            Receipt."Issuer Acc. No." := Issue."Issuer Acc. No.";
            Receipt."Issue Amount" := Issue."Issue Amount";
            Receipt."Receiver ID" := Issue."Requester ID";
            Receipt."Receiver Acc. No." := Issue."Requester Acc. No.";
            Receipt."Receiver Amount" := Issue."Issue Amount";
            Receipt."Receiver Name" := Issue."Requester Name";
            Receipt.Insert();
        end;

        //ask for user confirmation
        Selection := Confirm('A Cash Receipt ' + Receipt."No." + ' has been created. View the created Cash Receipt?', false);

        //check the selection made by the user of the system
        case Selection of
            true://user wishes to view hence show the form


                Page.Run(39006037, Receipt);
            false://user does not wish to view the form


                ;

        end;
    end;
}
