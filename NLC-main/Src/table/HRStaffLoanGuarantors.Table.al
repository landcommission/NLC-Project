#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193885 "HR Staff Loan Guarantors"
{
    Caption = 'HR Staff Loan Guarantors';
    DataClassification = CustomerContent;
    //DrillDownPageID = UnknownPage39004256;
    //LookupPageID = UnknownPage39004256;

    fields
    {
        field(1; "Loan No"; Code[20])
        {
            NotBlank = true;
            TableRelation = "HR Staff Loan Request"."Loan No.";
            Caption = 'Loan No';
        }
        field(2; "Guarantor Staff  No"; Code[20])
        {
            NotBlank = false;
            TableRelation = "HR Employees"."No.";
            Caption = 'Guarantor Staff  No';
            trigger OnValidate()
            begin
                "Self Guarantee" := false;
                SelfGuaranteedA := 0;
                Date := Today;

                /*IF Cust.GET("Member No") THEN BEGIN
                IF Employer.GET(Cust."Employer Code") THEN BEGIN
                IF NOT Employer."Can Guarantee Loan" THEN
                  ERROR('This member is not allowed to guarantee');
                END;
                END;*/





                //Check Max garantors
                LoansG := 0;
                LoanGuarantors.Reset();
                LoanGuarantors.SetRange(LoanGuarantors."Guarantor Staff  No", "Guarantor Staff  No");
                if LoanGuarantors.Find('-') then
                    //IF LoanGuarantors.COUNT > 4 THEN BEGIN
                    repeat
                        if Loans.Get(LoanGuarantors."Loan No") then begin
                            Loans.CalcFields(Loans.Balance);
                            if Loans.Balance > 0 then begin
                                LoansG := LoansG + 1;

                                if LoanGuarantors."Self Guarantee" = true then
                                    if LoansR.Get("Loan No") then
                                        if LoansR."Emp No." <> "Guarantor Staff  No" then
                                            Error('Member has guaranteed self therefore can not guarantee another member.')
                                        else
                                            SelfGuaranteedA := SelfGuaranteedA + Loans.Balance;
                            end;
                        end;
                    until LoanGuarantors.Next() = 0;
                //END;

                if LoansG > 4 then
                    if Confirm('Member has guaranteed more than 4 active loans. Do you wish to continue?', false) = false then begin
                        "Guarantor Staff  No" := '';
                        "Staff/Payroll No." := '';
                        Name := '';
                        "Loan Balance" := 0;
                        Date := 0D;
                        exit;
                    end;
                //Check Max garantors


                /*//Check If Self Guarantee
                IF LoansR.GET("Loan No") THEN BEGIN
                IF LoansR."Emp No." = "Guarantor Staff  No" THEN BEGIN
                IF GenSetUp.GET(0) THEN BEGIN
                IF GenSetUp."Member Can Guarantee Own Loan" = FALSE THEN
                ERROR('Member can not guarantee own loan.')
                END;
                //IF (SelfGuaranteedA + LoansR."Approved Amount") > Shares*-1 THEN
                //ERROR('Member Shares not sufficient to guarantee self.');

                "Self Guarantee":=TRUE;

                END;
                END;
                //Check If Self Guarantee*/

                /*
                //Substitute Guarantors
                IF Loans.Posted=TRUE THEN BEGIN
                StatusPermissions.RESET;
                StatusPermissions.SETRANGE(StatusPermissions."User ID",USERID);
                StatusPermissions.SETRANGE(StatusPermissions."Function",StatusPermissions."Function"::"Replace Guarantors");
                IF StatusPermissions.FIND('-') = FALSE THEN
                ERROR('You do not have permissions to replace guarantors.');
                MESSAGE('The guarantor has been replace. please remember to mark replaced guarantor');

                IF CONFIRM('Are you subtituting a guarantor?',FALSE)=FALSE THEN
                EXIT;

                Loans.CALCFIELDS(Loans."Outstanding Balance");
                IF Loans."Outstanding Balance"<=0 THEN
                IF CONFIRM('There is no need to subtitute a guarantor for cleared loan. Do you wish to continue?',FALSE) = FALSE THEN
                EXIT;
                END;
                //End Substitute guarantors
                */

                /*IF Cust.GET("Member No") THEN BEGIN
                IF Loans.Source=Loans.Source::MICRO THEN BEGIN
                Cust.SETRANGE(Cust."Customer Type",Cust."Customer Type"::MicroFinance);
                IF Cust.FIND('-')= FALSE THEN
                ERROR('Sorry selected Member is not a micro member');
                END;
                END;*/

            end;
        }
        field(3; Name; Text[200])
        {
            Editable = false;
            Caption = 'Name';
        }
        field(4; "Loan Balance"; Decimal)
        {
            Editable = false;
            Caption = 'Loan Balance';
        }
        field(6; "No Of Loans Guaranteed"; Integer)
        {
            Editable = false;
            Caption = 'No Of Loans Guaranteed';
        }
        field(7; Substituted; Boolean)
        {
            Caption = 'Substituted';
            trigger OnValidate()
            begin
                Date := Today;
            end;
        }
        field(8; Date; Date)
        {
            Caption = 'Date';
        }
        field(10; "New Upload"; Boolean)
        {
            Caption = 'New Upload';
        }
        field(11; "Amount Guaranteed"; Decimal)
        {
            Caption = 'Amount Guaranteed';

        }
        field(12; "Staff/Payroll No."; Code[20])
        {
            Caption = 'Staff/Payroll No.';
            trigger OnValidate()
            begin
                Cust.Reset();
                Cust.SetRange(Cust."No.", "Staff/Payroll No.");
                if Cust.Find('-') then begin
                    "Guarantor Staff  No" := Cust."No.";
                    Validate("Guarantor Staff  No");
                end;
            end;

        }
        field(14; "Self Guarantee"; Boolean)
        {
            Caption = 'Self Guarantee';
        }
        field(15; "ID No."; Code[50])
        {
            Caption = 'ID No.';
        }
        field(16; "Outstanding Balance"; Decimal)
        {
            Caption = 'Outstanding Balance';
        }
        field(17; "Member Guaranteed"; Code[50])
        {
            Caption = 'Member Guaranteed';
        }
    }

    keys
    {
        key(Key1; "Loan No", "Staff/Payroll No.", "Guarantor Staff  No") { }
        key(Key2; "Loan No", "Guarantor Staff  No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Cust: Record "HR Employees";
        LoanGuarantors: Record "HR Staff Loan Guarantors";
        Loans: Record "HR Staff Loan Request";
        LoansR: Record "HR Staff Loan Request";
        LoansG: Integer;
        GenSetUp: Record "HR Setup";
        SelfGuaranteedA: Decimal;
}

