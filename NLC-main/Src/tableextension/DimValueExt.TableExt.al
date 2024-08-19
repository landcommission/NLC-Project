#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 70024 "Dim Value Ext" extends "Dimension Value"
{
    DrillDownPageId = "Dimension Value List";
    Caption = 'Dimension Value Ext';
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Name(Field 3)".

        field(50023; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'Pay Period Filter';
        }
        field(50024; "Region Filter"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Region Filter';
            //TableRelation = County1.Code;
        }
        field(50025; "Hardship Area"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Hardship Area';
        }
        field(50026; "Hardship Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,Extreme,Moderate';
            OptionMembers = " ",Extreme,Moderate;
            Caption = 'Hardship Type';
        }
        field(50027; HOD; Code[20])
        {

            // TableRelation = "Employee"."No." where(HOD = const(true));
            TableRelation = "User Setup"."User ID";
            Caption = 'HOD';
            DataClassification = CustomerContent;
        }
        field(50028; Director; Code[20])
        {
            TableRelation = "User Setup"."User ID";
            Caption = 'Director';
            DataClassification = CustomerContent;
        }
        field(50031; Registrar; Code[20])
        {
            TableRelation = "User Setup"."User ID";
            Caption = 'Registrar';
            DataClassification = CustomerContent;
        }
        field(50029; "Deputy Registrar"; Code[20])
        {
            TableRelation = "User Setup"."User ID";
            Caption = 'Deputy Registrar';
            DataClassification = CustomerContent;
        }
        field(50030; "Head of Station"; Code[20])
        {
            TableRelation = "User Setup"."User ID";
            Caption = 'Head of Station';
            DataClassification = CustomerContent;
        }
        field(40; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));
            DataClassification = CustomerContent;
        }

        field(41; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));
            DataClassification = CustomerContent;

        }
        field(141; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                          Blocked = const(false));
            DataClassification = CustomerContent;

        }
        field(43; "Apply Unit filter"; Boolean)
        {
            Caption = 'Apply Unit filter';
            DataClassification = CustomerContent;
        }
        field(39003900; Picture; Blob)
        {
            Subtype = Bitmap;
            Caption = 'Picture';
            DataClassification = CustomerContent;
        }
        field(50000; "Transport Booking Period"; DateFormula)
        {
            Caption = 'Transport Booking Period';
            DataClassification = CustomerContent;
        }
        field(50001; "Transport Cancellation Period"; DateFormula)
        {
            Caption = 'Transport Cancellation Period';
            DataClassification = CustomerContent;
        }
    }

}


