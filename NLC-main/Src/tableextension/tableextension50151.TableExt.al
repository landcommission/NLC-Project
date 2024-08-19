#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50151 tableextension50151 extends "Job Task"
{
    fields
    {
        field(50004; "Task Start Time"; Time)
        {
            Caption = 'Task Start Time';
            DataClassification = CustomerContent;
        }
        field(50005; "Task End Time"; Time)
        {
            Caption = 'Task End Time';
            DataClassification = CustomerContent;
        }
        field(50006; "Reason For Delay"; Text[150])
        {
            Caption = 'Reason For Delay';
            DataClassification = CustomerContent;
        }
        field(50007; "Authorized By"; Code[20])
        {
            TableRelation = Employee;
            Caption = 'Authorized By';
            DataClassification = CustomerContent;
        }
        field(50008; "Originated By"; Code[20])
        {
            TableRelation = Employee;
            Caption = 'Originated By';
            DataClassification = CustomerContent;
        }
        field(50009; "Offsite Job"; Boolean)
        {
            Caption = 'Offsite Job';
            DataClassification = CustomerContent;
        }
        field(50010; "Maintenance Reason Description"; Text[50])
        {
            Caption = 'Maintenance Reason Description';
            DataClassification = CustomerContent;
        }
        field(50011; "Amount Posted to FA"; Decimal)
        {
            Caption = 'Amount Posted to FA';
            DataClassification = CustomerContent;
        }
        field(50012; "WIP Closed"; Boolean)
        {
            Editable = false;
            Caption = 'WIP Closed';
            DataClassification = CustomerContent;
        }
        field(50013; "Offsite Location"; Text[30])
        {
            Caption = 'Office Location';
            DataClassification = CustomerContent;
        }
        field(50016; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            Editable = false;
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }
        field(50017; "No. Of Resource"; Integer)
        {
            CalcFormula = count("Job Planning Line" where("Job No." = field("Job No."),
                                                           Type = const(Resource)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'No. Of Resource';
        }
        field(50018; "Total Labour Cost"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Line Amount (LCY)" where("Job No." = field("Job No."),
                                                                             Type = const(Resource)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Total Labour Cost';
        }
        field(50019; "Actual Completion Time"; Time)
        {
            Caption = 'Actual Completion Time';
            DataClassification = CustomerContent;
        }
        field(50040; "Planned Starting Date"; Date)
        {
            Caption = 'Planned Starting Date';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                Rec.CheckDateConsistency();
            end;
        }
        field(50041; "Planned Ending Date"; Date)
        {
            Caption = 'Planned Ending Date';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                Rec.CheckDateConsistency();
            end;
        }
        field(50042; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Rec.CheckDateConsistency();
            end;
        }
        field(50043; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Rec.CheckDateConsistency();
            end;
        }
        field(50044; "Job Location Code"; Code[20])
        {
            Description = 'To Limit the User View of Job Dbase';
            Editable = false;
            TableRelation = Location;
            Caption = 'Job Location Code';
            DataClassification = CustomerContent;
        }
    }

    procedure CheckDateConsistency()
    begin
        case CurrFieldNo of
            Rec.FieldNo(Rec."Planned Starting Date"):
                begin
                    if (Rec."Planned Starting Date" > Rec."Planned Ending Date") and (Rec."Planned Ending Date" <> 0D) then
                        Error(Text103, Rec.FieldCaption(Rec."Planned Starting Date"), Rec.FieldCaption(Rec."Planned Ending Date"));
                    if (Rec."Planned Starting Date" < Rec."Starting Date") and (Rec."Starting Date" <> 0D) then
                        Error(Text103, Rec.FieldCaption(Rec."Starting Date"), Rec.FieldCaption(Rec."Planned Starting Date"));
                    if (Rec."Planned Starting Date" > Rec."Ending Date") and (Rec."Ending Date" <> 0D) then
                        Error(Text103, Rec.FieldCaption(Rec."Planned Starting Date"), Rec.FieldCaption(Rec."Ending Date"));
                end;
            Rec.FieldNo(Rec."Starting Date"):
                begin
                    if (Rec."Starting Date" > Rec."Ending Date") and (Rec."Ending Date" <> 0D) then
                        Error(Text103, Rec.FieldCaption(Rec."Starting Date"), Rec.FieldCaption(Rec."Ending Date"));
                    if (Rec."Starting Date" < Rec."Ending Date") and (Rec."Ending Date" <> 0D) then
                        Error(Text103, Rec.FieldCaption(Rec."Ending Date"), Rec.FieldCaption(Rec."Starting Date"));
                    if (Rec."Starting Date" < Rec."Planned Starting Date") and (Rec."Planned Starting Date" <> 0D) and (Rec."Starting Date" <> 0D) then
                        Error(Text103, Rec.FieldCaption(Rec."Starting Date"), Rec.FieldCaption(Rec."Planned Starting Date"));
                end;
            Rec.FieldNo(Rec."Ending Date"):
                begin
                    Rec.TestField(Rec."Starting Date");
                    if (Rec."Ending Date" < Rec."Starting Date") and (Rec."Ending Date" <> 0D) then
                        Error(Text103, Rec.FieldCaption(Rec."Starting Date"), Rec.FieldCaption(Rec."Ending Date"));
                    if (Rec."Ending Date" < Rec."Planned Starting Date") and (Rec."Planned Starting Date" <> 0D) and (Rec."Ending Date" <> 0D) then
                        Error(Text103, Rec.FieldCaption(Rec."Ending Date"), Rec.FieldCaption(Rec."Planned Starting Date"));
                end;
            Rec.FieldNo(Rec."Planned Ending Date"):
                begin
                    Rec.TestField(Rec."Planned Starting Date");
                    if (Rec."Planned Ending Date" < Rec."Planned Starting Date") and (Rec."Planned Ending Date" <> 0D) then
                        Error(Text103, Rec.FieldCaption(Rec."Planned Starting Date"), Rec.FieldCaption(Rec."Planned Ending Date"));
                    if (Rec."Planned Ending Date" > Rec."Ending Date") and (Rec."Ending Date" <> 0D) then
                        Error(Text103, Rec.FieldCaption(Rec."Ending Date"), Rec.FieldCaption(Rec."Planned Ending Date"));
                    if (Rec."Planned Ending Date" < Rec."Starting Date") and (Rec."Starting Date" <> 0D) then
                        Error(Text103, Rec.FieldCaption(Rec."Starting Date"), Rec.FieldCaption(Rec."Planned Ending Date"));
                end;
        end;
    end;

    var
        Text100: Label 'Planning line already exist for this task line and this may be affected by this change. Are you absolutely sure you want to continue?';
        Text101: Label 'Action Alborted.';
        Text102: Label 'Task line %1 already created for the maintenance code %2';
        Text103: Label '%1 cannot be after %2';
}
