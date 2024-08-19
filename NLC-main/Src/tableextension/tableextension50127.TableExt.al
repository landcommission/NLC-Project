#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50127 tableextension50127 extends "Purch. Inv. Line"
{
    fields
    {
        field(50000; Committed; Boolean)
        {
            Caption = 'Committed';
            DataClassification = CustomerContent;
        }
        field(50004; "Expense Code"; Code[10])
        {
            Caption = 'Expense Code';
            DataClassification = CustomerContent;
            //TableRelation = Table39005906;
        }
        field(50005; "RFQ No."; Code[20])
        {
            Description = 'ADDED THIS FIELD';
            Caption = 'RFQ No.';
            DataClassification = CustomerContent;
        }
        field(50006; "RFQ Line No."; Integer)
        {
            Description = 'ADDED THIS FIELD';
            Caption = 'RFQ Line No.';
            DataClassification = CustomerContent;
            //TableRelation = Table39006018.Field4;
        }
        field(50010; "Project Code"; Code[10])
        {
            Caption = 'Project Code';
            DataClassification = CustomerContent;
            //TableRelation = Table39004330;
        }
        field(51000; "RFQ Remarks"; Text[50])
        {
            Caption = 'RFQ Remarks';
            DataClassification = CustomerContent;
        }
        field(51002; "Requisition No"; Code[20])
        {
            Caption = 'Requisition No';
            DataClassification = CustomerContent;
        }
        field(39005540; "Procurement Type Code"; Code[20])
        {
            TableRelation = "CshMgt PV Steps";
            Caption = 'Procurement Type Code';
            DataClassification = CustomerContent;
        }
        field(39005606; "Manual Requisition No"; Code[20])
        {
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Quote),
                                                           Status = const(Released));
            Caption = 'Manual Requisition No';
            DataClassification = CustomerContent;
        }
        field(39005607; "Manually Added"; Boolean)
        {
            Caption = 'Manually Added';
            DataClassification = CustomerContent;
        }
    }
}
