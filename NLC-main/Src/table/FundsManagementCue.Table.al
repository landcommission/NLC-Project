#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193673 "Funds Management Cue"
{
    Caption = 'Finance Cue';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Interbank Pending Approval"; Integer)
        {
            CalcFormula = count("InterBank Transfers" where(Status = filter("Pending Approval")));
            FieldClass = FlowField;
            Caption = 'Interbank Pending Approval';
            Editable = false;
        }
        field(3; "Interbank Not Posted"; Integer)
        {
            CalcFormula = count("InterBank Transfers" where(Status = filter(Approved),
                                                             Posted = filter(false)));
            FieldClass = FlowField;
            Caption = 'Interbank Not Posted';
            Editable = false;
        }
        field(4; "PV Pending Approval"; Integer)
        {
            CalcFormula = count("Payments Header" where("Payment Type" = filter(<> "Petty Cash"),
                                                         Status = filter("Pending Approval")));
            FieldClass = FlowField;
            Caption = 'PV Pending Approval';
            Editable = false;
        }
        field(5; "PV Not Posted"; Integer)
        {
            CalcFormula = count("Payments Header" where("Payment Type" = filter(<> "Petty Cash"),
                                                         Status = filter(Approved)));
            FieldClass = FlowField;
            Caption = 'PV Not Posted';
            Editable = false;
        }
        field(6; "PCV Pending Approval"; Integer)
        {
            CalcFormula = count("Payments Header" where("Payment Type" = filter("Petty Cash"),
                                                         Status = filter("Pending Approval")));
            FieldClass = FlowField;
            Caption = 'PCV Pending Approval';
            Editable = false;
        }
        field(7; "PCV Not Posted"; Integer)
        {
            CalcFormula = count("Payments Header" where("Payment Type" = filter("Petty Cash"),
                                                         Status = filter(Approved)));
            FieldClass = FlowField;
            Caption = 'PCV Not Posted';
            Editable = false;
        }
        field(8; "Staff Travel Pending Approval"; Integer)
        {
            CalcFormula = count("Imprest Header" where(Status = filter("Pending Approval")));
            FieldClass = FlowField;
            Caption = 'Staff Travel Pending Approval';
            Editable = false;
        }
        field(9; "Staff Travel Not Posted"; Integer)
        {
            CalcFormula = count("Imprest Header" where(Status = filter(Approved)));
            FieldClass = FlowField;
            Caption = 'Staff Travel Not Posted';
            Editable = false;
        }
        field(10; "Staff TA Pending Approval"; Integer)
        {
            CalcFormula = count("Imprest Surrender Header" where(Status = filter("Pending Approval")));
            FieldClass = FlowField;
            Caption = 'Staff TA Pending Approval';
            Editable = false;
        }
        field(11; "Staff TA Not Posted"; Integer)
        {
            CalcFormula = count("Imprest Surrender Header" where(Status = filter(Approved)));
            FieldClass = FlowField;
            Caption = 'Staff TA Not Posted';
            Editable = false;
        }
        field(12; "Other Advance Pending Approval"; Integer)
        {
            CalcFormula = count("Staff Advance Header" where(Status = filter("Pending Approval")));
            FieldClass = FlowField;
            Caption = 'Other Advance Pending Approval';
            Editable = false;
        }
        field(13; "Other Advance Not Posted"; Integer)
        {
            CalcFormula = count("Staff Advance Header" where(Status = filter(Approved)));
            FieldClass = FlowField;
            Caption = 'Other Advance Not Posted';
            Editable = false;
        }
        field(14; "Staff Claim Pending Approval"; Integer)
        {
            CalcFormula = count("Staff Claims Header" where(Status = filter("Pending Approval")));
            FieldClass = FlowField;
            Caption = 'Staff Claim Pending Approval';
            Editable = false;
        }
        field(15; "Staff Claim Not Posted"; Integer)
        {
            CalcFormula = count("Staff Claims Header" where(Status = filter(Approved)));
            FieldClass = FlowField;
            Caption = 'Staff Claim Not Posted';
            Editable = false;
        }
        field(16; "Requisitions Pending Approval"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter(Quote),
                                                         DocApprovalType = filter(Requisition),
                                                         Status = filter("Pending Approval")));
            FieldClass = FlowField;
            Caption = 'Requisitions Pending Approval';
            Editable = false;
        }
        field(17; "Requisitions Not Posted"; Integer)
        {
            Caption = 'Requisitions Not Posted';
        }
        field(18; "Store Req. Pending Approval"; Integer)
        {
            CalcFormula = count("Store Requistion Header" where(Status = filter("Pending Approval")));
            FieldClass = FlowField;
            Caption = 'Store Req. Pending Approval';
            Editable = false;
        }
        field(19; "Store Req. Not Posted"; Integer)
        {
            CalcFormula = count("Store Requistion Header" where(Status = filter(Released)));
            FieldClass = FlowField;
            Caption = 'Store Req. Not Posted';
            Editable = false;
        }
        field(20; "Due Date Filter"; Date)
        {
            Caption = 'Due Date Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(21; "Overdue Date Filter"; Date)
        {
            Caption = 'Overdue Date Filter';
            FieldClass = FlowFilter;
        }
        field(22; "Work Advance Retire Pending"; Integer)
        {
            CalcFormula = count("Staff Advance Surrender Header" where(Status = const(Pending)));
            FieldClass = FlowField;
            Caption = 'Work Advance Retire Pending';
            Editable = false;
        }
        field(23; "Work Advance Retire Not Posted"; Integer)
        {
            CalcFormula = count("Staff Advance Surrender Header" where(Status = const(Approved)));
            FieldClass = FlowField;
            Caption = 'Work Advance Retire Not Posted';
            Editable = false;
        }
        field(24; "Approval Entries"; Integer)
        {
            Caption = 'Approval Entries';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
