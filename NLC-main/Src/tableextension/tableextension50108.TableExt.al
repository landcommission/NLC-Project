#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50108 tableextension50108 extends "Sales Header"
{
    fields
    {
        field(39004240; "Status 2"; Option)
        {
            OptionCaption = '1,2,3';
            OptionMembers = "1","2","3";
            Caption = 'Status 2';
            DataClassification = CustomerContent;
        }
        field(39004388; "Multiple Delivery Locations"; Boolean)
        {
            Caption = 'Multiple Delivery Locations';
            DataClassification = CustomerContent;
        }
        field(39004390; "Source Document[Copied]"; Code[20])
        {
            Caption = 'Source Document[Copied]';
            DataClassification = CustomerContent;
        }
        field(39004391; "Cash Posted"; Boolean)
        {
            Editable = false;
            Caption = 'Cash Posted';
            DataClassification = CustomerContent;
        }
        field(39004392; "Transport Type"; Option)
        {
            OptionMembers = " ",Self,Company,Outsourced;
            Caption = 'Transport Type';
            DataClassification = CustomerContent;
        }
        field(39004393; "Sales Region"; Code[20])
        {
            Caption = 'Sales Region';
            DataClassification = CustomerContent;
        }
        field(39004394; "Tender Type"; Option)
        {
            OptionMembers = Cash,"Deposit Slip",Cheques,"M-pesa",Eft;
            Caption = 'Tender Type';
            DataClassification = CustomerContent;
        }
        field(39004399; Tendered; Boolean)
        {
            Caption = 'Tendered';
            DataClassification = CustomerContent;
        }
        field(39004401; "Time posted"; DateTime)
        {
            Caption = 'Time posted';
            DataClassification = CustomerContent;
        }
        field(39004402; "Cashier ID"; Code[50])
        {
            Caption = 'Cashier ID';
            DataClassification = CustomerContent;
        }
        field(39004406; "Vessel No"; Code[10])
        {
            Caption = 'Vessel No';
            DataClassification = CustomerContent;
        }
        field(39004407; "Lot No"; Code[10])
        {
            Caption = 'Lot No';
            DataClassification = CustomerContent;
        }
        field(39004409; "Customer Category"; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
            Caption = 'Customer Category';
            DataClassification = CustomerContent;
        }
        field(39004410; "Deposit Slip No"; Code[20])
        {
            Caption = 'Deposit Slip No';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                Rec."External Document No." := Rec."Deposit Slip No";
                Rec.Modify();
            end;
        }
        field(39004411; "Deposit Date and Time"; DateTime)
        {
            Caption = 'Deposit Date and Time';
            DataClassification = CustomerContent;
        }
        field(39004412; "Bank Cashier Name"; Text[60])
        {
            Caption = 'Bank Cashier Name';
            DataClassification = CustomerContent;
        }
        field(39004413; "Total Line Amount"; Decimal)
        {
            CalcFormula = sum("Sales Line"."Line Amount" where("Document No." = field("No.")));
            FieldClass = FlowField;
            Caption = 'Total Line Amount';
            Editable = false;
        }
        field(39005544; Cancelled; Boolean)
        {
            Caption = 'Cancelled';
            DataClassification = CustomerContent;
        }
        field(39005545; "Cancelled By"; Code[50])
        {
            Caption = 'Cancelled By';
            DataClassification = CustomerContent;
        }
        field(39005546; "Cancelled Date"; Date)
        {
            Caption = 'Cancelled Date';
            DataClassification = CustomerContent;
        }
        field(39005547; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = CustomerContent;
        }
        field(39005548; "Time Date Created"; DateTime)
        {
            Caption = 'Time Date Created';
            DataClassification = CustomerContent;
        }
        field(39005549; "Evacuation Start Date"; Date)
        {
            Caption = 'Evacuation Start Date';
            DataClassification = CustomerContent;
        }
        field(39005550; "Requested Evacuation End Date"; Date)
        {
            Caption = 'Requested Evacuation End Date';
            DataClassification = CustomerContent;
        }
    }
}
