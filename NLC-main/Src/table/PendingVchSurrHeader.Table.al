#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193640 "Pending Vch. Surr. Header"
{
    Caption = 'Pending Vch. Surr. Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'No.';
        }
        field(2; Date; Date)
        {
            Caption = 'Date';
        }
        field(3; "Voucher No."; Code[20])
        {
            Editable = false;
            TableRelation = "Pending Voucher Entry"."Pending Voucher No." where("Pending Voucher Type" = const(Issued),
                                                                                 "Amount Due" = filter(> 0));
            Caption = 'Voucher No.';
            trigger OnValidate()
            begin
                CP.Reset();
                if CP.Get("Voucher No.") then begin
                    "Bank Code" := CP."Paying Bank Account";
                    "Bank Dimension 1 Code" := CP."Global Dimension 1 Code";
                    "Bank Dimensin 2 Code" := CP."Shortcut Dimension 2 Code";
                end;
            end;
        }
        field(4; "Entry No."; Integer)
        {
            TableRelation = "Pending Voucher Entry"."Entry No" where("Pending Voucher Type" = const(Issued),
                                                                      "Amount Due" = filter(> 0));
            Caption = 'Entry No.';
            trigger OnValidate()
            begin
                //get the details in the database
                PVE.Reset();
                PVE.SetRange(PVE."Entry No", "Entry No.");
                if PVE.FindFirst() then begin
                    "Voucher Date" := PVE."Pending Voucher Date";
                    "Voucher No." := PVE."Pending Voucher No.";
                    "Employee No." := PVE."Employee No.";
                    Amount := PVE."Pending Voucher Amount";
                    "Global Dimension 1 Code" := PVE."Shortcut Dimension 1 Code";
                    "Global Dimension 2 Code" := PVE."Shortcut Dimension 2 Code";
                    Validate("Voucher No.");
                    Validate("Employee No.");
                end;
            end;
        }
        field(5; "Employee No."; Code[20])
        {
            Editable = false;
            Caption = 'Employee No.';
            //TableRelation = Table39005883.Field1;

            trigger OnValidate()
            begin
                Emp.Reset();
                if Emp.Get("Employee No.") then
                    "Employee Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
            end;
        }
        field(6; "Employee Name"; Text[100])
        {
            Editable = false;
            Caption = 'Employee Name';
        }
        field(7; Amount; Decimal)
        {
            Editable = false;
            Caption = 'Amount';
        }
        field(8; "Global Dimension 1 Code"; Code[20])
        {
            Editable = false;
            Caption = 'Global Dimension 1 Code';
        }
        field(9; "Global Dimension 2 Code"; Code[20])
        {
            Editable = false;
            Caption = 'Global Dimension 2 Code';
        }
        field(10; "Voucher Date"; Date)
        {
            Editable = false;
            Caption = 'Voucher Date';
        }
        field(11; "Bank Code"; Code[20])
        {
            Editable = false;
            TableRelation = "Bank Account"."No.";
            Caption = 'Bank Code';
        }
        field(12; "Bank Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Editable = false;
            Caption = 'Bank Dimension 1 Code';
        }
        field(13; "Bank Dimensin 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Editable = false;
            Caption = 'Bank Dimensin 2 Code';
        }
        field(14; "Receipt Amount"; Decimal)
        {
            CalcFormula = sum("Pending Vch. Surr. Line".Amount where("Type Of Surrender" = const(Receipt),
                                                                      "No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Receipt Amount';
        }
        field(15; "Cash Amount"; Decimal)
        {
            CalcFormula = sum("Pending Vch. Surr. Line".Amount where("Type Of Surrender" = const(Cash),
                                                                      "No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Cash Amount';
        }
        field(16; "Total Amount"; Decimal)
        {
            CalcFormula = sum("Pending Vch. Surr. Line".Amount where("No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Total Amount';
        }
        field(17; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(18; "Posted Date"; Date)
        {
            Caption = 'Posted Date';
        }
        field(19; "Posted Time"; Time)
        {
            Caption = 'Posted Time';
        }
        field(20; "Posted By"; Code[20])
        {
            Caption = 'Posted By';
        }
        field(21; Status; Option)
        {
            OptionMembers = New,Approved,Posted;
            Caption = 'Status';
        }
        field(22; "Register Number"; Integer)
        {
            Caption = 'Register Number';
        }
        field(23; "From Entry No."; Integer)
        {
            Caption = 'From Entry No.';
        }
        field(24; "To Entry No."; Integer)
        {
            Caption = 'To Entry No.';
        }
    }

    keys
    {
        key(Key1; "No.", "Entry No.", "Voucher No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        Date := Today;
    end;

    var
        PVE: Record "Pending Voucher Entry";
        CP: Record "Cash Payments Header";
        Emp: Record Employee;
}
