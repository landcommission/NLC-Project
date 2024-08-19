#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 70020 "Bank Account Stat Line" extends "Bank Account Statement Line"
{
    fields
    {
        field(50000; Reconciled; Boolean)
        {
            Caption = 'Reconciled';
            DataClassification = CustomerContent;
        }
        field(50001; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(50002; Debit; Decimal)
        {
            CalcFormula = sum("Bank Account Statement Line"."Statement Amount" where("Statement Amount" = filter(> 0),
                                                                                      "Bank Account No." = field("Bank Account No."),
                                                                                      "Statement Line No." = field("Statement Line No.")));
            FieldClass = FlowField;
            Caption = 'Debit';
            Editable = false;
        }
        field(50003; Credit; Decimal)
        {
            CalcFormula = sum("Bank Account Statement Line"."Statement Amount" where("Statement Amount" = filter(< 0),
                                                                                      "Bank Account No." = field("Bank Account No."),
                                                                                      "Statement Line No." = field("Statement Line No.")));
            FieldClass = FlowField;
            Caption = 'Credit';
            Editable = false;
        }
        field(50004; "Open Type"; Option)
        {
            OptionCaption = ' ,Unpresented Cheques List,Uncredited Cheques List';
            OptionMembers = " ",Unpresented,Uncredited;
            Caption = 'Open Type';
            DataClassification = CustomerContent;
        }
    }
}
