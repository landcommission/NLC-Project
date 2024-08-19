table 50011 "Greencom Sms Messages"
{

    fields
    {
        field(1; originator_id; Guid)
        {
        }
        field(2; msg_id; BigInteger)
        {
        }
        field(3; msg_product_id; BigInteger)
        {
        }
        field(4; msg_provider_code; Code[10])
        {
        }
        field(5; msg_charge; Code[20])
        {
        }
        field(6; msg_status_code; Integer)
        {
        }
        field(7; msg_status_description; Text[50])
        {
        }
        field(8; msg_status_date; DateTime)
        {
        }
        field(9; sender; Text[15])
        {
        }
        field(10; receiver; Code[15])
        {
        }
        field(11; msg; Text[1000])
        {
        }
        field(12; msg_type; Code[20])
        {
        }
        field(13; msg_source_reference; Code[50])
        {
        }
        field(14; msg_destination_reference; Code[50])
        {
        }
        field(15; msg_xml_data; Code[200])
        {
        }
        field(16; msg_category; Code[30])
        {
        }
        field(17; msg_priority; Integer)
        {
        }
        field(18; msg_send_count; Integer)
        {
        }
        field(19; schedule_msg; Text[30])
        {
        }
        field(20; date_scheduled; DateTime)
        {
        }
        field(21; msg_send_integrity_hash; Code[100])
        {
        }
        field(22; msg_response_date; DateTime)
        {
        }
        field(23; msg_response_xml_data; Code[250])
        {
        }
        field(24; msg_response_integrity_hash; Code[250])
        {
        }
        field(25; transaction_date; DateTime)
        {
        }
        field(26; date_created; DateTime)
        {
        }
        field(27; "SMS Date"; Date)
        {
        }
        field(28; "Account To Charge"; Code[20])
        {
        }
        field(29; Posted; Boolean)
        {
        }
        field(101; transaction_id; Integer)
        {
            AutoIncrement = true;
        }
        field(103; server_id; BigInteger)
        {
        }
        field(107; msg_charge_applied; Code[20])
        {
        }
        field(114; msg_format; Code[10])
        {
        }
        field(116; msg_command; Text[20])
        {
        }
        field(117; msg_sensitivity; Code[20])
        {
        }
        field(127; msg_response_description; Text[250])
        {
        }
        field(301; msg_result_description; Text[250])
        {
        }
        field(302; msg_result_xml_data; Text[250])
        {
        }
        field(303; msg_result_date; DateTime)
        {
        }
        field(304; msg_result_integrity_hash; Text[250])
        {
        }
        field(305; msg_result_submit_count; Integer)
        {
        }
        field(306; msg_result_submit_status; Code[20])
        {
        }
        field(307; msg_result_submit_description; Text[250])
        {
        }
        field(308; msg_result_submit_date; DateTime)
        {
        }
        field(309; msg_general_flag; Code[50])
        {
        }
        field(310; sender_type; Text[20])
        {
        }
        field(311; receiver_type; Text[20])
        {
        }
        field(312; "Charge Member"; Boolean)
        {
        }
        field(313; Finalized; Boolean)
        {
        }
        field(314; "Split Charge"; Boolean)
        {
        }
        field(315; "Balance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            // CalcFormula = - Sum (Table39004287.Field17 WHERE (Field3 = FIELD ("Account To Charge")));
            Caption = 'Balance (LCY)';
            Editable = false;
            //FieldClass = FlowField;
        }
        field(316; msg_request_application; Text[250])
        {
        }
        field(317; msg_request_correlation_id; Text[50])
        {
        }
        field(318; msg_source_application; Text[20])
        {
        }
        field(319; msg_response; Text[250])
        {
        }
        field(320; msg_response_code; Integer)
        {
        }
        field(321; msg_result; Text[250])
        {
        }
        field(322; msg_result_code; Integer)
        {
        }
        field(323; msg_mode; Text[30])
        {
        }
        field(324; "Sent By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(325; Source; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New Member,New Account,Loan Approval,Deposit Confirmation,Cash Withdrawal Confirm,Loan Application,Loan Appraisal,Loan Guarantors,Loan Rejected,Loan Posted,Loan defaulted,Salary Processing,Teller Cash Deposit,Teller Cash Withdrawal,Teller Cheque Deposit,Fixed Deposit Maturity,InterAccount Transfer,Account Status,Status Order,EFT Effected, ATM Application Failed,ATM Collection,MBanking,Member Changes,Cashier Below Limit,Cashier Above Limit,Chq Book,Bankers Cheque,Teller Cheque Transfer,Defaulter Loan Issued,Bonus,Dividend,Bulk,Standing Order,Loan Bill Due,POS Deposit,Mini Bonus,Leave Application,Loan Witness,PV,CalMobile,CalPIN';
            OptionMembers = "New Member","New Account","Loan Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit","Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MBanking,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book","Bankers Cheque","Teller Cheque Transfer","Defaulter Loan Issued",Bonus,Dividend,Bulk,"Standing Order","Loan Bill Due","POS Deposit","Mini Bonus","Leave Application","Loan Witness",PV,CalMobile,CalPIN;
        }
        field(326; "SMS Charge"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(327; "Document No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(328; "Member No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(1000; "Overriden By"; Code[50])
        {
            TableRelation = User."User Name" where("User Name" = field("Overriden By"));
        }
    }

    keys
    {
        key(Key1; originator_id)
        {
            Clustered = true;
        }
        key(Key2; date_created)
        {
        }
    }

    fieldgroups
    {
    }
}


