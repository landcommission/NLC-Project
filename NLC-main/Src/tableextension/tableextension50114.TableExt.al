#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50114 tableextension50114 extends "Gen. Journal Line"
{
    fields
    {
        field(50000; "Remittance Type"; Option)
        {
            OptionMembers = " ","W/Tax",VAT,Excise,Others,Retention;
            Caption = 'Remittance Type';
            DataClassification = CustomerContent;
        }
        field(50001; "Amount Payable"; Decimal)
        {
            Caption = 'Amount Payable';
            DataClassification = CustomerContent;
        }
        field(50050; "Batch Balance"; Decimal)
        {
            CalcFormula = sum("Gen. Journal Line".Amount where("Journal Template Name" = field("Journal Template Name"),
                                                                "Journal Batch Name" = field("Journal Batch Name")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Batch Balance';
        }
        field(39005586; "Transaction Code"; Code[30])
        {
            Caption = 'Transaction Code';
            DataClassification = CustomerContent;
            // //TableRelation = Table39005598.Field1;
        }
        field(39005590; "Entry Type"; Option)
        {
            OptionCaption = ' ,Income,Expense';
            OptionMembers = " ",Income,Expense;
            Caption = 'Entry Type';
            DataClassification = CustomerContent;
        }
        field(39005597; "Transaction Name"; Text[100])
        {
            Caption = 'Transaction Name';
            DataClassification = CustomerContent;
        }
        field(39005598; Particulars; Text[200])
        {
            Caption = 'Particulars';
            DataClassification = CustomerContent;
        }
        field(39005599; "Expense code"; Code[30])
        {
            Caption = 'Expense code';
            DataClassification = CustomerContent;
        }
        field(39005600; "Asset No."; Code[20])
        {
            TableRelation = "Fixed Asset"."No.";
            Caption = 'Asset No.';
            DataClassification = CustomerContent;
        }
        field(39005601; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = CustomerContent;
        }
        field(39005602; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Canceled;
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
    }


    //Unsupported feature: Code Modification on "CheckDocNoOnLines(PROCEDURE 78)".

    //procedure CheckDocNoOnLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GenJnlLine.COPYFILTERS(Rec);

    IF NOT GenJnlLine.FINDSET THEN
    #4..7

    CLEAR(NoSeriesMgt);
    REPEAT
      GenJnlLine.CheckDocNoBasedOnNoSeries(LastDocNo,GenJnlBatch."No. Series",NoSeriesMgt);
      LastDocNo := GenJnlLine."Document No.";
    UNTIL GenJnlLine.NEXT = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10

     IF "Document No." ='' THEN BEGIN   //addition to allow us indirectly post payments through journal with document no from pv

      GenJnlLine.CheckDocNoBasedOnNoSeries(LastDocNo,GenJnlBatch."No. Series",NoSeriesMgt);
      LastDocNo := GenJnlLine."Document No.";
      END;
    UNTIL GenJnlLine.NEXT = 0;
    */
    //end;


    //Unsupported feature: Code Modification on "CheckDocNoBasedOnNoSeries(PROCEDURE 74)".

    //procedure CheckDocNoBasedOnNoSeries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF NoSeriesCode = '' THEN
      EXIT;

    IF (LastDocNo = '') OR ("Document No." <> LastDocNo) THEN
      TESTFIELD("Document No.",NoSeriesMgtInstance.GetNextNo(NoSeriesCode,"Posting Date",FALSE));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF NoSeriesCode = '' THEN
      EXIT;
    IF (LastDocNo = '') OR ("Document No." <> LastDocNo) THEN
      TESTFIELD("Document No.",NoSeriesMgtInstance.GetNextNo(NoSeriesCode,"Posting Date",FALSE));
    */
    //end;

    var
        FieldIsNotEmptyErr: Label '%1 cannot be used while %2 has a value.', Comment = '%1=Field;%2=Field';
}
