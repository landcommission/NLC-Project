#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193797 "Contract Milestone Entry"
{
    Caption = 'Contract Milestone Entry';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Opportunity No."; Code[10])
        {
            TableRelation = Contracts;
            Caption = 'Opportunity No.';
        }
        field(2; "Sales Cycle Code"; Code[10])
        {
            TableRelation = "Contract Cycle";
            Caption = 'Sales Cycle Code';
        }
        field(3; "Sales Cycle Stage"; Integer)
        {
            TableRelation = "Contract Cycle Stage".Stage where("Sales Cycle Code" = field("Sales Cycle Code"));
            Caption = 'Sales Cycle Stage';
            trigger OnValidate()
            begin
                ContractCycle.Reset();
                //ContractCycle.SETRANGE(ContractCycle.Code,"Sales Cycle Stage");
                if ContractCycle.Find('-') then
                    "Stage Description" := ContractCycle.Description;
            end;
        }
        field(4; "Contact No."; Code[10])
        {
            TableRelation = Contact;
            Caption = 'Contact No.';
        }
        field(5; "Contact Company No."; Code[10])
        {
            TableRelation = Contact where(Type = const(Company));
            Caption = 'Contact Company No.';
        }
        field(6; "Salesperson Code"; Code[10])
        {
            Caption = 'Salesperson Code';
        }
        field(7; "Campaign No."; Code[10])
        {
            TableRelation = Campaign;
            Caption = 'Campaign No.';
        }
        field(8; "Date of Change"; Date)
        {
            Caption = 'Date of Change';
        }
        field(9; Active; Boolean)
        {
            Caption = 'Active';
        }
        field(10; "Date Closed"; Date)
        {
            Caption = 'Date Closed';
        }
        field(11; "Days Open"; Decimal)
        {
            Caption = 'Days Open';
        }
        field(12; "Action Taken"; Option)
        {
            OptionCaption = ' ,Next,Previous,Updated,Jumped,Won,Lost';
            OptionMembers = " ",Next,Previous,Updated,Jumped,Won,Lost;
            Caption = 'Action Taken';
        }
        field(13; "Estimated Value (LCY)"; Decimal)
        {
            Caption = 'Estimated Value (LCY)';
        }
        field(14; "Calcd. Current Value (LCY)"; Decimal)
        {
            Caption = 'Calcd. Current Value (LCY)';
        }
        field(15; "Completed %"; Decimal)
        {
            Caption = 'Completed %';
        }
        field(16; "Chances of Success %"; Decimal)
        {
            Caption = 'Chances of Success %';
        }
        field(17; "Probability %"; Decimal)
        {
            Caption = 'Probability %';
        }
        field(18; "Close Opportunity Code"; Code[10])
        {
            TableRelation = if ("Action Taken" = const(Won)) "Close Opportunity Code" where(Type = const(Won))
            else
            if ("Action Taken" = const(Lost)) "Close Opportunity Code" where(Type = const(Lost));
            Caption = 'Close Opportunity Code';
        }
        field(19; "Previous Sales Cycle Stage"; Integer)
        {
            TableRelation = "Contract Cycle Stage".Stage where("Sales Cycle Code" = field("Sales Cycle Code"));
            Caption = 'Previous Sales Cycle Stage';
        }
        field(20; "Estimated Close Date"; Date)
        {
            Caption = 'Estimated Close Date';
        }
        field(21; "Stage Description"; Text[30])
        {
            Caption = 'Stage Description';
        }
        field(22; Status; Option)
        {
            OptionCaption = ' ,Open,Complete,Ongoing';
            OptionMembers = " ",Open,Complete,Ongoing;
            Caption = 'Status';
        }
    }

    keys
    {
        key(Key1; "Opportunity No.", "Sales Cycle Stage")
        {
            Clustered = true;
        }
        key(Key2; "Contact Company No.", "Contact No.", Active) { }
        key(Key3; "Campaign No.", Active) { }
        key(Key4; Active, "Sales Cycle Code", "Sales Cycle Stage", "Estimated Close Date") { }
    }

    fieldgroups { }

    var
        ContractCycle: Record "Contract Cycle";
}
