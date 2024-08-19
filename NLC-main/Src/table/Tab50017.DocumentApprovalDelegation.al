#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50017 "Document Approval Delegation"
{
    // DrillDownPageID = UnknownPage51511600;
    // LookupPageID = UnknownPage51511600;

    fields
    {
        field(1; "Delegation No"; Code[20])
        {

            trigger OnValidate()
            begin
                if xRec."Delegation No" <> "Delegation No" then begin
                    SSetUp.Get;
                    // SSetUp.TestField("Delegation Nos");
                    //NoSeriesMgt.TestManual(SSetUp."Delegation Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Current Approver ID"; Code[80])
        {
            TableRelation = "User Setup";

            // trigger OnLookup()
            // begin
            //     LoginMgt.LookupUserID("Current Approver ID");
            // end;

            // trigger OnValidate()
            // begin
            //     LoginMgt.ValidateUserID("Current Approver ID");
            // end;
        }
        field(3; "New Approver ID"; Code[80])
        {
            TableRelation = "User Setup";

            // trigger OnLookup()
            // begin
            //     LoginMgt.LookupUserID("New Approver ID");
            // end;

            // trigger OnValidate()
            // begin
            //     LoginMgt.ValidateUserID("New Approver ID");
            // end;
        }
        field(4; "Start Date"; Date)
        {

            // trigger OnValidate()
            // begin
            //     CompInfo.Get;
            //     if CalendarMgmt.CheckDateStatus(CompInfo."Base Calendar Code","Start Date",Description) then
            //          Error(Text003);
            // end;
        }
        field(5; Duration; DateFormula)
        {

            // trigger OnValidate()
            // begin
            //     CompInfo.Get;
            //     EndDate:="Start Date";
            //     NoOfDays:=(CalcDate(Duration,"Start Date")-"Start Date");
            //     //Calculate the end date based on working days
            //      repeat
            //      if not CalendarMgmt.CheckDateStatus(CompInfo."Base Calendar Code",EndDate,Description) then
            //             NoOfWorkingDays:=NoOfWorkingDays+1;
            //             EndDate:=CalcDate('1D',EndDate);

            //      until  NoOfWorkingDays=NoOfDays;
            //      "End Date":=EndDate;
            //      if not CalendarMgmt.CheckDateStatus(CompInfo."Base Calendar Code","End Date",Description) then
            //           Loop:=true
            //           else begin
            //           Loop:=false;
            //           repeat
            //           "End Date":=CalcDate('1D',"End Date");
            //          if not CalendarMgmt.CheckDateStatus(CompInfo."Base Calendar Code","End Date",Description) then
            //           Loop:=true;
            //           until Loop=true;
            //      end;
            // end;
        }
        field(6; "End Date"; Date)
        {
        }
        field(7; Status; Option)
        {
            OptionCaption = 'Open,Processed,Expired';
            OptionMembers = Open,Processed,Expired;
        }
        field(8; "Delegation Limits Approver ID"; Code[80])
        {
            TableRelation = "User Setup";

            // trigger OnLookup()
            // begin
            //     LoginMgt.LookupUserID("Delegation Limits Approver ID");
            // end;

            // trigger OnValidate()
            // begin
            //     LoginMgt.ValidateUserID("Delegation Limits Approver ID");
            // end;
        }
        field(9; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(10; Description; Text[250])
        {
        }
        field(11; "Alternate Approver ID"; Code[80])
        {
            TableRelation = "User Setup";

            // trigger OnLookup()
            // begin
            //     LoginMgt.LookupUserID("Alternate Approver ID");
            // end;

            // trigger OnValidate()
            // begin
            //     LoginMgt.ValidateUserID("Alternate Approver ID");
            // end;
        }
    }

    keys
    {
        key(Key1; "Delegation No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Delegation No" = '' then begin
            SSetUp.Get;
            //SSetUp.TestField("Delegation Nos");
            //NoSeriesMgt.InitSeries(SSetUp."Delegation Nos",xRec."No. Series",0D,"Delegation No","No. Series");
        end;
    end;

    var
        LoginMgt: Codeunit "User Management";
        Text000: label 'Processing Approval Delegation \From #1#########\ To   #2#########\ Delegated Authority #3#########';
        Text001: label 'There is a current Delegation that is already open, Do u want to replace it?';
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ApprovalSetup: Record "User Setup";
        Text002: label 'Processing Approval Resumption \From #1######### To   #2#########\ Delegated Authority From #3########  to#4#########';
        CalendarMgmt: Codeunit "Calendar Management";
        CompInfo: Record "Company Information";
        NoOfWorkingDays: Integer;
        EndDate: Date;
        NoOfDays: Integer;
        Loop: Boolean;
        Text003: label 'The Date you have entered is not a working day of the calendar';
        SSetUp: Record "Sales & Receivables Setup";

}

